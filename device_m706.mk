$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
# $(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/alps/m706/m706-vendor.mk)

#PRODUCT_CHARACTERISTICS := nosdcard

DEVICE_PACKAGE_OVERLAYS += device/alps/m706/overlay

LOCAL_PATH := device/alps/m706
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
    libxlog

PRODUCT_PACKAGES += \
    lights.mt6572

# audio
PRODUCT_PACKAGES += \
    audio.r_submix.default

PRODUCT_PACKAGES += \
    audio.primary.mt6572

PRODUCT_PACKAGES += \
    audio_policy.default

PRODUCT_PACKAGES += \
    lib_driver_cmd_mt66xx

PRODUCT_COPY_FILES += \
    device/alps/m706/rootdir/configs/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl

PRODUCT_COPY_FILES += \
    device/alps/m706/rootdir/root/fstab.mt6572:root/fstab.mt6572 \
    device/alps/m706/rootdir/root/init.recovery.mt6572.rc:root/init.recovery.mt6572.rc \
    device/alps/m706/rootdir/root/init.rc:root/init.rc \
    device/alps/m706/rootdir/root/init.mt6572.rc:root/init.mt6572.rc \
    device/alps/m706/rootdir/root/init.project.rc:root/init.project.rc \
    device/alps/m706/rootdir/root/factory_init.rc:root/factory_init.rc \
    device/alps/m706/rootdir/root/init.fuse.rc:root/init.fuse.rc \
    device/alps/m706/rootdir/root/init.modem.rc:root/init.modem.rc \
    device/alps/m706/rootdir/root/init.xlog.rc:root/init.xlog.rc \
    device/alps/m706/rootdir/root/ueventd.mt6572.rc:root/ueventd.mt6572.rc \
    device/alps/m706/rootdir/root/init.mt6572.usb.rc:root/init.mt6572.usb.rc \
    device/alps/m706/rootdir/root/init.protect.rc:root/init.protect.rc \
    device/alps/m706/rootdir/root/ueventd.rc:root/ueventd.rc \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
	device/alps/m706/rootdir/configs/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml \
	device/alps/m706/rootdir/configs/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/configs/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/rootdir/configs/media_profiles.xml:system/etc/media_profiles.xml

$(call inherit-product, build/target/product/full.mk)

PRODUCT_PROPERTY_OVERRIDES := \
	ro.mediatek.version.release=ALPS.W10.24.p0 \
	ro.mediatek.platform=mt6572 \
	ro.mediatek.chip_ver=S01 \
	ro.mediatek.version.branch=KK1.MP1 \
	ro.mediatek.version.sdk=2 \
	ro.telephony.sim.count=2 \
	ro.allow.mock.location=0 \
	ro.debuggable=1 \
	persist.sys.usb.config=mtp,adb \
	ro.mount.fs=EXT4 \
	persist.service.adb.enable=1 \
	persist.service.debuggable=1 \
	persist.mtk.wcn.combo.chipid=-1

PRODUCT_NAME := full_m706
PRODUCT_DEVICE := m706

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
