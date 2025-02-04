
$Myenv = (Get-Content -Path ".\env.json") | ConvertFrom-Json
$MySQLexe = $Myenv[2].MySQL + "mysql.exe"
$MyINI_Feng = ".\Confidential\MyINI\Feng.ini"

& $MySQLexe --defaults-file=$MyINI_Feng

# Write-Host $MySQLexe

