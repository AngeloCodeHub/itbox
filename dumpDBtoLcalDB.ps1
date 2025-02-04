
# dump（複製）遠端資料庫至本地資料庫

$Myenv = (Get-Content -Path ".\env.json") | ConvertFrom-Json
$Server = (Get-Content -Path ".\Confidential\MySQLServer.json") | ConvertFrom-Json

$dump = $Myenv[2].dumpExe
$DBname = $Server[0].DBname
$clientEXE = $Myenv[2].MyEXE
$iniFlile = ".\Confidential\my.ini"

& $dump --defaults-file=$iniFlile $DBname | & $clientEXE --defaults-file=$iniFlile --user root $DBname;

# write-host $iniFlile
# write-host $DBname


