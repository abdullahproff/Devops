
# Stage 1: Build
FROM debian as builder

WORKDIR /build

COPY mini_server.c ./

RUN apt-get update && \
    apt-get install -y gcc make libfcgi-dev && \
    gcc -static -o /build/mini_server /build/mini_server.c -lfcgi

# Stage 2: Image
FROM alpine

EXPOSE 81

COPY --from=builder /build/mini_server /usr/local/bin/ 
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./run_script.sh /build/
ARG APP_USER=menosVM
ARG APP_GROUP=nginx

RUN apk update && \
    apk add --no-cache spawn-fcgi wget nginx && \
    chmod +x /usr/local/bin/mini_server && \
    adduser --system --no-create-home --ingroup $APP_GROUP $APP_USER && \
    mkdir -p  /var/lib/nginx/logs \
    /var/log/nginx \
    /var/lib/nginx/tmp/client_body \
    /var/lib/nginx/tmp/proxy \
    /var/lib/nginx/tmp/fastcgi \
    /var/lib/nginx/tmp/uwsgi \
    /var/lib/nginx/tmp/scgi \
    /tmp/nginx && \
    touch /var/lib/nginx/logs/error.log \
    /var/log/nginx/access.log && \
    chown -R $APP_USER:$APP_GROUP /var/lib/nginx/logs \
    /var/log/nginx \
    /var/lib/nginx/tmp \
    /tmp/nginx

USER $APP_USER

HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1

CMD ["/bin/sh", "/build/run_script.sh"]