function _privateShowMenu 
{
    echo -e "\e[1;31m/*************** INTERACTIVE ****************/\e[0m"
    echo -e "\e[1;31m/--------------------------------------------/\e[0m"
    echo -e "\e[33m/----Enter one of the following commands-----/\e[0m"
    echo -e "\e[33m/----------- 1 - run calc module ------------/\e[0m"
    echo -e "\e[1;33m/---------- 2 - run search module -----------/\e[0m"
    echo -e "\e[1;33m/--------- 3 - run reverse module -----------/\e[0m"
    echo -e "\e[32m/---------- 4 - run strlen module -----------/\e[0m"
    echo -e "\e[32m/----------- 5 - run log module -------------/\e[0m"
    echo -e "\e[34m/----------- 6 - run help module ------------/\e[0m"
    echo -e "\e[34m/----- 7 - exit from interactive module -----/\e[0m"
    echo -e "\e[35m/--------------------------------------------/\e[0m"
    echo -e "\e[35m/*************** INTERACTIVE ****************/\e[0m"
    echo -en "\nEnter one of the gave number to execute module: "
}

function _privateShowCalcMenu
{
    echo -e "\e[1;31m/************ INTERACTIVE-CALC **************/\e[0m"
    echo -e "\e[1;31m/--------------------------------------------/\e[0m"
    echo -e "\e[33m/----Enter one of the following commands-----/\e[0m"
    echo -e "\e[33m/--------------------------------------------/\e[0m"
    echo -e "\e[1;33m/--------- sum lParameter rParameter --------/\e[0m"
    echo -e "\e[1;33m/----------sub lParameter rParameter --------/\e[0m"
    echo -e "\e[32m/--------- div lParameter rParameter --------/\e[0m"
    echo -e "\e[32m/--------- mul lParameter rParameter --------/\e[0m"
    echo -e "\e[34m/--------------------------------------------/\e[0m"
    echo -e "\e[34m/---Where lParameter and rParameter is INT---/\e[0m"
    echo -e "\e[35m/--------------------------------------------/\e[0m"
    echo -e "\e[35m/************ INTERACTIVE-CALC **************/\e[0m"
    echo -en "\nEnter one of the gave command to execute module: "
}

function _privateShowSearchMenu
{
    echo -e "\e[1;31m/*********** INTERACTIVE-SEARCH *************/\e[0m"
    echo -e "\e[1;31m/--------------------------------------------/\e[0m"
    echo -e "\e[33m/----Enter one of the following commands-----/\e[0m"
    echo -e "\e[33m/--------------------------------------------/\e[0m"
    echo -e "\e[1;33m/-------- [dir] [regular_expression] --------/\e[0m"
    echo -e "\e[1;33m/--------------------------------------------/\e[0m"
    echo -e "\e[32m/---- Where dir is a directory to search ----/\e[0m"
    echo -e "\e[32m/--------- strings witch satisfy by ---------/\e[0m"
    echo -e "\e[34m/--- second parameter - regular_expression --/\e[0m"
    echo -e "\e[34m/--------------------------------------------/\e[0m"
    echo -e "\e[35m/*********** INTERACTIVE-SEARCH *************/\e[0m"
    echo -en "\nEnter one of the gave command to execute module: "
}

function _privateShowReverseMenu
{
    echo -e "\e[1;31m/********** INTERACTIVE-REVERSE *************/\e[0m"
    echo -e "\e[1;31m/--------------------------------------------/\e[0m"
    echo -e "\e[33m/----Enter one of the following commands-----/\e[0m"
    echo -e "\e[33m/--------------------------------------------/\e[0m"
    echo -e "\e[1;33m/--------- [file_from] [file_to] ------------/\e[0m"
    echo -e "\e[1;33m/--------------------------------------------/\e[0m"
    echo -e "\e[32m/- Where [file_from] is a file to read data -/\e[0m"
    echo -e "\e[32m/------- witch will put into [file_to] ------/\e[0m"
    echo -e "\e[34m/--------------------------------------------/\e[0m"
    echo -e "\e[35m/********** INTERACTIVE-REVERSE *************/\e[0m"
    echo -en "\nEnter one of the gave command to execute module: "
}

function _privateShowStrLenMenu
{
    echo "/********** INTERACTIVE-STR_LEN *************/"
    echo "/--------------------------------------------/"
    echo "/----Enter one of the following commands-----/"
    echo "/--------------------------------------------/"
    echo "/------------- [some_string] ----------------/"
    echo "/--------------------------------------------/"
    echo "/---- Where [some_string] is a string to ----/"
    echo "/----------- calculate her length -----------/"
    echo "/--------------------------------------------/"
    echo "/********** INTERACTIVE-STR_LEN *************/"
    echo -en "\nEnter one of the gave command to execute module: "
} 
