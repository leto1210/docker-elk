ARG ELK_VERSION

# https://github.com/elastic/elasticsearch-docker
FROM amazon/opendistro-for-elasticsearch:${DISTRO_VERSION}

# Add your elasticsearch plugins setup here
# Example: RUN elasticsearch-plugin install analysis-icu

# Add healthcheck
COPY docker-healthcheck /usr/local/bin/
RUN ["chmod", "+x", "/usr/local/bin/docker-healthcheck"]
HEALTHCHECK CMD ["docker-healthcheck"]
