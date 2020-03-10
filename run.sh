#!/bin/sh

TEST_DIR=$1
TEST_ENV=$2
TEST_LOG=fio_test.log

if [  -z "$TEST_DIR" ];then
	echo "please input the dir!"
	exit 0
fi

if [[ "$TEST_ENV" == "host" ]];then
	RR_CONFIG=4krr_host
	RRDEBUG_CONFIG=4krr_host_trace
	RW_CONFIG=4krw_host
	RWDEBUG_CONFIG=4krw_host_trace
elif  [[ "$TEST_ENV" == "vhost" ]];then
	RR_CONFIG=4krr_vhost
	RRDEBUG_CONFIG=4krr_vhost_trace
	RW_CONFIG=4krw_vhost
	RWDEBUG_CONFIG=4krw_vhost_trace
else
	echo "please input host or vhost!"
	exit 0
fi

cd $TEST_DIR
date >> $TEST_DIR/$TEST_LOG
cpu_model=`lscpu  |grep "Model name" |cut -d ':' -f2`
echo "FIO TEST for $cpu_model" >>$TEST_DIR/$TEST_LOG

echo "########4K Randread Test Started########" >>$TEST_DIR/$TEST_LOG

cd $TEST_DIR/4krr/4krr_1thread_1iodepth
fio $RR_CONFIG >result_4krr_1thread_1iodepth.txt
fio $RRDEBUG_CONFIG
ret=`ls |grep unbinding |head -n 1`
if [ -n "$ret" ];then
	echo "4K Randread Test for 1 thread with 1 iodepth passed!" >>$TEST_DIR/$TEST_LOG
else
	echo "4K Randread Test for 1 thread with 1 iodepth failed!" >>$TEST_DIR/$TEST_LOG
fi

cd $TEST_DIR/4krr/4krr_8threads_128iodepths
fio $RR_CONFIG >result_4krr_8threads_128iodepths.txt
fio $RRDEBUG_CONFIG
ret=`ls |grep unbinding |head -n 1`
if [ -n "$ret" ];then
	echo "4K Randread Test for 8 threads with 128 iodepths passed!" >>$TEST_DIR/$TEST_LOG
else
	echo "4K Randread Test for 8 thread with 128 iodepths failed!" >>$TEST_DIR/$TEST_LOG
fi

cd $TEST_DIR/4krr/4krr_16threads_128iodepths
fio $RR_CONFIG >result_4krr_16threads_128iodepths.txt
fio $RRDEBUG_CONFIG
ret=`ls |grep unbinding |head -n 1`
if [ -n "$ret" ];then
	echo "4K Randread Test for 16 threads with 128 iodepths passed!" >>$TEST_DIR/$TEST_LOG
else
	echo "4K Randread Test for 16 thread with 128 iodepths failed!" >>$TEST_DIR/$TEST_LOG
fi

cd $TEST_DIR/4krr/4krr_32threads_128iodepths
fio $RR_CONFIG >result_4krr_32threads_128iodepths.txt
fio $RRDEBUG_CONFIG
ret=`ls |grep unbinding |head -n 1`
if [ -n "$ret" ];then
	echo "4K Randread Test for 32 threads with 128 iodepths passed!" >>$TEST_DIR/$TEST_LOG
else
	echo "4K Randread Test for 32 thread with 128 iodepths failed!" >>$TEST_DIR/$TEST_LOG
fi

echo "########4K Randread Test Ended########" >>$TEST_DIR/$TEST_LOG
echo "########4K Randwrite Test Started########" >>$TEST_DIR/$TEST_LOG

cd $TEST_DIR/4krw/4krw_1thread_1iodepth
fio $RW_CONFIG > result_4krw_1thread_1iodepth.txt
fio $RWDEBUG_CONFIG
ret=`ls |grep unbinding |head -n 1`
if [ -n "$ret" ];then
	echo "4K Randwrite Test for 1 thread with 1 iodepth passed!" >>$TEST_DIR/$TEST_LOG
else
	echo "4K Randwrite Test for 1 thread with 1 iodepth failed!" >>$TEST_DIR/$TEST_LOG
fi

cd $TEST_DIR/4krw/4krw_8threads_128iodepths
fio $RW_CONFIG > result_4krw_8threads_128iodepths.txt
fio $RWDEBUG_CONFIG
ret=`ls |grep unbinding |head -n 1`
if [ -n "$ret" ];then
	echo "4K Randwrite Test for 8 threads with 128 iodepths passed!" >>$TEST_DIR/$TEST_LOG
else
	echo "4K Randwrite Test for 8 threads with 128 iodepths failed!" >>$TEST_DIR/$TEST_LOG
fi

cd $TEST_DIR/4krw/4krw_16threads_128iodepths
fio $RW_CONFIG > result_4krw_16threads_128iodepths.txt
fio $RWDEBUG_CONFIG
ret=`ls |grep unbinding |head -n 1`
if [ -n "$ret" ];then
	echo "4K Randwrite Test for 16 threads with 128 iodepths passed!" >>$TEST_DIR/$TEST_LOG
else
	echo "4K Randwrite Test for 16 threads with 128 iodepths failed!" >>$TEST_DIR/$TEST_LOG
fi

cd $TEST_DIR/4krw/4krw_32threads_128iodepths
fio $RW_CONFIG > result_4krw_32threads_128iodepths.txt
fio $RWDEBUG_CONFIG
ret=`ls |grep unbinding |head -n 1`
if [ -n "$ret" ];then
	echo "4K Randwrite Test for 32 threads with 128 iodepths passed!" >>$TEST_DIR/$TEST_LOG
else
	echo "4K Randwrite Test for 32 threads with 128 iodepths failed!" >>$TEST_DIR/$TEST_LOG
fi
echo "########4K Randwrite Test Ended########" >>$TEST_DIR/$TEST_LOG
