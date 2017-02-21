## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := m706

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/alps/m706/device_m706.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 800

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := m706
PRODUCT_NAME := cm_m706
PRODUCT_BRAND := alps
PRODUCT_MODEL := m706
PRODUCT_MANUFACTURER := alps
