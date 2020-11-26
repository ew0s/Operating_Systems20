#!/bin/bash
(tail -f pipe) | 
while true; do
	read LINE;
	case $LINE in
		QUIT)
			echo "EXIT"
			killall tail
			exit
			;;
		*)
			echo $LINE
			;;
	esac
done
