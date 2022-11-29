FROM debian:stable

LABEL maintainer="Max Karou <makarou@hotmail.com>"

SHELL ["/bin/bash", "-c"]

RUN apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    dnsutils \
    dumb-init \
    gettext \
    gnupg2 \
    jq \
    libgmp10 \
    libgomp1 \
    libssl1.1 \
    libpq-dev \
    procps \
    python3 \
    tzdata && \
    rm -rf /var/lib/apt/lists/* && \
    echo "deb [trusted=yes] http://packages.o1test.net bullseye stable" | tee /etc/apt/sources.list.d/mina.list && \
    apt-get -y update && \
    apt-get install -y curl unzip mina-mainnet=1.3.1.2-25388a0 && \
    apt-get install -y mina-mainnet=1.3.1.2-25388a0

STOPSIGNAL SIGINT


ENTRYPOINT []