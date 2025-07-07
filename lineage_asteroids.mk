#
# SPDX-FileCopyrightText: 2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, device/nothing/asteroids/device.mk)
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_BRAND := Nothing
PRODUCT_DEVICE := asteroids
PRODUCT_MANUFACTURER := Nothing
PRODUCT_MODEL := A059
PRODUCT_NAME := lineage_asteroids

PRODUCT_GMS_CLIENTID_BASE := android-nothing

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="qssi_64-user 15 AQ3A.241015.001 2506101841 release-keys" \
    BuildFingerprint=Nothing/Asteroids/Asteroids:15/AQ3A.241015.001/2506101841:user/release-keys \
    DeviceName=Asteroids \
    DeviceProduct=Asteroids \
    SystemDevice=Asteroids \
    SystemName=Asteroids
