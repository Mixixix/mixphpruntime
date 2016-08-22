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
&& apt -y install libfreetype6 libfreetype6-dev sudo wget
WORKDIR /var/cp/pdf2json
RUN bash configure \
&& make \
&& make install
WORKDIR /var/cp/swftools/lib/pdf
RUN wget ftp://ftp.foolabs.com/pub/xpdf/xpdfbin-linux-3.04.tar.gz
WORKDIR /var/cp/swftools
RUN bash configure \
&& make \
&& make install