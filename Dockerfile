FROM debian:stable

ARG BUILD_DATE
ARG VERSION
ARG UNIFI_VERSION
LABEL build_version="mgrusso v: ${VERSION} Build-date: ${BUILD_DATE}" 
LABEL maintainer "mgrusso"

ARG UNIFI_BRANCH="stable"
ARG DEBIAN_FRONTEND="noninteractive"

RUN \
  echo "Install packages" && \
  apt-get update && \
  apt-get install -y \
    binutils jsvc libcap2 logrotate mongodb-server openjdk-8-jre-headless \
    wget && \
  echo "Install UNIFI" && \
  if [ -z ${UNIFI_VERSION+x} ]; then \
    UNIFI_VERSION=$(curl -sX GET http://dl-origin.ubnt.com/unifi/debian/dists/${UNIFI_BRANCH}/ubiquiti/binary-amd64/Packages \
    |grep -A 7 -m 1 'Package: unifi' \
    | awk -F ': ' '/Version/{print $2;exit}' \
    | awk -F '-' '{print $1}'); \
  fi && \
  curl -o \
  /tmp/unifi.deb -L \
    "https://dl.ui.com/unifi/${UNIFI_VERSION}/unifi_sysvinit_all.deb" && \
  dpkg -i /tmp/unifi.deb && \
  echo "Cleanup" && \
  apt-get clean && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

COPY root/ /

WORKDIR /usr/lib/unifi
VOLUME /config
EXPOSE 8080 8443 8843 8880
