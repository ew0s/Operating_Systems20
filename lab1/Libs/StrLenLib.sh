function _privateArgsExistStrLen
{
    if ! [[ $1 -eq 1 ]] 
    then
        echo "Error: strlen module contains 1 argument. Not $1." >> /dev/stderr
        if ! [[ InInteractive -eq 0 ]]; then exit -2; else return 1; fi
    fi

    return 0;
}

function strlen
{
    if _privateArgsExistStrLen $#
    then
        echo ${#1} 
    fi
}
