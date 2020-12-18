#!/bin/bash

while true;
do
    read line
    echo "$line" > pipe

    if [[ "$line" == "QUIT" ]];
    then
        echo "Programm finished!!!"
        exit 0
    fi

    if [[ "$line" != "+" && "$line" != "*" && "$line" != [0-9] ]];
    then
        echo "[Generator]: Error - no such commnad"
        exit 1
    fi
done
