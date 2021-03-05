FROM ubuntu:20.04

# System - toto by mohlo byt vo zvlast image
RUN apt-get update && apt-get install -y wget

ARG TAR_PATH='https://github.com/ModelioOpenSource/Modelio/releases/download/v4.1.0/Modelio.4.1.0.-.Linux.tar.gz'

RUN mkdir -p /home/modelio && \
    wget -nv --show-progress --progress=bar:force:noscroll -O modelio.tar.gz ${TAR_PATH} && \
    tar -zxvf modelio.tar.gz -C /home/modelio/ && \
    rm -rf modelio.tar.gz

RUN apt-get update && apt-get install -y openjdk-14-jdk openjdk-14-jre
RUN echo "deb http://cz.archive.ubuntu.com/ubuntu bionic main universe" >> /etc/apt/sources.list && apt-get update
RUN export DEBIAN_FRONTEND=noninteractive && apt-get install -y -q libwebkitgtk-1.0-0

ENV HOME=/home/modelio