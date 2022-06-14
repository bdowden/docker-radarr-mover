FROM ghcr.io/linuxserver/baseimage-alpine:3.15

# set version label
ARG BUILD_DATE
ARG VERSION
ARG RADARR-MOVER_RELEASE
LABEL build_version="Dowdentech.com version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="bdowden"

# environment settings
ARG RADARR-MOVER_BRANCH="main"
ENV XDG_CONFIG_HOME="/config/xdg"

RUN \
    echo "**** install packages ****" && \
    apk add -U --upgrade --no-cache \
        curl \
        python \
        git && \

    echo "**** install radarr-mover ****" && \
    mkdir -p /app/ && \
    cd /app/ && \
    git clone "https://github.com/bdowden/radarr_mover.git" . && \
    echo "**** installed radarr-mover ****"

    EXPOSE 8781
    VOLUME /config