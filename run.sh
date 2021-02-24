#!/usr/bin/env bash

# directory where this script is located
cd "$(dirname "$0")" || exit

if grep -qi Linux /proc/version; then
    export DISPLAY=:0
else
    export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
fi

xhost +

docker run \
    -it --rm \
    -e DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $(pwd)/workspace:/home/developer/modelio/workspace:z \
    -v $(pwd)/.modelio:/home/developer/.modelio:z \
    --net=host --ipc=host \
    mariyo/modelio:4.1.0