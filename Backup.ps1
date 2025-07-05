# Export putty settings from registry
$puttyRegPath = "HKEY_CURRENT_USER\Software\SimonTatham\PuTTY"
$puttyRegBackupPath = "Confidential\putty-settings.reg"
reg export $puttyRegPath $puttyRegBackupPath /y

$env = (Get-Content -Path "Confidential\env.json") | ConvertFrom-Json
$BackupDst = $env[0].BackupDst `
  + (Get-Date -Format "ITBox-yyyyMMddHH") + ".zip"
# Write-Host $BackupDst
Compress-Archive -Path ".\Confidential" -DestinationPath $BackupDst -Force
