#!/bin/bash

docker start head node2 node3 node4

docker exec -it -u hduser head /home/hduser/hadoop/sbin/start-dfs.sh

docker exec -it -u hduser head /home/hduser/hadoop/sbin/start-yarn.sh

masterIp=`docker inspect -f "{{ .NetworkSettings.Networks.hadoop.IPAddress }}" head`

echo "Hadoop info @ head : http://$masterIp:8088/cluster"
echo "DFS Health @ head  : http://$masterIp:9870/dfshealth.html"
