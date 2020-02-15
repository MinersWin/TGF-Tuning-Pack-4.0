function Set-PowerPlan {

        Param
        (
            $PowerPlan = "high performance"
        )

        $PowerPlan = $PowerPlan.toLower()
        $perf = powercfg -l | %{if($_.toLower().contains($PowerPlan)) {$_.split()[3]}}
        $currentPlan = $(powercfg -getactivescheme).split()[3]

        if ($currentPlan -ne $perf) {
            powercfg -setactive $perf
        }
}

function Set-PowerSaver {
    Set-PowerPlan("power saver")
}

function Set-PowerHighPerformance {
    Set-PowerPlan("high performance")
}

function Set-PowerBalanced {
    Set-PowerPlan("balanced")
}

function Set-ScreenSaverTimeout([Int32]$value)
{
    $seconds = $value * 60
    Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name ScreenSaveTimeOut -Value $seconds

    if ($value -eq 0) {
        Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name ScreenSaveActive -Value 0
    }
    else {
        Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name ScreenSaveActive -Value 1
    }
}

function Set-DisplaySleep([int]$MonitorOff = 15, [int]$ComputerSleep = 30, [int]$screenSaver = 10) {
    POWERCFG -change -standby-timeout-ac $ComputerSleep;
    POWERCFG -change -monitor-timeout-ac $MonitorOff
    Set-ScreenSaverTimeout $screenSaver;
}

function Set-PresentationModeOff() {
    # use the defaults we set up earlier
    Set-DisplaySleep;
    Set-PowerBalanced;
}

function Set-PresentationModeOn() {
    Set-DisplaySleep -monitor 0 -sleep 0 -screenSaver 0;
    Set-PowerHighPerformance;
}