#!/bin/sh
set -e

echo "configuring reverse proxy on port ${PROXY_PORT}"

# generate ssl certificate
mkdir -p /etc/nginx/certs
openssl req -new -x509 -sha256 -nodes -days 1024 -subj "/CN=${PROXY_HOST}" -keyout /etc/nginx/certs/key.pem -out /etc/nginx/certs/cert.pem > /dev/null 2>&1

# create nginx Configuration
envsubst '$PROXY_PORT:$TARGET_HOST:$TARGET_PORT' < /nginx.conf.template > /etc/nginx/nginx.conf

# start nginx
exec nginx
