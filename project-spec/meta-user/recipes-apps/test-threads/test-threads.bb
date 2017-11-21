#
# This file is the test-threads recipe.
#

SUMMARY = "Simple test-threads application"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://test-threads.c \
	   file://Makefile \
		  "

S = "${WORKDIR}"

do_compile() {
	     oe_runmake
}

do_install() {
	     install -d ${D}${base_sbindir}
	     install -m 0755 test-threads ${D}${base_sbindir}
}

# Wir sollten sicher sein, dass install fertig ist
do_install_append () {
        ln -s test-threads ${D}${base_sbindir}/test_threads
}

# create the folder in the file system
FILES_${PN} = " \
	/sbin/test-threads \
	/sbin/test_threads \
"
