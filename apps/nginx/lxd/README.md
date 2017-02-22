Prerequisites
=============
```sh
sudo apt install lxd
sudo dpkg-reconfigure -p medium lxd
sudo lxd init
sudo service lxd-bridge stop && sudo service lxd restart
```

Setup
=====
See `create_image.sh`

Start
=====
```sh
lxc launch nginx nginx
iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 80 -j DNAT --to-destination [IP_OF_CONTAINER]:80
```

Stop
====
```sh
iptables -t nat -D PREROUTING -p tcp -i eth0 --dport 80 -j DNAT --to-destination [IP_OF_CONTAINER]:80
lxc stop nginx
lxc delete nginx
```

Benchmark
=========
```sh
gcc -O2 ../generic/ab.c -o abc -lpthread
./abc [0-1k:100kA+100x30] [IP_OF_TARGET_HOST]/favicon.ico
```