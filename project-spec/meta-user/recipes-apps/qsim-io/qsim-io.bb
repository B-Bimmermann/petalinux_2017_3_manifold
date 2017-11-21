#
# This file is the qsim-io recipe.
#

SUMMARY = "Simple qsim-io application"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://qsim-io.c \
	   file://debug_print.h \
	   file://Makefile \
		  "

S = "${WORKDIR}"

do_compile() {
	     oe_runmake
}

# Create the data folder
#	install -d ${D}/data
#       install -m 0755 qsim-io ${D}/data
#  we must put some thing in it ... :(


do_install() {
	     install -d ${D}${base_sbindir}
	     install -m 0755 qsim-io ${D}${base_sbindir}
             install -d ${D}/data
	     install -m 0755 qsim-io ${D}/data
}

# Wir sollten sicher sein, dass install fertig ist
do_install_append () {
        ln -s qsim-io ${D}${base_sbindir}/qsim_io
        ln -s qsim-io ${D}${base_sbindir}/qsim_in
        ln -s qsim-io ${D}${base_sbindir}/qsim_out
        ln -s qsim-io ${D}${base_sbindir}/qsim_bin_out
}


# create the folder in the file system
FILES_${PN} = " \
	/sbin/qsim-io \
	/sbin/qsim_out \
	/sbin/qsim_io \
	/sbin/qsim_bin_out \
	/sbin/qsim_in \
	/data/*  \
"
