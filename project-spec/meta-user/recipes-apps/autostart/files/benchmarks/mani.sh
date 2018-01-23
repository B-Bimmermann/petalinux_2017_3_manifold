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

# goto data
cd /data
echo Executing benchmark ...

# unset udhcpc timeout
echo 0 > /proc/sys/kernel/hung_task_timeout_secs


# remove all unnecessary network interfaces 
ifdown eth0
ifdown lo

#start the real executing and stop the "fast forwarding"
mark_app
echo "START START START"
echo "START 1"
lat-bw-mem-tests
ECHO "END END END"
echo "--- program exit, will shutdown shortly... ---"
# Write dead to the PCMR register to stop the emulation
mark_app "end"
# ANSTATT VON mark_app NUR HIER ein programm mit set_n_cpus  

