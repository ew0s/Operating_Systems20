#!/bin/bash

ReadyFuncLib=0
ReadySearchLib=0
ReadyReverseLib=0

function CheckScripts
{
    if [[ -s FuncLib.sh ]]
    then
        ReadyFuncLib=1
        . FuncLib.sh
    else
        echo "No scripts found for calc module. Module disangaged."
    fi

    if [[ -s SearchLib.sh ]]
    then
        ReadySearchLib=1
        . SearchLib.sh
    else
        echo "No scripts found for search module. Module disangaged."
    fi

    if [[ -s ReverseLib.sh ]]
    then
        ReadyReverseLib=1
        . ReverseLib.sh
    else
        echo "No scripts found for reverse module. Module disangaged."
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
                    echo $(calc $2 $3 $4 )
                fi
            else
                echo "Invalid parameters count for calc module. Please try again."
            fi;;
        "search")
            if [[ $# -eq 3 ]]
            then
                (search $2 $3)
            else  
                echo "invalid parameters count for search module. please try again."
            fi;;
        "reverse")
            if [[ $# -eq 3 ]]
            then
                (reverse $2 $3)
            else
                echo "invalid parameters count for reverse module. please try again."
            fi;;
    esac
else
    echo "not exist"
fi
