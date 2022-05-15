#!/usr/bin/env bash

KHTTPD_MOD=khttpd.ko

if [ "$EUID" -eq 0 ]
  then echo "Don't run this script as root"
  exit
fi

# load kHTTPd
make unload
sleep 1
make load

# run HTTP benchmarking
./htstress -n 100000 -c 1 -t 4 http://localhost:8081/

# epilogue
make unload
echo "Complete"
