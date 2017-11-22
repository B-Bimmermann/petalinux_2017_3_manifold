BITSTREAM ?= images/linux/design_1_wrapper.bit
BOOT_BIN = images/linux/BOOT.BIN
QSIM ?= $(QSIM_PREFIX)/qsim-fastforwarder
QSIM_MEM_SIZE = 4096
QSIM_NUM_CPUS = 4
QSIM_STATE_FILE = "xilinx_zcu102"
QSIM_DT = "a"
QSIM_PATH = `pwd`
XILINX_ZCU102_BSP_PATH = "~/Downloads/xilinx-zcu102-v2017.3-final.bsp"


init: fix-tmp-dir-location
	petalinux-create -t project -s $(XILINX_ZCU102_BSP_PATH)

build: fix-tmp-dir-location
	petalinux-build

config: fix-tmp-dir-location
	petalinux-config

config-kernel: fix-tmp-dir-location
	petalinux-config -c kernel

config-rootfs: fix-tmp-dir-location
	petalinux-config -c rootfs

package-boot:
	petalinux-package --boot --force --fpga $(BITSTREAM) --u-boot --output $(BOOT_BIN)
	tar -czf images/linux/img.tgz images/linux/BOOT.BIN images/linux/image.ub

distclean: fix-tmp-dir-location
	petalinux-build -x distclean
	rm -rf components/plnx_workspace

mrproper: fix-tmp-dir-location
	petalinux-build -x mrproper
	rm -rf components/plnx_workspace
	rm -rf pre-built
	rm -rf *.bsp

fix-tmp-dir-location:
	echo "start	"
#	sed --in-place --expression "s|CONFIG_TMP_DIR_LOCATION=.*|CONFIG_TMP_DIR_LOCATION=\"$(PWD)/build/tmp\"|" project-spec/configs/config

qsim-boot:
	$(QSIM) $(QSIM_PATH) $(QSIM_NUM_CPUS) $(QSIM_MEM_SIZE) $(QSIM_STATE_FILE) $(QSIM_DT)

qsim-test:
	$(QSIM) ./ $(QSIM_NUM_CPUS) $(QSIM_MEM_SIZE) 

.PHONY: distclean mrproper
