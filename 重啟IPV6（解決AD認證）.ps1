Start-Sleep -Seconds 30
Disable-NetAdapterBinding -Name "乙太網路" -ComponentID ms_tcpip6
Start-Sleep -Seconds 5
Enable-NetAdapterBinding -Name "乙太網路" -ComponentID ms_tcpip6

<# 
PS C:\Users\user> get-netConnectionProfile

Name                     : 網路
InterfaceAlias           : 乙太網路
InterfaceIndex           : 6
NetworkCategory          : Public
DomainAuthenticationKind : None
IPv4Connectivity         : Internet
IPv6Connectivity         : NoTraffic


PS C:\Users\user> Enable-NetAdapterBinding -Name "乙太網路" -ComponentID ms_tcpip6
PS C:\Users\user> get-netConnectionProfile

Name                     : domain.com
InterfaceAlias           : 乙太網路
InterfaceIndex           : 6
NetworkCategory          : DomainAuthenticated
DomainAuthenticationKind : Ldap
IPv4Connectivity         : Internet
IPv6Connectivity         : NoTraffic
#>
