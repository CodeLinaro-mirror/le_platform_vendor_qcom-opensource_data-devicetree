include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

KERNEL_INCLUDE="$(LINUX_DIR)/include/"
DTC := $(LINUX_DIR)/scripts/dtc/dtc

DTBO += ipa/sdxecho-ipa
DTBO += eth/sdxecho-idp
DTBO += eth/sdxecho-idp-qmp5
DTBO += eth/sdxecho-idp-qmp5-v2
DTBO += eth/sdxecho-idp-qmp5-v3

.PHONY: all clean dtbs

dtbs: $(DTBO)

%:
	${CC} -undef -x assembler-with-cpp $(shell pwd)/$@.dts -I ${KERNEL_INCLUDE} -E -o $(shell pwd)/$@.dts.preprocessed
	${DTC} -O dtb -o $(shell pwd)/$@.dtbo $(shell pwd)/$@.dts.preprocessed


clean:
	rm -rf *.preprocessed
