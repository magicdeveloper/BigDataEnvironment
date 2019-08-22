 
docker rm -f $(docker ps -a -q)
docker network create hadoop-net
docker-compose -f docker-compose_ldap.yml up
sleep 7s
docker-compose -f docker-compose_postgresql.yaml up
sleep 5s
docker-compose -f docker-compose_namenode.yml up
sleep 25s
firefox --new-window  http://localhost:6080
firefox --new-window  http://localhost:9870
firefox --new-window  http://localhost:9864
docker-compose -f docker-compose_resourcemanager.yml up
sleep 25s
docker-compose -f docker-compose_historyserver.yml up
sleep 25s
docker-compose -f docker-compose_hive-metastore.yml up
sleep 25s
docker-compose -f docker-compose_hive-server.yml up
sleep 25s
docker-compose -f docker-compose_spark.yaml up
sleep 25s
docker-compose -f docker-compose_hue.yml up
sleep 25s
firefox --new-window  http://localhost:8088
firefox --new-window  http://localhost:8188
firefox --new-window  http://localhost:5480
firefox --new-window  http://localhost:5780
firefox --new-window  http://localhost:8888