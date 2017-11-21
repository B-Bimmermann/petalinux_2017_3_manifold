#!/bin/bash

export NCPUS=`grep processor /proc/cpuinfo | wc -l`

echo Number of CPUs: $NCPUS

echo Number of CPUs: $NCPUS | /sbin/qsim_out

cd /data/benchmarks/

### Wir wollen noch nicht in run gehen deswegen NICHT mark_app
#mark_app

#echo Restoring state
echo Extracting benchmark binary...
### Geht im moment nicht ...
#/sbin/qsim_in | tar -x

# untar the benchmark
tar -xf bc.tar

if [ $? != 0 ]; then
        echo Untar input failed. Are you providing a .tar archive? 
fi

if [ ! -e runme.sh ]; then
        echo \"runme.sh\" not found. Input .tar must contain this. | /sbin/qsim_out
fi

echo Executing benchmark
chmod +x runme.sh 
./runme.sh

echo --- program exit, will shutdown shortly... ---
mark_app "end"
# ANSTATT VON mark_app NUR HIER ein programm mit set_n_cpus  

