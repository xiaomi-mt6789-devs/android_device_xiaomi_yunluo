#
# Copyright (C) 2023 LineageOS
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
	$(LOCAL_DIR)/lineage_yunluo.mk

COMMON_LUNCH_CHOICES := \
    $(foreach FLAVOR, user userdebug eng, lineage_yunluo-$(FLAVOR))
