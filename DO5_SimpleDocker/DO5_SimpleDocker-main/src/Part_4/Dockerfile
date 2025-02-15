FROM nginx:latest

WORKDIR /home

COPY ./mini_server.c /home
COPY ./nginx.conf /etc/nginx/
COPY ./run_script.sh .

RUN apt-get update && \
    apt-get -y install gcc &&\
    apt-get -y install libfcgi-dev &&\
    apt-get -y install spawn-fcgi &&\
    chmod +x run_script.sh

ENTRYPOINT ["sh", "./run_script.sh"]