# 需要 PowerShell 7.3 或更新的版本
$PSNativeCommandArgumentPassing = "Legacy"
# /log="C:\指向\記錄\的\可寫入\路徑\WinSCP.log" /ini=nul `

& "D:\WorkSpace\itbox\APPs\WinSCP\WinSCP.com" `
  /command `
    "open sftp://username:password@8.8.8.8:22/ -hostkey=`"`"ssh-ed25519 255 VRkn+rZKvXcHd6lZlycNhZGXfUQ0tCwYbGOd1vS4GMU`"`"" `
    "cd /mnt/flash" `
    "lcd D:\log" `
    "get example.log" `
    "exit"
