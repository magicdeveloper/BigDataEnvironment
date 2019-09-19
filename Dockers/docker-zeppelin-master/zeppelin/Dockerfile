ARG SPARK_BASE=2.4.3-hadoop3.2.0
FROM mdt/spark-base:${SPARK_BASE}

LABEL MAINTAINER = "moahmed ghname <engmghnam@gmail.com>" 

ENV APACHE_SPARK_VERSION 2.4.3
ENV APACHE_HADOOP_VERSION 3.2.0
ENV ZEPPELIN_VERSION 0.8.1

RUN apt-get update && apt-get install wget
RUN set -x \
    && curl -fSL "https://www-eu.apache.org/dist/zeppelin/zeppelin-${ZEPPELIN_VERSION}/zeppelin-${ZEPPELIN_VERSION}-bin-all.tgz" -o /tmp/zeppelin.tgz \
    && tar -xzvf /tmp/zeppelin.tgz -C /opt/ \
    && mv /opt/zeppelin-* /opt/zeppelin \
    && rm /tmp/zeppelin.tgz

# COPY zeppelin-${ZEPPELIN_VERSION}-bin-all.tgz /tmp/zeppelin.tgz
# RUN tar -xvzf /tmp/zeppelin.tgz -C /opt/ \
#     && mv /opt/zeppelin-${ZEPPELIN_VERSION}-bin-all /opt/zeppelin \
#     && rm /tmp/zeppelin.tgz \
#     && cd /

# ENV SPARK_SUBMIT_OPTIONS "--jars /opt/zeppelin/sansa-examples-spark-2016-12.jar"

WORKDIR /opt/zeppelin

CMD ["/opt/zeppelin/bin/zeppelin.sh"]
RUN mkdir /opt/zeppelin/work
RUN mkdir /opt/zeppelin/work/projects
RUN mkdir /opt/zeppelin/work/data
RUN mkdir /opt/zeppelin/work/models
RUN mkdir /opt/zeppelin/work/models/hdf5
RUN mkdir /opt/zeppelin/work/data/hdf5
RUN mkdir /opt/zeppelin/work/data/images
RUN mkdir /opt/zeppelin/work/data/input
RUN mkdir /opt/zeppelin/work/data/output
RUN mkdir /opt/zeppelin/work/data/db
RUN conda update --all