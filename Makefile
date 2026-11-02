ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:15.0
INSTALL_TARGET_PROCESSES = SpringBoard
THEOS_PACKAGE_SCHEME = roothide

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = LockscreenQuickActions
LockscreenQuickActions_FILES = Tweak.xm
LockscreenQuickActions_CFLAGS = -fobjc-arc
LockscreenQuickActions_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
