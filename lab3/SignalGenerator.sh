#!/bin/bash
while true; do
    read LINE
    case $LINE in
        STOP)
            kill -USR1 $(cat .pid)
            ;;
        *)
            :
            ;;
    esac
done
