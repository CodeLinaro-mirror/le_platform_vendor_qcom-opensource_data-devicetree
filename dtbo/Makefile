# Makefile for data-dtbo
# Invoked by data-dtbo.bb via oe_runmake.
# DTC, KERNEL_INCLUDE and DATA_DEVICETREE_INCLUDE are passed explicitly by the recipe.

KERNEL_INCLUDE ?= $(LINUX_DIR)/include/
DTC            ?= $(LINUX_DIR)/scripts/dtc/dtc
# Root of the data-devicetree tree (eth/, ipa/, qms/, ...) — passed by the
# recipe as DATA_DEVICETREE_INCLUDE so each subsystem's .dts can #include its
# sibling .dtsi (e.g. eth/echo-eth.dtsi, ipa/echo-ipa.dtsi, qms/smem-mailbox.dtsi).
DATA_DEVICETREE_INCLUDE ?= $(LINUX_DIR)/../data-devicetree

# Every immediate subfolder of DATA_DEVICETREE_INCLUDE becomes its own -I
# path, so #include "<sibling>.dtsi" resolves no matter which subsystem
# folder (eth/, ipa/, qms/, or any new one) it is compiled from.
SUBSYSTEM_INCLUDES := $(wildcard $(DATA_DEVICETREE_INCLUDE)/*/)

# List every overlay source here, one DTBO line per variant, as
# <subsystem-folder>/<name-without-.dts-extension> (path relative to this
# Makefile, i.e. ${S}/dtbo). Add new subsystems the same way, e.g.:
#   DTBO += eth/echo-idp
DTBO += eth/echo_emac0_128_tcm_ring_buf_desc_en
DTBO += eth/echo_emac0_64min_tcm_ring_buf_desc_en
DTBO += eth/echo_emac1_128_tcm_ring_buf_desc_en
DTBO += eth/echo_emac1_64min_tcm_ring_buf_desc_en
DTBO += eth/echo_emac_serdes_pm_off
DTBO += eth/echo_emac_sph_en
DTBO += eth/echo_emac_tcm_buf_en_desc_off
DTBO += eth/echo_emac_tcm_disable
DTBO += eth/sa535m_emac0_rgmii

.PHONY: dtbs clean
dtbs: $(DTBO)

# Pattern rule: compile <name>.dts -> <name>.dtbo
# Step 1: preprocess — resolves #include directives
# Step 2: compile preprocessed DTS overlay -> .dtbo using dtc
#          -@  : compile with symbol support (required for ABL overlay apply)
#          -O dtb : output format Device Tree Blob
%:
	$(CC) -undef -x assembler-with-cpp \
	      $(shell pwd)/$@.dts \
	      -I $(KERNEL_INCLUDE) \
	      $(addprefix -I ,$(SUBSYSTEM_INCLUDES)) \
	      -E -o $(shell pwd)/$@.dts.preprocessed
	$(DTC) -@ -O dtb \
	       -o $(shell pwd)/$@.dtbo \
	       $(shell pwd)/$@.dts.preprocessed

clean:
	rm -f $(shell find . -name "*.dts.preprocessed" -o -name "*.dtbo")
