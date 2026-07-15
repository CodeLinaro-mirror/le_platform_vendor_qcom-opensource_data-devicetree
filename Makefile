include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

KERNEL_INCLUDE="$(LINUX_DIR)/include/"
DTC := $(LINUX_DIR)/scripts/dtc/dtc

ifeq ($(TARGET_SUPPORT), sa535m)
DTBO += eth/sa535m-eth
DTBO += ipa/sa535m-ipa
else
DTBO += ipa/echo-ipa
DTBO += eth/echo-idp
DTBO += eth/echo-idp-qmp5
DTBO += eth/echo-idp-qmp5-v2
DTBO += eth/echo-idp-qmp5-v3
DTBO += eth/echo-idp-lga
DTBO += eth/echo-rcm
DTBO += eth/echo-rcm-v2
endif

.PHONY: all clean dtbs

dtbs: $(DTBO)

%:
	${CC} -undef -x assembler-with-cpp $(shell pwd)/$@.dts -I ${KERNEL_INCLUDE} -E -o $(shell pwd)/$@.dts.preprocessed
	${DTC} -O dtb -o $(shell pwd)/$@.dtbo $(shell pwd)/$@.dts.preprocessed


clean:
	rm -rf *.preprocessed
