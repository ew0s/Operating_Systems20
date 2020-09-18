#!/bin/bash

function calc
{
    if [[ $2 =~ ^-?[[:digit:]]+$ && ! $2 =~ ^-0$ ]]
    then
        if [[ $3 =~ ^-?[[:digit:]]+$ && ! $3 =~ ^-0$ ]]
        then
            case "$1" in
                "sum")
                    echo $(( $2 + $3 ));;
                "sub")
                    echo $(( $2 - $3 ));;
                "mul")
                    echo $(( $2 * $3 ));;
                "div")
                    echo $(( $2 / $3 ));;
                *    )
                    echo "Invalid second argument in calc module. Please try again." >> /dev/stderr;;
            esac
        else
            echo  "Invalid fourth argument in calc module. Not an integer. Please try again." >> /dev/stderr
        fi
    else
        echo "Invalid third argument in calc module. Not an integer. Please try again." >> /dev/stderr
    fi
}

