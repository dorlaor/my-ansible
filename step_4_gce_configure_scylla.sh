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
while getopts :at:h OPT; do
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


#set yaml addresses

#example commands
#No need for autobootstrap, yet
#ansible -i my.ini Scylla -u centos --sudo -m lineinfile -a 'dest=/etc/scylla/scylla.yaml regexp="auto_bootstrap: false" line="# auto_bootstrap: false"'
#ansible -i my.ini Scylla -u centos  -m shell -a 'nodetool refresh keyspace1 standard1'


SEED=$(./step_2_ansible_host_file.sh -i|head -1)
ansible -i ./hosts.init $STR --sudo -m replace -a "dest=/etc/scylla/scylla.yaml regexp='seeds: \"127.0.0.1\"' replace='seeds: $SEED'"


ansible -i ./hosts.init $STR -m shell -a "/usr/sbin/ip addr show | /usr/bin/grep inet" 
IP=$(ifconfig  eth0 | grep broadcast | awk '{print $2}')
ansible -i ./hosts.init $STR --sudo -m replace -a "dest=/etc/scylla/scylla.yaml regexp='listen_address"' replace='listen_address: $IP'"
ansible -i ./hosts.init $STR --sudo -m replace -a "dest=/etc/scylla/scylla.yaml regexp='rpc_address"' replace='rpc_address: $IP'"



#Poll mode
#ansible -i ./hosts.init $STR --sudo -m replace -a "dest=/etc/sysconfig/scylla-server backup=yes regexp='SCYLLA_ARGS=' replace='SCYLLA_ARGS=\"--poll-mode\"'"
#ansible db -u root -m replace -a "dest=/etc/sysconfig/scylla-server backup=yes regexp='collectd-hostname=' replace='collectd-hostname=scyllaRS\"collectd-hostname=scylla\"'"
