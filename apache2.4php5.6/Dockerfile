FROM 25sprout/gitlab-builder:basic
MAINTAINER Jonas Su <jonas@25sprout.com>

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
    php5.6 php5.6-cli php5.6-common php5.6-curl php5.6-gd php5.6-json php5.6-mbstring php5.6-mysql php5.6-xml php5.6-xsl php5.6-zip php5.6-bcmath && \
    apt-get clean && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists && \
    phpenmod mysqli && \
    phpenmod json && \
    phpenmod gd

RUN ln -sf /dev/stdout /var/log/apache2/access.log && \
    ln -sf /dev/stderr /var/log/apache2/error.log

RUN usermod -u 1000 www-data
RUN usermod -G 1000 www-data

# Expose apache.
EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
