#!/bin/bash

function reverse
{
    if [[ -f $1 ]]
    then
        if [[ -f $2 ]]
        then
            echo "Work on it"
        else
            echo "Unable to initialize $2 file" >> /dev/stderr
        fi
    else
        echo "Unable to initialize $1 file" >> /dev/stderr
    fi
}
