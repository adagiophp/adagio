FROM php:8.0
LABEL Name=adagio Version=0.0.1

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN apt-get update \
    && apt-get install -y \
        libzip-dev \
        zip \
    && docker-php-ext-install zip

WORKDIR /app

CMD ["php", "-S", "0.0.0.0:8000", "-t", "public/"]