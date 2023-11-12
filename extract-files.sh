#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=yunluo
VENDOR=xiaomi
export PATCHELF_VERSION="0_17_2"
export EU_ENABLE_BINARY_CHECKS="true" # Enabled shared_libs, symbols and soname checks

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true

KANG=
SECTION=

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -n | --no-cleanup )
                CLEAN_VENDOR=false
                ;;
        -k | --kang )
                KANG="--kang"
                ;;
        -s | --section )
                SECTION="${2}"; shift
                CLEAN_VENDOR=false
                ;;
        * )
                SRC="${1}"
                ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

function blob_fixup() {
    case "${1}" in
        vendor/bin/hw/android.hardware.security.keymint@1.0-service.beanpod)
            "${PATCHELF}" --remove-needed "android.hardware.security.keymint-V1-ndk_platform.so" "${2}"
            "${PATCHELF}" --replace-needed "android.hardware.security.secureclock-V1-ndk_platform.so" "android.hardware.security.secureclock-V1-ndk.so" "${2}"
            "${PATCHELF}" --replace-needed "android.hardware.security.sharedsecret-V1-ndk_platform.so" "android.hardware.security.sharedsecret-V1-ndk.so" "${2}"
            ;;
        vendor/lib64/libspeech_enh_lib.so|\
        vendor/lib64/hw/sound_trigger.primary.mt6789.so|\
        vendor/lib64/libnir_neon_driver_ndk.mtk.vndk.so|\
        vendor/lib64/libwifi-hal-mtk.so)
            "${PATCHELF}" --set-soname "$(basename "${1}")" "${2}"
            ;;
        vendor/etc/init/android.hardware.graphics.allocator@4.0-service-mediatek.rc)
            sed -i 's|android.hardware.graphics.allocator@4.0-service-mediatek|mt6789/android.hardware.graphics.allocator@4.0-service-mediatek.mt6789|g' "${2}"
            ;;
        vendor/etc/init/android.hardware.media.c2@1.2-mediatek.rc)
            sed -i 's/@1.2-mediatek/@1.2-mediatek-64b/g' "${2}"
            ;;
        vendor/bin/hw/android.hardware.media.c2@1.2-mediatek-64b)
            "${PATCHELF}" --replace-needed "libavservices_minijail_vendor.so" "libavservices_minijail.so" "${2}"
            "${PATCHELF}" --add-needed "libstagefright_foundation-v33.so" "${2}"
            ;;
        vendor/lib64/hw/mt6789/vendor.mediatek.hardware.pq@2.15-impl.so)
            "${PATCHELF}" --replace-needed "libutils.so" "libutils-v32.so" "${2}"
            ;;
        vendor/lib64/mt6789/libmtkcam_stdutils.so)
            "${PATCHELF}" --replace-needed "libutils.so" "libutils-v32.so" "${2}"
            ;;
        vendor/etc/init/android.hardware.bluetooth@1.1-service-mediatek.rc)
            sed -i '/vts/Q' "$2"
            ;;
        vendor/etc/init/android.hardware.neuralnetworks-shim-service-mtk.rc)
            sed -i 's/start/enable/' "$2"
            ;;
        vendor/lib*/libwvhidl.so|\
        vendor/lib*/mediadrm/libwvdrmengine.so)
            "${PATCHELF}" --replace-needed "libprotobuf-cpp-lite-3.9.1.so" "libprotobuf-cpp-full-3.9.1.so" "${2}"
            ;;
        vendor/lib64/hw/android.hardware.sensors@2.X-subhal-mediatek.so|\
        vendor/lib64/hw/mt6789/vendor.mediatek.hardware.pq@2.15-impl.so|\
        vendor/lib64/mt6789/libaalservice.so|\
        vendor/lib64/mt6789/libcam.utils.sensorprovider.so)
            "${PATCHELF}" --add-needed "libshim_sensors.so" "${2}"
            ;;

    esac
}

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" false "${CLEAN_VENDOR}"

extract "${MY_DIR}/proprietary-files.txt" "${SRC}" "${KANG}" --section "${SECTION}"

"${MY_DIR}/setup-makefiles.sh"

vndk_import "${ANDROID_ROOT}" "libutils" "32" "both" "vndk-sp"
vndk_import "${ANDROID_ROOT}" "libstagefright_foundation" "33" "both" "vndk-core"

