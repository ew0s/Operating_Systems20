#!/bin/bash

function require()
{
    local ScriptName=$1
    if [[ -f $ScriptName ]]
    then
        return 0
    else
        echo "Warning: unable to find $ScriptName. Module disangaged." >> /dev/stderr && return -2
    fi
}

function _privateImport()
{
    local ScriptName=$1
    if require $ScriptName; then . $ScriptName; fi
}

function ImportScripts()
{
    _privateImport Libs/CalcLib.sh
    _privateImport Libs/ReverseLib.sh
    _privateImport Libs/SearchLib.sh
    _privateImport Libs/StrLenLib.sh
    _privateImport Libs/ExitLib.sh
}
