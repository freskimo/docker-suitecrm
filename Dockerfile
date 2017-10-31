FROM php:7.1-apache

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y libcurl4-gnutls-dev libpng-dev libssl-dev libc-client2007e-dev libkrb5-dev unzip mysql-client curl && \
    docker-php-ext-configure imap --with-imap-ssl --with-kerberos && \
    docker-php-ext-install mysqli curl gd zip mbstring imap && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

ADD app /var/www/html
ADD config_si.php /
ADD docker-entrypoint.sh /

RUN chmod 777 -R /var/www/html
RUN echo "upload_max_filesize = 25M" > /usr/local/etc/php/php.ini

EXPOSE 80
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["apache2-foreground"]
