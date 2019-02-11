FROM registry.hub.docker.com/library/alpine:3.7

ENV ELK_ALERT=V0.1.38.zip
ENV ELASTALERT_URL https://github.com/Yelp/elastalert/archive/${ELK_ALERT}

WORKDIR /opt

# Install software required for Elastalert and NTP for time synchronization.
RUN apk update && \
    apk upgrade && \
    apk add ca-certificates openssl-dev openssl libffi-dev python2 python2-dev py2-pip py2-yaml gcc musl-dev tzdata openntpd wget

RUN wget -O elastalert.zip "${ELASTALERT_URL}" && \
#RUN wget -O elastalert.zip "https://github.com/Yelp/elastalert/archive/${ELK_ALERT}.zip" && \
    unzip elastalert.zip && \
    rm elastalert.zip && \
    mv e* /opt/elastalert && \
    cd /opt/elastalert && \
    python setup.py install && \
    pip install -e . && \
    pip uninstall twilio --yes && \
    pip install twilio==6.0.0 && \
    easy_install supervisor

RUN mkdir -p /opt/config && \
    mkdir -p /opt/rules && \
    mkdir -p /opt/logs && \
    mkdir -p /var/empty

RUN apk del python2-dev && \
    apk del musl-dev && \
    apk del gcc && \
    apk del openssl-dev && \
    apk del libffi-dev && \
    rm -rf /var/cache/apk/*

WORKDIR /opt/elastalert

COPY config/* /opt/config/
COPY rules/* /opt/rules
COPY docker-entrypoint.sh /opt/entrypoint.sh

# Make the start-script executable.
RUN chmod +x /opt/entrypoint.sh

# Launch Elastalert when a container is started.
CMD ["/opt/entrypoint.sh"]
