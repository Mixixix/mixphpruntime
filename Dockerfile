FROM daocloud.io/library/php:5.6.9-apache
MAINTAINER Mixixix <wutingou@gmail.com>
RUN apt-get update \
&& apt-get -y install \
curl \
wget \
php5-mysql \
php5-sqlite \
php5-gd \
php5-curl \
&& apt-get clean \
&& apt-get autoclean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \