#
# Copyright (C) 2023 LineageOS
#
# SPDX-License-Identifier: Apache-2.0
#

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
	$(LOCAL_PATH)

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
	FILESYSTEM_TYPE_system=ext4 \
	POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Shipping API Level
PRODUCT_SHIPPING_API_LEVEL := 31

# Init files
PRODUCT_PACKAGES += \
	fstab.mt6789_vendor_ramdisk

# Inherit our proprietary vendor
$(call inherit-product, vendor/xiaomi/yunluo/yunluo-vendor.mk)
