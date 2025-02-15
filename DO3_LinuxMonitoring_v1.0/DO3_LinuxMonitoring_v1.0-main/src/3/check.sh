#!/bin/bash

function check()
{
    if [[ $# = 4 ]]
    then
        error=0;
        for i in "$@"
        do
            if [[ i -lt 1 ]] || [[ i -gt 6 ]]
            then
            error=1;
            echo "Введите четыре числовых параметра 1-6 и перезапустите скрипт" 
            exit 1
            fi
        done
        if [[ $error = 0 ]]
        then
            colorCheck "$@"
        else
            echo "Введите четыре числовых параметра 1-6 и перезапустите скрипт" 
            exit 1
        fi
    else
        echo "Введите четыре числовых параметра 1-6 и перезапустите скрипт" 
        exit 1
    fi
}


function colorCheck()
{
    if [[ $1 = "$2" ]] || [[ $3 = "$4" ]]
    then
        echo "Цвета шрифта и фона одного столбца не должны совпадать"
        exit 1
    else
        setBG "$1" BG1
        setBG "$3" BG2
        setF "$2" F1
        setF "$4" F2
        out
    fi
}