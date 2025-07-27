$PSNativeCommandArgumentPassing = "Legacy"
Set-Location -Path "C:\Script"
. "C:\Users\AD-angelo\Documents\Confidential.ps1"
$plinkExe = "C:\APPs\PLINK.EXE"
$winscpCOM = "C:\APPs\WinSCP.com"
$patchFile = ".\Command-Switch.sh"

for ($i = 1; $i -le 3; $i++) {
  switch ($i) {
    1 { 
      $filname = "Switch-$i" + "_IntCRC_" + (Get-Date -Format "yyyyMMdd") + ".log" 
      $patch = @"
show interface > $filname
clear counters
logout
"@
      $patch | Out-File -FilePath $patchFile -Encoding ASCII
      Get-Content $patchFile | & $plinkExe -ssh $switchIP_1 -l $switchUser -pw $switchPass -P $switchPort
      & $winscpCOM `
        /command `
        "open sftp://${switchUser}:${switchPass}@${switchIP_1}:${switchPort}/ -hostkey=`"`"ssh-ed25519 255 VRkn+rZKvXcHd6lZlycNhZGXfUQ0tCwYbGOd1vS4GMU`"`"" `
        "cd /mnt/flash" `
        "lcd D:\Backup" `
        "get $filname" `
        "exit"
    }

    2 { 
      $filname = "Switch-$i" + "_IntCRC_" + (Get-Date -Format "yyyyMMdd") + ".log" 
      $patch = @"
show interface > $filname
clear counters
logout
"@
      $patch | Out-File -FilePath $patchFile -Encoding ASCII
      Get-Content $patchFile | & $plinkExe -ssh $switchIP_2 -l $switchUser -pw $switchPass -P $switchPort
      & $winscpCOM `
        /command `
        "open sftp://${switchUser}:${switchPass}@${switchIP_2}:${switchPort}/ -hostkey=`"`"ssh-ed25519 255 VRkn+rZKvXcHd6lZlycNhZGXfUQ0tCwYbGOd1vS4GMU`"`"" `
        "cd /mnt/flash" `
        "lcd D:\Backup" `
        "get $filname" `
        "exit"
    }

    3 { 
      $filname = "Switch-$i" + "_IntCRC_" + (Get-Date -Format "yyyyMMdd") + ".log" 
      $patch = @"
show interface > $filname
clear counters
logout
"@
      $patch | Out-File -FilePath $patchFile -Encoding ASCII
      Get-Content $patchFile | & $plinkExe -ssh $switchIP_3 -l $switchUser -pw $switchPass -P $switchPort
      & $winscpCOM `
        /command `
        "open sftp://${switchUser}:${switchPass}@${switchIP_3}:${switchPort}/ -hostkey=`"`"ssh-ed25519 255 VRkn+rZKvXcHd6lZlycNhZGXfUQ0tCwYbGOd1vS4GMU`"`"" `
        "cd /mnt/flash" `
        "lcd D:\Backup" `
        "get $filname" `
        "exit"
    }
    default { Write-Output "Unknown value" }
  }
}

