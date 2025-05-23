
Mount-DiskImage -ImagePath 'C:\volumeD.vhdx'
Start-Sleep -Seconds 30
Disable-NetAdapterBinding -Name "乙太網路" -ComponentID ms_tcpip6
Start-Sleep -Seconds 2
Enable-NetAdapterBinding -Name "乙太網路" -ComponentID ms_tcpip6
