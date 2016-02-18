#!/bin/sh -e
#
#  Copyright (C) 2016 ScyllaDB

print_usage() {
    echo "gce-machines -c [clients] -s [servers]"
    echo "  -c  Amount of clients"
    echo "  -s  Amount of servers"
    exit 1
}

CLIENTS=0
SERVERS=0
while getopts s:c:h OPT; do
    case "$OPT" in
        "s")
            SERVERS=$OPTARG
            ;;
        "c")
            CLIENTS=$OPTARG
            ;;
        "h")
            print_usage
            ;;
    esac
done

wait_n() {
    for ((i=0 ; i < $1 ; i++ )); do
        wait
    done
}

echo "About to create $SERVERS servers"

for ((i=0 ; i < $SERVERS ; i++ )); do
gcloud compute instances create server-$i \
    --machine-type n1-standard-32 \
    --local-ssd interface=nvme \
    --local-ssd interface=nvme \
    --local-ssd interface=nvme \
    --local-ssd interface=nvme \
    --local-ssd interface=nvme \
    --local-ssd interface=nvme \
    --local-ssd interface=nvme \
    --local-ssd interface=nvme \
    --image centos-7-v20160126 \
    --image-project centos-cloud &
done

wait_n $SERVERS

echo "About to create $CLIENTS clients"

for ((i=0 ; i < $CLIENTS ; i++ )); do
gcloud compute instances create client-$i \
    --machine-type n1-standard-16 \
    --local-ssd interface=nvme \
    --local-ssd interface=nvme \
    --image centos-7-v20160126 \
    --image-project centos-cloud &
done

wait_n $CLIENTS

gcloud compute instances list
