
function GetCpuTemperature {
    $t = Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace "root/wmi"
    $returntemp = @()

    foreach ($temp in $t.CurrentTemperature){
        $currentTempKelvin = $temp / 10
        $currentTempCelsius = $currentTempKelvin - 273.15
        $returntemp += $currentTempCelsius  
    }
    return $returntemp
}

function CriticalCpuTemperature{

    Param
    (
        $MaxCpuTemperature
    )

    $CpuTemperatureResults = GetCpuTemperature

    foreach ($CpuTemperatureResult in $CpuTemperatureResults){

        if ($CpuTemperatureResult -gt $MaxCpuTemperature){

            $timeout = new-timespan -Minutes 5
            $sw = [diagnostics.stopwatch]::StartNew()
            while ($sw.elapsed -lt $timeout){

                $t = Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace "root/wmi"
                $returntemp = @()

                foreach ($temp in $t.CurrentTemperature){
                    $currentTempKelvin = $temp / 10
                    $currentTempCelsius = $currentTempKelvin - 273.15
                    $returntemp += $currentTempCelsius
                
                    if ($returntemp  -lt $MaxCpuTemperature){
                        return $false
                    }  
                }

                start-sleep -seconds 20
            }

            return $true

        }  
        else{
            return $false
        } 
    }
}


