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

####### THIS DOES NOT WORK AT THE MOMENT ...
# untar the benchmark
#tar -xf bc.tar
#if [ $? != 0 ]; then
#        echo Untar input failed. Are you providing a .tar archive? 
#fi
#if [ ! -e runme.sh ]; then
#        echo \"runme.sh\" not found. Input .tar must contain this. | /sbin/qsim_out
#fi
#chmod +x runme.sh 
#./runme.sh


#start the real executing and stop the "fast forwarding"
mark_app
#lat-bw-mem-tests
echo --- program exit, will shutdown shortly... ---
# Write dead to the PCMR register to stop the emulation
mark_app "end"
# ANSTATT VON mark_app NUR HIER ein programm mit set_n_cpus  

