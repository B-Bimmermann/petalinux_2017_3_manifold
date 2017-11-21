SRC_URI += "file://bsp.cfg \
            file://user_2017-11-08-15-37-00.cfg \
            file://0001-Qsim-specific-changes-to-the-linux-xilinx-kernel.patch \
            "

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
