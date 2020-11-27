#!/bin/bash

mkdir out 2> /dev/null

for i in $(ls /proc | grep "[0-9]")
do
    ppid=$(awk '{
	if ($1 == "PPid:")
	{
	    print $2
	}
    }' /proc/$i/status 2> /dev/null)

    avg_time=$(awk '{
        if ($1 == "se.sum_exec_runtime")
        {
            sum_exec_runtime=$3
        }
        if ($1 == "nr_switches")
        {
            nr_switches=$3
            print sum_exec_runtime/nr_switches
        }
    }' /proc/$i/sched 2> /dev/null)

    echo "$i $ppid $avg_time"
done | sort -n -k 2 | awk '{print "ProcessID="$1" : ParentProcessID="$2" : Average_Running_Time="$3""}' > out/task4.out
