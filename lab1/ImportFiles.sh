#!/bin/bash

function require()
{
    local ScriptName=$1
    if [[ -f $ScriptName ]]
    then
        return 0
    else
        echo "Warning: unable to find $ScriptName. Module disangaged." >> /dev/stderr && return 1
    fi
}

function _privateImport()
{
    local ScriptName=$1
    if require $ScriptName; then . $ScriptName; fi
}

function ImportScripts()
{
    _privateImport ImportFiles.sh
    _privateImport Libs/CalcLib.sh
    _privateImport Libs/ReverseLib.sh
    _privateImport Libs/SearchLib.sh
}
