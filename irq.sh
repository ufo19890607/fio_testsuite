#!/bin/sh
virtio=$1
i=$2
irqs=`cat /proc/interrupts |grep $virtio |awk '{print $1}' |cut -d ':' -f1`
for irq in $irqs
do
        #if [ $irq -lt 63 ];then
                #continue
        #fi
        echo "irq:$irq"
        #echo $i >/proc/irq/$irq/smp_affinity_list
        i=$(($i+1))
        cat /proc/irq/$irq/smp_affinity_list


done

