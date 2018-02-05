#!/bin/bash

# goto data
#cd /data/benchmarks
echo -n "Start the Script on "

# Get the Adress of eth0. If we are in the Simulation
# the adress is set from the device-tree and is
# 00:0a:35:00:22:01
T=`cat /sys/class/net/eth0/address`

# If the Address of eth0 is 00:0a:35:00:22:01, we are in a simulation
if [[ "$T" = "00:0a:35:00:22:01" ]]; then
	# If the Address of eth0 is 00:0a:35:00:22:01, we are in a simulation
	echo "a VM (of the ZCU102)" 
else
	# We are on the real Hardware
	echo "a real ZCU102 (real Hardware)"
fi
