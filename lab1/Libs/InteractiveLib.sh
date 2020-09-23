#!/bin/bash

function _privateArgExistInteractive
{
    if ! [[ $# -eq 1 ]]
    then
        echo "Error: interactive module contains 1 argument. Not $#." >> /dev/stderr
        echo "Please press ENTER and try again."
        return 1
    fi

    if ! [[ $1 =~ ^[1-7]$ ]]
    then 
        echo "Error: argument in interactive module must be in range from 1 to 7. Not $1" >> /dev/stderr
        echo "Please press ENTER and try again."
        return 1
    fi

    return 0
}


function _privateShowMenu 
{
    clear
    echo "/****************INTERACTIVE*****************/"
    echo "/--------------------------------------------/"
    echo "/----Enter one of the following commands-----/"
    echo "/----------- 1 - run calc module ------------/"
    echo "/---------- 2 - run search module -----------/"
    echo "/--------- 3 - run reverse module -----------/"
    echo "/---------- 4 - run strlen module -----------/"
    echo "/----------- 5 - run log module -------------/"
    echo "/----------- 6 - run help module ------------/"
    echo "/----- 7 - exit from interactive module -----/"
    echo "/--------------------------------------------/"
    echo "/****************INTERACTIVE*****************/"
    echo -en "\nEnter one of the gave number to execute module: "
}

function _privateCalc
{
    clear
    if require Libs/CalcLib.sh
    then
        echo "/*************INTERACTIVE-CALC***************/"
        echo "/--------------------------------------------/"
        echo "/----Enter one of the following commands-----/"
        echo "/--------- sum lParameter rParameter --------/"
        echo "/----------sub lParameter rParameter --------/"
        echo "/--------- div lParameter rParameter --------/"
        echo "/--------- mul lParameter rParameter --------/"
        echo "/---Where lParameter and rParameter is INT---/"
        echo "/--------------------------------------------/"
        echo "/*************INTERACTIVE-CALC***************/"
        echo -en "\nEnter one of the gave command to execute module: "
        read
        calc $REPLY
        sleep 3
    fi
}

function _privateChooseTODO
{
    case $1 in
        "1")
            # $2 - sum/sub/mul/div
            # $3 - left integer parameter
            # $4 - right integer parameter
            if require Libs/CalcLib.sh; then _privateCalc; fi;;
        "2")
            # $2 - directory where to search
            # $3 - regular expression
            if require Libs/SearchLib.sh; then search $2 $3; fi;;
        "3")
            # $2 - file to read from
            # $3 - file to write to
            if require Libs/ReverseLib.sh; then reverse $2 $3; fi;;
        "4")
            # $1 - the string that was given from the terminal
            if require Libs/StrLenLib.sh; then strlen $2; fi;;
        "5")
            if require Libs/LogLib.sh; then log; fi;;
        "6")
            help_;;
        "7")
            exi;;
    esac
}

function _privateReadUserData
{
    read first
    if _privateArgExistInteractive $first
    then 
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
