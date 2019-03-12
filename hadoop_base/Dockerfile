FROM ubuntu
#SHELL ["/bin/bash", "-c"]

USER root
EXPOSE 22/tcp
EXPOSE 22/udp

RUN apt update \
    && apt upgrade -y \
    && apt install -y \
	nano \
	wget \
    && apt-get install -y \
	openjdk-8-jdk \
	openssh-server

#RUN echo "Host *" >> /etc/ssh/ssh_config
RUN echo "PubkeyAuthentication yes" >> /etc/ssh/ssh_config
RUN echo "Host *" >> /etc/ssh/ssh_config
#RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config

###Create new user
RUN useradd -m -s /bin/bash hduser
USER hduser


WORKDIR /home/hduser


#Download hadoop
RUN wget https://archive.apache.org/dist/hadoop/core/hadoop-2.7.3/hadoop-2.7.3.tar.gz
RUN tar -xf hadoop-2.7.3.tar.gz
RUN rm hadoop-2.7.3.tar.gz
RUN mv hadoop-2.7.3 hadoop

#Edit .bashrc file
RUN echo "" >> .bashrc \
    && echo "### JAVA_HOME" >> .bashrc \
    && echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> ~/.bashrc \
    && echo "export PATH=\$PATH:\$JAVA_HOME/bin" >> ~/.bashrc \
    && echo "### HADOOP_HOME" >> ~/.bashrc \
    && echo "export HADOOP_HOME=/home/hduser/hadoop" >> ~/.bashrc \
    && echo "export PATH=\$PATH:\$HADOOP_HOME/bin" >> ~/.bashrc \
    && echo "export PATH=\$PATH:\$HADOOP_HOME/sbin" >> ~/.bashrc \
    && echo "export LD_LIBRARY_PATH=/home/hduser/hadoop/lib/native:\$LD_LIBRARY_PATH" >> ~/.bashrc \
    && echo "export HADOOP_CONF_DIR=/home/hduser/hadoop/etc/hadoop" >> ~/.bashrc \
    && /bin/bash -c "source ~/.bashrc"

RUN cat .bashrc
RUN /bin/bash -c "echo $HADOOP_HOME"
##version avec les variables d'environnement
#ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
#ENV HADOOP_HOME=/usr/local/hadoop
#ENV LD_LIBRARY_PATH=/usr/local/hadoop/lib/native:$LD_LIBRARY_PATH
#ENV HADOOP_CONF_DIF=/usr/local/hadoop/etc/hadoop
#ENV PATH=$PATH:/usr/local/hadoop/bin:/usr/local/hadoop/sbin:$JAVA_HOME/bin


#Add config files
COPY --chown=hduser ./config/core-site.xml ./config/yarn-site.xml ./config/mapred-site.xml /home/hduser/hadoop/etc/hadoop/
COPY --chown=hduser ./config/slaves /home/hduser/hadoop/etc/hadoop/slaves

###Set up SSh keys
RUN mkdir /home/hduser/.ssh
#RUN echo "Host *" >> /home/hduser/.ssh/config
#RUN echo PubKeyAuthentication yes >> /home/hduser/.ssh/config
#RUN echo PasswordAuthentication no >> /home/hduser/.ssh/config
#RUN echo PubkeyAcceptedKeyTypes +ssh-dss >> /home/hduser/.ssh/config
COPY --chown=hduser config/ssh_config /home/hduser/.ssh/
RUN mv /home/hduser/.ssh/ssh_config /home/hduser/.ssh/config
COPY --chown=hduser config/id_rsa.pub /home/hduser/.ssh/
COPY --chown=hduser config/id_rsa /home/hduser/.ssh/
RUN cat /home/hduser/.ssh/id_rsa.pub >> /home/hduser/.ssh/authorized_keys

###deal with hadoop-env.sh
RUN echo JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 >> /home/hduser/hadoop/etc/hadoop/hadoop-env.sh
RUN echo HDFS_NAMENODE_USER=hduser >> /home/hduser/hadoop/etc/hadoop/hadoop-env.sh
RUN echo HDFS_DATANODE_USER=hduser >> /home/hduser/hadoop/etc/hadoop/hadoop-env.sh                        
RUN echo HDFS_SECONDARYNAMENODE_USER=hduser >> /home/hduser/hadoop/etc/hadoop/hadoop-env.sh

USER root
CMD service ssh start && sleep infinity
