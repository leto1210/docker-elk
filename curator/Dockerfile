FROM python

ARG https_proxy

ENV ES_HOST=es
ENV CONFIG_FILE=curator.yml

RUN mkdir -p /app
RUN mkdir -p /app/actions
RUN mkdir -p /app/conf

RUN pip install elasticsearch-curator

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

WORKDIR /app/actions

CMD ["curator-job"]
