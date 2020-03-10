#!/bin/sh

#clean up the colleted performance data
files=`find ./ -name "*.log" -o -name "*.svg" -o -name "*.txt" |grep -v "fio_" | xargs rm -f`
