#!/bin/bash
source ./check_args.sh
source ./check_space.sh
source ./create_files.sh

# Извлечение аргументов
dir_path=$1
num_dirs=$2
dir_chars=$3
num_files=$4
file_chars=$5
file_size=$6

# Проверка аргументов
check_args $@

# Проверка свободного места
check_space

# Создание директорий и файлов
create_files $dir_path $num_dirs $dir_chars $num_files $file_chars $file_size
