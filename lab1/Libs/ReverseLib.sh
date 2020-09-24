#!/bin/bash

function _privateArgsExistReverse
{
    if ! [[ $1 -eq 2 ]]
    then
        echo "Error: reverse mode contains 2 arguments. Not $1" >> /dev/stderr
        help_
        if ! [[ InInteractive -eq 0 ]]; then exit -2; else return 1; fi
    fi

    return 0
}

function _privateIsCorrectFiles
{
    local fileToRead=$1
    local fileToWrite=$2
    if ! [[ -r $fileToRead ]]
    then
        echo "Error: permission denied for $fileToRead. Make sure you giving readable file." >> /dev/stderr
        help_
        if ! [[ InInteractive -eq 0 ]]; then exit -8; else return 1; fi
    fi

    if ! [[ -w $fileToWrite ]]
    then
        echo "Error: permission denied for $fileToWrite. Make sure you giving writeable file." >> /dev/stderr
        help_
        if ! [[ InInteractive -eq 0 ]]; then exit -9; else return 1; fi
    fi

    return 0
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
    if ! _privateArgsExistReverse $#; then return; fi
    if ! _privateIsCorrectFiles $1 $2; then return; fi
    _privateReadAndWrite $1 $2
}
