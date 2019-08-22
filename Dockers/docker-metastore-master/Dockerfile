FROM postgres:9.6

LABEL MAINTAINER = "moahmed ghname <engmghnam@gmail.com>" 
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
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

COPY hive-schema-2.3.0.postgres.sql /hive/hive-schema-2.3.0.postgres.sql
COPY hive-txn-schema-2.3.0.postgres.sql /hive/hive-txn-schema-2.3.0.postgres.sql

COPY init-hive-db.sh /docker-entrypoint-initdb.d/init-user-db.sh
