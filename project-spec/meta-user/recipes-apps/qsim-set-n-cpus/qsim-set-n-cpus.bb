#
# This file is the qsim-set-n-cpus recipe.
#

SUMMARY = "Simple qsim-set-n-cpus application"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://qsim-set-n-cpus.c \
	   file://Makefile \
		  "

S = "${WORKDIR}"

do_compile() {
	     oe_runmake
}

do_install() {
	     install -d ${D}${bindir}
	     install -m 0755 qsim-set-n-cpus ${D}${bindir}
}
