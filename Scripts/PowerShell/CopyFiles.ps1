function CopyFiles{

    param(
        $CopyFile
    )

    if($CopyFile.EndPath -eq "Desktop"){
        
        $EndPath = [Environment]::GetFolderPath($CopyFile.EndPath)

    }
    else{
        $EndPath = $CopyFile.EndPath
    }

    if (!(Test-Path ($EndPath + $CopyFile.Name))){
        
        $Path = $CopyFile.StartPath + $CopyFile.Name

        Copy-Item -Path $Path -Destination $EndPath

    }
    
}




