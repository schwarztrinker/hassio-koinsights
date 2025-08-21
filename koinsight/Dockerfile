ARG BUILD_FROM=ghcr.io/georgesg/koinsight:v0.1.2
FROM $BUILD_FROM

# Install bashio for Home Assistant add-on integration
RUN apk add --no-cache bash curl jq

# Copy run script
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
