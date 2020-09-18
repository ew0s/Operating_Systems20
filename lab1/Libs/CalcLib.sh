#!/bin/bash

function _privateArgsExistCalc
{
    local ArgsCount=$1
    if ! [[ ArgsCount -eq 4 ]]
    then
        echo "Error: calc module contains 4 arguments. Not $ArgsCount." >> /dev/stderr
        help_
        exit -2
    fi
}

function _priavateArgsCorrectCalc
{
    # $1 - sum/sub/mul/div
    # $2 - lInteger
    # $3 - rInteger

    local switchParameter=$1
    local lParameter=$2
    local rParameter=$3

    if ! [[ $switchParameter =~ ^(sum|sub|mul|div)$ ]]
    then
        echo "Error: switchParameter should be like sum/sub/mul/div. Not $switchParameter." >> /dev/stderr
        help_
        exit -12
    fi

    if ! [[ $lParameter =~ ^-?[[:digit:]]+$ && ! $lParameter =~ ^-0$ ]]
    then 
        echo "Error: lParameter in $switchParameter should be integer. Not $lParameter." >> /dev/stderr
        help_
        exit -15
    fi

    if ! [[ $rParameter =~ ^-?[[:digit:]]+$ && ! $rParameter =~ ^-0$ ]]
    then
        echo "Error: rParameter in $switchParameter should be integer. Not $rParameter." >> /dev/stderr
        help_
        exit -15
    fi
}

function CalcMouduleReady
{
   _privateArgsExistCalc $1
   _priavateArgsCorrectCalc $2 $3 $4
   return 0
}

function _privateDivision
{
    local lParameter=$1
    local rParameter=$2
    if [[ $rParameter -eq 0 ]]
    then
        echo "Error: division by 0 caught. Please try again"
        help_
        exit -1
    else
        return $(( $lParameter / $rParameter ))
    fi
}

function _privateChooseToCalc
{
    case "$1" in
        "sum")
            echo $(( $2 + $3 ));;
        "sub")
            echo $(( $2 - $3 ));;
        "mul")
            echo $(( $2 * $3 ));;
        "div")
            _privateDivision $2 $3;;
    esac
}

function calc
{
    if CalcMouduleReady $1 $2 $3 $4; then _privateChooseToCalc $2 $3 $4; fi
}
