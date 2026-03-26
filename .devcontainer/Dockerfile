FROM php:8.2-apache

# Install PHP extensions and basic tools
RUN apt-get update && apt-get install -y     mariadb-client     curl     nano     iputils-ping     net-tools     && docker-php-ext-install mysqli     && rm -rf /var/lib/apt/lists/*

# Enable Apache mod_rewrite (commonly used for web apps)
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html
