#!/bin/bash

T=`grep -q "^flags.*hypervisor" /proc/cpuinfo`
if [[ $? -ne 0 ]]; then
	echo "not running in a VM (QSIM/QEMU), bailing out"
	exit
fi

echo DEBUG: IN AUTOSTART : START

echo DEBUG: IN AUTOSTART : GET CPUS

export NCPUS=`grep processor /proc/cpuinfo | wc -l`

echo DEBUG: IN AUTOSTART : Number of CPUs: $NCPUS stdout 

echo DEBUG: IN AUTOSTART : Number of CPUs: $NCPUS stderr

echo Number of CPUs: $NCPUS | /sbin/qsim_out

echo DEBUG: IN AUTOSTART : DATA

cd /data

echo DEBUG: IN AUTOSTART : CALL MARK_APP

/sbin/mark_app

echo DEBUG: IN AUTOSTART : CALLED MARK_APP

echo Restoring state
echo Copying benchmark binary...

/sbin/qsim_in | tar -x
if [ $? != 0 ]; then
  echo Untar input failed. Are you providing a .tar archive? | /sbin/qsim_out
fi

if [ ! -e runme.sh ]; then
  echo \"runme.sh\" not found. Input .tar must contain this. | /sbin/qsim_out
fi

echo Executing benchmark
/sbin/chmod +x ./runme.sh
/sbin/bash ./runme.sh

echo --- program exit, will shutdown shortly... ---
# Spin forever.
while true; do
  sleep 10
done


