#!/bin/bash
function generate_logs {
    # Массивы для генерации случайных данных
    declare -a RESPONSE_CODES=("200" "201" "400" "401" "403" "404" "500" "501" "502" "503")
    declare -a METHODS=("GET" "POST" "PUT" "PATCH" "DELETE")
    declare -a AGENTS=("Mozilla" "Google Chrome" "Opera" "Safari" "Internet Explorer" "Microsoft Edge" "Crawler and bot" "Library and net tool")

    # Генерация случайного IP-адреса
    function generate_ip() {
        echo "$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256))"
    }

    # Генерация случайного URL
    function generate_url() {
        echo "/$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)"
    }

    # Генерация логов
    for ((i=1; i<=5; i++)); do
        log_file="nginx_log_$i.log"
        touch $log_file
        num_entries=$((RANDOM % 901 + 100))
        for ((j=1; j<=$num_entries; j++)); do
            ip=$(generate_ip)
            response_code=${RESPONSE_CODES[$RANDOM % ${#RESPONSE_CODES[@]}]}
            method=${METHODS[$RANDOM % ${#METHODS[@]}]}
            url=$(generate_url)
            agent=${AGENTS[$RANDOM % ${#AGENTS[@]}]}
            echo "$ip - - [$(date +'%d/%b/%Y:%H:%M:%S %z')] \"$method $url HTTP/1.1\" $response_code 0 \"-\" \"$agent\"" >> $log_file
        done
    done
}

#200: OK. Запрос успешно обработан.
#201: Created. Запрос успешно обработан, и в результате создан новый ресурс.
#400: Bad Request. Сервер не понимает запрос из-за неверного синтаксиса.
#401: Unauthorized. Для доступа к запрашиваемому ресурсу требуется аутентификация.
#403: Forbidden. У клиента нет прав доступа к содержимому, поэтому сервер отказывает в предоставлении соответствующего ресурса.
#404: Not Found. Сервер не может найти запрашиваемый ресурс.
#500: Internal Server Error. На сервере произошла непредвиденная ситуация, которая не позволяет ему выполнить запрос.
#501: Not Implemented. Метод, указанный в запросе, не поддерживается на сервере и не может быть обработан.
#502: Bad Gateway. Получен недействительный ответ от внутреннего сервера при попытке сервера-посредника выполнить запрос.
#503: Service Unavailable. Сервер не готов обрабатывать запрос. Обычно это связано с временной перегрузкой или техническим обслуживанием сервера.
