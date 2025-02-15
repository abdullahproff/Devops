#!/bin/bash
function check_args {
    # Проверка количества аргументов
    if [ "$#" -ne 1 ]; then
        echo "Неверное количество аргументов. Необходимо 1."
        exit 1
    fi
}
