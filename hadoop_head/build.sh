#!/bin/bash

echo ""

echo -e "\nbuild hadoop namenode docker image\n"
docker build -t adriaj/hadoop_head:latest .

echo ""
