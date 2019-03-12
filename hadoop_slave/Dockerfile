
FROM adriaj/hadoop_base
SHELL ["/bin/bash", "-c"]

USER hduser

RUN mkdir -p /home/hduser/data/hdfs/datanode

#setting for hdfs-site.xml
COPY ./config/hdfs-site.xml /home/hduser/hadoop/etc/hadoop/

USER root

#CMD ["bash", "-c", "service ssh start; bash"]
CMD service ssh start && sleep infinity
