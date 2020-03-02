ARCHS = arm64 arm64e

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NoMoreBadgeNumbers

NoMoreBadgeNumbers_FILES = NoMoreBadgeNumbers.xm
NoMoreBadgeNumbers_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk