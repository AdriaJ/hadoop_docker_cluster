## Description
This repo contains the files to build and deploy hadoop cluster on Docker containers.It s mode of three different images :
* **hadoop_base** contains a base image, started from ubuntu, with minimum common configuration for hadoop masternode and datanodes
* **hadoop_head** contains the image for masternode, with a couple of more components, like Jupyter Notebook
* **hadoop_slave** contains the image for datanodes to use in the cluster

## How to use it ?
  1) Clone this repo
  2) Run **deploy-cluster.sh** to build images and start nodes and cluster
  3) Use **stop-cluster.sh** and **start-cluster.sh** to close and re-open it

## What's needed to be done as improvement ?
* Use Docker Volumes to ensure persistency of data through different deployments
* Run Hadoop application such as MapReduce Tasks
* Add Hadoop components like Hive or HBase to extend improve the cluster, and emphasize the distributed environment installation

## Sources : 
[Docker cluster with Spark] (https://github.com/rubenafo/docker-spark-cluster) ([associated medium article] (https://medium.com/@rubenafo/some-tips-to-run-a-multi-node-hadoop-in-docker-9c7012dd4e26) )  
[Another Docker cluster] (https://github.com/liliasfaxi/hadoop-cluster-docker)

## Useful resources (how to setup a multinode hadoop cluster):
[How to set up a regular Hadoop cluster] (https://www.linode.com/docs/databases/hadoop/how-to-install-and-set-up-hadoop-cluster/)  
[Set up Hadoop cluster on ec2 instances] (https://medium.com/@jeevananandanne/setup-4-node-hadoop-cluster-on-aws-ec2-instances-1c1eeb4453bd)

PS : some non necessary or useless files/lines may still be present in the repo, due to long investigation at creation time.
