FROM ghcr.io/linuxserver/baseimage-ubuntu:focal

# set version label
ARG BUILD_DATE
ARG VERSION
ARG RADARR-MOVER_RELEASE
LABEL build_version="Dowdentech.com version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="bdowden"

# environment settings
ARG DEBIAN_FRONTEND="noninteractive"
ENV XDG_DATA_HOME="/config" \
XDG_CONFIG_HOME="/config"

RUN \
    echo "**** install packages ****" && \
    apt-get update && \
    apt-get install -y \
        python-is-python3 \
        pip \
        git && \

    echo "**** install radarr-mover ****" && \
    mkdir -p /mover/ && \
    cd /mover/ && \
    git clone https://github.com/bdowden/radarr_mover.git . && \
    pip install -r requirements.txt && \
    echo "**** installed radarr-mover ****" && \
    echo "**** Starting mover API ****" && \
    cd app

    EXPOSE 8781
    VOLUME /config