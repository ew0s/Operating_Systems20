#!/bin/bash

if [[ $# > 1 ]];
then
    echo "[Error]: Too many arguments"
    exit 1
fi

if [[ $# < 1 ]];
then
    echo "[Error]: Too few arguments"
    exit 1
fi

if [[ ! -f $1 ]];
then
    echo "[Error]: given file not a file"
    exit 1
fi

if [[ ! -e "/home/user/.trash" ]];
then
    mkdir /home/user/.trash
fi

date=$(date +'%F_%H-%M-%S');
ln $1 ~/.trash/$date

echo "deleted path: $pwd/$1, created hard link $date" >> ~/.trash.log

rm $1
