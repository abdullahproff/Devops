#!/bin/sh

# Запускаем сервер FastCGI на порту 8080
spawn-fcgi -p 8080 -u menosVM -g nginx /usr/local/bin/mini_server

# Запускаем nginx в режиме фонового процесса
nginx -g 'daemon off;'

service nginx start


while true; do
    sleep 1
done