#!/bin/sh
for (( i=15;i<32;i++ ))
do
	echo 1 >/sys/devices/system/cpu/cpu$i/online
done
