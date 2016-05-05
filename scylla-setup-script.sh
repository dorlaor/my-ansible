#!/bin/sh

yum install -y wget
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y epel-release-latest-7.noarch.rpm
yum repolist
yum update -y
#wget -O /etc/yum.repos.d/scylla.repo https://s3.amazonaws.com/downloads.scylladb.com/rpm/centos/scylla.repo
wget -O /etc/yum.repos.d/scylla.repo http://downloads.scylladb.com/rpm/unstable/centos/master/latest/scylla.repo


yum remove -y abrt
yum install -y scylla-server scylla-jmx scylla-tools

#setup the nvme drives (auto detect their number)
i=$(ls /dev/nvme0n? -la | wc -l)
NVME=
for (( j=1 ; j < $i ; j++)); do NVME+="/dev/nvme0n$j," ; done
NVME+="/dev/nvme0n$i"
/usr/lib/scylla/scylla_raid_setup --disks $NVME --update-fstab 

/usr/lib/scylla/scylla_ntp_setup
/usr/lib/scylla/scylla_bootparam_setup
/usr/lib/scylla/scylla_coredump_setup

systemctl stop firewalld
echo "tsc" | tee -a /sys/bus/clocksource/devices/clocksource0/current_clocksource

