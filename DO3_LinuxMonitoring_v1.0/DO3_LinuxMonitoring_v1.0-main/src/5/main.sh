#!/bin/bash
source output.sh

function check()
{
    if [ $# -eq 1 ]
    then
        if [[ $1 =~ /$ ]]
        then
            if [[ -d "$1" ]]
            then
                output "$1"
            else
                echo "Директория не найдена"
            fi
        else
            echo "Параметр должен заканчиваться знаком '/', например: ./main.sh /var/log/"
            exit 1
        fi
    else
        echo "Необходимо ввести один параметр"
        exit 1
    fi
}

check "$@"