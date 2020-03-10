#!/bin/sh
for (( i=18;i<32;i++ ))
do
	echo 0 >/sys/devices/system/cpu/cpu$i/online
done
