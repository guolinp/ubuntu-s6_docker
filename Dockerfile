FROM ubuntu:18.04
MAINTAINER "Pan Guolin"

ARG S6_OVERLAY_VERSION=1.21.4.0

VOLUME /work

RUN apt-get clean && apt-get update -y --fix-missing

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget && \
    cd /tmp && \
    wget https://github.com/just-containers/s6-overlay/releases/download/v$S6_OVERLAY_VERSION/s6-overlay-amd64.tar.gz && \
    tar xzf s6-overlay-amd64.tar.gz -C / && \
    rm s6-overlay-amd64.tar.gz

# slim down image
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man/?? /usr/share/man/??_*

ENTRYPOINT ["/init"]
