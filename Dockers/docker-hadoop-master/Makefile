DOCKER_NETWORK = hadoop-net
ENV_FILE = hadoop.env
HADOOP_TAG := 3.2.0-debian
HADOOP_VERSION := 3.2.0

build:
	docker build -t mdt/hadoop-base:$(HADOOP_TAG) ./base
	docker build -t mdt/hadoop-namenode:$(HADOOP_TAG) ./namenode
	docker build -t mdt/hadoop-datanode:$(HADOOP_TAG) ./datanode
	docker build -t mdt/hadoop-resourcemanager:$(HADOOP_TAG) ./resourcemanager
	docker build -t mdt/hadoop-nodemanager:$(HADOOP_TAG) ./nodemanager
	docker build -t mdt/hadoop-historyserver:$(HADOOP_TAG) ./historyserver
	docker build -t mdt/hadoop-submit:$(HADOOP_TAG) ./submit
	
push:
	docker push mdt/hadoop-base:$(HADOOP_TAG)
	docker push mdt/hadoop-namenode:$(HADOOP_TAG)
	docker push mdt/hadoop-datanode:$(HADOOP_TAG)
	docker push mdt/hadoop-resourcemanager:$(HADOOP_TAG)
	docker push mdt/hadoop-nodemanager:$(HADOOP_TAG)
	docker push mdt/hadoop-historyserver:$(HADOOP_TAG)
	docker push mdt/hadoop-submit:$(HADOOP_TAG)

app:
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} mdt/hadoop-submit:$(HADOOP_TAG)
