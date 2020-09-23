function _privateShowMenu 
{
    echo "/*************** INTERACTIVE ****************/"
    echo "/--------------------------------------------/"
    echo "/----Enter one of the following commands-----/"
    echo "/----------- 1 - run calc module ------------/"
    echo "/---------- 2 - run search module -----------/"
    echo "/--------- 3 - run reverse module -----------/"
    echo "/---------- 4 - run strlen module -----------/"
    echo "/----------- 5 - run log module -------------/"
    echo "/----------- 6 - run help module ------------/"
    echo "/----- 7 - exit from interactive module -----/"
    echo "/--------------------------------------------/"
    echo "/*************** INTERACTIVE ****************/"
    echo -en "\nEnter one of the gave number to execute module: "
}

function _privateShowCalcMenu
{
    echo "/************ INTERACTIVE-CALC **************/"
    echo "/--------------------------------------------/"
    echo "/----Enter one of the following commands-----/"
    echo "/--------------------------------------------/"
    echo "/--------- sum lParameter rParameter --------/"
    echo "/----------sub lParameter rParameter --------/"
    echo "/--------- div lParameter rParameter --------/"
    echo "/--------- mul lParameter rParameter --------/"
    echo "/--------------------------------------------/"
    echo "/---Where lParameter and rParameter is INT---/"
    echo "/--------------------------------------------/"
    echo "/************ INTERACTIVE-CALC **************/"
    echo -en "\nEnter one of the gave command to execute module: "
}

function _privateShowSearchMenu
{
    echo "/*********** INTERACTIVE-SEARCH *************/"
    echo "/--------------------------------------------/"
    echo "/----Enter one of the following commands-----/"
    echo "/--------------------------------------------/"
    echo "/----- search [dir] [regular_expression] ----/"
    echo "/--------------------------------------------/"
    echo "/---- Where dir is a directory to search ----/"
    echo "/--------- strings witch satisfy by ---------/"
    echo "/--- second parameter - regular_expression --/"
    echo "/--------------------------------------------/"
    echo "/*********** INTERACTIVE-SEARCH *************/"
    echo -en "\nEnter one of the gave command to execute module: "
}

function _privateReverseMenu
{
    echo "/********** INTERACTIVE-REVERSE *************/"
    echo "/--------------------------------------------/"
    echo "/----Enter one of the following commands-----/"
    echo "/--------------------------------------------/"
    echo "/------ reverse [file_from] [file_to] -------/"
    echo "/--------------------------------------------/"
    echo "/- Where [file_from] is a file to read data -/"
    echo "/------- witch will put into [file_to] ------/"
    echo "/--------------------------------------------/"
    echo "/********** INTERACTIVE-REVERSE *************/"
    echo -en "\nEnter one of the gave command to execute module: "
}

function _privateStrLenMenu
{
    echo "/********** INTERACTIVE-STR_LEN *************/"
    echo "/--------------------------------------------/"
    echo "/----Enter one of the following commands-----/"
    echo "/--------------------------------------------/"
    echo "/---------- strlen [some_string] ------------/"
    echo "/--------------------------------------------/"
    echo "/---- Where [some_string] is a string to ----/"
    echo "/----------- calculate her length -----------/"
    echo "/--------------------------------------------/"
    echo "/********** INTERACTIVE-STR_LEN *************/"
    echo -en "\nEnter one of the gave command to execute module: "
} 

function _privateLogMenu
{
    echo "/************ INTERACTIVE-LOG ***************/"
    echo "/--------------------------------------------/"
    echo "/-----Enter one of the following commands----/"
    echo "/--------------------------------------------/"
    echo "/------------------- log --------------------/"
    echo "/--------------------------------------------/"
    echo "/------ Where log is a parameter wich -------/"
    echo "/---------- will execute log module ---------/"
    echo "/--------------------------------------------/"
    echo "/************ INTERACTIVE-LOG ***************/"
    echo -en "\nEnter one of the gave command to execute module: "
}
