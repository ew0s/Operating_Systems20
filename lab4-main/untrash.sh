#!/bin/bash

if [[ $# > 1 || $# < 1 ]];
then
    echo "[ERROR]: Wrong arguments count"
    exit 1
fi

if [[ $1 == *"/"* ]]
then
    echo "[ERROR]: Argument can not be a file path";
    exit 1
fi

TrashLogPath=$~/trash.log
TrashPath=$~/trash

[ -f $TrashLogPath ] || { echo "[ERROR]: Hidden file trash.log does not exist"}; exit 1; };
[ -s $TrashLogPath ] || { echo "[ERROR]: Hidden file trash.log is empty"; exit 1; };

[ -d $TrashPath ] || { echo "[ERROR]: Hidden directory trash does not exist"; exit 1; };

FileCount=$(echo $( ls -A $TrashPath | wc -l ))
[ FileCount -e 0 ] && { echo "[ERROR]: Hidden directory is empty"; exit 1; };


function Recover()
{
    local FilePath=$1
    local LinkName=$2
    local FileName=$3
    local TrashPath=$4
    local TrashLogPath=$5

}

Matches=$(mktemp /tmp/untrash_script.XXXXXX)
grep -i "$1" "$TrashLogPath" > Matches

if [[ ! -s Matches ]]
then 
    echo "[ERROR]: Unable to find such file in trash directory"
    exit 1
fi

cat Matches | while read LINE
do
    FilePath=$(echo "$LINE" | awk '{print $1}')
    LinkName=$(echo "$LINE" | awk '{print $2}')

    echo "Press ENTER to recover $FilePath from trash:"
    echo "Press any other key to continue"
    read input < /dev/tty
    if [[ $input == "" ]]
    then
        recover $FilePath $LinkName $1 $TrashPath $TrashLogPath
    else
        continue
    fi
done
