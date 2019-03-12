#!/bin/bash

echo ""

echo -e "\nbuild hadoop slave docker image\n"
docker build -t adriaj/hadoop_slave:latest .

echo ""
