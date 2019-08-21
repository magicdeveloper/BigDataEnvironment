Write-Host "-------------------------------"
start powershell 'docker-compose -f docker-compose_resourcemanager.yml up'
Write-Host "docker-compose_resourcemanager.yml strat up"

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
