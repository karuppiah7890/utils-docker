FROM alpine:3.9

WORKDIR /opt
ARG JQ_VERSION=1.6
ARG STOLON_VERSION=0.12.0

RUN apk --no-cache add curl ngrep postgresql-client mysql-client redis httpie

ADD https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/jq-linux64 /usr/local/bin/jq
RUN chmod +x /usr/local/bin/jq

ADD https://github.com/sorintlab/stolon/releases/download/v$STOLON_VERSION/stolon-v$STOLON_VERSION-linux-amd64.tar.gz /opt/
RUN tar -C . -xvf stolon-v$STOLON_VERSION-linux-amd64.tar.gz stolon-v$STOLON_VERSION-linux-amd64/bin/stolonctl && \
    mv /opt/stolon-v$STOLON_VERSION-linux-amd64/bin/stolonctl /usr/local/bin/ && \
    rm -rf stolon-v$STOLON_VERSION-linux-amd64.tar.gz /opt/stolon-v$STOLON_VERSION-linux-amd64/