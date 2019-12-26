# Copyright (C) 2019 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Check for target product
ifeq (pa_bonito,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Include Paranoid Android common configuration
TARGET_BOOT_ANIMATION_RES := 1080

TARGET_USES_AOSP := true
TARGET_USES_QCOM_BSP := false

include vendor/pa/config/common_full_phone.mk

# Inherit AOSP device configuration
$(call inherit-product, device/google/bonito/device-bonito.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_bonito
PRODUCT_DEVICE := bonito
PRODUCT_BRAND := Google
PRODUCT_MODEL := Pixel 3a XL
PRODUCT_MANUFACTURER := Google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="bonito" \
    TARGET_DEVICE="bonito" \
    PRIVATE_BUILD_DESC="bonito-user 10 QQ1A.191205.011 6009058 release-keys"

BUILD_FINGERPRINT := "google/bonito/bonito:10/QQ1A.191205.011/6009058:user/release-keys"

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=google/bonito/bonito:10/QQ1A.191205.011/6009058:user/release-keys

BOARD_PREBUILT_VENDORIMAGE := vendor/images/bonito/vendor.img

# Include GAPPS
$(call inherit-product, vendor/pixelgapps/pixel-gapps.mk)
endif
