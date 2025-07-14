# 定義下載目標 URL 和本地存放路徑
$downloadUrl = "https://github.com/PowerShell/PowerShell/releases/download/v7.5.2/PowerShell-7.5.2-win-x64.msi"
$destinationPath = "D:\PowerShell-7.5.2-win-x64.msi"

# 使用 Invoke-WebRequest 下載檔案
Write-Host "正在下載 PowerShell MSI 安裝檔案..."
Invoke-WebRequest -Uri $downloadUrl -OutFile $destinationPath

# 確認檔案是否下載成功
if (Test-Path $destinationPath) {
    Write-Host "下載完成，開始執行安裝..."
    # 執行 MSI 安裝檔案
    # Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$destinationPath`" /quiet /norestart" -Wait
    Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$destinationPath`" /norestart" -Wait
    Write-Host "安裝完成！"
} else {
    Write-Host "下載失敗，請檢查網路連線或 URL 是否正確。"
}