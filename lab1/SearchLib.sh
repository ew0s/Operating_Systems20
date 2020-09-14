#!/bin/bash

function search
{
    if [[ -d $1 ]]
    then
        grep -r "$2" $1
    else
        echo "Unable to found $1 directory"
    fi
}

