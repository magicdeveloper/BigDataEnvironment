cd C:\D\Docker\docker-compose-master\zeppelin-hue-hive-ldap-hadoop
cls
docker rm -f $(docker ps -a -q)
Write-Host "Start my script"
docker network create hadoop-net
Write-Host "*******************************************************************************"
start powershell 'docker-compose -f docker-compose_ldap.yml up'
Write-Host "docker-compose_ldap.yml strat up"
Start-Sleep -Second 1
start powershell 'docker-compose -f docker-compose_postgresql.yaml up'
Write-Host "docker-compose_postgresql.yaml strat up"
Start-Sleep -Second 1
start powershell 'docker-compose -f docker-compose_namenode.yml up'
Write-Host "docker-compose_namenode.yml strat up"
Start-Sleep -Second 25
start powershell 'docker-compose -f docker-compose_resourcemanager.yml up'
Write-Host "docker-compose_resourcemanager.yml strat up"
Start-Sleep -Second 14 
start powershell 'docker-compose -f docker-compose_historyserver.yml up'
Write-Host "docker-compose_historyserver.yml strat up"
Start-Sleep -Second 10 
start powershell 'docker-compose -f docker-compose_hive-metastore.yml up'
Write-Host "docker-compose_hive-metastore.yml strat up"
Start-Sleep -Second 12
start powershell 'docker-compose -f docker-compose_hive-server.yml up'
Write-Host "docker-compose_hive-server.yml strat up"
Start-Sleep -Second 12
start powershell 'docker-compose -f docker-compose_spark.yaml up'
Write-Host "docker-compose_spark.yaml strat up"
Start-Sleep -Second 22
start powershell 'docker-compose -f docker-compose_hue.yml up'
Write-Host "docker-compose_hue.yml strat up"
Write-Host "-------------------------------"
Start-Sleep -Second 12
Write-Host "Congratulations! Your script executed successfully"
Write-Host "-------------------------------------------------------------------------------"
docker ps
Write-Host "-------------------------------------------------------------------------------"
$urls = @("http://localhost:6080","http://localhost:9870","http://localhost:9864","http://localhost:8088","http://localhost:8188","http://localhost:5480","http://localhost:5780","http://localhost:8888")

foreach($url in $urls){
    Start-Process $url
}
