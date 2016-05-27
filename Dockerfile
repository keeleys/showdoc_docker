FROM php:5.6-apache
COPY showdoc/ /var/www/html/

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
    && docker-php-ext-install -j$(nproc) gd

RUN chmod 777 Application/Runtime \
	&& chmod 777 Public/Uploads \
	&& chmod 777 Sqlite \
	&& chmod 777 Sqlite/showdoc.db.php
CMD ["apache2-foreground"]
