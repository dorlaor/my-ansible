
# General editing commands

ansible -i my.ini Scylla -u centos --sudo -m lineinfile -a 'dest=/etc/scylla/scylla.yaml regexp="auto_bootstrap: false" line="# auto_bootstrap: false"'
ansible -i my.ini Scylla -u centos  -m shell -a 'nodetool refresh keyspace1 standard1'
ansible db -u root -m replace -a "dest=/etc/scylla/scylla.yaml regexp='seeds: 10.184.13.11,10.184.13.109,10.184.13.110' replace='seeds: 10.184.13.11'"
ansible db -u root -m replace -a "dest=/etc/sysconfig/scylla-server backup=yes regexp='collectd-hostname=' replace='collectd-hostname=scyllaRS\"collectd-hostname=scylla\"'"
ansible db -u root -m replace -a "dest=/etc/scylla/scylla.yaml regexp='seeds: \"127.0.0.1\"' replace='seeds: 10.184.5.97'"
ansible all -m ping -s -k -u root
ansible client -a "/usr/bin/yum update -y" -u root -vv
ansible client -m copy "src=/home/dor/demo.sh dest=/root/demo.sh owner=root group=root mode=0777" -u root -vv
ansible all -a "/root/demo.sh" -u root -vv
ansible all -a "/usr/sbin/reboot" -u root -vv
ansible db -i test.yml 
ansible -i ./hosts db playbook ip.yml 
ansible -i ./hosts db -m shell -a "/usr/sbin/ip addr show | /usr/bin/grep inet" 

# Scylla server commands

ansible all -a "/usr/lib/scylla/posix_net_conf.sh -mq" -u root -vv
ansible db -a "/usr/bin/systemctl start scylla-server" -u root -vv
ansible db -a "/usr/bin/systemctl stop firewalld" -u root -vv
ansible db -a "/usr/bin/systemctl start scylla-jmx" -u root -vv
ansible -i ./hosts db -m ansible -i db.ini db -u fedora --sudo -m replace -a "dest=/etc/sysconfig/scylla-server backup=yes regexp='SCYLLA_ARGS=' replace='SCYLLA_ARGS=\"--poll-mode\"'"

# cassandra-client commands
ansible client -a "cassandra-stress write no-warmup duration=15m cl=QUORUM -schema 'replication(factor=3) keyspace=test1' -mode native cql3 -rate limit=25000/s threads=700 -node 10.184.13.11 -log file=/tmp/stress" -u root -vv
ansible client -a "cassandra-stress write n=100000000 -pop 'seq=1..100000000' no-warmup duration=200m cl=ONE -mode native cql3 -rate threads=700 -node 10.184.5.100 -log file=/tmp/stress" -u root -vv

# Scylla startup instructions

#Edit the scylla.yaml with a single seed from one of the addresses above and local ip for listening:
ansible -i ./hosts db -s -m shell -a "/usr/bin/sed -i -e \"s/seeds:.*/seeds: 10.240.0.4/g\" -e \"s/rpc_address:.*/rpc_address: 10.240.0.4/g\" -e \"s/listen_address:.*/listen_address: 10.240.0.4/g\"  /etc/scylla/scylla.yaml"

#(make sure you give different listen addresses for different nodes - I need to fix it in ansible!)
ssh dor@104.196.13.182 ""/usr/bin/sed -i -e \"s/seeds:.*/seeds: 10.240.0.4/g\" -e \"s/rpc_address:.*/rpc_address: 10.240.0.2/g\" -e \"s/listen_address:.*/listen_address: 10.240.0.2/g\"  /etc/scylla/scylla.yaml"

#Enable poll mode (not a must, good for low rates)
ansible -i ./hosts db -s -m replace -a "dest=/etc/sysconfig/scylla-server backup=yes regexp='SCYLLA_ARGS=' replace='SCYLLA_ARGS=\"--poll-mode\"'"
#Start the servers:
ansible -i ./hosts -s db -a "/usr/bin/systemctl start scylla-server" 
#Check status:
ansible -i ./hosts -s db -a "/usr/bin/systemctl status scylla-server" 
#Start Jmx
ansible -i ./hosts -s db -a "/usr/bin/systemctl start scylla-jmx" 
#Check the cluster:
ansible -i ./hosts -s db -a "/usr/bin/nodetool status" 


#YCSB
YCSB 5 
--------
ansible  -i hosts.ini ycsb  -u root -m shell -a 'curl -O --location https://github.com/brianfrankcooper/YCSB/releases/download/0.5.0/ycsb-0.5.0.tar.gz'
ansible  -i hosts.ini ycsb  -u root -m shell -a 'tar xfvz ycsb-0.5.0.tar.gz'

YCSB 6
--------
ansible  -i hosts.ini ycsb  -u root -m shell -a 'curl -O --location https://github.com/brianfrankcooper/YCSB/releases/download/0.6.0/ycsb-0.6.0.tar.gz'
ansible  -i hosts.ini ycsb  -u root -m shell -a 'tar xfvz ycsb-0.6.0.tar.gz'

