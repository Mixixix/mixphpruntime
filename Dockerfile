FROM php:5.6.9-apache
MAINTAINER TingouWu <wutingou@gmail.com>
ADD php.ini    /usr/local/etc/php/php.ini
ADD cp /var/cp
RUN echo “Asia/shanghai” >> /etc/timezone \
&& /usr/local/bin/docker-php-ext-install mysqli mbstring
RUN apt update \
&& apt -y install libfreetype6 libfreetype6-dev zlib1g-dev sudo wget xPDF libjpeg-dev build-essential \
&& apt -y install swftools
WORKDIR /var/cp/pdf2json
RUN bash configure \
&& make \
&& make install
WORKDIR /var/www/html