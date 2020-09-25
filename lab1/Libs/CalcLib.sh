#!/bin/bash

function _privateArgsExistCalc
{
    local ArgsCount=$1
    if ! [[ ArgsCount -eq 3 ]]
    then
        echo "Error: calc module contains 3 arguments. Not $ArgsCount." >> /dev/stderr
        generalHelp
        if ! [[ InInteractive -eq 0 ]]; then exit -2; else return 1; fi
    fi
    return 0
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
        generalHelp
        if ! [[ InInteractive -eq 0 ]]; then exit -12; else return 1; fi
    fi

    if ! [[ $lParameter =~ ^[-+]?[[:digit:]]+$ && ! $lParameter =~ ^-0$ ]]
    then 
        echo "Error: lParameter in $switchParameter should be integer. Not $lParameter." >> /dev/stderr
        generalHelp
        if ! [[ InInteractive -eq 0 ]]; then exit -15; else return 1; fi
    fi

    if ! [[ $rParameter =~ ^[-+]?[[:digit:]]+$ && ! $rParameter =~ ^-0$ ]]
    then
        echo "Error: rParameter in $switchParameter should be integer. Not $rParameter." >> /dev/stderr
        generalHelp
        if ! [[ InInteractive -eq 0 ]]; then exit -15; else return 1; fi
    fi
}

function _privateDivision
{
    local lParameter=$1
    local rParameter=$2
    if [[ $rParameter -eq 0 ]]
    then
        echo "Error: division by 0 caught. Please try again"
        generalHelp
        if ! [[ InInteractive -eq 0 ]]; then exit -1; else return; fi
    fi
    echo $(( $lParameter / $rParameter ))
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

function CalcMouduleReady
{
  if ! _privateArgsExistCalc $#; then return 1; fi
  if ! _priavateArgsCorrectCalc $1 $2 $3; then return 1; fi
  return 0
}

function calc
{
    if CalcMouduleReady $@; then _privateChooseToCalc $1 $2 $3; fi
}
