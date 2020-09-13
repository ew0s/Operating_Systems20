#!/bin/bash

function calc
{
    case "$1" in
        "sum")
            echo found
            echo $(( $2 + $3 ));;
        "sub")
            echo $(( $2 - $3 ));;
        "mul")
            echo $(( $2 * $3 ));;
        "div")
            echo $(( $2 / $3 ));;
    esac
}

result=$(calc $1 $2 $3)
echo "$result"
