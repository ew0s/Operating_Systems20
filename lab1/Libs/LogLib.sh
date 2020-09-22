#!/bin/bash

function _privateLogFilesExist
{
    if ! [[ -e /var/log/anaconda/X.log ]]
    then
        echo "Error: unable to locate /var/log/anaconda/X.log" && help_
        exit -9
    fi
}

function _privateLogSets
{
    warnings="$(cat /var/log/anaconda/X.log | awk '{if(($3 == "(WW)") && ($1 == "["))print $0}')"
    information="$(cat /var/log/anaconda/X.log | awk '{if(($3 == "(II)") && ($1 == "["))print $0}')"
}

function _privateShowColorLog
{
    echo -e "${warnings//"(WW)"/"\e[33mWarning:\e[0m"}"
    echo -e "${information//"(II)"/"\e[94mInformation:\e[0m"}"
}

function log
{
    _privateLogFilesExist
    _privateLogSets
    _privateShowColorLog
}
