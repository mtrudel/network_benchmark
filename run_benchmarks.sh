#!/bin/bash

hostname=localhost

for protocol in http/1.1 h2c
do
  for m in 1 16
  do 
    for port in 4001 4002
    do 
      h2load --no-tls-proto=$protocol -D 15 -d random_10k http://$hostname:$port -m $m -t 1 -c 1
      read -p "The previous run was $protocol m=$m c=1 port=$port. Press the any key to continue"
      h2load --no-tls-proto=$protocol -D 15 -d random_10k http://$hostname:$port -m $m -t 2 -c 2
      read -p "The previous run was $protocol m=$m c=2 port=$port. Press the any key to continue"
      h2load --no-tls-proto=$protocol -D 15 -d random_10k http://$hostname:$port -m $m -t 4 -c 4
      read -p "The previous run was $protocol m=$m c=4 port=$port. Press the any key to continue"
      h2load --no-tls-proto=$protocol -D 15 -d random_10k http://$hostname:$port -m $m -t 8 -c 8
      read -p "The previous run was $protocol m=$m c=8 port=$port. Press the any key to continue"
      h2load --no-tls-proto=$protocol -D 15 -d random_10k http://$hostname:$port -m $m -t 16 -c 16
      read -p "The previous run was $protocol m=$m c=16 port=$port. Press the any key to continue"
      h2load --no-tls-proto=$protocol -D 15 -d random_10k http://$hostname:$port -m $m -t 32 -c 32
      read -p "The previous run was $protocol m=$m c=32 port=$port. Press the any key to continue"
      h2load --no-tls-proto=$protocol -n 1000000 -d random_10k http://$hostname:$port -m $m -t 32 -c 64
      read -p "The previous run was $protocol m=$m c=64 port=$port. Press the any key to continue"
      h2load --no-tls-proto=$protocol -n 1000000 -d random_10k http://$hostname:$port -m $m -t 32 -c 128
      read -p "The previous run was $protocol m=$m c=128 port=$port. Press the any key to continue"
      h2load --no-tls-proto=$protocol -n 1000000 -d random_10k http://$hostname:$port -m $m -t 32 -c 256
      read -p "The previous run was $protocol m=$m c=256 port=$port. Press the any key to continue"
      h2load --no-tls-proto=$protocol -n 1000000 -d random_10k http://$hostname:$port -m $m -t 32 -c 512
      read -p "The previous run was $protocol m=$m c=512 port=$port. Press the any key to continue"
      h2load --no-tls-proto=$protocol -n 1000000 -d random_10k http://$hostname:$port -m $m -t 32 -c 1024
      read -p "The previous run was $protocol m=$m c=1024 port=$port. Press the any key to continue"
    done
  done
done
