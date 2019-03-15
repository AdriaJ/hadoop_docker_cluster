TO DO :
Install jupyter on head
Write sufficient and clear readme.md file

## Description
This repo contains the files to build and deploy hadoop cluster on Docker containers.It s mode of three different images :
* hadoop_base contains a base image, started from ubuntu, with minimum common configuration for hadoop masternode and datanodes
* hadoop_head contains the image for masternode, with a couple of more components, like Jupyter Notebook
* hadoop_slave contains the image for datanodes to use in the cluster



## Sources : 
https://github.com/rubenafo/docker-spark-cluster (associated medium article https://medium.com/@rubenafo/some-tips-to-run-a-multi-node-hadoop-in-docker-9c7012dd4e26)
https://github.com/liliasfaxi/hadoop-cluster-docker

## Useful resources (how to setup a multinode hadoop cluster):
https://www.linode.com/docs/databases/hadoop/how-to-install-and-set-up-hadoop-cluster/
https://medium.com/@jeevananandanne/setup-4-node-hadoop-cluster-on-aws-ec2-instances-1c1eeb4453bd

