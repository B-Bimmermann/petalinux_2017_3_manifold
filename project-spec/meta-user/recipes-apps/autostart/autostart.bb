#
# This file is the autostart recipe.
# Change this file later .....

SUMMARY = "Autostart application for manifold"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://autostart.sh \
	   file://small_mani.sh \
	   file://benchmarks \	
	   file://Makefile \
	   file://autostart.c \
		  "

# set small_mani.sh as a star script
inherit update-rc.d

INITSCRIPT_NAME = "small_mani"
INITSCRIPT_PACKAGES = "small_mani"
INITSCRIPT_PARAMS = "start 99 S ."

S = "${WORKDIR}"

# copy the script and all banchmarks for manifold
do_install() {
             install -d ${D}/data/benchmarks
	     install -m 0755 autostart.sh ${D}/data
	     install -m 0755 small_mani.sh ${D}/data
	     cp -r ${WORKDIR}/benchmarks ${D}/data
	     install -d ${D}${sysconfdir}/init.d
	     install -m 0755 ${S}/small_mani.sh ${D}${sysconfdir}/init.d/myapp-init
}

FILES_${PN} = " \
  /data \
  /data/autostart.sh  \
  /data/small_mani.sh  \
  /data/*  \
  /etc \
  /etc/init.d \
  /etc/init.d/small_mani \
  ${sysconfdir}/* \
\"

