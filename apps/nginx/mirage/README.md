Prerequisites
=============
Please follow the instructions on https://mirage.io/wiki/install. Since no OCaml port of Nginx exists, we have to resort to using the basic HTTP server example provided by the authors of MirageOS, the `conduit_server`. 

Setup
=====
Clone the repository `git://github.com/mirage/mirage-skeleton.git` and `cd` to the directory `mirage-skeleton/conduit_server_manual`.

There, run the following commands:
```sh
mirage configure -t xen --ip=[IP_OF_MIRAGE_INSTANCE] --gateways=[GATEWAY_IP] --netmask=255.255.255.0 --network=0
make
```

Benchmark
=========
```sh
gcc -O2 ../generic/ab.c -o abc -lpthread
./abc [0-1k:100kA+100x30] [IP_OF_MIRAGE_INSTANCE]/favicon.ico
```