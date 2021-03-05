FROM mariyo/modelio:4.1.0-v2

ARG UID=50000
ARG GID=50000

RUN if [ ${UID:-0} -ne 0 ] && [ ${GID:-0} -ne 0 ]; then \
        groupadd -g ${GID} modelio && \
        useradd -l -u ${UID} -g modelio modelio && \
        chown ${UID}:${GID} -R /home/modelio \
    ;fi

USER modelio

ENV HOME=/home/modelio

CMD /home/modelio/'Modelio 4.1'/modelio