# docker images

### build Database images

    docker build -t mdt/metastore:9.6-hive2.3.4 ./docker-metastore-master
    docker build -t mdt/postgresql:9.6 ./docker-postgresql-master

### build hadoop cluster images

    docker build -t mdt/hadoop-base:3.2.0-debian ./docker-hadoop-master/base
    docker build -t mdt/hadoop-namenode:3.2.0-debian ./docker-hadoop-master/namenode
    docker build -t mdt/hadoop-datanode:3.2.0-debian ./docker-hadoop-master/datanode
    docker build -t mdt/hadoop-historyserver:3.2.0-debian ./docker-hadoop-master/historyserver
    docker build -t mdt/hadoop-resourcemanager:3.2.0-debian ./docker-hadoop-master/resourcemanager
    docker build -t mdt/hadoop-nodemanager:3.2.0-debian ./docker-hadoop-master/nodemanager
    docker build -t mdt/hadoop-submit:3.2.0-debian ./docker-hadoop-master/submit

### build hive images

    docker build -t mdt/hive:2.3.4-hadoop3.2.0 ./docker-hive-master

### build spark cluster images

    docker build -t mdt/spark-base:2.4.5-hadoop3.2.0 ./docker-spark-master/base
    docker build -t mdt/spark-conda:2.4.5-hadoop3.2.0 ./docker-spark-master/conda
    docker build -t mdt/spark-master:2.4.5-hadoop3.2.0 ./docker-spark-master/master
    docker build -t mdt/spark-submit:2.4.5-hadoop3.2.0 ./docker-spark-master/submit
    docker build -t mdt/spark-worker:2.4.5-hadoop3.2.0 ./docker-spark-master/worker

### build zeppelin image

    docker build -t mdt/zeppelin:0.8.2 ./docker-zeppelin-master/zeppelin

### build hue image

    docker build -t mdt/hue:4.4.0 ./docker-hue-master/hue
