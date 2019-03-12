#!/bin/bash

echo "Y" | ssh-keygen -t rsa -P '' -f config/id_rsa

echo ""

echo -e "\nbuild hadoop base docker image\n"
docker build -t adriaj/hadoop_base:latest .

echo ""
