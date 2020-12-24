#!/bin/bash

LastBackupDate=$(find ~ -name "Backup*" | awk 'BEGIN{FS="-"}{print $2"-"$3"-"$4}' | sort -nr | head -1)
LastBackup=~/Backup-$LastBackupDate

if [[ -z "$LastBackup" ]]
then
    echo "Backup directory doesn't exist"
	exit 1
fi 

if [[ ! -d ~/restore ]]
then
	mkdir ~/restore
else
	rm -r ~/restore
	mkdir ~/restore
fi

for file in $(ls $LastBackup | grep -Ev "\.[0-9]{4}-[0-9]{2}-[0-9]{2}$")
do
	cp $LastBackup/$file ~/restore/$file
done
