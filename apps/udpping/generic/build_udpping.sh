#!/bin/sh
apt update && apt install -y wget build-essential make
wget --no-check-certificate "https://raw.githubusercontent.com/plauth/lightweight-vm-performance/master/apps/udpping/generic/udpping.c"
cc -DSERVER=\"192.168.42.42\" udpping.c -o udpping
mv udpping /opt/

wget --no-check-certificate "https://raw.githubusercontent.com/plauth/lightweight-vm-performance/master/apps/udpping/generic/udpping.service"
mv udpping.service /etc/systemd/system/udpping.service
systemctl enable udpping.service
exit

