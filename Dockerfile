FROM php:7-jessie

# Install node.js for api docs
RUN  curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
        apt-get install -y nodejs \
        && apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Composer
RUN curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#Install Docker
RUN curl -fsSL https://get.docker.com/ | sh

RUN php -v
RUN node -v
RUN docker -v