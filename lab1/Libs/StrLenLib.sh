function _privateArgsExistStrLen
{
    if ! [[ $1 -eq 1 ]] 
    then
        echo "Error: strlen module contains 1 argument. Not $1." >> /dev/stderr
        help_
        exit -2
    fi
}

function strlen
{
    _privateArgsExistStrLen $#
    local varLength=${#$1}
    echo $varLength
}
