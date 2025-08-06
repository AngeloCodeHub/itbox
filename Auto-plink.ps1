<# 
1.設定檔程式化（利用powershell產生switch原生指令稿）
2.plink.exe執行switch指令稿
#>
# $patch = @"
# configure terminal
# http server load flash:/DT-6054GTX-4-V2_webImage_v7.3.0.21.b06.bin
# service https enable
# yes
# exit
# "@
# $patchFile = ".\build\Command-Switch.sh"
# $patch | Out-File -FilePath $patchFile -Encoding ASCII

# --Example
# Invoke-Expression -Command (Get-Content -Path ".\Confidential\Confidential.ps1" -Raw)
. ".\Confidential\Confidential.ps1"
$plinkExe = ".\APPs\Putty\PLINK.EXE"

# --直接連線
& $plinkExe -ssh $switchIP -l $switchUser -pw $switchPass -P $switchPort

# --執行指令稿
# $patchFile = ".\build\Command-Switch.sh"
# Get-Content $patchFile | & $plinkExe -ssh $switchIP -l $switchUser -pw $switchPass -P $switchPort



