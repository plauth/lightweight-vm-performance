#!/bin/bash
apt-get update
apt-get -y install wget build-essential make zlib1g-dev

NGINX_CONF_OPTS="--conf-path=/data/conf/nginx.conf \
	--pid-path=/tmp/nginx.pid \
	--lock-path=/tmp/nginx.lock \
	--error-log-path=/tmp/error.log \
	--http-log-path=/tmp/access.log \
	--http-client-body-temp-path=/tmp/client-body \
	--http-proxy-temp-path=/tmp/proxy \
	--http-fastcgi-temp-path=/tmp/fastcgi \
	--http-scgi-temp-path=/tmp/scgi \
	--http-uwsgi-temp-path=/tmp/uwsgi \
	--with-pcre"

mkdir -p /tmp/client-body
mkdir -p /tmp/proxy
mkdir -p /tmp/fastcgi
mkdir -p /tmp/scgi
mkdir -p /tmp/uwsgi

mkdir /tmp/nginx_install
cd /tmp/nginx_install

wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.38.tar.gz
tar xf pcre-8.38.tar.gz && rm pcre-8.38.tar.gz
cd /tmp/nginx_install/pcre-8.38
./configure && make install

cd /tmp/nginx_install
wget http://nginx.org/download/nginx-1.8.0.tar.gz
tar xf nginx-1.8.0.tar.gz && rm nginx-1.8.0.tar.gz
cd /tmp/nginx_install/nginx-1.8.0
./configure ${NGINX_CONF_OPTS}
make install

cd /data/conf
rm nginx.conf
wget --no-check-certificate "https://raw.githubusercontent.com/plauth/lightweight-vm-performance/master/apps/nginx/generic/nginx.conf"
mkdir /data/www
cd /data/www
wget "www.hpi.de/favicon.ico"

wget --no-check-certificate "https://raw.githubusercontent.com/plauth/lightweight-vm-performance/master/apps/nginx/generic/nginx.service"
mv nginx.service /etc/systemd/system/nginx.service
systemctl enable nginx.service
exit
