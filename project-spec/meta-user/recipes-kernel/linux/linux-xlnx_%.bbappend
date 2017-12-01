SRC_URI += "file://bsp.cfg \
            file://user_2017-11-08-15-37-00.cfg \
            file://0001-Qsim-specific-changes-to-the-linux-xilinx-kernel.patch \
            file://user_2017-12-01-16-23-00.cfg \
            "

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
