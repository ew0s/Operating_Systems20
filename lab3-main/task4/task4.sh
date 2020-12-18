#!/bin/bash

sh ./task4_operation.sh&pid0=$!
sh ./task4_operation.sh&pid1=$!
sh ./task4_operation.sh&pid2=$!

renice +10 -p $pid0
