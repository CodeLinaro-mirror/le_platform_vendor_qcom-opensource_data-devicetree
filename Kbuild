ifeq ($(CONFIG_ARCH_SA510M),y)
dtbo-y += ./ipa/sa510m-ipa.dtbo
dtbo-y += ./eth/sa510m-eth.dtbo
endif

dtbo-y += ./ipa/kalama-ipa.dtbo

always-y	:= $(dtb-y) $(dtbo-y)
subdir-y	:= $(dts-dirs)
clean-files	:= *.dtb *.dtbo
