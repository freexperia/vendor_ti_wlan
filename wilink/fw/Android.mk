LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

# files that live under /system/etc/...

file := tiwlan_firmware.bin

copy_to := $(addprefix $(TARGET_OUT)/etc/,$(file))
copy_from := $(addprefix $(LOCAL_PATH)/,$(file))

$(copy_to) : PRIVATE_MODULE := system_etcdir
$(copy_to) : $(TARGET_OUT)/etc/% : $(LOCAL_PATH)/% | $(ACP)
	$(transform-prebuilt-to-target)

ALL_PREBUILT += $(copy_to)
