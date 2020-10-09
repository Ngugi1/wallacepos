# Image with apache
FROM php:7.4.3-apache

# Update the OS/container
RUN apt update
# Configure the server and move files
# Make wallacepos.com directory
RUN mkdir -p /var/www/wallacepos.com/public_html && sleep 5;
COPY  . /var/www/wallacepos.com/public_html
# Change ownership
RUN chown -R www-data: /var/www/wallacepos.com
# Copy local project to docker container
# Enable prerequisites
RUN a2enmod proxy_http proxy_wstunnel rewrite
# Copy configuration files
COPY wallacepos.com.conf /etc/apache2/sites-available/
# Create symbolic link to the wallacepos.com.conf
RUN ln -s /etc/apache2/sites-available/wallacepos.com.conf /etc/apache2/sites-enabled/


################################
# Install OS dependencies
# Get docker php extension, msqli, pdo and pdo_mysql

RUN docker-php-ext-install mysqli pdo pdo_mysql

# Install text editor

RUN apt-get install nano

# Install Curl

RUN apt-get install curl

WORKDIR /var/www/wallacepos.com/public_html/
# Install nodejs

RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN npm install socket.io

####################################################
# Installl php dependencies
# Get composer
RUN curl -s https://getcomposer.org/installer | php
# Move to proper directory
RUN mv composer.phar /usr/local/bin/composer
RUN composer install

RUN service apache2 restart
RUN a2enmod proxy_http proxy_wstunnel rewrite
# RUN apt-get install php5-curl php5-gd





