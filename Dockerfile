FROM php:5.6.9-apache
MAINTAINER TingouWu <wutingou@gmail.com>
ADD php.ini    /usr/local/etc/php/php.ini
ADD cp /var/cp
RUN echo “Asia/shanghai” >> /etc/timezone \
&& /usr/local/bin/docker-php-ext-install mysqli mbstring
WORKDIR /var/cp/jpeg
RUN bash configure \
&& make \
&& make install
WORKDIR /var/cp/zlib
RUN bash configure \
&& make \
&& make install \
&& apt update \
&& apt -y install swftools
WORKDIR /var/cp/swftools
RUN bash configure --prefix=/usr/swftools \
&& make \
&& make install