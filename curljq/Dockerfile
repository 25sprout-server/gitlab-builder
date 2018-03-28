FROM tutum/curl
MAINTAINER Jonas Su <jonas@25sprout.com>

RUN apt-get -qq update \
    && apt-get -qqy upgrade \
    && apt-get install -qqy jq openssh-client \
    && apt-get clean
