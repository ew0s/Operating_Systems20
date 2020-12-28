#!/bin/bash

function CreateNewBackup
{
    local NewDirectory=$1
    local CurrentDate=$2

    mkdir $NewDirectory
    cp -a ~/source/. $NewDirectory
    echo -e "[$CurrentDate] Backup has created successfully.\nNew values:\n$(ls $NewDirectory)" >> ~/backup-report
}

function CopyNewFile
{
    local File=$1
    local LastBackupDirectory=$2
    local NewFilesLog=$3

    cp ~/source/$File $LastBackupDirectory
    NewFilesLog="$NewFilesLog\nNew file: $File"

    return "$NewFilesLog"
}

function CopyChangedFile
{
    local File=$1
    local LastBackupDirectory=$2
    local ChangedFilesLog=$3
    local CurrentDate=$4

    cp ~/source/$File $LastBackupDirectoryi
    ChangedFilesLog="$ChangedFilesLog\nOutdate: $File.$CurrentDate; Up to date: $File"

    return "$ChangedFilesLog"
}

CurrentDate=$(date +"%Y-%m-%d")
NewDirectory=~/Backup-$CurrentDate
LastUpdateDate=$(find ~ -name "Backup*" | awk 'BEGIN{FS="-"}{print $2"-"$3"-"$4}' | sort -nr | head -1)

if [[ ! -f "~/backup-report" ]]; then
    touch ~/backup-report
fi

if [[ -z $LastUpdateDate ]]; then
    CreateNewBackup $NewDirectory $CurrentDate 
    exit 0
fi

LastBackupDirectory=~/Backup-$LastUpdateDate
LastBackupSeconds=$(date -d $LastUpdateDate +"%s")
CurrentSeconds=$(date -d $CurrentDate +"%s")
DayDifference=$(echo "($CurrentSeconds - $LastBackupSeconds) / 60 / 60 / 24" | bc)

if [[ $DayDifference -gt 6 ]]; then
    CreateNewBackup $NewDirectory $CurrentDate
    exit 0
fi

for file in $(ls ~/source)
do
    if [[ ! -f $LastBackupDirectory/$file ]]; then
        NewFilesLog=$( CopyNewFile $file $LastBackupDirectory $NewFilesLog)
    else
        SourceFileSize=$(wc -c ~/source/$file | awk '{print $1}')
        LastBackupFileSize=$(wc -c $LastBackupDirectory/$file | awk '{print $1}')
        SizeDifference=$(echo "$SourceFileSize - $LastBackupFileSize" | bc)

        if [[ $SizeDifference -ne 0 ]]; then
            mv $LastBackupDirectory/$file $LastBackupDirectory/$file.$CurrentDate
            ChangedFilesLog=$( CopyChangedFile $file $LastBackupDirectory $ChangedFilesLog $CurrentDate)
        fi
    fi
done

echo -e $NewFilesLog
echo -e $ChangedFilesLog
