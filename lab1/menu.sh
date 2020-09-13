#!/bin/bash
ReadyFuncLib=0

function CheckScripts
{
    if [[ -s FuncLib.sh ]]
    then
        ReadyFuncLib=1
        . FuncLib.sh
    else
        echo "No scripts found for calc module. Module disangaged."
    fi
}

CheckScripts

if [[ -n $1 ]]
then
    case $1 in
        "calc")
            if [[ $# -eq 4 ]]
            then
                if [[ ReadyFuncLib -eq 1 ]]
                then
                    echo fine
                    result=1
                    result=$(calc $2 $3 $4 )
                    echo "$result"
                fi
            else
                echo "Invalid parameters count for calc module. Please try again."
            fi;;
    esac
else
    echo "not exist"
fi
