#!/bin/bash

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

# sleep a short time for the ifdown kernel message
sleep 2

#initilize it here to save a little bit time
i="0"
y="0"
z="0"
test_times=10

#start the real executing and stop the "fast forwarding"
echo "Switch from fast forwarding to simulation"
echo "The next echo can take up to 10 minutes"
mark_app

echo "START START MY START"

echo "Sleep-Test to $test_times"
while [ $i -lt $test_times ]
do
	i=$[$i+1]
	echo "i is: " + $i
	sleep 1
done

echo "Sleep-Test to $test_times"
while [ $y -lt $test_times ]
do
	y=$[$y+1]
	echo "y is: " + $y
	/usr/bin/time sleep 1 2> /dev/console
done

echo "lat-bw-mem-tests to $test_times"
while [ $z -lt $test_times ]
do
	z=$[$z+1]
	lat-bw-mem-tests
done

# Write dead to the PCMR register to stop the emulation
mark_app "end"

echo "END END MY END"
echo ""
echo "END END MY END"
