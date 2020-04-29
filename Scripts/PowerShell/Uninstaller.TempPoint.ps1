 function UninstallPup { 
 
 Param
    (
        $ProgramList,
        $PupList
    )

    foreach ($Program in $ProgramList){
        foreach ($Pup in $PupList){
            if ($Program.Name -eq $Pup) {
                cmd /c $Program.UninstallString /S
            }
        }
    }
}


 function UninstallWindowsApps { 
 
 Param
    (
        $WindowsApps
    )

    foreach ($app in $WindowsApps) {
        
        #Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -AllUsers
        Get-AppxPackage -AllUsers "'*$app*'" | Remove-AppxPackage

        Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -Like "'*$app*'"} | ForEach-Object { Remove-AppxProvisionedPackage -Online -PackageName $_.PackageName}
    }

}



