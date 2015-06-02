# Nginx-Proxy

This is a simple docker image that sets up Nginx to proxy to a linked container or a host and port set in an environment variable. It defaults to proxy requests to port 8000 on the app container.

Simply link to a container

    docker run --link=yourcontainer:app --publish=80:80 simonluijk/nginx-proxy

Link to a container but use a custom port

    docker run --link=yourcontainer:app --env=PORT=9000 --publish=80:80 simonluijk/nginx-proxy

Set custom proxy endpoint

    docker run --env=APP_ENDPOINT=192.168.1.123:8000 --publish=80:80 simonluijk/nginx-proxy
