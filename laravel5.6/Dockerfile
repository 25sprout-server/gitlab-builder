FROM 25sprout/apache-php:2.4-7.2
MAINTAINER Jonas Su <jonas@25sprout.com>

ENV DEBIAN_FRONTEND noninteractive

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer && \
    composer global require "laravel/installer"

RUN composer global require "laravel/installer" && \
    ln -s /root/.config/composer/vendor/bin/laravel /usr/local/bin

# Expose apache.
EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
