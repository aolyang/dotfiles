#!/usr/bin/env bash

# if first argument is none, unset proxy
if [ "$1" = "none" ]; then
    unset http_proxy
    unset https_proxy
    echo "Proxy removed"
    exit 0
fi

PROTOCOL="http"
HOST="127.0.0.1"
PORT="7890"

# protocol(optional), http is default: http, https, socks5: -p, --protocol
# host(optional), 127.0.0.1: -h, --host
# port(optional), 7890: --port

usage() {
    echo "Usage: $0 [-p protocol] [-h host] [-p port] none|default"
}

if [ $# == 0 ]; then
    usage
    exit 1
fi

ARGS=`getopt -o p:h:p: --long protocol:,host:,port: -n "$0" -- "$@"`
eval set -- "$ARGS"

while true; do
    case "$1" in
        -p|--protocol)
            PROTOCOL="$2"
            shift 2
            ;;
        -h|--host)
            HOST="$2"
            shift 2
            ;;
        -p|--port)
            PORT="$2"
            shift 2
            ;;
        --)
            shift
            break
            ;;
        *)
            echo "Internal error!"
            exit 1
            ;;
    esac
done

export http_proxy="$PROTOCOL://$HOST:$PORT"
export https_proxy="$PROTOCOL://$HOST:$PORT"
echo "Proxy set to $http_proxy"
