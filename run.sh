#!/usr/bin/env bash

# directory where this script is located
cd "$(dirname "$0")" || exit

xhost + 127.0.0.1

docker run \
    -it --rm -e DISPLAY=host.docker.internal:0 \
    -v $(pwd)/workspace:/home/developer/modelio/workspace:z \
    -v $(pwd)/.modelio:/home/developer/.modelio:z \
    --net=host --ipc=host \
    mariyo/modelio:4.1.0