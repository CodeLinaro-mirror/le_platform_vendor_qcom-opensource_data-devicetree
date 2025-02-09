ifeq ($(CONFIG_ARCH_SA510M),y)
dtbo-y += ./ipa/sa510m-ipa.dtbo
endif

always-y	:= $(dtb-y) $(dtbo-y)
subdir-y	:= $(dts-dirs)
clean-files	:= *.dtb *.dtbo
