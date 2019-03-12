#!/bin/bash


echo "building images..."

cd hadoop_base/
bash build.sh
cd ../hadoop_head/
bash build.sh
cd ../hadoop_slave/
bash build.sh
