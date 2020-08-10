#!/bin/sh

cd $(dirname $0)
case "$1" in
    server)
    exec /home/docker/data/bin/python mozhttp3server/server.py
    ;;

    *)
        echo "Unknown CMD, $1"
        exit 1
        ;;
esac
