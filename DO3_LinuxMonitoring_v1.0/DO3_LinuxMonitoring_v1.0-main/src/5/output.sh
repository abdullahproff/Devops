#!/bin/bash
source topDir.sh
source topFile.sh
source topExe.sh

function output()
{
    time=$(date +%s)
    dir=$(find "$1" -type d |wc -l)
    echo "Общее число папок, включая вложенные = $(($dir-1))"
    echo "Топ 5 папок с самым большим весом в порядке убывания (путь и размер):"; topDir "$1"
    echo Total number of files = "$(find "$1" -type f|wc -l)"

    echo Number of:  
    echo "Число конфигурационных файлов (с расширением .conf) = $(find "$1" -name "*.conf" | wc -l)"
    echo "Текстовые файлы = $(find "$1" -name "*.txt" | wc -l)"
    echo "Исполняемые файлы = $(find "$1" -type f -executable | wc -l)"
    echo "Лог файлы (с расширением .log) = $(find "$1" -name "*.log" | wc -l)"
    echo "Архивные файлы = $(find "$1" -name "*.tar"| wc -l)"
    echo "Символические файлы = $(find "$1" -type l | wc -l)"

    echo "Топ 10 файлов с самым большим весом в порядке убывания (путь, размер и тип):"; topFile "$1"
    echo "Топ 10 исполняемых файлов с самым большим весом в порядке убывания (путь, размер и хеш):"; topExe "$1"

    echo "Время выполнения скрипта (сек) = $(($(date +%s)-$time))"
}