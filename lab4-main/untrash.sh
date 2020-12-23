#!/bin/bash

if [[ $# > 1 || $# < 1 ]];
then
    echo "Wrong arguments count"
    exit 1
fi

[ -f "~/trash.log" ] || { echo "File trash.log does not exist"}; exit 1; };
[ -s "~/trash.log" ] || { echo "File trash.log is empty"; exit 1; };

[ -d "~/trash" ] || { echo "Directory trash does not exist"; exit 1; };
[]
