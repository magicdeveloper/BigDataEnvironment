ARG SPARK_BASE=2.4.3-hadoop3.2.0
FROM mdt/spark-base:${SPARK_BASE}

LABEL MAINTAINER = "moahmed ghname <engmghnam@gmail.com>" 

ENV SPARK_MASTER_NAME spark-master
ENV SPARK_MASTER_PORT 7077
ENV SPARK_APPLICATION_JAR_LOCATION /app/application.jar
ENV SPARK_APPLICATION_PYTHON_LOCATION /app/app.py
ENV SPARK_APPLICATION_MAIN_CLASS my.main.Application
ENV SPARK_APPLICATION_ARGS ""

COPY submit.sh /

CMD ["/bin/bash", "/submit.sh"]
