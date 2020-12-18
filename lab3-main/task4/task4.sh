#!/bin/bash

sh ./task4_operation.sh & pid1=$! 
sh ./task4_operation.sh & pid2=$! 
sh ./task4_operation.sh & pid3=$! 

renice +10 -p $pid1

at now + 1min <<< "kill ${pid3}"
at now + 2min <<< "kill ${pid1}; kill ${pid2}"
