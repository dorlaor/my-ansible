ansible -i ./hosts.init servers -m copy -a "src=/home/dor/src/my-ansible/scylla-setup-script.sh dest=/home/dor/ mode=0777"  -vv
ansible -i ./hosts.init servers -m shell -a "sudo /home/dor/scylla-setup-script.sh" -vv

