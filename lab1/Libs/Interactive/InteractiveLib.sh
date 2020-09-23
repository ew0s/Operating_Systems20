#!/bin/bash

function _privateWaitUntilKey
{
    echo "PRESS ANY KEY TO CONTINUE"
    read x
}

function _privateArgExistInteractive
{
    if ! [[ $# -eq 1 ]]
    then
        echo "Error: interactive module contains 1 argument. Not $#." >> /dev/stderr
        _privateWaitUntilKey
        clear
        return 1
    fi

    if ! [[ $1 =~ ^[1-7]$ ]]
    then 
        echo "Error: argument in interactive module must be in range from 1 to 7. Not $1" >> /dev/stderr
        _privateWaitUntilKey
        clear
        return 1
    fi

    return 0
}

function _privateCalc
{
    if require Libs/CalcLib.sh
    then
        _privateShowCalcMenu
        read
        calc $REPLY
        _privateWaitUntilKey
    fi
    clear
}

function _privateSearch
{ 
    if require Libs/SearchLib.sh 
    then
        _privateShowSearchMenu
        read
        search $REPLY
        _privateWaitUntilKey
    fi
    clear
}

function _privateModuleExecute
{
    _privateShow$1Menu
    read
    $( echo $1 | awk '{print tolower($0)}') $REPLY
    _privateWaitUntilKey
    clear
}

function _privateChooseTODO
{
    case $1 in
        "1")
            _privateCalc;;
        "2")
            _privateModuleExecute Search;;
        "3")
            _privateChooseTODO;;
    esac
}

function _privateReadUserData
{
    read first
    if _privateArgExistInteractive $first
    then
        clear
        _privateChooseTODO $first
    fi
}

function interactive
{
    InInteractive=0
    while [[ 1 -eq 1 ]]
    do
        _privateShowMenu
        _privateReadUserData
    done
    InInteractive=1
}
