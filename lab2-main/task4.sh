#!/bin/bash

mkdir out 2> /dev/null

tmpfile=$(mktemp /tmp/Task4Buffer.XXXXXX)
exec 3>"tmpfile"

for i in $(ls /proc | grep "[0-9]")
do
    (awk 
    '{
        if ($1 == "Pid:")
        {
            printf "ProcessID=%d : ", $2
        }
        if ($1 == "PPid:")
        {
            printf "Parent_ProcessID=%d : ", $2
        }
    }' /proc/$i/status >&3 ) 2> /dev/null

    (awk
    '{
        if ($1 == "se.sum_exec_runtime")
        {
            sum_exec_runtime=$3
        }
        if ($1 == "nr_switches")
        {
            nr_switches=$3
            printf "Average_Running_Time=%f\n", sum_exec_runtime/nr_switches
        }
    }' /proc/$i/sched >>&3 ) 2> /dev/null
done

sort -n $tmpfile > out/task4.out

exec 3>&-