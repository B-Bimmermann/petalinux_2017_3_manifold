#
# This file is the autostart recipe.
# Change this file later .....

SUMMARY = "Autostart application for manifold"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://autostart.sh \
	   file://benchmarks \	
		  "

S = "${WORKDIR}"
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"


# set autostart.sh as a star script
inherit update-rc.d

# set the initscript name
INITSCRIPT_NAME = "autostart.sh"
# set the script parameter
INITSCRIPT_PARAMS = "defaults"

# copy the script and all banchmarks for manifold
do_install() {
             install -d ${D}/data/benchmarks
	     cp      -r ${WORKDIR}/benchmarks   ${D}/data
             cp      -r ${WORKDIR}/autostart.sh ${D}/data
	     install -d ${D}${sysconfdir}/init.d/
	     install -m 0755 ${S}/autostart.sh ${D}${sysconfdir}/init.d/autostart.sh
}

RDEPENDS_${PN} = "bash \
lat-bw-mem-tests \
"

FILES_${PN} = " \
  /data \
  /data/*  \
  ${sysconfdir}/* \
\"

