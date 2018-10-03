FROM debian
MAINTAINER Jonas Su <jonas@25sprout.com>

RUN apt-get -qq update \
    && apt-get -qqy upgrade \
    && apt-get install -qqy openssh-client git zip unzip \
    && apt-get clean

RUN apt-get -qq update \
    && apt-get -qqy upgrade \
    && apt-get install -qqy wget curl jq libxml2-utils \
    && apt-get clean
