FROM debian:stretch
MAINTAINER Jonas Su <jonas@25sprout.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update \
    && apt-get -qqy install \
    apt-utils apt-transport-https wget gnupg curl screen zip unzip jq libxml2-utils rsync openssh-client \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list

RUN apt-get -qq update \
    && apt-get -qqy install \
    yarn \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists

RUN apt-get -qq update \
    && apt-get -qqy install apache2 \
    && a2dismod -f autoindex \
    && a2enmod ssl \
    && a2enmod rewrite \
    && a2enmod headers

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

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer && \
    composer global require "laravel/installer"

RUN composer global require "laravel/installer" && \
    ln -s /root/.composer/vendor/laravel/installer/laravel /usr/local/bin

RUN usermod -u 1000 www-data
RUN usermod -G 1000 www-data

RUN ln -sf /dev/stdout /var/log/apache2/access.log && \
    ln -sf /dev/stderr /var/log/apache2/error.log

# Expose apache.
EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
