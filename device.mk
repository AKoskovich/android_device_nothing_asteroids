#
# SPDX-FileCopyrightText: 2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, hardware/qcom-caf/common/common.mk)
$(call inherit-product, vendor/nothing/asteroids/asteroids-vendor.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/vabc_features.mk)

PRODUCT_RO_FILE_SYSTEM ?= ext4

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=$(PRODUCT_RO_FILE_SYSTEM) \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=$(PRODUCT_RO_FILE_SYSTEM) \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

PRODUCT_VENDOR_PROPERTIES += \
    ro.virtual_ab.compression.threads=true \
    ro.virtual_ab.merge_delay_seconds=40

PRODUCT_VIRTUAL_AB_COMPRESSION_METHOD := lz4

# API
PRODUCT_SHIPPING_API_LEVEL := 35

# ART
PRODUCT_ENABLE_UFFD_GC := true

# Adreno
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_3.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2023-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2023-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml

PRODUCT_VENDOR_PROPERTIES += \
    graphics.gpu.profiler.support=true \
    ro.hardware.egl=adreno \
    ro.hardware.vulkan=adreno \
    ro.opengles.version=196610

# Audio
AUDIO_HAL_DIR := hardware/qcom-caf/sm8650/audio/primary-hal
AUDIO_PAL_DIR := hardware/qcom-caf/sm8650/audio/pal

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml

PRODUCT_COPY_FILES += \
    $(AUDIO_HAL_DIR)/configs/volcano/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_volcano/audio_effects.conf \
    $(AUDIO_HAL_DIR)/configs/volcano/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_volcano/audio_effects.xml \
    $(AUDIO_HAL_DIR)/configs/volcano/microphone_characteristics.xml:$(TARGET_COPY_OUT_VENDOR)/etc/microphone_characteristics.xml \
    $(AUDIO_PAL_DIR)/configs/volcano/card-defs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/card-defs.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_volcano/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(LOCAL_PATH)/audio/mixer_paths_volcano_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_volcano/mixer_paths_volcano_qrd.xml \
    $(LOCAL_PATH)/audio/resourcemanager_volcano_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_volcano/resourcemanager_volcano_qrd.xml \
    $(LOCAL_PATH)/audio/usecaseKvManager.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usecaseKvManager.xml

PRODUCT_PACKAGES += \
    android.hardware.audio@7.1-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.audio.service \
    android.hardware.bluetooth.audio-impl \
    android.hardware.soundtrigger@2.3-impl \
    audio.bluetooth.default \
    audio.primary.volcano \
    audio.r_submix.default \
    audio.usb.default \
    audioadsprpcd \
    lib_bt_aptx \
    lib_bt_ble \
    lib_bt_bundle \
    libagm_compress_plugin \
    libagm_mixer_plugin \
    libagm_pcm_plugin \
    libagmmixer \
    libaudiochargerlistener \
    libbatterylistener \
    libcustomva_intf \
    libfmpal \
    libhfp_pal \
    libhotword_intf \
    libpalclient \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libvolumelistener \
    sound_trigger.primary.volcano

PRODUCT_PRODUCT_PROPERTIES += \
    audio.offload.min.duration.secs=30 \
    media.stagefright.audio.deep=false \
    ro.af.client_heap_size_kbyte=7168 \
    ro.audio.monitorRotation=true

PRODUCT_VENDOR_PROPERTIES += \
    aaudio.hw_burst_min_usec=2000 \
    aaudio.mmap_exclusive_policy=2 \
    aaudio.mmap_policy=2 \
    af.fast_track_multiplier=1 \
    audio.deep_buffer.media=true \
    audio.offload.video=true \
    persist.bluetooth.a2dp_offload.disabled=false \
    ro.af.client_heap_size_kbyte=7168 \
    ro.audio.flinger_standbytime_ms=2000 \
    ro.bluetooth.a2dp_offload.supported=true \
    vendor.audio.adm.buffering.ms=2 \
    vendor.audio.feature.a2dp_offload.enable=true \
    vendor.audio.feature.afe_proxy.enable=true \
    vendor.audio.feature.battery_listener.enable=true \
    vendor.audio.feature.hfp.enable=true \
    vendor.audio.feature.kpi_optimize.enable=true \
    vendor.audio.offload.buffer.size.kb=32 \
    vendor.audio.offload.playspeed=true \
    vendor.audio.ull_record_period_multiplier=2 \
    vendor.audio.volume.headset.gain.depcal=true \
    vendor.audio_hal.period_size=192

# Biometrics
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# Bluetooth
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml

PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.profile.a2dp.source.enabled=true \
    bluetooth.profile.avrcp.target.enabled=true \
    bluetooth.profile.avrcp.controller.enabled=true \
    bluetooth.profile.hfp.ag.enabled=true \
    bluetooth.profile.gatt.enabled=true \
    bluetooth.profile.hid.host.enabled=true \
    bluetooth.profile.hid.device.enabled=true \
    bluetooth.profile.map.server.enabled=true \
    bluetooth.profile.opp.enabled=true \
    bluetooth.profile.pan.nap.enabled=true \
    bluetooth.profile.pan.panu.enabled=true \
    bluetooth.profile.pbap.server.enabled=true \
    bluetooth.device_id.vendor_id=0x001D

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    bluetooth.device.class_of_device=90,2,12 \
    bluetooth.hfp.codec_aptx_voice.enabled=true \
    bluetooth.hfp.swb.aptx.power_management.enabled=true \
    bluetooth.leaudio.dual_bidirection_swb.supported=true \
    bluetooth.profile.pbap.sim.enabled=true \
    bluetooth.profile.sap.server.enabled=true \
    persist.bluetooth.leaudio.allow.multiple.contexts=false \
    persist.bluetooth.leaudio.notify.idle.during.call=true \
    persist.bluetooth.leaudio_offload.disabled=false \
    ro.bluetooth.leaudio_offload.supported=true

PRODUCT_VENDOR_PROPERTIES += \
    bluetooth.profile.bap.broadcast.assist.enabled=true \
    bluetooth.profile.bap.broadcast.source.enabled=true \
    bluetooth.profile.bap.unicast.client.enabled=true \
    bluetooth.profile.bas.client.enabled=true \
    bluetooth.profile.ccp.server.enabled=true \
    bluetooth.profile.csip.set_coordinator.enabled=true \
    bluetooth.profile.hap.client.enabled=true \
    bluetooth.profile.mcp.server.enabled=true \
    bluetooth.profile.vcp.controller.enabled=true \
    persist.sys.fflag.override.settings_bluetooth_hearing_aid=true \
    persist.vendor.bluetooth.modem_nv_support=true \
    persist.vendor.qcom.bluetooth.a2dp_mcast_test.enabled=false \
    persist.vendor.qcom.bluetooth.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldac-aptxadaptiver2 \
    persist.vendor.qcom.bluetooth.aac_frm_ctl.enabled=true \
    persist.vendor.qcom.bluetooth.aptxadaptiver2_1_support=true \
    persist.vendor.qcom.bluetooth.scram.enabled=false \
    persist.vendor.qcom.bluetooth.twsp_state.enabled=false \
    vendor.hw.fm.init=0

# Boot Control
PRODUCT_PACKAGES += \
    android.hardware.boot-service.qti \
    android.hardware.boot-service.qti.recovery

# CNE
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.vendor.cne.feature=1

# Camera
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.concurrent.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.concurrent.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

PRODUCT_PACKAGES += \
    vendor.qti.hardware.display.config-V2-ndk.vendor

PRODUCT_PRODUCT_PROPERTIES += \
    ro.camerax.extensions.enabled=true

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    vendor.camera.aux.packagelist=com.nothing.camera,org.lineageos.aperture,org.lineageos.aperture.dev

PRODUCT_VENDOR_PROPERTIES += \
    camera.disable_zsl_mode=1 \
    ro.camera.enableCamera1MaxZsl=1

# Charger
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.charger.enable_suspend=1

# DPM
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.vendor.dpm.feature=11

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.dpm.vndr.feature=11 \
    persist.vendor.dpm.vndr.halservice.enable=1 \
    persist.vendor.dpm.vndr.idletimer.mode=default

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey

PRODUCT_VENDOR_PROPERTIES += \
    drm.service.enabled=true

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Data
PRODUCT_PACKAGES += \
    IPACM_Filter_cfg.xml \
    IPACM_cfg.xml \
    ipacm

# Display
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/display_id_asteroids.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_4630946978939328130.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

PRODUCT_PACKAGES += \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    init.qti.display_boot.rc \
    init.qti.display_boot.sh \
    vendor.qti.hardware.display.allocator-service \
    vendor.qti.hardware.display.composer-service \
    vendor.qti.hardware.display.demura-service

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    sys.brightness.disable_gamma_conversion=true

PRODUCT_VENDOR_PROPERTIES += \
    vendor.display.comp_mask=0 \
    vendor.display.disable_3d_adaptive_tm=1 \
    vendor.display.disable_cwb_idle_fallback=1 \
    vendor.display.disable_dynamic_fps=1 \
    vendor.display.disable_excl_rect=0 \
    vendor.display.disable_excl_rect_partial_fb=1 \
    vendor.display.disable_hw_recovery_dump=1 \
    vendor.display.disable_offline_rotator=1 \
    vendor.display.disable_scaler=0 \
    vendor.display.disable_sdr_dimming=0 \
    vendor.display.disable_sdr_histogram=1 \
    vendor.display.disable_stc_dimming=1 \
    vendor.display.enable_async_vds_creation=1 \
    vendor.display.enable_dpps_dynamic_fps=1 \
    vendor.display.enable_hdr10_gpu_target=1 \
    vendor.display.enable_optimize_refresh=0 \
    vendor.display.enable_rounded_corner=0 \
    vendor.display.vds_allow_hwc=1 \
    vendor.gralloc.disable_ubwc=0 \
    vendor.gralloc.enable_logs=0

# eUICC
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_JPN/android.hardware.telephony.euicc.xml \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_ProEEA/android.hardware.telephony.euicc.xml \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_ProROW/android.hardware.telephony.euicc.xml \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_ProTUR/android.hardware.telephony.euicc.xml

PRODUCT_PACKAGES += \
    AsteroidsEuicc \
    default-permissions-com.google.android.euicc.xml

PRODUCT_PRODUCT_PROPERTIES += \
    masterclear.allow_retain_esim_profiles_after_fdr=true

# FUSE
PRODUCT_VENDOR_PROPERTIES += \
    persist.sys.fuse.passthrough.enable=true

# FRP
PRODUCT_VENDOR_PROPERTIES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/frp

# FWK Detect
PRODUCT_PACKAGES += \
    libvndfwk_detect_jni.qti_vendor

# Fastboot
PRODUCT_PACKAGES += \
    fastbootd

# GPS
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml

# Graphics
PRODUCT_VENDOR_PROPERTIES += \
    debug.sf.auto_latch_unsignaled=1 \
    debug.sf.early.app.duration=13666666 \
    debug.sf.early.sf.duration=10500000 \
    debug.sf.earlyGl.app.duration=13666666 \
    debug.sf.earlyGl.sf.duration=10500000 \
    debug.sf.enable_gl_backpressure=1 \
    debug.sf.late.app.duration=13666666 \
    debug.sf.late.sf.duration=10500000 \
    debug.sf.predict_hwc_composition_strategy=0 \
    debug.sf.treat_170m_as_sRGB=1 \
    debug.sf.use_phase_offsets_as_durations=1 \
    persist.sys.sf.native_mode=260 \
    ro.surface_flinger.force_hwc_copy_for_virtual_displays=true \
    ro.surface_flinger.game_default_frame_rate_override=60 \
    ro.surface_flinger.has_HDR_display=true \
    ro.surface_flinger.has_wide_color_display=true \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
    ro.surface_flinger.max_virtual_display_dimension=4096 \
    ro.surface_flinger.protected_contents=true \
    ro.surface_flinger.set_idle_timer_ms=3000 \
    ro.surface_flinger.set_touch_timer_ms=200 \
    ro.surface_flinger.use_color_management=true \
    ro.surface_flinger.use_content_detection_for_refresh_rate=true \
    ro.surface_flinger.wcg_composition_dataspace=143261696

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.allocator@1.0-service \
    hwservicemanager

# Health
PRODUCT_PACKAGES += \
    android.hardware.health-service.qti \
    android.hardware.health-service.qti_recovery

# Incremental FS
PRODUCT_VENDOR_PROPERTIES += \
    ro.incremental.enable=yes

# Init
$(call soong_config_set,libinit,vendor_init_lib,//$(LOCAL_PATH):libinit_asteroids)

PRODUCT_PACKAGES += \
    fstab.qcom \
    fstab.qcom.vendor_ramdisk \
    fstab.zram.2g \
    init.asteroids.hw.rc \
    init.asteroids.rc \
    init.class_main.sh \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    init.qcom.rc \
    init.qcom.recovery.rc \
    init.qcom.sh \
    init.target.rc \
    ueventd.asteroids.rc \
    ueventd.qcom.rc

# Kernel
 PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/system_dlkm.modules.blocklist:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/system_dlkm.modules.blocklist

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl

# Keymint
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.keystore.app_attest_key.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.keystore.app_attest_key.xml \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml

PRODUCT_PACKAGES += \
    android.hardware.hardware_keystore_V3.xml

PRODUCT_VENDOR_PROPERTIES += \
    ro.crypto.metadata_init_delete_all_keys.enabled=true \
    ro.hardware.keystore_desede=true \
    vendor.gatekeeper.is_security_level_spu=0

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    media.stagefright.thumbnail.prefer_hw_codecs=true \
    ro.media.recorder-max-base-layer-fps=60

PRODUCT_VENDOR_PROPERTIES += \
    debug.stagefright.c2inputsurface=-1 \
    debug.stagefright.omx_default_rank=0 \
    vendor.qc2audio.per_frame.flac.dec.enabled=true \
    vendor.qc2audio.suspend.enabled=true

# Memtrack
PRODUCT_PACKAGES += \
    vendor.qti.hardware.memtrack-service

# NFC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-hal-st-JPN.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st-JPN.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-hal-st-PRO.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st-PRO.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-hal-st-BASE.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st-BASE.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-nci-JPN.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci-JPN.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_JPN/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml

PRODUCT_PACKAGES += \
    android.hardware.nfc-service.st

# Netmgr
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.vendor.data.mode=concurrent

# OEM Unlock
PRODUCT_VENDOR_PROPERTIES += \
    ro.oem_unlock_supported=1

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rro_overlays/partition_order.xml:$(TARGET_COPY_OUT_PRODUCT)/overlay/partition_order.xml

PRODUCT_ENFORCE_RRO_TARGETS := *

PRODUCT_PACKAGES += \
    AsteroidsApertureDevOverlay \
    AsteroidsApertureOverlay \
    AsteroidsFrameworksOverlay \
    AsteroidsMainlineWifiOverlay \
    AsteroidsProApertureDevOverlay \
    AsteroidsProApertureOverlay \
    AsteroidsProMainlineWifiOverlay \
    AsteroidsProSettingsProviderOverlay \
    AsteroidsProWifiOverlay \
    AsteroidsSettingsOverlay \
    AsteroidsSettingsProviderOverlay \
    AsteroidsSystemUIOverlay \
    AsteroidsWifiOverlay \
    CarrierConfigResCommon_Vendor \
    FrameworksResCommon_Vendor \
    FrameworksResTarget_Vendor \
    NcmTetheringOverlay \
    SecureElementResTarget_Vendor \
    SettingsResCommon_Vendor \
    SystemUIResCommon_Vendor \
    TelephonyResCommon_Sys \
    TelephonyResCommon_Vendor \
    UwbResCommon_Vendor \
    WifiResCommonMainline_Vendor \
    WifiResCommon_Vendor \
    WifiResMainlineTarget \
    WifiResTarget

# Partitions
PRODUCT_BUILD_RECOVERY_IMAGE := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true

PRODUCT_PACKAGES += \
    vendor_bt_firmware_mountpoint \
    vendor_dsp_mountpoint \
    vendor_firmware_mnt_mountpoint

# Performance
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.extension_library=libqti-perfd-client.so

# Permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-nothing.xml

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service-qti

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Public Libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.system_ext.txt:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/public.libraries.txt

# QC Value Addons
PRODUCT_ODM_PROPERTIES += \
    ro.vendor.qti.va_odm.support=1

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.vendor.qti.va_aosp.support=1

# RIL
PRODUCT_VENDOR_PROPERTIES += \
    persist.radio.multisim.config=dsds \
    persist.vendor.radio.apm_sim_not_pwdn=1 \
    persist.vendor.radio.custom_ecc=1 \
    persist.vendor.radio.enableadvancedscan=true \
    persist.vendor.radio.procedure_bytes=SKIP \
    persist.vendor.radio.sib16_support=1

# Ramdisk
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)

# SSR
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.ssr.restart_level=ALL_ENABLE

# Secure Element
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_JPN/android.hardware.se.omapi.ese.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml

PRODUCT_PACKAGES += \
    android.hardware.secure_element-service.thales

# Security
BOOT_SECURITY_PATCH := 2025-03-05
INIT_BOOT_SECURITY_PATCH := $(BOOT_SECURITY_PATCH)
VENDOR_SECURITY_PATCH := $(BOOT_SECURITY_PATCH)

# Sensors
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_volcano/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_volcano/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.dynamic.head_tracker.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_volcano/android.hardware.sensor.dynamic.head_tracker.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_volcano/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_volcano/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_volcano/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_volcano/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_volcano/android.hardware.sensor.stepdetector.xml

PRODUCT_PACKAGES += \
    android.hardware.sensors-service.multihal \
    sensors.dynamic_sensor_hal

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.sensorhub.timeout_reset_threshold=20 \
    persist.vendor.sensors.enable.mag_filter=true

# SoC
PRODUCT_VENDOR_PROPERTIES += \
    ro.soc.manufacturer=QTI

# Soong
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    kernel/nothing/sm8650 \
    kernel/nothing/sm8650-modules

# Storage
PRODUCT_CHARACTERISTICS := nosdcard

# Telephony
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.telephony.mbms.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.mbms.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml

PRODUCT_PACKAGES += \
    extphonelib \
    extphonelib-product \
    extphonelib.xml \
    extphonelib_product.xml \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti-telephony-hidl-wrapper-prd \
    qti_telephony_hidl_wrapper.xml \
    qti_telephony_hidl_wrapper_prd.xml \
    qti-telephony-utils \
    qti-telephony-utils-prd \
    qti_telephony_utils.xml \
    qti_telephony_utils_prd.xml \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ril.subscription.types=NV,RUIM \
    ro.telephony.default_network=33,33 \
    telephony.lteOnCdmaDevice=1

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.rcs.singlereg.feature=1 \
    telephony.active_modems.max_count=2

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal-service.qti

# USB
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml

PRODUCT_PACKAGES += \
    android.hardware.usb-service.qti \
    android.hardware.usb.gadget-service.qti \
    init.qcom.usb.rc \
    init.qcom.usb.sh \
    usb_compositions.conf

PRODUCT_SOONG_NAMESPACES += \
    vendor/qcom/opensource/usb/etc

PRODUCT_ODM_PROPERTIES += \
    ro.usb.uvc.disable_video_encode_flag=true \
    ro.usb.uvc.enabled=true

PRODUCT_VENDOR_PROPERTIES += \
    sys.usb.mtp.batchcancel=1 \
    vendor.usb.controller=a600000.dwc3 \
    vendor.usb.diag.func.name=ffs \
    vendor.usb.dpl.inst.name=dpl \
    vendor.usb.qdss.inst.name=qdss_sw \
    vendor.usb.rmnet.func.name=gsi \
    vendor.usb.rmnet.inst.name=rmnet \
    vendor.usb.rndis.func.name=gsi \
    vendor.usb.use_ffs_mtp=1 \
    vendor.usb.use_gadget_hal=1

# Update Engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

# Vendor Service Manager
PRODUCT_PACKAGES += \
    vndservicemanager

# Verified Boot
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml

# Vibrator
$(call soong_config_set,qti_vibrator,effect_lib,libqtivibratoreffect.nothing_sm7635-richtap)
$(call soong_config_set,qti_vibrator,use_effect_stream,true)

PRODUCT_COPY_FILES += \
    vendor/qcom/opensource/vibrator/excluded-input-devices.xml:$(TARGET_COPY_OUT_VENDOR)/etc/excluded-input-devices.xml

PRODUCT_PACKAGES += \
    vendor.qti.hardware.vibrator.service

# Wi-Fi
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml

PRODUCT_PACKAGES += \
    android.hardware.wifi-service \
    firmware_wlanmdsp.otaupdate_symlink \
    firmware_wlan_mac.bin_symlink \
    hostapd \
    libwifi-hal-ctrl \
    libwifi-hal-qcom \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_VENDOR_PROPERTIES += \
    wifi.aware.interface=wifi-aware0
