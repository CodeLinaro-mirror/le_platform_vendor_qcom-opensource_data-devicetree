ifeq ($(CONFIG_ARCH_SDXKOVA),y)
dtbo-y += ./ipa/sdxkova-ipa.dtbo
dtbo-y += ./ipa/sdxkova-512mb.dtbo
dtbo-y += ./ipa/sdxkova-idp-cpe-v2.dtbo
dtbo-y += ./eth/sdxkova-idp-mbb.dtbo
dtbo-y += ./eth/sdxkova-idp-cpe.dtbo
dtbo-y += ./eth/sdxkova-idp-mbb-v2.dtbo
dtbo-y += ./eth/sdxkova-idp-cpe-v7.dtbo
dtbo-y += ./eth/sdxkova-idp-m2-v5.dtbo
dtbo-y += ./eth/sdxkova-idp-lga.dtbo
endif

ifeq ($(CONFIG_ARCH_SDXPINN),y)
dtbo-y += ./eth/sdxpinn-idp-cpe.dtbo
dtbo-y += ./eth/sdxpinn-idp-mbb.dtbo
dtbo-y += ./eth/sdxpinn-idp-mbb-v2.dtbo
endif

always-y	:= $(dtb-y) $(dtbo-y)
subdir-y	:= $(dts-dirs)
clean-files	:= *.dtb *.dtbo
