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
lxc launch redis redis
iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 6379 -j DNAT --to-destination [IP_OF_CONTAINER]:6379
```

Stop
====
```sh
iptables -t nat -D PREROUTING -p tcp -i eth0 --dport 6379 -j DNAT --to-destination [IP_OF_CONTAINER]:6379
lxc stop redis
lxc delete redis
```

Benchmark
=========
```sh
redis-benchmark -h [IP_OF_TARGET_HOST] -c [1-1000] -n 100000 -k 1 -t set,get
```