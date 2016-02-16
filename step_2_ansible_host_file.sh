#!/bin/bash

CLIENTS="n1-standard-16"
SERVERS="n1-standard-32"
HOSTS_FILE='hosts.init'

echo "[clients]" >> $HOSTS_FILE
gcloud compute instances list | grep $CLIENTS | awk '{print $5}' >> $HOSTS_FILE

echo "" >> $HOSTS_FILE

echo "[servers]" >> $HOSTS_FILE
gcloud compute instances list | grep $SERVERS | awk '{print $5}' >> $HOSTS_FILE

