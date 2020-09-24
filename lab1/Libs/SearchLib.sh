#!/bin/bash

function _privateArgsExistSearch
{
    if ! [[ $1 -eq 2 ]]
    then
        echo "Error: module search contains 2 arguments. Not $1" >> /dev/stderr
        help_
        if ! [[ InInteractive -eq 0 ]]; then exit -2; else return 1; fi
    fi

    return 0
}

function _privateIsDirectory
{
    if ! [[ -d $1 ]]
    then
        echo "Error: first argument in search module must be a directory." >> /dev/stderr
        help_
        if ! [[ InInteractive -eq 0 ]]; then exit -6; else return 1; fi 
    fi

    return 0
}

function _privatePremissionCheck
{
    if ! [[ -r $1 ]]
    then
        echo "Error: premission denied for $1." >> /dev/stderr
        help_
        if ! [[ InInteractive -eq 0 ]]; then exit -2; else return 1; fi
    fi

    return 0
}

function _privateGrepSearch
{
    if grep -r "$2" $1 2> /dev/null 1>&1;
    then
        return
    else
        echo -e "NO MATCHES FOUND FOR \"$2\"" >> /dev/stderr
    fi
}

function search
{
    if ! _privateArgsExistSearch $#; then return; fi
    if ! _privateIsDirectory $1; then return; fi
    if ! _privatePremissionCheck $1; then return; fi
    _privateGrepSearch $1 $2
}

