FROM daocloud.io/library/php:5.6.9-apache
MAINTAINER Mixixix <wutingou@gmail.com>
ADD php.ini    /usr/local/etc/php/php.ini
RUN /usr/local/bin/docker-php-ext-install mysqli mbstring