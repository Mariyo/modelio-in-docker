FROM ubuntu:20.04

ARG USER_ID=1000
ARG GROUP_ID=1000

# System
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get install -y openjdk-11-jdk openjdk-11-jre

RUN mkdir -p /home/developer && \
    if [ ${USER_ID:-0} -ne 0 ] && [ ${GROUP_ID:-0} -ne 0 ]; then \
        groupadd -g ${GROUP_ID} developer && \
        useradd -l -u ${USER_ID} -g developer developer \
    ;fi && \
    chown ${USER_ID}:${GROUP_ID} -R /home/developer

RUN cd /home/developer && \
    wget -nv --show-progress --progress=bar:force:noscroll -O modelio.tar.gz https://github.com/ModelioOpenSource/Modelio/releases/download/v4.1.0/Modelio.4.1.0.-.Linux.tar.gz && \
    tar -zxvf modelio.tar.gz -C /home/developer/ && rm -rf modelio.tar.gz

RUN chown ${USER_ID}:${GROUP_ID} -R /home/developer

USER developer
ENV HOME /home/developer

CMD /home/developer/Modelio\ 4.1/modelio