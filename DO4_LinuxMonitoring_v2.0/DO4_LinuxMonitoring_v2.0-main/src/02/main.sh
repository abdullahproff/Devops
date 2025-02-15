#!/bin/bash
source ./check_args.sh
source ./check_space.sh
source ./create_files.sh

# Извлечение аргументов
dir_chars=$1
file_chars=$2
file_size=$3

# Проверка аргументов
check_args $@

# Проверка свободного места
check_space

# Создание директорий и файлов
create_files $dir_chars $file_chars $file_size
