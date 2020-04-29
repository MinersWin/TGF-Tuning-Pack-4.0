function DisableUac{

    $osversion = (Get-CimInstance Win32_OperatingSystem).Version 
    $version = $osversion.split(".")[0] 
 
    if ($version -eq 10) { 
        Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value "0" 
    } ElseIf ($Version -eq 6) { 
        $sub = $version.split(".")[1] 
        if ($sub -eq 1 -or $sub -eq 0) { 
            Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value "0" 
        } Else { 
            Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value "0" 
        } 
    } ElseIf ($Version -eq 5) { 
        Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value "0" 
    } Else { 
        Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value "0" 
    }

}


function EnableUac{

    $osversion = (Get-CimInstance Win32_OperatingSystem).Version 
    $version = $osversion.split(".")[0] 
 
    if ($version -eq 10) { 
        Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value "1" 
    } ElseIf ($Version -eq 6) { 
        $sub = $version.split(".")[1] 
        if ($sub -eq 1 -or $sub -eq 0) { 
            Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value "1" 
        } Else { 
            Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value "1" 
        } 
    } ElseIf ($Version -eq 5) { 
        Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value "0" 
    } Else { 
        Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value "1" 
    }

}