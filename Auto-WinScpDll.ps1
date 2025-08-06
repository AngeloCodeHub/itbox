# --顯示.NET Framework版本
# Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP' -Recurse |
# Get-ItemProperty -Name Version -ErrorAction SilentlyContinue |
# Where-Object { $_.PSChildName -match '^(?!S)\p{L}'} |
# Select-Object PSChildName, Version

# 載入 WinSCP .NET assembly
try {
  Add-Type -Path ".\APPs\WinSCP\WinSCPnetStandard2.dll"
}
catch {
  Write-Error "無法載入 WinSCP .NET assembly: $_"
  exit
}

# 設置工作階段選項
# . ".\Confidential\Confidential.ps1"
Invoke-Expression -Command (Get-Content -Path ".\Confidential\Confidential.ps1" -Raw)
$sessionOptions = New-Object WinSCP.SessionOptions -Property $winscpProp
$session = New-Object WinSCP.Session

try {
  # 連接
  $session.Open($sessionOptions)
  
  # 您的程式碼
  Write-Host $session.HomePath

  $remotePath = "/mnt/flash/startup-config.conf"
  if ($session.FileExists($remotePath)) {
    Write-Host "File $remotePath exists"
    # Now you can e.g. download file using session.GetFiles
    $localPath = "$PWD\sourceDL\startup-config.conf"
    $transferOptions = New-Object WinSCP.TransferOptions
    $transferOptions.TransferMode = [WinSCP.TransferMode]::Binary
    $transferResult = $session.GetFiles($remotePath, $localPath, $False, $transferOptions)
    # Check to see if the transfer was successful
    if ($transferResult.IsSuccess) {
      Write-Host "File downloaded successfully to $localPath"
    }
    else {
      Write-Host "File download failed"
    }
    exit 0
  }
  else {
    Write-Host "File $remotePath does not exist"
    exit 1
  }
}
finally {
  $session.Dispose()
}
