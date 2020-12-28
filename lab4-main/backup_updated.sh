#!/bin/bash

CurrentDate=$(date +"%Y-%m-%d")
NewDirectory=~/Backup-$date
LastUpdateDate=$(find ~ -name "Backup*" | awk 'BEGIN{FS="-"}{print $2"-"$3"-"$4}' | sort -nr | head -1)

if [[ ! -f "~/backup-report" ]]; then
    touch ~/backup-report
fi

echo $LastUpdateDate
echo $NewDirectory

if [[ -z $LastUpdateDate ]]; then
    mkdir $NewDirectory
    cp -a ~/source/. $NewDirectory
    echo -e "[$Date] Backup has created successfully.\n\tNew values: $(ls $NewDirectory)" >> ~/backup-report
fi
