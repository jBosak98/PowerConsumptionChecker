#!/bin/bash
defaultInput=5
input=${1:-$defaultInput}
total=0;
for i in `seq 1 $input`;
do 
	power[i]=$(awk '{print $1*10^-6}' /sys/class/power_supply/BAT0/power_now)
	echo "${power[i]} W"
	total=$(echo ${power[i]}+$total | bc )
    sleep 1
done
average=$(echo "scale=3; $total / $input" | bc)
echo "average power consumption in the last $input seconds: ${average} W"
