#!/bin/bash

CurrentDate=$(date +"%Y-%m-%d")
NewDirectory=~/Backup-$CurrentDate
LastUpdateDate=$(find ~ -name "Backup*" | awk 'BEGIN{FS="-"}{print $2"-"$3"-"$4}' | sort -nr | head -1)

if [[ ! -f "~/backup-report" ]]; then
    touch ~/backup-report
fi

if [[ -z $LastUpdateDate ]]; then
    mkdir $NewDirectory
    cp -a ~/source/. $NewDirectory
    echo -e "[$CurrentDate] Backup has created successfully.\nNew values:\n$(ls $NewDirectory)" >> ~/backup-report
    exit 0
fi

LastBackup=~/Backup-$LastUpdateDate
LastBackupSeconds=$(date -d $LastUpdateDate +"%s")
CurrentSeconds=$(date -d $CurrentDate +"%s")
DayDifference=$(echo "($CurrentSeconds - $LastBackupSeconds) / 60 / 60 / 24" | bc)
echo $DayDifference
