#!/bin/sh
TEST_ENV=$1

if [[ "$TEST_ENV" == "host" ]];then
	CONFIG="4kw_host"
elif  [[ "$TEST_ENV" == "vhost" ]];then
	CONFIG="4kw_vhost"
else
	echo "please input host or vhost!"
	exit 0
fi

yum install -y fio libaio-devel gnuplot

fio $CONFIG
echo c >/proc/sysrq-trigger
