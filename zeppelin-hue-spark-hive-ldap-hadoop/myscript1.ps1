cd C:\D\Docker\docker-compose-master\zeppelin-hue-hive-ldap-hadoop
cls
docker rm -f $(docker ps -a -q)
Write-Host "Start my script"
docker network create hadoop-net
Write-Host "*******************************************************************************"
start powershell 'docker-compose -f docker-compose_ldap.yml up'
Write-Host "docker-compose_ldap.yml strat up"
Start-Sleep -Second 7
start powershell 'docker-compose -f docker-compose_postgresql.yaml up'
Write-Host "docker-compose_postgresql.yaml strat up"
Start-Sleep -Second 5
start powershell 'docker-compose -f docker-compose_namenode.yml up'
Write-Host "docker-compose_namenode.yml strat up"
Start-Sleep -Second 25
Write-Host "-------------------------------------------------------------------------------"
docker ps
Write-Host "-------------------------------------------------------------------------------"
$urls = @("http://localhost:6083","http://localhost:9870","http://localhost:9864")

foreach($url in $urls){
    Start-Process $url
}
