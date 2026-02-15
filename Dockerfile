# We use PHP 8.2 FPM on Alpine Linux
FROM php:8.2-fpm-alpine

# Install system dependencies needed for PHP extensions and Composer
RUN apk add --no-cache \
    curl \
    libpng-dev \
    libzip-dev \
    zip \
    unzip \
    postgresql-dev

# Install PHP extensions for Laravel and PostgreSQL
RUN docker-php-ext-install pdo_pgsql pgsql zip gd

# Get the latest Composer from the official image
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
