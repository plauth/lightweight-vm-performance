#!/bin/sh
apt update && apt install -y wget build-essential make
wget --no-check-certificate "https://raw.githubusercontent.com/plauth/lightweight-vm-performance/master/apps/udpping/generic/udpping_infinite.c"
cc -DSERVER=\"127.0.0.1\" udpping.c -o udpping
mv udpping /opt/

wget --no-check-certificate "https://raw.githubusercontent.com/plauth/lightweight-vm-performance/master/apps/udpping/generic/udpping.service"
mv udpping.service /etc/systemd/system/udpping.service
systemctl enable udpping.service
exit

