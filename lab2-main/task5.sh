#!/bin/bash

bash task4.sh

awk 'BERIN {CurrLine=0;
            LineCounter=0.0;
            CurrPPID=0;
            ARTSum=0.0}
    {
        if (CurrLine == 0)
        {
            CurrLine=$7
            ARTSum+=$(11)
            LineCounter=1.0;
        }
        else if (CurrPPID == $7)
        {
            ARTSum+=$(11)
            LineCounter++;
        }
        else
        {
            print "Average_Sleeping_Children_of_ParentID=" CurrPPID " is " ARTSum/LineCounter
            CurrPPID=$7
            ARTSum=$(11)
            LineCounter=1.0
        }

        print $0
        CurrLine++;
    }' out/task4.out > out/task5.out
