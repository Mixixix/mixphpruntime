FROM php:5.6.9-apache
MAINTAINER TingouWu <wutingou@gmail.com>
ADD php.ini    /usr/local/etc/php/php.ini
ADD cp /var/cp
RUN echo “Asia/shanghai” >> /etc/timezone \
&& /usr/local/bin/docker-php-ext-install mysqli mbstring \
&& apt update \
&& apt install -y swftools \
&& apt-get clean \
&& apt-get autoclean
WORKDIR /var/cp/jpeg
RUN bash configure \
&& make \
&& make install
WORKDIR /var/cp/freetype
RUN bash configure \
&& make \
&& make install