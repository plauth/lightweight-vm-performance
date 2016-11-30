#!/bin/bash
apt-get update
apt-get -y install wget build-essential make

mkdir /tmp/redis_install
cd /tmp/redis_install

wget http://download.redis.io/releases/redis-3.0.7.tar.gz
tar xf redis-3.0.7.tar.gz && rm redis-3.0.7.tar.gz
cd /tmp/redis_install/redis-3.0.7/
make install

mkdir -p /data/conf
cd /data/conf
wget --no-check-certificate "https://raw.githubusercontent.com/plauth/lightweight-vm-performance/master/apps/redis/generic/redis_custom.conf"

wget --no-check-certificate "https://raw.githubusercontent.com/plauth/lightweight-vm-performance/master/apps/redis/generic/redis.service"
mv redis.service /etc/systemd/system/redis.service
systemctl enable redis.service
exit
