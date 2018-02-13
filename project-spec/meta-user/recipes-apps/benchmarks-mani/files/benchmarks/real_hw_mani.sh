#!/bin/bash

#T=`grep -q "^flags.*hypervisor" /proc/cpuinfo`
#if [[ $? -ne 0 ]]; then
#	echo "not running in a VM (QSIM/QEMU), bailing out"
#	exit
#fi

# Don't know the need of that.
# Maybe we don't need it...
export NCPUS=`grep processor /proc/cpuinfo | wc -l`
echo Number of CPUs: $NCPUS

# unset udhcpc timeout
echo 0 > /proc/sys/kernel/hung_task_timeout_secs

# remove all unnecessary network interfaces 
ifdown eth0
ifdown lo

#start
echo "START START  START"
lat-bw-mem-tests 
echo "END"

# Maybe we should here shoutdown ? or reboot ?
