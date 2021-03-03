FROM ubuntu:20.04

# System - toto by mohlo byt vo zvlast image
RUN apt-get update && apt-get install -y wget

ARG TAR_PATH='https://github.com/ModelioOpenSource/Modelio/releases/download/v4.1.0/Modelio.4.1.0.-.Linux.tar.gz'

RUN mkdir -p /home/modelio && \
    wget -nv --show-progress --progress=bar:force:noscroll -O modelio.tar.gz ${TAR_PATH} && \
    tar -zxvf modelio.tar.gz -C /home/modelio/ && \
    rm -rf modelio.tar.gz

RUN apt-get update && apt-get install -y openjdk-8-jdk openjdk-8-jre

ENV HOME=/home/modelio
ENV SWT_WEBKIT2=1
