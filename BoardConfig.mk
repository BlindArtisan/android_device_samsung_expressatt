# Copyright (C) 2013 The CyanogenMod Project
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

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/samsung/expressatt/BoardConfigVendor.mk

# inherit from common msm8960
-include device/samsung/msm8960-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH := device/samsung/expressatt/include

# Kernel
TARGET_KERNEL_SOURCE        := kernel/samsung/expressatt
TARGET_KERNEL_CONFIG        := cyanogenmod_expressatt_defconfig
BOARD_KERNEL_CMDLINE        := androidboot.hardware=qcom user_debug=31
BOARD_KERNEL_BASE           := 0x80200000
BOARD_MKBOOTIMG_ARGS        := --ramdisk_offset 0x01300000
BOARD_KERNEL_PAGESIZE       := 2048

TARGET_BOOTLOADER_BOARD_NAME := MSM8960

# Asserts
TARGET_OTA_ASSERT_DEVICE := expressatt,SGH-I437,SGH-I437P
#TARGET_BOARD_INFO_FILE ?= device/samsung/expressatt/board-info.txt

# Wifi
WIFI_BAND := 802_11_ABG
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HAVE_SAMSUNG_WIFI :=
BOARD_HAS_QCOM_WLAN := true

WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/prima_wlan.ko"
WIFI_DRIVER_MODULE_NAME := "prima_wlan"
WIFI_DRIVER_MODULE_ARG :=
WIFI_DRIVER_MODULE_AP_ARG :=
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/prima_wlan/parameters/fwpath"
WIFI_DRIVER_FW_PATH_STA :=
WIFI_DRIVER_FW_PATH_AP :=
WIFI_DRIVER_FW_PATH_P2P :=

# Recovery
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/expressatt/recovery/recovery_keys.c
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
BOARD_USES_MMCUTILS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1572864000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 28651290624
BOARD_FLASH_BLOCK_SIZE := 131072

# bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/expressatt/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/expressatt/bluetooth/vnd_expressatt.txt
BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := false

# Disable initlogo, Samsungs framebuffer is weird
TARGET_NO_INITLOGO := true

#BOARD_EGL_NEEDS_LEGACY_FB := true

# HAX
#BOARD_USE_SAMSUNG_SEPARATEDSTREAM := true
#BOARD_USES_LIBMEDIA_WITH_AUDIOPARAMETER := true
#TARGET_PROVIDES_LIBAUDIO := true

# Use Audience A2220 chip
#BOARD_HAVE_AUDIENCE_A2220 := true

# Use USB Dock Audio
#BOARD_HAVE_DOCK_USBAUDIO := true

