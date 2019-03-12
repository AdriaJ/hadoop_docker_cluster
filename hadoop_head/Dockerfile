FROM adriaj/hadoop_base
SHELL ["/bin/bash", "-c"]

USER hduser
WORKDIR /home/hduser


#RUN cat .bashrc
RUN mkdir -p /home/hduser/data/hdfs/namenode

#Setup secondary namenode
WORKDIR /home/hduser/hadoop/etc/hadoop
RUN touch masters \
    && echo "node2" >> masters

#setting for hdfs-site.xml
COPY ./config/hdfs-site.xml /home/hduser/hadoop/etc/hadoop/

#setup slave nodes
#COPY ./config/slaves /usr/local/hadoop/etc/hadoop

RUN /home/hduser/hadoop/bin/hdfs namenode -format

USER root
#CMD ["bash", "-c", "service ssh start; bash"]
CMD service ssh start && sleep infinity
