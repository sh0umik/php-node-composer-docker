FROM php:7-fpm

# Install node.js for api docs
RUN  curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
        apt-get install -y nodejs \
        && apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install composer
RUN /usr/bin/curl -sS https://getcomposer.org/installer | /usr/local/bin/php
RUN /bin/mv composer.phar /usr/local/bin/composer

#Install Docker
RUN curl -fsSL https://get.docker.com/ | sh

RUN php -v
RUN node -v
RUN docker -v