FROM ubuntu:20.04

USER root
RUN apt-get upgrade && apt-get update 
RUN apt-get install nano -y
RUN apt-get install iputils-ping -y
RUN apt-get install openssh-server openssh-client -y
RUN apt-get install openjdk-8-jdk jsvc -y

RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
RUN chmod 0600 ~/.ssh/authorized_keys

ADD hadoop-3.3.4.tar.gz /
RUN ln -s hadoop-3.3.4 hadoop

RUN mkdir -p /hadoop/dfsdata/datanode && mkdir /hadoop/dfsdata/namenode

COPY setup.sh /
COPY start.sh /
COPY *.xml /hadoop/etc/hadoop/

RUN chmod a+x /setup.sh
RUN chmod a+x /start.sh

ENV HADOOP_HOME /hadoop

RUN /bin/bash -C /setup.sh

EXPOSE 9870 9864 8088 9000

CMD  ["/start.sh"]