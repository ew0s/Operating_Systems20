#!/bin/bash

bash task4.sh


for line in $(cat /out/task4.out)
do
    currPPid=$(echo "$line" | awk '{print $3}')
    currART=$(echo "$line" | awk '{print $4}')
    
    echo $currPPid $currART
done
