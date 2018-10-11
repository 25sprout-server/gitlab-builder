FROM debian:stretch
MAINTAINER Jonas Su <jonas@25sprout.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update \
    && apt-get -qqy upgrade \
    && apt-get install -qqy openssh-client zip unzip screen \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists

RUN apt-get -qq update \
    && apt-get -qqy upgrade \
    && apt-get install -qqy wget curl git rsync \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists

RUN apt-get -qq update \
    && apt-get -qqy upgrade \
    && apt-get install -qqy jq libxml2-utils \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists

RUN apt-get -qq update \
    && apt-get -qqy install \
    apt-utils apt-transport-https lsb-release ca-certificates gnupg \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists
