#
# Copyright (C) 2023 LineageOS
#
# SPDX-License-Identifier: Apache-2.0
#

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
	$(LOCAL_PATH)

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Shipping API Level
PRODUCT_SHIPPING_API_LEVEL := 31

# Inherit our proprietary vendor
$(call inherit-product, vendor/xiaomi/yunluo/yunluo-vendor.mk)
