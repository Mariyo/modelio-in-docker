#!/usr/bin/env bash

# directory where this script is located
cd "$(dirname "$0")" || exit

case "$OSTYPE" in
    darwin*)
        DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
        xhost + 127.0.0.1
    ;; 
    linux*)
        # WSL
        if grep -qi Microsoft /proc/version; then
            DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
        else
            DISPLAY=:0
        fi
        
        xhost +
    ;;
    *)
        echo "unsupported: $OSTYPE"
        exit
    ;;
esac

# zbuildujem lokalny image s HOST userom ako modelio user
docker build --build-arg UID="$(id -u)" --build-arg GID="$(id -g)" -t modelio:4.1.0 .

docker run \
    -it --rm \
    -e DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v "$(pwd)"/workspace:/home/modelio/modelio/workspace:z \
    -v "$(pwd)"/.modelio:/home/modelio/.modelio:z \
    --net=host --ipc=host \
    --user "$(id -u)":"$(id -g)" \
    modelio:4.1.0