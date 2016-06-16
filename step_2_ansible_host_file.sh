#!/bin/bash
#
#  Copyright (C) 2016 ScyllaDB

print_usage() {
    echo "NAME [-f] [-i]"
    echo "  -f Create ansible host file"
    echo "  -i get servers internal IPs"
    echo "  -k kill all machines"
    echo "  -h help"
    exit 1
}

FILE=0
IP=0
KILL=0
while getopts :fkih OPT; do
    case "$OPT" in
        "f")
            FILE=1
            ;;
        "i")
            IP=1
            ;;
        "k")
            KILL=1
            ;;
        "h")
            print_usage
            ;;
    esac
done


CLIENTS="client"
SERVERS="server"
HOSTS_FILE='hosts.init'

if [ $FILE -eq 1 ]; then
   rm -f $HOSTS_FILE
   echo "[clients]" >> $HOSTS_FILE
   gcloud compute instances list | grep $CLIENTS | awk '{print $5}' >> $HOSTS_FILE
   echo "" >> $HOSTS_FILE

   echo "[servers]" >> $HOSTS_FILE
   gcloud compute instances list | grep $SERVERS | awk '{print $5}' >> $HOSTS_FILE
fi

if [ $IP -eq 1 ]; then
   gcloud compute instances list | grep $SERVERS | awk '{print $4}'
fi

if [ $KILL -eq 1 ]; then
   MACHINES=$(gcloud compute instances list | grep n1-standard | awk '{print $1}' | xargs)
   gcloud compute instances delete $MACHINES
   rm -f $HOSTS_FILE
fi
