#!/bin/sh -e
#
#  Copyright (C) 2016 ScyllaDB

print_usage() {
    echo "gce-machines [-t TYPE] -a"
    echo "  -a  All machines"
    echo "  -t  just the TYPE machines"
    exit 1
}

STR=0
while getopts t:ah OPT; do
    case "$OPT" in
        "a")
            STR="all"
            ;;
        "t")
            STR=$OPTARG
            ;;
        "h")
            print_usage
            ;;
    esac
done

#Add poll mode
ansible -i ./hosts.init servers --sudo -m replace -a "dest=/etc/sysconfig/scylla-server backup=yes regexp='SCYLLA_ARGS=\"' replace='SCYLLA_ARGS=\"--poll-mode '"

SEED=$(./step_2_ansible_host_file.sh -i|head -1)
ansible -i ./hosts.init $STR --sudo -m replace -a "dest=/etc/scylla/scylla.yaml regexp='seeds: \"127.0.0.1\"' replace='seeds: $SEED'"

#run the mandatory io_setup which calls iotune
ansible -i ./hosts.init $STR --sudo -a "/usr/lib/scylla/scylla_io_setup"

ansible-playbook -i ./hosts.init scylla-conf.yaml
ansible-playbook -i ./hosts.init scylla-start.yaml

