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

ansible -i ./hosts.init $STR -m copy -a "src=/home/dor/src/my-ansible/scylla-setup-script.sh dest=/home/dor/ mode=0777"  -vv
ansible -i ./hosts.init $STR -m shell -a "sudo /home/dor/scylla-setup-script.sh" -vv

