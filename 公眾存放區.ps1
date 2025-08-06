<#
使用說明
1.刪除無用的資料
  資料量大優先處理，注意日期
2.創建使用者資料夾
3.複製舊資料
#>


if (!(Test-Path -Path D:\【公眾存放區】)) {

    New-Item D:\【公眾存放區】 -ItemType "directory"
    New-Item D:\【公眾存放區】\"_1.(教學)選定個人使用者資料夾" -ItemType "directory"
    New-Item D:\【公眾存放區】\"_2.(教學)滑鼠右鍵建立捷徑於桌面" -ItemType "directory"
    New-Item D:\【公眾存放區】\"_3.(教學)個人資料夾可儲存任何檔案" -ItemType "directory"
    New-Item D:\【公眾存放區】\"_4.(教學)記住個人使用者編號" -ItemType "directory"
    New-Item D:\【公眾存放區】\"_5.(教學)重新開機檔案不會消失" -ItemType "directory"
    New-Item D:\【公眾存放區】\"_6.(教學)可於本店任何電腦存取" -ItemType "directory"
    New-Item D:\【公眾存放區】\"_7.重要檔案請使用[雲端硬碟]" -ItemType "directory"
    New-Item D:\【公眾存放區】\"_8.病毒檔案自動刪除" -ItemType "directory"

    icacls.exe D:\【公眾存放區】 /inheritance:r
    icacls.exe D:\【公眾存放區】 /grant AngeloHu:F /T
    icacls.exe D:\【公眾存放區】 /grant Everyone:'(R)'

    $Parameters = @{
        Name       = '【公眾存放區】'
        Path       = 'D:\【公眾存放區】'
        FullAccess = 'Everyone'
        # FullAccess = 'RobotMachine\John'
    }
    New-SmbShare @Parameters
    
}

<# if (!(Test-Path -Path D:\【本店檔案區】)) {
    New-Item D:\【本店檔案區】 -ItemType "directory"
} #>

for ($i = 1; $i -le 500; $i++) {
    # if (!(Test-Path -Path D:\【公眾存放區】\使用者$i)) {
    # }
    New-Item D:\【公眾存放區】\使用者$i -ItemType "directory"
    icacls.exe D:\【公眾存放區】\使用者$i /grant AngeloHu:F /T
    icacls.exe D:\【公眾存放區】\使用者$i /inheritance:d
    icacls.exe D:\【公眾存放區】\使用者$i /grant Everyone:'(OI)(CI)(RC,GR,GW,GE,DC,RD,WD,AD,REA,WEA,X,DC,RA,WA)'
}

# 複製舊有的
for ($i = 1; $i -le 100; $i++) {
    Robocopy.exe Z:\使用者$i D:\【公眾存放區】\使用者$i /mir
}



<# 
Invoke-CimMethod -ClassName Win32_Share -MethodName Create -Arguments @{
    Path           = 'D:\【公眾存放區】'
    Name           = '【公眾存放區】'
    Type           = [uint32]0 #Disk Drive
    MaximumAllowed = [uint32]16777216
    Description    = 'public share folder folder'
}
 #>

# New-SmbShare @Parameters | Grant-SmbShareAccess -AccountName Everyone,Administrators -AccessRight Full

<# 
Powershell調用.NTE使用
    $NewAcl = Get-Acl -Path "D:\【公眾存放區】"
    $isProtected = $true
    $preserveInheritance = $false
    $identity = "AngeloHu"
    $fileSystemRights = "FullControl"
    $type = "Allow"

    $fileSystemAccessRuleArgumentList = $identity, $fileSystemRights, $type
    $fileSystemAccessRule = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $fileSystemAccessRuleArgumentList
    $NewAcl.SetAccessRuleProtection($isProtected, $preserveInheritance)
    $NewAcl.SetAccessRule($fileSystemAccessRule)

    Set-Acl -Path "D:\【公眾存放區】" -AclObject $NewAcl

 #>