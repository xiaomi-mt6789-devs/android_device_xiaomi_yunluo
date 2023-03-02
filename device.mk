#
# Copyright (C) 2023 LineageOS
#
# SPDX-License-Identifier: Apache-2.0
#

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := \
	boot \
	vendor_boot \
	system \
	vendor \
	product \
	vbmeta \
	vbmeta_system \
	vbmeta_vendor

PRODUCT_PACKAGES += \
	update_engine \
	update_verifier \
	otapreopt_script \
	checkpoint_gc

AB_OTA_POSTINSTALL_CONFIG += \
	RUN_POSTINSTALL_system=true \
	POSTINSTALL_PATH_system=system/bin/otapreopt_script \
	FILESYSTEM_TYPE_system=erofs \
	POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Shipping API Level
PRODUCT_SHIPPING_API_LEVEL := 31

# Bluetooth
PRODUCT_PACKAGES += \
	android.hardware.bluetooth.audio-impl \
	libbluetooth_audio_session \
	android.hardware.bluetooth@1.0.vendor:64 \
	android.hardware.bluetooth@1.1.vendor:64

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl.recovery

# Init files
PRODUCT_PACKAGES += \
	init.insmod.sh \
	init.insmod.mt6789.cfg \
	init.cgroup.rc \
	init.charge_logger.rc \
	init.connectivity.common.rc \
	init.connectivity.rc \
	init.mi_thermald.rc \
	init.mt6789.rc \
	init.mt6789.usb.rc \
	init.mtkgki.rc \
	init.project.rc \
	init.sensor_2_0.rc \
	init_connectivity.rc \
	ueventd.mt6789.rc \
	fstab.mt6789 \

# Audio Configuration
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

# Media
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/media/,$(TARGET_COPY_OUT_VENDOR)/etc)

# PowerHAL Configuration
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/power/,$(TARGET_COPY_OUT_VENDOR)/etc)

# Public libraries
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/misc/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# Seccomp
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/seccomp/,$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy)

# Sensors MultiHAL config
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Wifi configs
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/wifi/,$(TARGET_COPY_OUT_VENDOR)/etc/wifi)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
	hardware/mediatek \
	$(LOCAL_PATH)

# Inherit our proprietary vendor
$(call inherit-product, vendor/xiaomi/yunluo/yunluo-vendor.mk)
