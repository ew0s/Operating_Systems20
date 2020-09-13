#!/bin/bash

function calc
{
    case "$2" in
        "sum")
            echo $( $3 + $4 );;
        "sub")
            echo $( $3 - $4 );;
        "mul")
            echo $( $3 * $4 );;
        "div")
            echo $( $3 / $4 );;
    esac
}

result=$(calc $2 $3 $4)
echo "$result"
