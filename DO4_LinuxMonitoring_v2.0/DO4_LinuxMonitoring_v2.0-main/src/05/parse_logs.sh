#!/bin/bash
function parse_logs {
    option=$1

    # Путь к файлам логов
    log_files="nginx_log_*.log"

    case $option in
        1)
            # Все записи, отсортированные по коду ответа
            awk '{print $0}' $log_files | sort -k9
            ;;
        2)
            # Все уникальные IP, встречающиеся в записях
            awk '{print $1}' $log_files | sort | uniq
            ;;
        3)
            # Все запросы с ошибками (код ответа - 4хх или 5хх)
            awk '($9 ~ /^4/ || $9 ~ /^5/) {print $0}' $log_files
            ;;
        4)
            # Все уникальные IP, которые встречаются среди ошибочных запросов
            awk '($9 ~ /^4/ || $9 ~ /^5/) {print $1}' $log_files | sort | uniq
            ;;
        *)
            echo "Неверный параметр. Должно быть 1, 2, 3 или 4."
            exit 1
            ;;
    esac
}
