######################################################################################################################################################################################
### All the Tools ###
######################################################################################################################################################################################
#Process Killer
function Test_Kill_Process{
    $Kill_Process = Test-Path .\Scripts\ProcessKiller-Tuning-Pack.bat
    if ($Kill_Process){
        $ButtonToolsKillProcess.Add_Click{(Kill-Process)}
        $ButtonToolsKillProcess.ForeColor = 'Green'
    } else {
        $ButtonToolsKillProcess.Add_Click{(Download_Kill-Process)}
        $ButtonToolsKillProcess.ForeColor = 'RED'
    }
    }
    function Kill-Process{
        [System.Windows.Forms.MessageBox]::Show("Prozesse werden beendet","TGF Tuning Pack 4.1",1)
        Write-Host "Prozesse werden beendet."
        & '.\Scripts\ProcessKiller-Tuning-Pack.bat'
        Write-Host "Die Prozesse wurden beendet"
        Test_Kill_Process
    }
    function Download_Kill-Process{
        Set-Location .\Scripts\
        wget 'http://download.tuning-pack.de/TGF/Scripts/ProcessKiller-Tuning-Pack.bat' -OutFile 'ProcessKiller-Tuning-Pack.bat' -UseBasicParsing
        Set-Location .\..\
        Test_Kill_Process
    }
    #Internet Explorer Cleanup
    function Test_IE_Clean{
        $IE_Clean = Test-Path '.\Tools\IE Cleanup\Clear-IECachedData.ps1'
        if ($IE_Clean){
            $Button4.Add_Click{(IE_Clean)}
            $Button4.ForeColor = 'Green'
        } else {
            $Button4.Add_Click{(Download_IE_Clean)}
            $Button4.ForeColor = 'RED'
        }
        }
        function IE_Clean{
            & '.\Tools\IE Cleanup\Clear-IECachedData.ps1'
        }
        function Download_IE_Clean{
            Set-Location .\Tools\
            wget 'http://download.tuning-pack.de/TGF/Tools/IE%20Cleanup.zip' -OutFile 'IE_Cleanup.zip' -UseBasicParsing
            Expand-Archive .\IE_Cleanup.zip -DestinationPath .\
            Set-Location .\..\
            Test_IE_Clean
        }
    #CCleaner
    function Test_CCleaner{
        $IE_Clean = Test-Path '.\Tools\CCleaner\CCleaner.exe'
        if ($IE_Clean){
            $ButtonToolsCCleaner.Add_Click{(CCleaner)}
            $ButtonToolsCCleaner.ForeColor = 'Green'
        } else {
            $ButtonToolsCCleaner.Add_Click{(Download_CCleaner)}
            $ButtonToolsCCleaner.ForeColor = 'RED'
        }
        }
        function CCleaner{
            .\Tools\CCleaner\CCleaner.exe
        }
        function Download_CCleaner{
            Set-Location .\Tools\
            wget 'http://download.tuning-pack.de/TGF/Tools/CCleaner.zip' -OutFile 'CCleaner.zip' -UseBasicParsing
            Expand-Archive .\CCleaner.zip -DestinationPath .\
            Set-Location .\..\
            Test_CCleaner
        }
    #BleachBit
    function Test_BleachBit{
        $IE_Clean = Test-Path '.\Tools\BleachBit\bleachbit.exe'
        if ($IE_Clean){
            $ButtonToolsBleachBit.Add_Click{(BleachBit)}
            $ButtonToolsBleachBit.ForeColor = 'Green'
        } else {
            $ButtonToolsBleachBit.Add_Click{(Download_BleachBit)}
            $ButtonToolsBleachBit.ForeColor = 'RED'
        }
        }
        function BleachBit{
            .\Tools\BleachBit\bleachbit.exe
        }
        function Download_BleachBit{
            Set-Location .\Tools\
            wget 'http://download.tuning-pack.de/TGF/Tools/BleachBit.zip' -OutFile 'BleachBit.zip' -UseBasicParsing
            Expand-Archive .\BleachBit.zip -DestinationPath .\
            Set-Location .\..\
            Test_BleachBit
        }
    #Temp File Cleanup
    function Test_TFC{
        $IE_Clean = Test-Path '.\Tools\Temp File Cleanup\Cleanup.ps1'
        if ($IE_Clean){
            $ButtonToolsTempFileCleanup.Add_Click{(TFC)}
            $ButtonToolsTempFileCleanup.ForeColor = 'Green'
        } else {
            $ButtonToolsTempFileCleanup.Add_Click{(Download_TFC)}
            $ButtonToolsTempFileCleanup.ForeColor = 'RED'
        }
        }
        function TFC{
            & '.\Tools\Temp File Cleanup\Cleanup.ps1'
        }
        function Download_TFC{
            Set-Location .\Tools\
            wget 'http://download.tuning-pack.de/TGF/Tools/Temp%20File%20Cleanup.zip' -OutFile 'TempFileCleanup.zip' -UseBasicParsing
            Expand-Archive .\TempFileCleanup.zip -DestinationPath .\
            rm TempFileCleanup.zip
            Set-Location .\..\
            Test_TFC
        }
    #USB Device Cleanup
    function Test_USBDeviceCleanup{
        $IE_Clean = Test-Path '.\Tools\Drive Cleanup\DriveCleanup.exe'
        if ($IE_Clean){
            $ButtonToolsUSBDeviceCleanup.Add_Click{(USBDeviceCleanup)}
            $ButtonToolsUSBDeviceCleanup.ForeColor = 'Green'
        } else {
            $ButtonToolsUSBDeviceCleanup.Add_Click{(Download_USBDeviceCleanup)}
            $ButtonToolsUSBDeviceCleanup.ForeColor = 'RED'
        }
        }
        function USBDeviceCleanup{
            & '.\Tools\Drive Cleanup\DriveCleanup.exe'
        }
        function Download_USBDeviceCleanup{
            Set-Location .\Tools\
            wget 'http://download.tuning-pack.de/TGF/Tools/Drive%20Cleanup.zip' -OutFile 'DriveCleanup.zip' -UseBasicParsing
            Expand-Archive .\DriveCleanup.zip -DestinationPath .\
            rm DriveCleanup.zip
            Set-Location .\..\
            Test_USBDeviceCleanup
        }
    
    #Cleanup Duplicate Downloads
    ###FIXME###
    
    #$ButtonToolsCleanupDuplicateDownloads.Add_Click{([System.Windows.Forms.MessageBox]::Show("WIP","TGF Tuning Pack 4.1"1))}
    
    #Clear Windows event logs
    #$ButtonToolsClearWindowsEventLogs.ForeColor = 'GREEN'
    $ButtonToolsClearWindowsEventLogs.Add_Click{(Clear-EventLog Application,Security,System)}
    #Clear Windows Update Cache
    function Test_Clear-UpdateCache{
        $IE_Clean = Test-Path '.\Tools\Clear Update Cache\Erase_Cache.bat'
        if ($IE_Clean){
            $ButtonToolsClearWindowsUpdateCache.Add_Click{(Clear-UpdateCache)}
            $ButtonToolsClearWindowsUpdateCache.ForeColor = 'Green'
        } else {
            $ButtonToolsClearWindowsUpdateCache.Add_Click{(Download_Clear-UpdateCache)}
            $ButtonToolsClearWindowsUpdateCache.ForeColor = 'RED'
        }
        }
        function Clear-UpdateCache{
            & '.\Tools\Clear Update Cache\Erase_Cache.bat'
        }
        function Download_Clear-UpdateCache{
            Set-Location .\Tools\
            wget 'http://download.tuning-pack.de/TGF/Tools/Clear%20Update%20Cache.zip' -OutFile 'ClearUpdateCache.zip' -UseBasicParsing
            Expand-Archive .\ClearUpdateCache.zip -DestinationPath .\
            rm ClearUpdateCache.zip
            Set-Location .\..\
            Test_Clear-UpdateCache
        }
    #Clear CryptNet SSL Cache
    $ButtonToolsClearCryptNetSSLCache.Add_Click{(Clear-SSL)}
    function Clear-SSL{
        certutil -URLcache * delete
    }
    #Malwarebytes
    $ButtonToolsMalwarebytesAntiMalware.Add_Click{(Malwarebytes)}
    function Malwarebytes{
        .\Tools\Malwarebytes\mb3-setup-consumer-3.8.3.2965-1.0.613-1.0.11878.exe
    }
    #Kaspersky Virus Removal Tool
    function KVRT{
        .\Tools\KVRT\KVRT.exe
    }
    $ButtonToolsKasperskyVirusRemovalTool.Add_Click{(KVRT)}
    #Sophos Virus Removal Tool
    $ButtonToolsNetAdapterRepair.Add_Click{(Sophos)}
    function Sophos{
        & '.\tools\Sophos Virus Removal Tool\Sophos Virus Removal Tool.exe'
    }
    #MSI installer Cleanup
    $ButtonToolsMSIInstallerCleanup.Add_Click{(Installer-Cleanup)}
    function Installer-Cleanup{
        [System.Windows.Forms.MessageBox]::Show("Diese funktion ist momentan nicht verfÃ¼gbar, Microsoft hat dieses Feature eingestellt. Ich arbeite momentan an einer Alternative","TGF Tuning Pack 4.1 by MinersWin",1)
    }
    #System File Checker
    $ButtonToolsSystemFileChecker.Add_Click{(System-File-Checker)}
    function System-File-Checker{
        [System.Windows.Forms.MessageBox]::Show("Es wird sich gleich ein Konsolenfenster Ã¶ffnen, in welchem ein Windows Image heruntergeladen wird, mit welchem das System auf Fehler geprÃ¼ft wird. Das Image wird nach Abschluss des Vorgangs wieder gelÃ¶scht. Zum BestÃ¤tigen OK drÃ¼cken","TGF Tuning Pack 4.1 by MinersWin",1)    
        & '.\Tools\System File Checker\Check.bat'
    }
    #DISM image check and repair
    $ButtonToolsDISMImageCheckandRepair.Add_Click{(System-File-Checker)}
    #CheckDisk
    $buttontoolschkdsk.Add_Click{(start cmd.exe 'chkdsk C: /f /r')}
    #Network Repair
    $ButtonToolsNetworkRepair.Add_Click{(Network-Repair)}
    function Network-Repair{
        ipconfig /flushdns
        netsh interface ip delete arpcache
        netsh winsock reset catalog
    }
    #Page File Reset
    $ButtonToolsPageFileReset.Add_Click{(Page-File-Reset)}
    function Page-File-Reset{
        C: computersystem where name="%computername%" set AutomaticManagedPagefile=True
    }
    #Defraggler
    $ButtonToolsDefraggler.Add_Click{(Defraggler-Start)}
    function Defraggler-Start{
        .\Tools\Defraggler\Defraggler64.exe
    }
    $ButtonToolsADSSpy.Add_Click{(ADSSPy)}
    function ADSSPy{
        .\Tools\ADSSpy\ADSSpy.exe
    }
    #Adwcleaner
    $ButtonToolsAdwCleaner.Add_Click{(ADWCleaner)}
    function ADWCleaner{
        .\Tools\AdwCleaner\adwcleaner_7.4.1.exe
    }
    #aswMBR
    $ButtonToolsaswMBR.Add_Click{(aswMBR)}
    function aswMBR{
        .\Tools\aswMBR\aswmbr.exe
    }
    #autorun
    $buttontoolsautorun.Add_Click{(autorun)}
    function autorun{
        .\Tools\autorun\Autoruns64.exe
    }
    #PCHunter
    $ButtonToolsPCHunter.Add_Click{(PCHunter)}
    function PCHunter{
        .\Tools\PCHunter\PCHunter64.exe
    }
    #Net Adapter Repair
    $ButtonToolsNetAdapterRepair.Add_Click{(Net-Adapter-Repair)}
    function Net-Adapter-Repair{
        .\tools\NetAdapterRepair\NetAdapterRepair1.2.exe
    }
    #ParkControl
    $ButtonToolsParkControl.Add_Click{(Park-Control)}
    function Park-Control{
        .\Tools\ParkControl\ParkControl.exe
    }
    #System Recovery
    $ButtonToolsSystemRecovery.Add_Click{(System-Recovery)}
    function System-Recovery{
        rstrui.exe
    }
    #Reboot to Recovery
    $ButtonToolsReboottoRecovery.Add_Click{(Reboot-Recovery)}
    function Reboot-Recovery{
        shutdown /r /o /f /t 00
    }
    
    function Refresh_Tools{
    #Test_Kill_Process
    #Test_IE_Clean
    #Test_CCleaner
    #Test_BleachBit
    #Test_TFC
    #Test_USBDeviceCleanup
    #Test_Clear-UpdateCache
    }
    Refresh_Tools