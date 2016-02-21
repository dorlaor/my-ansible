#!/bin/sh

ansible -i hosts.init clients -a "cassandra-stress write no-warmup duration=15m cl=QUORUM -schema 'replication(factor=3) keyspace=test1' -mode native cql3 -rate limit=25000/s threads=700 -node `./step_2_ansible_host_file.sh -i| head -1` -log file=/tmp/stress"  -vv
