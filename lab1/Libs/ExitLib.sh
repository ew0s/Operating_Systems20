function _privateIsCorrectExitCode
{
    if [[ $1 -lt -255 || $1 -gt 255 ]]
    then
        echo "Error: exit code should be in range from -255 to 255" >> /dev/stderr
        help_
        exit -10
    fi
}

function _privateArgExistExit
{
    shift
    if [[ $# -lt 0 || $# -gt 1 ]]
    then
        echo "Error: exit module contains 1 or 0 arguments. Not $#." >> /dev/stderr
        help_
        exit -2
    elif [[ $# -eq 1 ]]
    then
        _privateIsCorrectExitCode $1
    else
        exit 0
    fi
}

function exi
{
    _privateArgExistExit "$@"
    shift
    exit $1
}
