Prerequisites
=============
Docker has to be installed. For instructions, please refer to https://docs.docker.com/engine/installation/linux/ubuntulinux/

Setup
=====
```sh
docker build -t "nginx" .
```

Start
=====
```sh
docker run -d -p 80:80 nginx
```

Stop
====
```sh
docker stop nginx
```

Benchmark
=========
```sh
gcc -O2 ../generic/ab.c -o abc -lpthread
./abc [0-1k:100kA+100x30] [IP_OF_TARGET_HOST]/favicon.ico
```