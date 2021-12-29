#!/bin/bash
para_count=$#
let para_count1=para_count-1

PENDING_count=0
for ((i=1; i<=$para_count1; i++))
do
    count=`sacct -X -n -o State --j ${!i}|grep "PENDING"|wc -l`
    let PENDING_count+=count
done

while [ $PENDING_count -ne 0 ]
do
    sleep 15
    PENDING_count=0
    for ((i=1; i<=$para_count1; i++))
    do
        count=`sacct -X -n -o State --j ${!i}|grep "PENDING"|wc -l`
        let PENDING_count+=count
    done
done

echo  "submit"  |mail  -s "${!para_count} submit"  gushanshan2019@sibs.ac.cn

RUNNING_count=0
for ((i=1; i<=$para_count1; i++))
do
    count=`sacct -X -n -o State --j ${!i}|grep "RUNNING"|wc -l`
    let RUNNING_count+=count
done

while [ $RUNNING_count -ne 0 ]
do
    sleep 15
    RUNNING_count=0
    for ((i=1; i<=$para_count1; i++))
    do
        count=`sacct -X -n -o State --j ${!i}|grep "RUNNING"|wc -l`
        let RUNNING_count+=count
    done
done

COMPLETED_count=0
for ((i=1; i<=$para_count1; i++))
do
    count=`sacct -X -n -o State --j ${!i}|grep "COMPLETED"|wc -l`
    let COMPLETED_count+=count
done

if [ $COMPLETED_count -eq $para_count1 ]
then
    echo  "done"  |mail  -s "${!para_count} done"  gushanshan2019@sibs.ac.cn
else
    echo  "failed"  |mail  -s "${!para_count} failed"  gushanshan2019@sibs.ac.cn
fi
