#!/bin/bash

PID_EXEIFSTAT=`echo $$`

#echo $PID_EXEIFSTAT
echo $PID_EXEIFSTAT > pid.txt
#export PID_KILL=$PID_EXEIFSTAT
#echo $PID_KILL
while :
do
echo `echo $$` >> pid2.txt
# Press ctrl-c to exit
x=`ifstat 1 1 | tail -1 | tr '\t' ' '`;  #tail -1 takes the DL and UL speeds in KB/S
x1=`echo $x | cut -d ' ' -f1`; x2=`echo $x | cut -d ' ' -f2`;
#x1=$(echo "scale=4; $x1/1024" | bc); x2=$(echo "scale=4; $x2/1024" | bc); # Convert DL rate to MB/S
printf "`date "+%H":"%M":"%S"` \t D: %0.3f MB/s\t U: %0.3f MB/s\n" "$x1" "$x2" 
done
