#!/bin/bash
function create_files {
    dir_chars=$1
    file_chars=$2
    file_size=$3

    # Создание директорий и файлов
    for ((i=1; i<=100; i++)); do
        dir_name=$(echo $dir_chars | fold -w1 | shuf | head -c5)
        dir_name="${dir_name}_$(date +%d%m%y)"
        mkdir -p "./$dir_name"
        num_files=$((RANDOM%100+1))
        for ((j=1; j<=$num_files; j++)); do
            file_name=$(echo $file_chars | cut -d. -f1 | fold -w1 | shuf | head -c5)
            file_ext=$(echo $file_chars | cut -d. -f2 | fold -w1 | shuf | head -c3)
            file_name="${file_name}_$(date +%d%m%y).$file_ext"
            dd if=/dev/zero of="./$dir_name/$file_name" bs=1048576 count=$file_size
            echo "Создан файл: ./$dir_name/$file_name, размер: $file_size Мб, дата создания: $(date +%d-%m-%Y)"
        done
    done
}
