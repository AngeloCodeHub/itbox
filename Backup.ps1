# Export putty settings from registry
$puttyRegPath = "HKEY_CURRENT_USER\Software\SimonTatham\PuTTY"
$puttyRegBackupPath = "Confidential\putty-settings.reg"
reg export $puttyRegPath $puttyRegBackupPath /y

$jsonObj = (Get-Content -Path "Confidential\env.json") | ConvertFrom-Json
$BackupDst = $jsonObj[0].DestDir + "Confidential\" `
  + (Get-Date -Format "yyyyMMddHH") + ".zip"
# Write-Host $BackupDst
Compress-Archive -Path ".\Confidential" -DestinationPath $BackupDst -Force
