#!/bin/bash

function _privateArgsExistReverse
{
    if ! [[ $1 -eq 2 ]]
    then
        echo "Error: reverse mode contains 2 arguments. Not $1" >> /dev/stderr
        help_
        exit -2
    fi
}

function _privateIsCorrectFiles
{
    local fileToRead=$1
    local fileToWrite=$2
    if ! [[ -r $fileToRead ]]
    then
        echo "Error: permission denied for $fileToRead. Make sure you giving readable file." >> /dev/stderr
        help_
        exit -8
    fi

    if ! [[ -w $fileToWrite ]]
    then
        echo "Error: permission denied for $fileToWrite. Make sure you giving writeable file." >> /dev/stderr
        help_
        exit -9
    fi
}

function _privateReadAndWrite
{
    exec 3>buffer
    cat $1 >&3
    tac buffer | rev 1> $2 2> /dev/stderr
    exec 3>&-
    /buffer >> /dev/null
}

function reverse
{
    _privateArgsExistReverse $#
    _privateIsCorrectFiles $1 $2
    _privateReadAndWrite $1 $2
}
