#!/bin/bash

#remove old stuff
#docker container stop `docker ps -q`
docker rm -f `docker ps -q`
docker network rm hadoop


docker network create --driver=bridge hadoop

bash ./build-images.sh

echo "start hadoop-master container..."
docker run -itd --net=hadoop \
                -p 50070:50070 \
                -p 8088:8088 \
		-p 7077:7077 \
		-p 16010:16010 \
		-p 2019:2019 \
                --name head \
                --hostname head \
		adriaj/hadoop_head

for i in `seq 2 4`
do
	echo "start hadoop-slave node$i container..."
	port=$(( 8040 + $i ))
	docker run -dit	-p $port:8042 \
		--name node$i \
		--hostname node$i \
		--net=hadoop \
		adriaj/hadoop_slave
done

echo "start hadoop cluster"
docker start head node2 node3 node4

echo ">>start hdfs..."
docker exec -it -u hduser head /home/hduser/hadoop/sbin/start-dfs.sh


echo ">>start yarn..."
docker exec -d -u hduser head /home/hduser/hadoop/sbin/start-yarn.sh


#find ip
masterIp=`docker inspect -f "{{ .NetworkSettings.Networks.hadoop.IPAddress }}" head`

echo "Hadoop info @ head : http://$masterIp:8088/cluster"
echo "DFS Health @ head  : http://$masterIp:9870/dfshealth.html"
echo "You can start jupyter server and use jupyter notebook on port 2019 with the command 'jupyter notebook --ip=0.0.0.0 --port=2019'"

