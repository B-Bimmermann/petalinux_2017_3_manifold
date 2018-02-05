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
echo Number of CPUs: $NCPUS | /sbin/qsim_out

# unset udhcpc timeout
echo 0 > /proc/sys/kernel/hung_task_timeout_secs


# remove all unnecessary network interfaces 
ifdown eth0
ifdown lo

#start the real executing and stop the "fast forwarding"
echo "Switch from fast forwarding to simulation"
echo "The next echo can take up to 10 minutes"
mark_app
echo "START"
lat-bw-mem-tests
ECHO "END"
echo "--- program exit, will shutdown shortly... ---"
# Write dead to the PCMR register to stop the emulation
mark_app "end"
