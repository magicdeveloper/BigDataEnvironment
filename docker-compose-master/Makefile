ZEPPELIN_TAG := 0.8.1
up:
	mkdir -p data
	mkdir -p notebook
& "C:\D\Docker\docker-compose-master\zeppelin-hue-hive-ldap-hadoop\myscript1.ps1"
& "C:\D\Docker\docker-compose-master\zeppelin-hue-hive-ldap-hadoop\myscript2.ps1"
cd C:\D\Docker\docker-compose-master\zeppelin-hue-hive-ldap-hadoop

docker network create hadoop-net
docker-compose -f docker-compose_ldap.yml up
docker-compose -f docker-compose_postgresql.yaml up
docker-compose -f docker-compose_namenode.yml up
docker-compose -f docker-compose_resourcemanager.yml up
docker-compose -f docker-compose_historyserver.yml up
docker-compose -f docker-compose_hive-metastore.yml up
docker-compose -f docker-compose_hive-server.yml up
docker-compose -f docker-compose_spark.yaml up
docker-compose -f docker-compose_hue.yml up
 
 
ldap-admin: 			http://localhost:6080
hadoop-NameNode:		http://localhost:9870
hadoop-DataNode:		http://localhost:9864
hadoop-resourcemanager:	http://localhost:8088
hadoop-historyserver:	http://localhost:8188
hive-server:			http://localhost:10000
spark-master:			http://localhost:5480
zeppelin:				http://localhost:5780
Hue:					http://localhost:8888

localhost:9870
localhost:9870
down:
	docker-compose down
	docker network rm spark-net
	# rm -rf data
	# rm -rf notebook

push:
	docker push mdt/zeppelin:$(ZEPPELIN_TAG)

Start-Process powershell -Verb runAs
Start-Process  cd C:\D\Docker\docker-compose-master\zeppelin-hue-hive-ldap-hadoop
start powershell
$arguments = New-Object System.Collections.ArrayList
$arguments += "Write-Host 'start your script'" 
$arguments += "Write-Host '1'"
$arguments +=  "Write-Host '2'"
Start-Process powershell -Verb runAs -Argument $arguments
	Start-Process powershell -Verb runAs   "Write-Host '1'" 
	 start powershell  -NoExit    "Write-Host '1'"  
 start powershell -NoExit -Command "&\{ Get-Counter '\\savdalvs01\Cluster Shared Volumes(\ClusterStorage\Volume1)\IO Writes' -Continuous \}"