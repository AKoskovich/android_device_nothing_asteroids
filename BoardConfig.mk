#
# SPDX-FileCopyrightText: 2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/nothing/asteroids

include build/make/target/board/BoardConfigMainlineCommon.mk

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    init_boot \
    odm \
    product \
    recovery \
    system_dlkm \
    system_ext \
    system \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vendor_boot \
    vendor_dlkm \
    vendor

# API
BOARD_SHIPPING_API_LEVEL := 34

# AVB
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

BOARD_AVB_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_BOOT_ALGORITHM := SHA256_RSA2048
BOARD_AVB_BOOT_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := 3

BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

BOARD_AVB_VBMETA_SYSTEM := product system system_ext
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

BOARD_AVB_VBMETA_VENDOR := odm system_dlkm vendor vendor_dlkm
BOARD_AVB_VBMETA_VENDOR_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_VENDOR_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX_LOCATION := 4

BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a-branchprot
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a76

# Audio
AUDIO_FEATURE_ENABLED_AGM_HIDL := true
AUDIO_FEATURE_ENABLED_DLKM := true
AUDIO_FEATURE_ENABLED_GEF_SUPPORT := true
AUDIO_FEATURE_ENABLED_GKI := true
AUDIO_FEATURE_ENABLED_INSTANCE_ID := true
AUDIO_FEATURE_ENABLED_LSM_HIDL := true
AUDIO_FEATURE_ENABLED_MCS := true
AUDIO_FEATURE_ENABLED_PAL_HIDL := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_SVA_MULTI_STAGE := true
BOARD_SUPPORTS_OPENSOURCE_STHAL := true

# Board
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/android-info.txt

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := volcano

# Boot
BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

BOARD_INIT_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_INIT_ARGS += --header_version $(BOARD_INIT_BOOT_HEADER_VERSION)

# DTB
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# DTBO
BOARD_USES_QCOM_MERGE_DTBS_SCRIPT := true
TARGET_NEEDS_DTBOIMAGE := true

# Display
TARGET_SCREEN_DENSITY := 420

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

# Kernel
BOARD_KERNEL_CMDLINE := \
    log_buf_len=1M \
    nosoftlockup \
    qcom_geni_serial.con_enabled=0 \
    video=vfb:640x400,bpp=32,memsize=3072000
BOARD_BOOTCONFIG := \
    androidboot.console=0 \
    androidboot.hardware=qcom \
    androidboot.load_modules_parallel=true \
    androidboot.memcg=1 \
    androidboot.usbcontroller=a600000.dwc3

BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_USE_LZ4 := true
BOARD_USES_GENERIC_KERNEL_IMAGE := true

TARGET_KERNEL_SOURCE := kernel/nothing/sm7635
TARGET_KERNEL_CONFIG := \
    gki_defconfig \
    vendor/pineapple_GKI.config
TARGET_MERGE_DTBS_WILDCARD := *volcano*

# Kernel Modules
BOARD_SYSTEM_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.system_dlkm))
SYSTEM_KERNEL_MODULES := $(BOARD_SYSTEM_KERNEL_MODULES_LOAD)
BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE := $(DEVICE_PATH)/modules.blocklist
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.vendor_dlkm))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_BLOCKLIST_FILE := $(BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.vendor_boot))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.recovery))
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD)

TARGET_KERNEL_EXT_MODULE_ROOT := kernel/nothing/sm7635-modules
TARGET_KERNEL_EXT_MODULES := \
    qcom/opensource/mmrm-driver \
    qcom/opensource/mm-drivers/hw_fence \
    qcom/opensource/mm-drivers/msm_ext_display \
    qcom/opensource/mm-drivers/sync_fence \
    qcom/opensource/securemsm-kernel \
    qcom/opensource/audio-kernel \
    qcom/opensource/camera-kernel \
    qcom/opensource/datarmnet-ext/mem \
    qcom/opensource/dataipa/drivers/platform/msm \
    qcom/opensource/datarmnet/core \
    qcom/opensource/datarmnet-ext/aps \
    qcom/opensource/datarmnet-ext/offload \
    qcom/opensource/datarmnet-ext/shs \
    qcom/opensource/datarmnet-ext/perf \
    qcom/opensource/datarmnet-ext/perf_tether \
    qcom/opensource/datarmnet-ext/sch \
    qcom/opensource/datarmnet-ext/wlan \
    qcom/opensource/display-drivers/msm \
    qcom/opensource/dsp-kernel \
    qcom/opensource/video-driver \
    qcom/opensource/graphics-kernel \
    qcom/opensource/wlan/platform \
    qcom/opensource/wlan/qcacld-3.0 \
    qcom/opensource/bt-kernel \
    qcom/opensource/mm-sys-kernel/ubwcp \
    qcom/opensource/fingerprint \
    qcom/opensource/touch-drivers

# Partitions
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := odm product system system_dlkm system_ext vendor vendor_dlkm
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 9659482112 # BOARD_SUPER_PARTITION_SIZE - 4MiB
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE := 9663676416

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x6000000
BOARD_DTBOIMG_PARTITION_SIZE := 0x1800000
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 32)
BOARD_INIT_BOOT_IMAGE_PARTITION_SIZE := 0x800000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x6400000
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 0x6000000

BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := $(PRODUCT_RO_FILE_SYSTEM)
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := $(PRODUCT_RO_FILE_SYSTEM)
BOARD_SYSTEM_DLKMIMAGE_FILE_SYSTEM_TYPE := $(PRODUCT_RO_FILE_SYSTEM)
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := $(PRODUCT_RO_FILE_SYSTEM)
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := $(PRODUCT_RO_FILE_SYSTEM)
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := $(PRODUCT_RO_FILE_SYSTEM)
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := $(PRODUCT_RO_FILE_SYSTEM)

TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_SYSTEM_DLKM := system_dlkm
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := volcano

# Power
TARGET_TAP_TO_WAKE_NODE := "/proc/touchpanel/gesture_mode"

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Recovery
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/init/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 100
TARGET_USERIMAGES_USE_F2FS := true

# SELinux
include device/qcom/sepolicy_vndr/SEPolicy.mk

BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# VINTF
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/framework_matrix_nothing.xml \
    hardware/qcom-caf/common/vendor_framework_compatibility_matrix.xml
DEVICE_FRAMEWORK_MANIFEST_FILE += $(DEVICE_PATH)/framework_manifest.xml
DEVICE_MATRIX_FILE := hardware/qcom-caf/common/compatibility_matrix.xml

ODM_MANIFEST_FILES += $(DEVICE_PATH)/manifest_asteroids.xml
ODM_MANIFEST_SKUS := JPN
ODM_MANIFEST_JPN_FILES := $(DEVICE_PATH)/manifest_JPN.xml

DEVICE_MANIFEST_SKUS += volcano
DEVICE_MANIFEST_VOLCANO_FILES += $(DEVICE_PATH)/manifest_volcano.xml

# Wi-Fi
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := $(BOARD_HOSTAPD_DRIVER)
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := $(BOARD_HOSTAPD_PRIVATE_LIB)
BOARD_WPA_SUPPLICANT_PRIVATE_LIB_EVENT := "ON"
CONFIG_ACS := true
CONFIG_DPP3 := true
CONFIG_FST := true
CONFIG_IEEE80211AC := true
CONFIG_IEEE80211AX := true
CONFIG_IEEE80211BE := true
CONFIG_MBO := true
CONFIG_OCV := true
CONFIG_PASN := true
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_DRIVER_STATE_ON := "ON"
WIFI_HIDL_FEATURE_AWARE := true
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X
