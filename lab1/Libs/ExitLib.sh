function _privateIsCorrectExitCode
{
    if [[ $1 -lt -255 || $1 -gt 255 ]]
    then
        echo "Error: exit code should be in range from -255 to 255" >> /dev/stderr
        if ! [[ $InInteractive -eq 0 ]]; then exit -10; else return 1; fi
    fi

    if ! [[ $1 =~ ^-?[0-9]+$ ]]
    then
        echo "Error: exit code should be an INT. Not $1" >> /dev/stderr
        if ! [[ $InInteractive -eq 0 ]]; then exit -10; else return 1; fi
    fi
}

function _privateArgExistExit
{
    shift
    if [[ $# -gt 1 ]]
    then
        echo "Error: exit module contains 1 or 0 arguments. Not $#." >> /dev/stderr
        if ! [[ $InInteractive -eq 0 ]]; then exit -2; else return 1; fi
    elif [[ $# -eq 1 ]]
    then
        if ! _privateIsCorrectExitCode $1; then return 1; fi
    else
        exit 0
    fi

    return 0
}

function exi
{
    if _privateArgExistExit "$@"
    then
        shift
        exit $1
    fi
}
