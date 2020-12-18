#!/bin/bash

command=""
result=1
tail -f pipe |
while true;
do
    read line
    case $line in
        "+")
            command="$line"
            echo "[Handler]: Switch to plus"
        ;;
        "*")
            command="$line"
            echo "[Handler]: Switch to multi"
        ;;
        [0-9])
            case $command in
                "+")
                    result=$(($result + $line))
                    echo $result
                ;;
                "*")
                    result=$(($result * $line))
                    echo $result
                ;;
            esac
        ;;
        "QUIT")
            killall tail
            echo "[Handler]: quit"
            exit 0
        ;;
        *)
            killall tail
            echo "[Handler]: Error"
            exit 1
        ;;
    esac
done
