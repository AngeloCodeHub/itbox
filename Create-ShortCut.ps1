
$WshShell = New-Object -ComObject WScript.Shell
$shortcut = $WshShell.CreateShortcut("APPs\WinSCP.lnk")
$shortcut.TargetPath = "$PWD\APPS\WinScp\WinSCP.exe"
$shortcut.Arguments = "/ini=$PWD\Confidential\INI_WinSCPINI\WinSCP.ini"
$shortcut.Save()

$WshShell = New-Object -ComObject WScript.Shell
$shortcut = $WshShell.CreateShortcut("APPs\Putty.lnk")
$shortcut.TargetPath = "$PWD\APPS\Putty\PUTTY.EXE"
$shortcut.Save()
