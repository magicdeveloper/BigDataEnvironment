FROM debian:9

LABEL maintainer = "mohamed ghname <engmghnam@gmail.com>"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      apt-utils\
      openjdk-8-jdk \
      net-tools \
      curl \
      netcat \
      gnupg \
      wget \
      nano\
      sudo\ 
      vim\          
      python \ 
    && rm -rf /var/lib/apt/lists/*
    
RUN sudo apt update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends\
  python3 \
  python3-setuptools \
  python3-pip \
  python3-numpy \
  python3-matplotlib \
  python3-scipy \
  python3-pandas \
  python3-simpy\
  && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
RUN java -version
#RUN cd /usr/local
#RUN wget http://www-eu.apache.org/dist/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz
#RUN sudo tar xzf apache-maven-3.6.0-bin.tar.gz
#RUN sudo ln -s apache-maven-3.6.0 apache-maven
#RUN sudo vi /etc/profile.d/apache-maven.sh
#RUN export JAVA_HOME=/usr/lib/jvm/java-11-oracle
#RUN export M2_HOME=/usr/local/apache-maven
#RUN export MAVEN_HOME=/usr/local/apache-maven
#RUN export PATH=${M2_HOME}/bin:${PATH}
#RUN source /etc/profile.d/apache-maven.sh
#RUN rm -f apache-maven-3.6.0-bin.tar.gz
#RUN maven -version

RUN python3 --version
RUN python --version
RUN nano --version

 
#RUN sudo apt-get remove maven2
#RUN sudo apt-get update
#RUN sudo apt-get install maven

 

#RUN apt-get update 
#RUN sudo  apt-get install maven3 -y
RUN curl -O https://dist.apache.org/repos/dist/release/hadoop/common/KEYS

RUN gpg --import KEYS

ENV HADOOP_VERSION 3.2.0

ENV HADOOP_URL https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
RUN set -x \
    && curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    && curl -fSL "$HADOOP_URL.asc" -o /tmp/hadoop.tar.gz.asc \
    && gpg --verify /tmp/hadoop.tar.gz.asc \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz*

# Develop mode
# COPY hadoop-3.2.0.tar.gz /tmp/hadoop.tar.gz
# RUN set -x \
#     # && curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
#     && curl -fSL "$HADOOP_URL.asc" -o /tmp/hadoop.tar.gz.asc \
#     && gpg --verify /tmp/hadoop.tar.gz.asc \
#     && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
#     && rm /tmp/hadoop.tar.gz*

RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop
RUN mkdir /opt/hadoop-$HADOOP_VERSION/logs

RUN mkdir /hadoop-data

ENV HADOOP_HOME=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1
ENV USER=root
ENV PATH $HADOOP_HOME/bin/:$PATH

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
