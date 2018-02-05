#
# This file is the benchmarks-mani recipe.
#

SUMMARY = "Copy all benchmarks from manifold"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://benchmarks-mani \
	   file://benchmarks \
	"

S = "${WORKDIR}"

do_install() {
	     install -d ${D}/${bindir}
	     install -m 0755 ${S}/benchmarks-mani ${D}/${bindir}
	     install -d ${D}/data/benchmarks
	     cp      -r ${WORKDIR}/benchmarks   ${D}/data
}

RDEPENDS_${PN} = " \
	bash \
"

FILES_${PN} = " \
  /data/benchmarks \
  /data/benchmarks/* \
  /usr/bin/benchmarks-mani \
"

