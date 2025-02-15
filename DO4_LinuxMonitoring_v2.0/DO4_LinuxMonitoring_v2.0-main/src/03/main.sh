#!/bin/bash
source ./check_args.sh
source ./delete_files.sh

# Извлечение аргумента
method=$1

# Проверка аргументов
check_args $@

# Удаление файлов
delete_files $method
