FROM php:7-jessie

ADD php.ini /usr/local/etc/php/
# Install node.js for api docs
RUN  curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
        apt-get install -y zip unzip automake nodejs git libreadline-dev \
        && apt-get -y autoremove dh-autoreconf libpng-dev autoconf automake make g++ libtool nasm \
        && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install pngquant-bin
RUN npm install pngquant-bin

# Install Composer
RUN curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#Install Docker
RUN curl -fsSL https://get.docker.com/ | sh

RUN php -v
RUN node -v
RUN docker -v