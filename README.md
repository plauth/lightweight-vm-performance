# lightweight-vm-performance

Startup time measurement
========================

xen tuning:
/etc/default/grub:
```
GRUB_CMDLINE_XEN_DEFAULT="dom0_mem=4096M,max:4096M"
```
/etc/xen/xl.conf
```
autoballoon=0
```
then update-grub and reboot


build static-website for mirage on xen:
```
mirage configure -t xen --ip=192.168.42.235 --gateways=192.168.42.1 --netmask=255.255.255.0 --kv_ro=fat --network=0
```


Application performance
=======================
Redis
-----


stop all containers:
```docker stop $(docker ps -a -q)```
delete all containers:
```docker rm $(docker ps -a -q)```
delete all images:
```docker rmi $(docker images -q)```




OSv:
apt-get install build-essential libboost-all-dev genromfs autoconf libtool openjdk-8-jdk ant qemu-utils maven libmaven-shade-plugin-java python-dpkt tcpdump gdb qemu-system-x86 gawk gnutls-bin openssl python-requests lib32stdc++-4.9-dev p11-kit

scripts/run.py -nv -m 384M -c 1 -e "--ip=eth0,192.168.42.235,255.255.254.0 \
--defaultgw=192.168.42.1 --nameserver=192.168.42.2 `cat build/release/cmdline`"
