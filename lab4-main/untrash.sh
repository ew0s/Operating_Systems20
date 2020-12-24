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

TrashLogPath=~/.trash.log
TrashPath=~/.trash

if [[ -e TrashLogPath ]]; then
    echo "[ERROR]: Hidden file .trash.log does not exist"; 
    exit 1;
fi

if [[ -s TrashLogPath ]]; then
    echo "[ERROR]: Hidden file .trash.log is empty";
    exit 1;
fi

if [[ -d TrashPath ]]; then
    echo "[ERROR]: Hidden directory trash does not exist";
    exit 1;
fi

FileCount=$(echo $( ls -A $TrashPath | wc -l ))
[ $FileCount -eq 0 ] && { echo "[ERROR]: Hidden directory is empty"; exit 1; };


function Recover()
{
    local FilePath=$1
    local LinkName=$2
    local FileName=$3
    local TrashPath=$4
    local TrashLogPath=$5
    local CurrentDirectoryPath=$(echo "$1" | awk 'BEGIN{FS = OFS = "/"} {$NF=""; print}')

    if [[ -e "$CurrentDirectoryPath" ]]
    then
        if [[ ! -f "$FilePath" ]]
        then
            ln "$TrashPath/$LinkName" "$FilePath"
        else
            echo "[WARNING]: File already exists in given directory. Change file name."
            read name < /dev/tty
            ln "$TrashPath/$LinkName" "$CurrentDirectoryPath/$name"
        fi
        echo "[SUCCESS]: File recovered successfully"
    else
        if [[ ! -f "~/$FileName" ]]; then
            ln "$TrashPath/$LinkName" "~/$FileName"
        else
            echo "[WARNING]: File already exists in given directory. Change file name."
            read name < /dev/tty
            ln "$TrashPath/$LinkName" "~/$name"
        fi
        echo "[SUCCESS]: File recovered successfully and moved to home directory"
    fi

    rm "$TrashPath/$LinkName"
    sed -i "/$LinkName/d" "$TrashLogPath" 2> /dev/null
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

    echo "Press Y to recover $FilePath from trash or any key to continue:"
    read input < /dev/tty
    clear
    if [[ $input == "Y" ]]
    then
        Recover $FilePath $LinkName $1 $TrashPath $TrashLogPath
    else
        continue
    fi
done

echo "" > $TrashLogPath
rm Matches
