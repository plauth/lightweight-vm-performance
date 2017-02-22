Setup
=====
See `build_redis.sh`

Benchmark
=========
```sh
redis-benchmark -h [IP_OF_TARGET_HOST] -c [1-1000] -n 100000 -k 1 -t set,get
```