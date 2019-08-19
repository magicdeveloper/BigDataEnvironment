SPARK_TAG := 2.4.3-hadoop3.2.0

build:
	docker build -t mdt/spark-base:$(SPARK_TAG) ./base
	docker build -t mdt/spark-master:$(SPARK_TAG) ./master
	docker build -t mdt/spark-worker:$(SPARK_TAG) ./worker
	# docker build -t mdt/spark-submit:$(SPARK_TAG ) ./submit

push:
	docker push mdt/spark-base:$(SPARK_TAG)
	docker push mdt/spark-master:$(SPARK_TAG)
	docker push mdt/spark-worker:$(SPARK_TAG)
	# docker push mdt/spark-submit:$(SPARK_TAG)
