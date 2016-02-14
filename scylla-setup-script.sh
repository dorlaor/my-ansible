#!/bin/sh

yum install -y wget
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y epel-release-latest-7.noarch.rpm
yum repolist
yum update -y
wget -O /etc/yum.repos.d/scylla.repo https://s3.amazonaws.com/downloads.scylladb.com/rpm/centos/scylla.repo

yum install -y scylla-server scylla-jmx scylla-tools

/usr/lib/scylla/scylla_raid_setup -d /dev/nvme0n1,/dev/nvme0n2,/dev/nvme0n3,/dev/nvme0n4,/dev/nvme0n5,/dev/nvme0n6,/dev/nvme0n7,/dev/nvme0n8 -u
/usr/lib/scylla/posix_net_conf.sh -mq
/usr/lib/scylla/scylla_ntp_setup
/usr/lib/scylla/scylla_bootparam_setup
/usr/lib/scylla/scylla_coredump_setup

systemctl stop firewalld
