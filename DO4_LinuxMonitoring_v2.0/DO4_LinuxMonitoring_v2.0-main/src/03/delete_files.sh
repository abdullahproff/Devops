#!/bin/bash
function delete_files {
    method=$1

    case $method in
        1)
            # Удаление по лог-файлу
            echo "Введите путь к лог-файлу:"
            read log_file
            while IFS= read -r line
            do
                rm -rf "$line"
            done < "$log_file"
            ;;
        2)
            # Удаление по дате и времени создания
            echo "Введите начальную дату и время (в формате YYYYMMDDhhmm):"
            read start_date
            echo "Введите конечную дату и время (в формате YYYYMMDDhhmm):"
            read end_date
            find / -type f -newermt "$start_date" ! -newermt "$end_date" -exec rm -f {} \;
            ;;
        3)
            # Удаление по маске имени
            echo "Введите маску имени:"
            read name_mask
            find / -type f -name "$name_mask" -exec rm -f {} \;
            ;;
        *)
            echo "Неверный метод. Должно быть 1, 2 или 3."
            exit 1
            ;;
    esac
}
