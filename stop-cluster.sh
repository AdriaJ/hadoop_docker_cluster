#!/bin/bash

### Retrieve container ids from network hadoop
ids=`docker inspect -f "{{ .Containers }}" hadoop | sed s/^....// | sed 's/{[^}]*}/\n/g' | sed s/://g | sed s/]// | sed 's/ //g'`

### Stop containers
docker stop $ids

### Make sure there are off
echo "Docker containers :"
docker ps
