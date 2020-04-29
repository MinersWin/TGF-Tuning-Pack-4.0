function DisableService {
    
    PARAM(
        $DisabledServices
    )
	
	foreach ($service in $DisabledServices)
	{
		Get-Service -Name $service -ErrorAction SilentlyContinue | Set-Service -StartupType Disabled
	}
	
}

function ManualService {
    
    PARAM(
        $ManualServices
    )

    foreach ($service in $ManualServices) {
		Get-Service -Name $service -ErrorAction SilentlyContinue | Set-Service -StartupType manual
    }
}



function AutoMaticService {
    
    PARAM(
        $AutoMaticServices
    )

    foreach ($service in $AutoMaticServices) {
		Get-Service -Name $service -ErrorAction SilentlyContinue | Set-Service -StartupType automatic
    }
}


function AutoMaticDelayedService {
    
    PARAM(
        $AutoMaticDelayedServices
    )

    foreach ($service in $AutoMaticDelayedServices) {
        Set-ItemProperty -Path "Registry::HKLM\System\CurrentControlSet\Services\$service" -Name "DelayedAutostart" -Value 1 -Type DWORD
    }
}



function StopService {
    
    PARAM(
        $StopServices
    )

    foreach ($service in $StopServices) {
        Start-Process "$env:WINDIR\system32\sc.exe", stop, $service -NoNewWindow -Wait
        while ((Get-Service -Name $service -ErrorAction SilentlyContinue | Select -ExpandProperty Status) -ne 'Stopped') {
            Start-Sleep -Seconds 10
        }
    }
}


function StartService {
    
    PARAM(
        $StartServices
    )

    foreach ($service in $StartServices) {
        Start-Process "$env:WINDIR\system32\sc.exe", start, $service -NoNewWindow -Wait
    }
}


function ServiceRecovery{
    param
    (
        [Parameter(Mandatory=$true)] $ServiceDisplayName,
        [string] $action1 = "restart",
        [int] $time1 =  30000, # in miliseconds
        [string] $action2 = "restart",
        [int] $time2 =  30000, # in miliseconds
        [string] $actionLast = "restart",
        [int] $timeLast = 30000, # in miliseconds
        [int] $resetCounter = 4000 # in seconds
    )

    $services = Get-CimInstance -ClassName 'Win32_Service' | Where-Object {$_.DisplayName -imatch $ServiceDisplayName}
    $action = $action1+"/"+$time1+"/"+$action2+"/"+$time2+"/"+$actionLast+"/"+$timeLast
 
    foreach ($service in $services){
        # https://technet.microsoft.com/en-us/library/cc742019.aspx
        $output = sc.exe failure $($service.Name) actions= $action reset= $resetCounter
    }
}
 
    