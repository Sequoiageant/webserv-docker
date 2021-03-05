ARG NGINX_VERSION
FROM nginx:${NGINX_VERSION}

ARG UID
RUN apk --no-cache add shadow && usermod -u ${UID} nginx

COPY ./nginx.conf /etc/nginx/

COPY ./certs/cert.key /etc/ssl/private/
COPY ./certs/cert.crt /etc/ssl/