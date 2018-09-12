FROM debian
MAINTAINER Jonas Su <jonas@25sprout.com>

RUN apt-get -qq update \
    && apt-get -qqy upgrade \
    && apt-get install -qqy curl jq openssh-client libxml2-utils \
    && apt-get clean

RUN apt-get -qq update \
    && apt-get -qqy upgrade \
    && apt-get install -qqy mysql-client \
    && apt-get clean
