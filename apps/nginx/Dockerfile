FROM ubuntu:16.04
MAINTAINER Max Plauth <max.plauth@hpi.de>

ENV NGINX_VERSION 1.8.0
ENV LD_LIBRARY_PATH /usr/local/lib:$LD_LIBRARY_PATH
ENV CONFIG "--conf-path=/data/conf/nginx.conf \
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

RUN mkdir -p /tmp/client-body
RUN mkdir -p /tmp/proxy
RUN mkdir -p /tmp/fastcgi
RUN mkdir -p /tmp/scgi
RUN mkdir -p /tmp/uwsgi

RUN mkdir /tmp/nginx_install
WORKDIR /tmp/nginx_install

RUN apt-get update && apt-get install -y \
        wget \
        build-essential \
        make \
        zlib1g-dev

RUN wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.38.tar.gz
RUN tar xf pcre-8.38.tar.gz && rm pcre-8.38.tar.gz
WORKDIR /tmp/nginx_install/pcre-8.38
RUN ./configure && make install

WORKDIR /tmp/nginx_install
RUN wget http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz
RUN tar xf nginx-$NGINX_VERSION.tar.gz
RUN rm nginx-$NGINX_VERSION.tar.gz
WORKDIR /tmp/nginx_install/nginx-$NGINX_VERSION
RUN ./configure $CONFIG
RUN make install

WORKDIR /data/conf
RUN rm nginx.conf
RUN wget --no-check-certificate "https://www.dcl.hpi.uni-potsdam.de/media/nginx.conf"
RUN mkdir /data/www
WORKDIR /data/www
RUN wget www.hpi.de/favicon.ico


EXPOSE 80

CMD ["/usr/local/nginx/sbin/nginx"]