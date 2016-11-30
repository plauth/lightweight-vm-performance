FROM ubuntu:16.04
MAINTAINER Max Plauth <max.plauth@hpi.de>

RUN mkdir /tmp/redis_install
WORKDIR /tmp/redis_install

RUN apt-get update && apt-get install -y \
        wget \
        build-essential

RUN wget http://download.redis.io/releases/redis-3.0.7.tar.gz
RUN tar xf redis-3.0.7.tar.gz && rm redis-3.0.7.tar.gz
WORKDIR /tmp/redis_install/redis-3.0.7
RUN make install

RUN mkdir -p /data/conf
WORKDIR /data/conf
RUN wget --no-check-certificate "https://raw.githubusercontent.com/plauth/lightweight-vm-performance/master/apps/redis/generic/redis_custom.conf"

EXPOSE 6379

CMD ["/usr/local/bin/redis-server", "/data/conf/redis_custom.conf"]