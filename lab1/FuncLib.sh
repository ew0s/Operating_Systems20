#!/bin/bash

function calc
{
    if [[ $2 =~ ^-*[[:digit:]]+$ ]]
    then
        if [[ $3 =~ ^-*[[:digit:]]+$ ]]
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
                    echo "Invalid first argument in calc module. Please try again.";;
            esac
        else
            printf "Invalid third argument in calc module. Not an integer. Please try again."
        fi
    else
        printf "Invalid second argument in calc module. Not an integer. Please try again."
    fi
}
