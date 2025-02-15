#!/bin/bash
function check_args {
    # Проверка количества аргументов
    if [ "$#" -ne 6 ]; then
        echo "Неверное количество аргументов. Необходимо 6."
        exit 1
    fi
}
