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
see `create_image.sh`

Benchmark
=========
see `timer_docker.py`