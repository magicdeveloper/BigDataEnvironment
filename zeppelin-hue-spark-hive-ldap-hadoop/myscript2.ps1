Write-Host "-------------------------------"
start powershell 'docker-compose -f docker-compose_resourcemanager.yml up'
Write-Host "docker-compose_resourcemanager.yml strat up"
Start-Sleep -Second 16 
start powershell 'docker-compose -f docker-compose_historyserver.yml up'
Write-Host "docker-compose_historyserver.yml strat up"
Start-Sleep -Second 10 
start powershell 'docker-compose -f docker-compose_hive-metastore.yml up'
Write-Host "docker-compose_hive-metastore.yml strat up"
Start-Sleep -Second 11
start powershell 'docker-compose -f docker-compose_hive-server.yml up'
Write-Host "docker-compose_hive-server.yml strat up"
Start-Sleep -Second 11
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
$urls = @("http://localhost:8088","http://localhost:8188","http://localhost:5480","http://localhost:5780","http://localhost:8888")

foreach($url in $urls){
    Start-Process $url
}
