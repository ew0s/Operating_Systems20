#!/bin/bash

function generalHelp
{
    echo -e "\e[1;44mHELP                                                                                      \e[0m"
    echo -e "\e[1mApp - version 1.0 (2020 Sep 20)\e[0m                                                         \e[1;44m  \e[0m"
    echo -e "\e[1mUsing: App.sh [parameters] [file ..] work with files and parameters\e[0m                     \e[1;44m  \e[0m"
    echo -e "\e[1m       App.sh [parameters] work with parameters\e[0m                                         \e[1;44m  \e[0m"
    echo -e "\e[1;44m                                                                                          \e[0m"
    echo -e "\e[1mParameters:\e[0m"
    echo -e "\e[1;44m                                                                                          \e[0m"
        echo -e "\e[1m\tcalc [switch parameter] <INT> <INT> ----- Execute math module to calculate numbers\e[0m"
            echo -e "\e[1m\t\tcalc sum <INT> <INT> - sum of two INTs"
            echo -e "\e[1m\t\tcalc sub <INT> <INT> - subtract of two INTs"
            echo -e "\e[1m\t\tcalc mul <INT> <INT> - multiply of two INTs"
            echo -e "\e[1m\t\tcalc div <INT> <INT> - division of two INTs"
            echo -e "\e[1;44m                                                                                          \e[0m"
        echo -e "\e[1m\tsearch [directory] <regular expression> ----- Execute search module to find strings
                                    in file wich satisfy by regular expression"
            echo -e "\e[1m\t\t[directory] - directory to search matches with regular expression"
            echo -e "\e[1m\t\t<regular expression> - regular expression"
            echo -e "\e[1;44m                                                                                          \e[0m"
        echo -e "\e[1m\treverse <file to read> <file to write> ----- Execute reverse module to rewrite file"
            echo -e "\e[1m\t\t<file to read> - take data from this file. Make sure that file is readable"
            echo -e "\e[1m\t\t<file to write> - put data into himself from <file ro read>. Make sure that the
                                    file is writeable"
            echo -e "\e[1;44m                                                                                          \e[0m"
        echo -e "\e[1m\tstrlen <string to search> ----- Execute strlen module to count length of some string"
            echo -e "\e[1m\t\t<string to search> - string with trimmed whitespaces"
            echo -e "\e[1;44m                                                                                          \e[0m"
        echo -e "\e[1m\tlog ----- Execute log module to show info from /var/log/anaconda/X.log"
            echo -e "\e[1;44m                                                                                          \e[0m"
        echo -e "\e[1m\tinteractive ----- Execute interactive module wich contains all functions from
                                    aplication in interactive mode."
            echo -e "\e[1;44m                                                                                          \e[0m"
        echo -e "\e[1m\thelp ----- Execute help module to show manual for application"
            echo -e "\e[1;44m                                                                                          \e[0m"
        echo -e "\e[1m\texit <?exit code>"
            echo -e "\e[1m\t\t<?exit code> - exit code wich should be in range from -255 to 255. This parameter
                                    not important so that in default exit code is 0"
            echo -e "\e[1;44m                                                                                          \e[0m"

}
