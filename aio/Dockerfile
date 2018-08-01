FROM debian:stretch
MAINTAINER Jonas Su <jonas@25sprout.com>

RUN apt-get -qq update \
    && apt-get -qqy upgrade \
    && apt-get install -qqy curl gnupg gnupg2 gnupg1 \
    && apt-get clean

# Install Node 8.x
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -qqy nodejs \
    && apt-get clean

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb http://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
    && apt-get -qq update \
    && apt-get -qqy upgrade \
    && apt-get install -qqy yarn \
    && apt-get clean

# # Install PHP7.1 and Laravel5.5
# RUN apt-get install -qqy apt-transport-https lsb-release ca-certificates git \
#     && wget -O /etc/apt/trusted.gpg.d/ https://packages.sury.org/php/apt.gpg \
#     && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list \
#     && apt-get -qq update \
#     && apt-get install -qqy php7.1 php7.1-cli php7.1-common php7.1-curl php7.1-gd php7.1-json php7.1-mbstring php7.1-mcrypt php7.1-mysql php7.1-xml php7.1-xsl php7.1-zip \
#     && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
#     && php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
#     && php composer-setup.php \
#     && php -r "unlink('composer-setup.php');" \
#     && mv composer.phar /usr/local/bin/composer \
#     && git clone https://github.com/laravel/laravel.git \
#     && 


# Install Python-pip and AWS CLI
RUN apt-get install -qqy python-pip \
    && apt-get clean \
    && pip install --upgrade --user awscli \
    && export PATH=/root/.local/bin:$PATH \
    && mkdir -p /root/.aws

# Install format tools
RUN apt-get -qq update \
    && apt-get -qqy upgrade \
    && apt-get install -qqy \
    libxml2-utils \
    jq \
    && apt-get clean

# Install other tools
RUN apt-get install -qqy \
    openssh-client \
    lftp \
    mysql-client \
    zip unzip \
    && apt-get clean

# Install npm packages
RUN npm install -g ajv-cli
