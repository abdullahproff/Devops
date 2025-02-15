#!/bin/bash
source config
source ./../3/check.sh
source ./../3/set.sh
source ./../3/out.sh

function confCheck()
{
    if [[ $# -eq 0 ]]
    then
        BG1=$column1_background
        BG2=$column2_background
        F1=$column1_font_color
        F2=$column2_font_color
        
        if [[ -z $BG1 ]] || [[ -z $BG2 ]] || [[ -z $F1 ]] || [[ -z $F2 ]]
        then
            BG1=1; BG2=2; F1=3; F2=6;

            colorCheck $BG1 $F1 $BG2 $F2
            echo ""
            outputColor default
        else
            check $BG1 $F1 $BG2 $F2
            echo ""
            outputColor
        fi
    else
        echo "Скрипт запускается без параметров"
        exit 1
    fi
}