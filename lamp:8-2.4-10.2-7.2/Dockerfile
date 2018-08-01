FROM mariadb:10.2
MAINTAINER Jonas Su <jonas@25sprout.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update && \
    apt-get -qqy install \
    apt-utils wget curl screen unzip jq && \
    apt-get clean && \
    apt-get autoclean  && \
    rm -rf /var/lib/apt/lists

RUN apt-get -qq update && \
    apt-get -qqy install \
    apache2 && \
    a2dismod -f autoindex && \
    a2enmod ssl && \
    a2enmod rewrite && \
    a2enmod headers

RUN apt-get -qqy install apt-transport-https lsb-release ca-certificates && \
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list && \
    apt-get -qq update && \
    apt-get -qqy install \
    php7.2 php7.2-cli php7.2-common php7.2-curl php7.2-gd php7.2-json php7.2-mbstring php7.2-mysql php7.2-xml php7.2-xsl php7.2-zip php7.2-bcmath && \
    apt-get clean && \
    apt-get autoclean  && \
    rm -rf /var/lib/apt/lists && \
    phpenmod mysqli && \
    phpenmod json && \
    phpenmod gd

RUN ln -sf /dev/stdout /var/log/apache2/access.log && \
    ln -sf /dev/stderr /var/log/apache2/error.log

COPY execute-lamp.sh /usr/local/bin/

# Expose apache.
EXPOSE 80 3306

CMD ["execute-lamp.sh"]
