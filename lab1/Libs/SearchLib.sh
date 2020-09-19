#!/bin/bash

function _privateArgsExistSearch
{
    if ! [[ $1 -eq 2 ]]
    then
        echo "Error: module search contains 2 arguments. Not $1" >> /dev/stderr
        exit -2
    fi
}

function _privateIsDirectory
{
    if ! [[ -d $1 ]]
    then
        echo "Error: first argument in search module must be a directory." >> /dev/stderr
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
        exit -2
    fi
}

function search
{
    _privateArgsExistSearch $#
    _privateIsDirectory $1
    _privatePremissionCheck $1
    # Redirection errors to the "black hole"
    grep -r "$2" $1 2> /dev/null 1>&1 
}

