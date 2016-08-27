FROM php:5.6.9-apache
MAINTAINER TingouWu <wutingou@gmail.com>
ADD php.ini    /usr/local/etc/php/php.ini
ADD phpredis    /var/phpredis
RUN echo “Asia/shanghai” >> /etc/timezone \
&& /usr/local/bin/docker-php-ext-install mysqli mbstring