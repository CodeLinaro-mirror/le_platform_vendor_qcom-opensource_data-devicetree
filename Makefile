include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

KERNEL_INCLUDE="$(LINUX_DIR)/include/"
DTC := $(LINUX_DIR)/scripts/dtc/dtc

%:
	${CC} -undef -x assembler-with-cpp $(shell pwd)/ipa/$@.dts -I ${KERNEL_INCLUDE} -E -o $(shell pwd)/ipa/$@.dts.preprocessed
	${DTC} -O dtb -o $(shell pwd)/ipa/$@.dtbo $(shell pwd)/ipa/$@.dts.preprocessed

clean:
	rm -rf *.preprocessed
