ifeq ($(CONFIG_ARCH_SDXKOVA),y)
dtbo-y += ./ipa/sdxkova-ipa.dtbo
endif

ifeq ($(CONFIG_ARCH_SDXPINN),y)
dtbo-y += ./eth/sdxpinn-idp-cpe.dtbo
dtbo-y += ./eth/sdxpinn-idp-mbb.dtbo
dtbo-y += ./eth/sdxpinn-idp-mbb-v2.dtbo
endif

always-y	:= $(dtb-y) $(dtbo-y)
subdir-y	:= $(dts-dirs)
clean-files	:= *.dtb *.dtbo
