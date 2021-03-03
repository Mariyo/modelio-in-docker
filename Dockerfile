FROM mariyo/modelio:4.1.0

ARG UID=1000
ARG GID=1000

RUN mkdir -p /home/modelio && \
    if [ ${UID:-0} -ne 0 ] && [ ${GID:-0} -ne 0 ]; then \
        groupadd -g ${GID} modelio && \
        useradd -l -u ${UID} -g modelio modelio \
    ;fi && \
    chown ${UID}:${GID} -R /home/modelio

USER modelio

ENV HOME=/home/modelio

CMD /home/modelio/'Modelio 4.1'/modelio