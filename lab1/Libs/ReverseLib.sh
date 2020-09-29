#!/bin/bash

function _privateArgsExistReverse
{
    if ! [[ $1 -eq 2 ]]
    then
        echo "Error: reverse mode contains 2 arguments. Not $1" >> /dev/stderr
        if ! [[ InInteractive -eq 0 ]]; then exit -2; else return 1; fi
    fi

    return 0
}

function _privateIsCorrectFiles
{
    local fileToRead=$1
    local fileToWrite=$2
    if ! [[ -e $fileToRead ]]
    then
        echo "Error: $fileToRead do not exist." >> /dev/stderr
        if ! [[ InInteractive -eq 0 ]]; then exit -8; else return 1; fi
    fi

    if ! [[ -r $fileToRead ]]
    then
        echo "Error: permission denied for $fileToRead. Make sure you giving readable file." >> /dev/stderr
        if ! [[ InInteractive -eq 0 ]]; then exit -8; else return 1; fi
    fi

    if [[ -e $fileToWrite  ]]
    then
        if ! [[ -w $fileToWrite ]]
        then
            echo "Error: permission denied for $fileToWrite. Make sure file is writeable." >> /dev/stderr
            if ! [[ InInteractive -eq 0 ]]; then exit -8; else return 1; fi
        fi
    else
        touch $fileToWrite
    fi

    return 0
}

function _privateReadAndWrite
{
    tmpfile=$(mktemp /tmp/AppBuffer)
    exec 3>"$tmpfile"
    cat $1 >&3
    tac "$tmpfile" | rev 1> $2 2> /dev/null
    rm "$tmpfile"
    exec 3>&-
}

function reverse
{
    if ! _privateArgsExistReverse $#; then return; fi
    if ! _privateIsCorrectFiles $1 $2; then return; fi
    _privateReadAndWrite $1 $2
}
