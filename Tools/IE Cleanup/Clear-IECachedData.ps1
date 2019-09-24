<#
	.SYNOPSIS
		Clears Internet Explorer Cached Data
	
	.DESCRIPTION
		A detailed description of the Clear-IECachedData function.
	
	.PARAMETER AddOnSettings
		Delete Files and Settings Stored by Add-Ons
	
	.PARAMETER All
		Delete All
	
	.PARAMETER Cookies
		Delete Cookies
	
	.PARAMETER FormData
		Delete Form Data
	
	.PARAMETER History
		Delete History
	
	.PARAMETER Passwords
		Delete Passwords
	
	.PARAMETER PipelineVariable
		A description of the PipelineVariable parameter.
	
	.PARAMETER TempIEFiles
		Delete Temporary Internet Files
	
	.EXAMPLE 1
		PS C:\> Clear-IECachedData -TempIEFiles
	
	.EXAMPLE 2
		PS C:\> Clear-IECachedData -Cookies

	.EXAMPLE 3
		PS C:\> Clear-IECachedData -History

	.EXAMPLE 4
		PS C:\> Clear-IECachedData -FormData

	.EXAMPLE 5
		PS C:\> Clear-IECachedData -Passwords

	.EXAMPLE 6
		PS C:\> Clear-IECachedData -All

	.EXAMPLE 7
		PS C:\> Clear-IECachedData -AddOnSettings
			
	.NOTES
		Feedback: TuningPack@MinersWin.DE
#>
function Clear-IECachedData
{
	[CmdletBinding(ConfirmImpact = 'None')]
	param
	(
		[Parameter(Mandatory = $false,
				   HelpMessage = ' Delete Temporary Internet Files')]
		[switch]
		$TempIEFiles,
		[Parameter(HelpMessage = 'Delete Cookies')]
		[switch]
		$Cookies,
		[Parameter(HelpMessage = 'Delete History')]
		[switch]
		$History,
		[Parameter(HelpMessage = 'Delete Form Data')]
		[switch]
		$FormData,
		[Parameter(HelpMessage = 'Delete Passwords')]
		[switch]
		$Passwords,
		[Parameter(HelpMessage = 'Delete All')]
		[switch]
		$All,
		[Parameter(HelpMessage = 'Delete Files and Settings Stored by Add-Ons')]
		[switch]
		$AddOnSettings
	)
	if ($TempIEFiles) { RunDll32.exe InetCpl.cpl, ClearMyTracksByProcess 8}
	if ($Cookies) { RunDll32.exe InetCpl.cpl, ClearMyTracksByProcess 2}
	if ($History) { RunDll32.exe InetCpl.cpl, ClearMyTracksByProcess 1}
	if ($FormData) { RunDll32.exe InetCpl.cpl, ClearMyTracksByProcess 16}
	if ($Passwords) { RunDll32.exe InetCpl.cpl, ClearMyTracksByProcess 32 }
	if ($All) { RunDll32.exe InetCpl.cpl, ClearMyTracksByProcess 255}
	if ($AddOnSettings) { RunDll32.exe InetCpl.cpl, ClearMyTracksByProcess 4351 }
}

Clear-IECachedData -Cookies