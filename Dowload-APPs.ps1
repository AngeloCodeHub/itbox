if (-Not (Test-Path -Path "sourceDL")) {
  New-Item -Path "sourceDL" -ItemType Directory
}

# WinSCP
$VWinSCP = "6.3.6"
if (-Not (Test-Path -Path "APPs\WinSCP")) {
  New-Item -Path "APPs\WinSCP" -ItemType Directory
}
$winscpWeb = "https://winscp.net/download/WinSCP-" + $VWinSCP + "-Portable.zip/download"
$comLib = "https://winscp.net/download/WinSCP-" + $VWinSCP + "-Automation.zip/download"
Start-Process msedge -ArgumentList $winscpWeb
Start-Process msedge -ArgumentList $comLib
Invoke-WebRequest -Uri `
  https://winscp.net/translations/dll/$VWinSCP/ch.zip `
  -OutFile "sourceDL\winscpCH.zip"
if (-Not (Test-Path -Path "APPs\WinSCP\WinSCP.ch")) {
  Expand-Archive -Path "sourceDL\winscpCH.zip" -DestinationPath "APPs\WinSCP"
}

# keepass password safe
$VKeePass = "2.57.1"
if (-Not (Test-Path -Path "APPs\keepass")) {
  New-Item -Path "APPs\keepass" -ItemType Directory
}
$keepassWeb = "https://sourceforge.net/projects/keepass/files/KeePass%202.x/" + $VKeePass + "/KeePass-" + $VKeePass + ".zip/download"
Start-Process msedge -ArgumentList $keepassWeb

# putty
if (-Not (Test-Path -Path "APPs\Putty")) {
  New-Item -Path "APPs\Putty" -ItemType Directory
}
Invoke-WebRequest -Uri `
  https://the.earth.li/~sgtatham/putty/latest/w64/putty.zip `
  -OutFile "sourceDL\putty.zip"
Expand-Archive -Path "sourceDL\putty.zip" -DestinationPath "APPs\Putty"

# winbox
$VWinbox = "3.41"
Invoke-WebRequest -Uri `
  https://download.mikrotik.com/routeros/winbox/$VWinbox/winbox64.exe `
  -OutFile "APPs\winbox64.exe"
