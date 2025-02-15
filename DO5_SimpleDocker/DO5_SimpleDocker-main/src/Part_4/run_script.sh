#!/bin/bash

gcc -o mini_server mini_server.c -lfcgi
spawn-fcgi -p 8080 ./mini_server

service nginx start


while true; do
    sleep 1
done
