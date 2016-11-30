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


launch udpping on rumprun on xen:
```
rumprun xen -M 1024 -i -I net1,xenif,script=vif-bridge,bridge=xenbr0,mac=00:16:3e:29:2b:7d -W net1,inet,dhcp —- udpping.bin
rumprun xen -M 1024 -i -I net1,xenif,script=vif-bridge,bridge=xenbr0,mac=00:16:3e:29:2b:7d -W net1,inet,static,192.168.42.170/24,192.168.42.1 —- udpping.bin
```

launch udpping on rumprun on kvm:
```
rumprun kvm -M 1024 -I if,vioif,'-net tap,ifname=tap0,script=/etc/qemu-ifup' -W if,inet,dhcp -- /home/max.plauth/udpping.bin
rumprun kvm -M 1024 -I if,vioif,'-net tap,ifname=tap0,script=/etc/qemu-ifup' -W if,inet,static,192.168.42.170/24,192.168.42.1 -- /home/max.plauth/udpping.bin
```

build udpping for mirage on xen:
```
mirage configure -t xen --dhcp=true --network=0
mirage configure -t xen --ip=192.168.42.170 --gateways=192.168.42.1 --netmask=255.255.255.0 --network=0
```

build static-website for mirage on xen:
```
mirage configure -t xen --ip=192.168.42.235 --gateways=192.168.42.1 --netmask=255.255.255.0 --kv_ro=fat --network=0
```


Application performance
=======================

Nginx
-----
launch nginx on rumprun on xen:
```
rumprun xen -M 1024 -i -I net1,xenif,script=vif-bridge,bridge=xenbr0,mac=00:16:3e:29:2b:7d -W net1,inet,static,192.168.42.235/24,192.168.42.1 -e RUMPRUN_SYSPROXY=tcp://0:12345 -b images/data.iso,/data -- ./nginx.bin -c /data/conf/nginx.conf
```

launch nginx on rumprun on kvm:
```
rumprun kvm -M 128 -I if,vioif,'-net tap,ifname=tap0,script=/etc/qemu-ifup' -W if,inet,dhcp -e RUMPRUN_SYSPROXY=tcp://0:12345 -b images/data.iso,/data -- ./nginx.bin -c /data/conf/nginx.conf
rumprun kvm -M 128 -I if,vioif,'-net tap,ifname=tap0,script=/etc/qemu-ifup' -W if,inet,static,192.168.42.235/24,192.168.42.1 -e RUMPRUN_SYSPROXY=tcp://0:12345 -b images/data.iso,/data -- ./nginx.bin -c /data/conf/nginx.conf
```

Redis
-----
todo

rumprun-bake xen_pv bin/redis-server.bin bin/redis-server

rumprun xen -i -M 192 -I net1,xenif,script=vif-bridge,bridge=xenbr1,mac=00:16:3e:29:2b:7d -W net1,inet,static,192.168.42.235/23,192.168.42.1 -e RUMPRUN_SYSPROXY=tcp://0:12345 -b images/data.iso,/data -b images/datapers.img,/backup -- bin/redis-server.bin /data/conf/redis_custom.conf

kvm
rumprun kvm -i -M 256 -I if,vioif,'-net tap,ifname=tap0,script=/etc/qemu-ifup' -W if,inet,static,192.168.42.235/24,192.168.42.1 -e RUMPRUN_SYSPROXY=tcp://0:12345 -b images/data.iso,/data -b images/datapers.img,/backup -- bin/redis-server.bin /data/conf/redis_custom.conf

install docker:
https://docs.docker.com/engine/installation/linux/ubuntulinux/

docker build -t "udpping" .

docker run -d -p 80:80 nginx

stop all containers:
```docker stop $(docker ps -a -q)```
delete all containers:
```docker rm $(docker ps -a -q)```
delete all images:
```docker rmi $(docker images -q)```


export RUMP_SERVER=tcp://192.168.42.235:12345
sysctl -w proc.0.rlimit.descriptors.soft=200000
sysctl -w proc.0.rlimit.descriptors.hard=200000
sysctl -w proc.1.rlimit.descriptors.soft=200000
sysctl -w proc.1.rlimit.descriptors.hard=200000
sysctl -w proc.2.rlimit.descriptors.hard=200000
sysctl -w proc.2.rlimit.descriptors.soft=200000
rumpctrl_unload



OSv:
apt-get install build-essential libboost-all-dev genromfs autoconf libtool openjdk-8-jdk ant qemu-utils maven libmaven-shade-plugin-java python-dpkt tcpdump gdb qemu-system-x86 gawk gnutls-bin openssl python-requests lib32stdc++-4.9-dev p11-kit

scripts/run.py -nv -m 384M -c 1 -e "--ip=eth0,192.168.42.235,255.255.254.0 \
--defaultgw=192.168.42.1 --nameserver=192.168.42.2 `cat build/release/cmdline`"
