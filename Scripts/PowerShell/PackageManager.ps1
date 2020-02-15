function PackageManagerSelect{
    Param
    (
        $PackageManager = "Chocolatey",
        $PackagesInstall,
        $PackagesUpdateTime = "8pm"
    )

    if($PackageManager -eq "Chocolatey"){
        ChocolateyPackageManager -PackagesInstall $PackagesInstall -PackagesUpdateTime $PackagesUpdateTime
    }

}



function ChocolateyPackageManager{

    Param
    (
        $PackagesInstall,
		$PackagesUpdateTime,
		$updatePath
    )

	Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    choco install chocolatey-core.extension --force
	choco upgrade chocolatey -y

    #Installing Packages
	$PackagesInstall | ForEach { choco install $_ --force -y }
}

function updateCompare
{
	param(
		$windowsPrograms,
		$libPath = "C:\ProgramData\chocolatey\lib\"
	)
	
	$safeList = @("Chocolatey", "Chocolatey Core Extensions")
	$chocoPackages = @()
	$chocoPackagesToUpdate = @()
	
	choco list -localonly | ForEach-Object {
		if ($_ -notmatch "packages installed.")
		{
			$chocoPackages += $_
		}
	}
	
	
	foreach ($singlePackage in $chocoPackages) {
		$chocoProgram, $chocoVersionRaw = $singlePackage.split(' ')
		$chocoVersion = $chocoVersionRaw -replace 'v', ''
		$chocoProgramTitleRaw = choco list -localonly --exact $chocoProgram --detail | Where-object { $_ -match "Title" }
		$chocoProgramTitle = $chocoProgramTitleRaw -replace"Title:", "" -replace "/\+/g", "\+" -replace '(.+?)\|.+', '$1' -replace '(.+?)\(.+', '$1' -replace "  ","" -replace '(.+?)\s(.+?)\-.+', '$1' -replace '([\s\-]{2})', '' | % { $_.trimEnd("-") } | % { $_.trim() } | ? { $_.trim() -ne "" }
		
		$programExists = $windowsPrograms | Where-Object { $_.Name -like "$chocoProgramTitle*" -and -not [string]::IsNullOrWhitespace($chocoProgramTitle)}
		
		if (!$programExists -and -not ([string]::IsNullOrEmpty($chocoProgram)) -and $safeList -notcontains $chocoProgramTitle)
		{

			if (Test-Path "$libPath$chocoProgram")
			{
				Remove-Item "$libPath$chocoProgram" -Recurse -Force
			}
			
		}
		
		
		
		if ($programExists -and -not ([string]::IsNullOrEmpty($chocoProgram)))
		{
			
			$pacakageWindowsVersionRounded = $programExists.Version -replace '\..*$', '' -replace 'v', ''
			$pacakageChocoVersionRounded = $chocoVersion -replace '\..*$', '' -replace 'v', ''
			$pacakageDeleteThresholdChoco = [int]$pacakageChocoVersionRounded + 2
			
			if ($chocoVersion -ge $programExists.Version)
			{
				$chocoPackagesToUpdate += $chocoProgram
			}
			
			if ($pacakageWindowsVersionRounded -ge $pacakageDeleteThresholdChoco)
			{
				if (Test-Path "$libPath$chocoProgram")
				{
					Remove-Item "$libPath$chocoProgram" -Recurse -Force
				}
			}
			
		}
	}
	
	#update Packages
	$chocoPackagesToUpdate | ForEach { choco upgrade $_ -y }
	
}
