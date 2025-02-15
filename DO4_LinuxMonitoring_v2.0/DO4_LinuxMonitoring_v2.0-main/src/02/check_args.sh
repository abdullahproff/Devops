#!/bin/bash
function check_args {
    # Проверка количества аргументов
    if [ "$#" -ne 3 ]; then
        echo "Неверное количество аргументов. Необходимо 3."
        exit 1
    fi
}
