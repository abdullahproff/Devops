#!/bin/bash
source ./check_args.sh
source ./parse_logs.sh

# Извлечение аргумента
option=$1

# Проверка аргументов
check_args $@

# Разбор логов
parse_logs $option
