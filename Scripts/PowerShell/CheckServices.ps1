# Checks for a service to be running.


function CheckServiceAlert{
	param($ServiceName)
	$arrService = Get-Service -Name $ServiceName
	if ($arrService.Status -ne "Running"){
	    return $true	
	}
}

function CheckService{
	param($ServiceName)
	$arrService = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue
	if ($arrService)
	{
		if ($arrService.Status -ne "Running")
		{
			Start-Service $ServiceName
			Start-Sleep -s 120
			CheckServiceAlert $ServiceName
		}	
	}
}


function CheckAntiVirusStatus{
    param(
    $InstalledAV
    )
    
    $InstalledAntiVirusList = GetAntiVirusProduct
    
    If (-not ($InstalledAntiVirusList.name -contains $InstalledAV)){
        return $true
    }
}


function CheckAntiVirusDefinitions{

    $InstalledAntiVirusList = GetAntiVirusProduct

    $DefinitionStatus = $InstalledAntiVirusList."Definition Status"
    If ($DefinitionStatus -ne "Up to date"){

        return $true

    }
}




