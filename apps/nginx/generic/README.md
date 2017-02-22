Setup
=====
See `build_nginx.sh`


Benchmark
=========
```sh
gcc -O2 ab.c -o abc -lpthread
./abc [0-1k:100kA+100x30] [IP_OF_TARGET_HOST]/favicon.ico
```