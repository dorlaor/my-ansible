# run : nohup ./loadRun.sh
ansible  -i hosts.ini ycsb  -u root -m shell -a '/root/ycsb-0.5.0/bin/ycsb run cassandra2-cql -p hosts="10.184.11.90" -P /root/ycsb-0.5.0/workloads/workloada  -p operationcount=1000000  -p cassandra.writeconsistencylevel=QUORUM -p cassandra.readconsistencylevel=QUORUM -threads 500 -target 2000 -s 2> stat_20k.log' -vv | tee 20k_OPS.log
ansible  -i hosts.ini ycsb  -u root -m shell -a '/root/ycsb-0.5.0/bin/ycsb run cassandra2-cql -p hosts="10.184.11.90" -P /root/ycsb-0.5.0/workloads/workloada  -p operationcount=2000000  -p cassandra.writeconsistencylevel=QUORUM -p cassandra.readconsistencylevel=QUORUM -threads 500 -target 4000 -s 2> stat_40k.log' -vv | tee 40k_OPS.log
ansible  -i hosts.ini ycsb  -u root -m shell -a '/root/ycsb-0.5.0/bin/ycsb run cassandra2-cql -p hosts="10.184.11.90" -P /root/ycsb-0.5.0/workloads/workloada  -p operationcount=3000000  -p cassandra.writeconsistencylevel=QUORUM -p cassandra.readconsistencylevel=QUORUM -threads 500 -target 6000 -s 2> stat_60k.log' -vv | tee 60k_OPS.log
ansible  -i hosts.ini ycsb  -u root -m shell -a '/root/ycsb-0.5.0/bin/ycsb run cassandra2-cql -p hosts="10.184.11.90" -P /root/ycsb-0.5.0/workloads/workloada  -p operationcount=7000000  -p cassandra.writeconsistencylevel=QUORUM -p cassandra.readconsistencylevel=QUORUM -threads 500 -target 7000 -s 2> stat_70k.log' -vv | tee 70k_OPS.log
ansible  -i hosts.ini ycsb  -u root -m shell -a '/root/ycsb-0.5.0/bin/ycsb run cassandra2-cql -p hosts="10.184.11.90" -P /root/ycsb-0.5.0/workloads/workloada  -p operationcount=10000000  -p cassandra.writeconsistencylevel=QUORUM -p cassandra.readconsistencylevel=QUORUM -threads 500 -target 10000 -s 2> stat_100k.log' -vv | tee 100k_OPS.log
ansible  -i hosts.ini ycsb  -u root -m shell -a '/root/ycsb-0.5.0/bin/ycsb run cassandra2-cql -p hosts="10.184.11.90" -P /root/ycsb-0.5.0/workloads/workloada  -p operationcount=10000000  -p cassandra.writeconsistencylevel=QUORUM -p cassandra.readconsistencylevel=QUORUM -threads 500 -target 12000 -s 2> stat_120k.log' -vv | tee 120k_OPS.log
ansible  -i hosts.ini ycsb  -u root -m shell -a '/root/ycsb-0.5.0/bin/ycsb run cassandra2-cql -p hosts="10.184.11.90" -P /root/ycsb-0.5.0/workloads/workloada  -p operationcount=10000000  -p cassandra.writeconsistencylevel=QUORUM -p cassandra.readconsistencylevel=QUORUM -threads 500 -target 14000 -s 2> stat_140k.log' -vv | tee 140k_OPS.log
ansible  -i hosts.ini ycsb  -u root -m shell -a '/root/ycsb-0.5.0/bin/ycsb run cassandra2-cql -p hosts="10.184.11.90" -P /root/ycsb-0.5.0/workloads/workloada  -p operationcount=10000000  -p cassandra.writeconsistencylevel=QUORUM -p cassandra.readconsistencylevel=QUORUM -threads 500 -target 16000 -s 2> stat_160k.log' -vv | tee 160k_OPS.log
ansible  -i hosts.ini ycsb  -u root -m shell -a '/root/ycsb-0.5.0/bin/ycsb run cassandra2-cql -p hosts="10.184.11.90" -P /root/ycsb-0.5.0/workloads/workloada  -p operationcount=10000000  -p cassandra.writeconsistencylevel=QUORUM -p cassandra.readconsistencylevel=QUORUM -threads 500 -target 18000 -s 2> stat_180k.log' -vv | tee 180k_OPS.log
ansible  -i hosts.ini ycsb  -u root -m shell -a '/root/ycsb-0.5.0/bin/ycsb run cassandra2-cql -p hosts="10.184.11.90" -P /root/ycsb-0.5.0/workloads/workloada  -p operationcount=10000000  -p cassandra.writeconsistencylevel=QUORUM -p cassandra.readconsistencylevel=QUORUM -threads 500 -target 18000 -s 2> stat_180k.log' -vv | tee 180k_OPS.log
ansible  -i hosts.ini ycsb  -u root -m shell -a '/root/ycsb-0.5.0/bin/ycsb run cassandra2-cql -p hosts="10.184.11.90" -P /root/ycsb-0.5.0/workloads/workloada  -p operationcount=10000000  -p cassandra.writeconsistencylevel=QUORUM -p cassandra.readconsistencylevel=QUORUM -threads 500 -target 20000 -s 2> stat_200k.log' -vv | tee 200k_OPS.log
ansible  -i hosts.ini ycsb  -u root -m shell -a '/root/ycsb-0.5.0/bin/ycsb run cassandra2-cql -p hosts="10.184.11.90" -P /root/ycsb-0.5.0/workloads/workloada  -p operationcount=10000000  -p cassandra.writeconsistencylevel=QUORUM -p cassandra.readconsistencylevel=QUORUM -threads 500 -target 22000 -s 2> stat_220k.log' -vv | tee 220k_OPS.log
ansible  -i hosts.ini ycsb  -u root -m shell -a '/root/ycsb-0.5.0/bin/ycsb run cassandra2-cql -p hosts="10.184.11.90" -P /root/ycsb-0.5.0/workloads/workloada  -p operationcount=10000000  -p cassandra.writeconsistencylevel=QUORUM -p cassandra.readconsistencylevel=QUORUM -threads 500 -target 24000 -s 2> stat_240k.log' -vv | tee 240k_OPS.log
ansible  -i hosts.ini ycsb  -u root -m shell -a '/root/ycsb-0.5.0/bin/ycsb run cassandra2-cql -p hosts="10.184.11.90" -P /root/ycsb-0.5.0/workloads/workloada  -p operationcount=10000000  -p cassandra.writeconsistencylevel=QUORUM -p cassandra.readconsistencylevel=QUORUM -threads 8000  -s 2> stat_maxk.log' -vv | tee Maxk_OPS.log
grep  AverageLatency  *.log > AverageLatency.csv
grep  MaxLatency  *.log > MaxLatency.csv
grep  95thPercentileLatency  *.log > 95thPercentileLatency.csv
grep  99thPercentileLatency  *.log > 99thPercentileLatency.csv
grep  Throughput  *.log > Throughput.csv
grep UPDATE AverageLatency.csv > update_AverageLatency.csv
grep READ AverageLatency.csv > read_AverageLatency.csv
grep  READ 95thPercentileLatency.csv  > read_95thPercentileLatency.csv
grep  UPDATE 95thPercentileLatency.csv  > update_95thPercentileLatency.csv
grep  READ 99thPercentileLatency.csv  > read_99thPercentileLatency.csv
grep  UPDATE 99thPercentileLatency.csv  > update_99thPercentileLatency.csv






