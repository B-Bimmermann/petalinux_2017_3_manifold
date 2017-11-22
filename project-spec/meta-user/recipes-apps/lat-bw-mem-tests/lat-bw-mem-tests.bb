#
# This file is the lat-bw-mem-tests recipe.
#

SUMMARY = "Simple lat-bw-mem-tests application"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://lat-bw-mem-tests \
	"

S = "${WORKDIR}"

RDEPENDS_${PN} = "bash"

do_install() {
	     install -d ${D}/${bindir}
	     install -m 0755 ${S}/lat-bw-mem-tests ${D}/${bindir}
}
