#!/bin/sh

TEST_DIR=$1
SVG_LOG=fio_svg.log

if [  -z "$TEST_DIR" ];then
	echo "please input the dir!"
	exit 0
fi

cd $TEST_DIR
date >> $TEST_DIR/$SVG_LOG
cpu_model=`lscpu  |grep "Model name" |cut -d ':' -f2`
echo "FIO Generate SVG for $cpu_model" >>$TEST_DIR/$SVG_LOG

echo "########4K Randread Generate SVG Started########" >>$TEST_DIR/$SVG_LOG

cd $TEST_DIR/4krr/4krr_1thread_1iodepth
fio_generate_plots 4krr_1thread_1iodepth
ret=`ls -l |grep svg| head -n 1 |awk '{print $5}'`
ls -l |grep svg| head -n 1 |awk '{print $5}'
if [ $ret -gt 0 ];then
	sed -i 's/msec/usec/g' *.svg
	echo "SVG for 4krr_1thread_1iodepth has been generated!" >>$TEST_DIR/$SVG_LOG
else
	echo "SVG for 4krr_1thread_1iodepth failed!" >>$TEST_DIR/$SVG_LOG
fi

cd $TEST_DIR/4krr/4krr_8threads_128iodepths
fio_generate_plots 4krr_8threads_128iodepths
ret=`ls -l |grep svg| head -n 1 |awk '{print $5}'`
if [ $ret -gt 0 ];then
	sed -i 's/msec/usec/g' *.svg
	echo "SVG for 4krr_8threads_128iodepths has been generated!" >>$TEST_DIR/$SVG_LOG
else
	echo "SVG for 4krr_8threads_128iodepths failed!" >>$TEST_DIR/$SVG_LOG
fi

cd $TEST_DIR/4krr/4krr_16threads_128iodepths
fio_generate_plots 4krr_16threads_128iodepths
ret=`ls -l |grep svg| head -n 1 |awk '{print $5}'`
if [ $ret -gt 0 ];then
	sed -i 's/msec/usec/g' *.svg
	echo "SVG for 4krr_16threads_128iodepths has been generated!" >>$TEST_DIR/$SVG_LOG
else
	echo "SVG for 4krr_16threads_128iodepths failed!" >>$TEST_DIR/$SVG_LOG
fi

cd $TEST_DIR/4krr/4krr_32threads_128iodepths
fio_generate_plots 4krr_32threads_128iodepths
ret=`ls -l |grep svg| head -n 1 |awk '{print $5}'`
if [ $ret -gt 0 ];then
	sed -i 's/msec/usec/g' *.svg
	echo "SVG for 4krr_32threads_128iodepths has been generated!" >>$TEST_DIR/$SVG_LOG
else
	echo "SVG for 4krr_32threads_128iodepths failed!" >>$TEST_DIR/$SVG_LOG
fi

echo "########4K Randread Generate SVG Ended########" >>$TEST_DIR/$SVG_LOG
echo "########4K Randwrite Generate SVG Started########" >>$TEST_DIR/$SVG_LOG

cd $TEST_DIR/4krw/4krw_1thread_1iodepth
fio_generate_plots 4krw_1thread_1iodepth
ret=`ls -l |grep svg| head -n 1 |awk '{print $5}'`
if [ $ret -gt 0 ];then
	sed -i 's/msec/usec/g' *.svg
	echo "SVG for 4krr_1thread_1iodepth has been generated!" >>$TEST_DIR/$SVG_LOG
else
	echo "SVG for 4krr_1thread_1iodepth failed!" >>$TEST_DIR/$SVG_LOG
fi

cd $TEST_DIR/4krw/4krw_8threads_128iodepths
fio_generate_plots 4krw_8threads_128iodepths
ret=`ls -l |grep svg| head -n 1 |awk '{print $5}'`
if [ $ret -gt 0 ];then
	sed -i 's/msec/usec/g' *.svg
	echo "SVG for 4krw_8threads_128iodepths has been generated!" >>$TEST_DIR/$SVG_LOG
else
	echo "SVG for 4krw_8threads_128iodepths failed!" >>$TEST_DIR/$SVG_LOG
fi

cd $TEST_DIR/4krw/4krw_16threads_128iodepths
fio_generate_plots 4krw_16threads_128iodepths
ret=`ls -l |grep svg| head -n 1 |awk '{print $5}'`
if [ $ret -gt 0 ];then
	sed -i 's/msec/usec/g' *.svg
	echo "SVG for 4krw_16threads_128iodepths has been generated!" >>$TEST_DIR/$SVG_LOG
else
	echo "SVG for 4krw_16threads_128iodepths failed!" >>$TEST_DIR/$SVG_LOG
fi

cd $TEST_DIR/4krw/4krw_32threads_128iodepths
fio_generate_plots 4krw_32threads_128iodepths
ret=`ls -l |grep svg| head -n 1 |awk '{print $5}'`
if [ $ret -gt 0 ];then
	sed -i 's/msec/usec/g' *.svg
	echo "SVG for 4krw_32threads_128iodepths has been generated!" >>$TEST_DIR/$SVG_LOG
else
	echo "SVG for 4krw_32threads_128iodepths failed!" >>$TEST_DIR/$SVG_LOG
fi

echo "########4K Randwrite Generate SVG Ended########" >>$TEST_DIR/$SVG_LOG
