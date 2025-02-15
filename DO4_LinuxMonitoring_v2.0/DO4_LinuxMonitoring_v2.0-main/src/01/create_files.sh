#!/bin/bash
function create_files {
    dir_path=$1
    num_dirs=$2
    dir_chars=$3
    num_files=$4
    file_chars=$5
    file_size=$6

    # Создание директорий и файлов
    for ((i=1; i<=$num_dirs; i++)); do
        dir_name=$(echo $dir_chars | fold -w1 | shuf | head -c4)
        dir_name="${dir_name}_$(date +%d%m%y)"
        mkdir -p "$dir_path/$dir_name"
        for ((j=1; j<=$num_files; j++)); do
            file_name=$(echo $file_chars | cut -d. -f1 | fold -w1 | shuf | head -c4)
            file_ext=$(echo $file_chars | cut -d. -f2 | fold -w1 | shuf | head -c3)
            file_name="${file_name}_$(date +%d%m%y).$file_ext"
            dd if=/dev/zero of="$dir_path/$dir_name/$file_name" bs=1024 count=$file_size
            echo "Создан файл: $dir_path/$dir_name/$file_name, размер: $file_size кб, дата создания: $(date +%d-%m-%Y)"
        done
    done
}
