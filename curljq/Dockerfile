FROM 25sprout/gitlab-builder:basic
MAINTAINER Jonas Su <jonas@25sprout.com>

RUN apt-get -qq update \
    && apt-get -qqy upgrade \
    && apt-get install -qqy curl jq libxml2-utils \
    && apt-get clean
