#!/bin/bash

Date=$(date +"%Y-%m-%d")
NewDirectory=~/Backup-$Date
LastDate=$(find ~ -name "Backup*" | awk 'BEGIN{FS="-"}{print $2"-"$3"-"$4}' | sort -nr | head -1)

if [[ ! -f "~/backup-report" ]]
then
    touch ~/backup-report
fi

echo $LastDate
if [[ -e "$HOME/Backup-$LastDate" ]]
then
    LastDirectory=~/Backup-$LastDate
    LastSeconds=$(date -d $LastDate +"%s")
    CurrentSeconds=$(date -d $Date +"%s")
    TimeDiff=$(echo "($CurrentSeconds - $LastSeconds) / 60 / 60 / 24" | bc)

    if [[ $TimeDiff -gt 6 ]]
    then
        mkdir $NewDirectory
        cp -a ~/source/. $NewDirectory
        echo "[Date] Backup has been created successfully. Values: \n$(ls $NewDirectory)" >> ~/backup-report
    else
        for file in $(ls ~/source)
        do
            if [[ -f $LastDirectory/$file ]]
            then
                SourceSize=$(wc -c ~/source/$file | awk '{print $1}')
                LastSourceSize=$(wc -c $LastDirectory/$file | awk '{print $1}')
                SizeDiff=$(echo $($SourceSize - $LastSourceSize) | bc)

                if [[ $SizeDiff -ne 0 ]]
                then
                    mv $LastDirectory/$file $LastDirectory/$file.$Date
                    cp ~/source/$file $LastDirectory
                    Changes="$Changes\nOutdate: $file.$Date; Up to date: $file"
                fi
            else
                cp ~/source/$file $LastDirectory
                New="$New\nNew: $file"
            fi
        done

        Update=$(echo $New$Changes | sed 's/^\\n//')
        if [[ ! -z "$Update" ]]
        then
            echo -e "[$Date] last backup ($LastDirectory) updated:\n$Update" >> ~/backup-report
        fi
    fi
else
    echo loh
    mkdir $NewDirectory
    cp -a ~/source/. $NewDirectory
    echo "[Date] Backup has been created successfully. Values: \n$(ls $NewDirectory)" >> ~/backup-report
fi