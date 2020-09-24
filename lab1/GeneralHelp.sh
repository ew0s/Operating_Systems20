#!/bin/bash

function generalHelp
{
    echo -e "\e[1;44mHELP                                                                                      \e[0m"
    echo -e "\e[1mApp - version 1.0 (2020 Sep 20)\e[0m                                                         \e[1;44m  \e[0m"
    echo -e "\e[1mUsing: App.sh [parameters] [file ..] work with files and parameters\e[0m                     \e[1;44m  \e[0m"
    echo -e "\e[1m       App.sh [parameters] work with parameters\e[0m                                         \e[1;44m  \e[0m"
    echo -e "\e[1;44m                                                                                          \e[0m"
    echo -e "\e[1mParameters:\e[0m"
    echo -e "\e[1m\tcalc [switch parameter] <INT> <INT> ----- Execute math module to calculate numbers\e[0m"
    echo -e "\e[1m\t\tcalc sum <INT> <INT> - sum of two INTs"
    echo -e "\e[1m\t\tcalc sub <INT> <INT> - subtract of two INTs"
    echo -e "\e[1m\t\tcalc mul <INT> <INT> - multiply of two INTs"
    echo -e "\e[1m\t\tcalc div <INT> <INT> - division of two INTs\n"
    echo -e "\e[1m\tsearch [directory] <regular expression> ----- Execute search module to find strings
                                    in file wich satisfy by regular expression"
    echo -e "\e[1m\t\t[directory] - directory to search matches with regular expression"
    echo -e "\e[1m\t\t<regular expression> - regular expression to" 

}
