#!/bin/bash

function _privateArgsExistSearch
{
    if ! [[ $1 -eq 2 ]]
    then
        echo "Error: module search contains 2 arguments. Not $1" >> /dev/stderr
        return -2
    else
        return 0
    fi
}

function _privateIsDirectory
{
    if ! [[ -d $1 ]]
    then
        echo "Error: first argument in must be a directory." >> /dev/stderr
        help_
        exit -6
    fi
}

function _privatePremissionCheck
{
    if ! [[ -r $1 ]]
    then
        echo "Error: premission denied for $1." >> /dev/stderr
        help_
        exit -36
    fi
}

function search
{
    _privateArgsExistSearch $#
    _privateIsDirectory $1
    _privatePremissionCheck $1
    grep -r "$2" $1
}

