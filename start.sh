#!/bin/bash
set -e

if [ -z "$APP_ENDPOINT" ]; then
    if [ -z "$PORT" ]; then
        if [ -z "$APP_PORT_8000_TCP_PORT" ]; then
            PORT=8000;
        else
            PORT=$APP_PORT_8000_TCP_PORT;
        fi
    fi

    APP_ENDPOINT="app:$PORT";
fi

sed -i "s/APP_ENDPOINT/$APP_ENDPOINT/g" /etc/nginx/sites-enabled/default;

if [ "$1" = "" ]; then
    exec nginx;
fi

exec "$@";
