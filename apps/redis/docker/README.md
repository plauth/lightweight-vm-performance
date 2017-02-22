Prerequisites
=============
Docker has to be installed. For instructions, please refer to https://docs.docker.com/engine/installation/linux/ubuntulinux/

Setup
=====
```sh
docker build -t "redis" .
```

Start
=====
```sh
docker run -d -p 6379:6379 redis
```

Stop
====
```sh
docker stop redis
```

Benchmark
=========
```sh
redis-benchmark -h [IP_OF_CONTAINER] -c [1-1000] -n 100000 -k 1 -t set,get
```