Function Set-FilePermissions {
    param (
     [parameter(Mandatory=$true)]
     [ValidateNotNullOrEmpty()]$File,
     [parameter(Mandatory=$true)]
     [ValidateNotNullOrEmpty()]$User,
     [parameter(Mandatory=$true)]
     [ValidateNotNullOrEmpty()]$Control,
     [parameter(Mandatory=$true)]
     [ValidateNotNullOrEmpty()]$Access
    )
 
    $ACL = Get-ACL "$File"
    Set-Acl -Path "$File" -AclObject $ACL
    $Permission = New-Object  system.security.accesscontrol.filesystemaccessrule("$User","$Control","$Access")
    $Acl.SetAccessRule($Permission)
    Set-Acl -Path "$File" -AclObject $ACL
 
}
 
Function Set-FileOwnership {
    param (
     [parameter(Mandatory=$true)]
     [ValidateNotNullOrEmpty()]$File,
     [parameter(Mandatory=$true)]
     [ValidateNotNullOrEmpty()]$User
    )
 
    $ACL = Get-ACL "$File"
    $Group = New-Object System.Security.Principal.NTAccount("$User")
    $ACL.SetOwner($Group)
    Set-Acl -Path "$File" -AclObject $ACL
 
}