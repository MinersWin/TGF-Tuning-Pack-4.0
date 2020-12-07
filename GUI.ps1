$MyDir = Split-Path $script:MyInvocation.MyCommand.Path
Set-Location $MyDir
Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'GUI.designer.ps1')
$tooltip = New-Object System.Windows.Forms.ToolTip
$Config = Import-LocalizedData -BaseDirectory .\Config\ -FileName Config.psd1
$WinVersion = [System.Environment]::OSVersion.Version.Major
$Language = Get-Content .\Config\Language.txt

####################################################################################################################################################
#Support us Function

if ($Language -eq "de-DE"){
    $SupportClick = [System.Windows.Forms.MessageBox]::Show("Willst du uns unterstützen?`nEin paar Browserfenster werden sich öffnen, du musst nichts machen. ;)","TGF Tuning Pack 4.3 by MinersWin",'YesNoCancel','Information')
} else {
    $SupportClick = [System.Windows.Forms.MessageBox]::Show("Do you want to support us?`nA few browser tabs will open, you don't have to do anything. ;)","TGF Tuning Pack 4.3 by MinersWin",'YesNoCancel','Information')
}
if ($SupportClick -ne "NO"){
    explorer "https://youtu.be/ftVBV-XmAP4"
    explorer "https://amzn.to/3dX3I7x"
    explorer "https://youtu.be/hRr6sEoUUd0"
    explorer "https://paypal.me/minerswin"
}

####################################################################################################################################################
#Write Log Function
function WriteLog {
    Param ([string]$t)
    Write-Output "$(Get-Date) $t" >> "$($MyDir)\Log\Latest.log"
}

#Einlesen der Einstellungen aus der Config Datei
if (Test-Path $MyDir\Log\Latest.log){
    $OldLog = Get-Content "$($MyDir)\Log\Latest.log"
    $OldLog[0]
    $NewName = $OldLog[0]
    $NewName = "$($NewName)-LOG"
    $NewName
    "$($MyDir)\Log\$($NewName).txt"
    Write-Output $OldLog >> "$($MyDir)\Log\$($NewName).txt"
    rm $MyDir\Log\Latest.log
} else {
    Write-Output ChickenHung
}

Write-Output (("{0:yyyy-MM-dd-HH-mm-ss}" -f (get-date)).ToString()) >> $MyDir\Log\Latest.log

####################################################################################################################################################
#Ballon Tool Tips
Function Invoke-BalloonTip {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory=$True,HelpMessage="Die Nachricht zum Anzeigen.")]
        [string]$Message,
        [Parameter(HelpMessage="Nachrichtentitel")]
         [string]$Title="Achtung $env:username",
        [Parameter(HelpMessage="Die Benachrichtigungsart: Info,Error,Warning,None")]
        [System.Windows.Forms.ToolTipIcon]$MessageType="Info",
        [Parameter(HelpMessage="The path to a file to use its icon in the system tray")]
        [string]$SysTrayIconPath='.\TGF_Tuning_Pack.exe',     
        [Parameter(HelpMessage="The number of milliseconds to display the message.")]
        [int]$Duration=1000
    )
    If (-NOT $script:balloon) {
        $script:balloon = New-Object System.Windows.Forms.NotifyIcon
        [void](Register-ObjectEvent -InputObject $balloon -EventName MouseDoubleClick -SourceIdentifier IconClicked -Action {
            Write-Verbose 'Disposing of balloon'
            $script:balloon.dispose()
            Unregister-Event -SourceIdentifier IconClicked
            Remove-Job -Name IconClicked
            Remove-Variable -Name balloon -Scope Global
        })
    }
    $path = Get-Process -id $pid | Select-Object -ExpandProperty Path
    $balloon.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($SysTrayIconPath)
    $balloon.BalloonTipIcon  = [System.Windows.Forms.ToolTipIcon]$MessageType
    $balloon.BalloonTipText  = $Message
    $balloon.BalloonTipTitle = $Title
    $balloon.Visible = $true
    $balloon.ShowBalloonTip($Duration)
    Write-Verbose "Ending function"
}

############################################################################################################################################
$MessageEnglish="
The tweaks have been successfully completed. If error messages have occurred, this is probably due to the selection of unsuitable tweaks such as removing Windows 10 apps under Windows 7.
We are not responsible for the consequences and possible damage to your systems. All tweaks were selected by you and confirmed several times.
If you have any questions or problems, please feel free to ask for a solution in the Discord, create a Thread in the Forums or join the TeamSpeak.
We would be happy to see your experiences and results. Feel free to post feedback in the Discord or the Forums.
Support for this and other tools: https://paypal.me/minerswin
Discord: https://discordapp.com/invite/qrXmqSq
TeamSpeak: ts.thegeekfreaks.de
Forum: forum.thegeekfreaks.de
"
############################################################################################################################################
#Funktion für BaloonTips
Add-Type -AssemblyName  System.Windows.Forms 
$script:balloon = New-Object System.Windows.Forms.NotifyIcon 
Unregister-Event  -SourceIdentifier IconClicked
[void](Register-ObjectEvent  -InputObject $balloon  -EventName MouseDoubleClick  -SourceIdentifier IconClicked  -Action {
    $script:balloon.dispose()
    Unregister-Event  -SourceIdentifier IconClicked
    Remove-Job -Name IconClicked
    Remove-Variable  -Name balloon  -Scope Global
  }) 
  $path = (Get-Process -id $pid).Path
  $balloon.Icon  = [System.Drawing.Icon]::ExtractAssociatedIcon($path) 
  $balloon.BalloonTipIcon  = [System.Windows.Forms.ToolTipIcon]::Warning
#___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________#


$balloon.BalloonTipText  = 'Starte TGF Tuning Pack 4.3'
$balloon.BalloonTipTitle  = "Achtung  $Env:USERNAME" 
$balloon.Visible  = $true 
$balloon.ShowBalloonTip(20) 
WriteLog "Starte TGF Tuning Pack 4.3"

Write-Host "

______________________________ ___________           .__                
\__    ___/  _____/\_   _____/ \__    ___/_ __  ____ |__| ____    ____  
  |    | /   \  ___ |    __)     |    | |  |  \/    \|  |/    \  / ___\ 
  |    | \    \_\  \|     \      |    | |  |  /   |  \  |   |  \/ /_/  >
  |____|  \______  /\___  /      |____| |____/|___|  /__|___|  /\___  / 
                 \/     \/                         \/        \//_____/  
             __________                __        _____     ________  
             \______   \_____    ____ |  | __   /  |  |    \_____  \ 
              |     ___/\__  \ _/ ___\|  |/ /  /   |  |_     _(__  < 
              |    |     / __ \\  \___|    <  /    ^   /    /       \
              |____|    (____  /\___  >__|_ \ \____   |  /\/______  /
                             \/     \/     \/      |__|  \/       \/                                                                              
 _             __  __ _                  __          ___       
| |           |  \/  (_)                 \ \        / (_)      
| |__  _   _  | \  / |_ _ __   ___ _ __ __\ \  /\  / / _ _ __  
| '_ \| | | | | |\/| | | '_ \ / _ \ '__/ __\ \/  \/ / | | '_ \ 
| |_) | |_| | | |  | | | | | |  __/ |  \__ \\  /\  /  | | | | |
|_.__/ \__, | |_|  |_|_|_| |_|\___|_|  |___/ \/  \/   |_|_| |_|
        __/ |                                                  
       |___/     
The Geek Freaks Tuning Pack 4.3 Update 04.12.2020
Download the newest Version: https://Github.com/MinersWin/TGF-Tuning-Pack-4.0/releases/
WE ASSUME NO RESPONSIBILITY FOR PROBLEMS WHICH COME WITH THE EXECUTION OF OUR PROGRAM!
This is a hobby project! Everything can create errors and problems! Use at your own risk!
WIR ÜBERNEHMEN KEINE VERANTWORTUNG FÜR PROBLEME DIE MIT DER AUSFÜHRUNG UNSERES PROGRAMMS EINHERGEHEN!
Das hier ist ein Hobbyprojekt! Alles kann Fehler und Probleme erzeugen! Benutzung auf eigene Gefahr!
TeamSpeak: ts.thegeekfreaks.de
Forum: forum.thegeekfreaks.de
Tutorials: youtube.com/thegeekfreaks
" -ForegroundColor Green
Write-Host "Forum: forum.thegeekfreaks.de" -ForegroundColor Green
$LabelTitle.Text = "TGF Tuning Pack 4.3"
Write-Host "Windoof $($WinVersion)"
WriteLog "Windows Version: $($WinVersion)"
WriteLog "User: $($env:username)"
WriteLog "Hostname: $($env:COMPUTERNAME)"

function Test-InternetConnection {
    while (!(test-connection 37.120.179.48 -Count 1 -Quiet)) {
    $Verbindungbesteht = $true
    break
    }
    if ($Verbindungbesteht){
        $script:Internet = $false
    } else {
        $script:Internet = $true
    }
    if ($Internet){
        "$(Get-Date) Internetconnection: Online"
        WriteLog "Internet: Online"
    } else {
        "$(Get-Date) Internetconnection: Offline"
        WriteLog "Internet: Offline"
    }
}
Test-InternetConnection
##################################################################################################################################################################################
if ($Language -eq "de-DE"){
[System.Windows.Forms.MessageBox]::Show("Dies ist ein Hobbyprojekt, wir geben dir Viele Möglichkeiten dein Windows einzustellen. Sei vorsichtig was du machst!.","The Geek Freaks Tuning Pack 4.3 by MinersWin",'OK','Info')
} else {
[System.Windows.Forms.MessageBox]::Show("This is a hobby project, we give you a lot of possibilities to adjust your Windows. Be careful what you do!","The Geek Freaks Tuning Pack 4.3 by MinersWin",'OK','Info')
}
WriteLog "Sprache $($Language)"
$FormTuningPack.Text = $Config.Application.Name

#New Update
if (Test-Path .\Config\Accept.dat){
    WriteLog "Found Accepted File, dont show Changelog again"
} else {
    WriteLog "First Startup, Show Changelog"
    .\Changelog\Changelog.ps1
    WriteLog "Changelog Accepted"
   Out-File -FilePath .\Config\Accept.dat
}


#Alles Ausgrauen
$PanelTemplates.Enabled = $false
$TabPage1.Enabled = $false
$TabPage2.Enabled = $false
$TabPageTools.Enabled = $false
$CheckBoxBackupRegistry.Enabled = $false
$CheckBoxBackupRecoveryPoint.Enabled = $false
$TabPage1.visible = $false
$TabPage2.visible = $false
$TabPageTools.Visible = $false
$TabPage5.Enabled = $false
$TabPage5.Visible = $false
$TabPage6.Enabled = $false
$TabPage6.Visible = $false
$TabPage8.Enabled = $false
$TabPage8.Visible = $false
$SpecialTweaks.Enabled = $false
$SpecialTweaks.Visible = $false
$TabControlMain.Controls.Remove($SpecialTweaks)

#$ButtonDonatePayPal PayPal Button
$ButtonDonatePayPal.Add_Click{(explorer https://paypal.me/minerswin);WriteLog "clicked on PayPal Button, YAY"}

#$PictureBoxBanner TuningPack.de Link onclick
$PictureBoxBanner.Add_Click{(explorer https://tuning-pack.de);WriteLog "Opened Tuning-Pack.de, Clicked on Banner"}


#German Language Image
$Picture2 = ".\Images\German.jpg"
$img2 = [System.Drawing.Image]::Fromfile($Picture2)
$ButtonLanguageGerman.BackgroundImage = $img2
$ButtonLanguageGerman.Text = ""


#English Language Image
$Picture3 = ".\Images\English.jpg"
$img3 = [System.Drawing.Image]::Fromfile($Picture3)
$ButtonLanguageEnglish.BackgroundImage = $img3
$ButtonLanguageEnglish.Text = ""



#All The Tools CHECK
function CheckTools{
    WriteLog "Checking for Tools"
    $Tools = Test-Path .\Tools
    if ($Tools){
        $LabelToolsDownloaded.ForeColor = "GREEN"
        $LabelToolsDownloaded.Text = "Tools found"
        $PanelToolsClean.Enabled = $true
        $PannelToolsDisinfect.Enabled = $true
        $PanelToolsRepair.Enabled = $true
        $PanelToolsOptimize.Enabled = $true
        $PanelToolsManual.Enabled = $true
        WriteLog "Tools Found"
    } else {
        $LabelToolsDownloaded.ForeColor = "RED"
        $LabelToolsDownloaded.Text = "Could not find the tools, please download first."
        $PanelToolsClean.Enabled = $false
        $PannelToolsDisinfect.Enabled = $false
        $PanelToolsRepair.Enabled = $false
        $PanelToolsOptimize.Enabled = $false
        $PanelToolsManual.Enabled = $false
        WriteLog "Tools not found, you have to Download them first"
    }
}
CheckTools
$ButtonToolsRefresh.Add_Click{(CheckTools)}

#Clipboard History
$Button44.Add_Click{(start cmd.exe 'cmd /c "echo off | clip"');WriteLog "Cleared Clipboard History"}
#System Propertys Performance
$Button15.Add_Click{(start SystemPropertiesPerformance.exe);WriteLog "Started SystemPropertiesPerformance Menu"}
#Download Tools
$ButtonToolsDownloadAllTools.Add_Click{
    Write-Host "Der Download Startet, dies kann je nach Internetgeschwindigkeit ca. 5-10 Minuten dauern. (500MB) `n The download starts, this may take about 5-10 minutes, depending on the internet speed. (500MB)"
    WriteLog "ToolDownload gestartet"
    if ($Internet){
        WriteLog "Internetverbindung besteht, Download wird gestartet"
        $url = "https://root3.minerswin.de/TGF/Tools.zip"
        $output = Join-Path -Path "$PWD" -ChildPath "Tools.zip"
        $start_time = Get-Date
        (New-Object System.Net.WebClient).DownloadFile($url, $output)
        Write-Host "Download fertiggestellt`nDownloadzeit: $((Get-Date).Subtract($start_time).Seconds) Sekunde(n)`nEntpacke Archiv ..."
        Expand-Archive -Path $output -DestinationPath .\
        Write-Host "Archiv erfolgreich entpackt, Lösche Temporäre Download Files ...."
        rm $output
        WriteLog "Download wurde abgeschlossen"
    } else {
        WriteLog "Verbindung zum Server kann nicht hergestellt werden"
        Write-Host "Keine Internetverbindung möglich. Bitte zu einem späteren Zeitpunkt erneut versuchen."
    }    
}

#Accept the Risk
$ButtonLetsGoDisclaimer.Add_Click{(Accept-Everything);WriteLog "Accepted Disclaimer"}
function Accept-Everything{
    if ($CheckBoxAcceptedDisclaimer.Checked){
        $TabPageHome.Enabled = $false
        $PanelTemplates.Enabled = $true
        $TabPage1.Enabled = $true  
        $TabPage2.Enabled = $true
        $TabPageTools.Enabled = $true
        $CheckBoxBackupRegistry.Enabled = $true
        $CheckBoxBackupRecoveryPoint.Enabled = $true
        $ButtonStart.Enabled = $true  
        $TabPage1.visible = $true
        $TabPage2.visible = $true
        $TabPageTools.Visible = $true
        $TabPageHome.Visible = $true
        $TabPage5.Enabled = $true
        $TabPage5.Visible = $true
        $TabPage6.Enabled = $true
        $TabPage6.Visible = $true
        $TabPage8.Enabled = $true
        $TabPage8.Visible = $true
        $TabControlMain.SelectedTab = $TabPage1
    } else {
        if ($Language -eq "de-DE"){
            [System.Windows.Forms.MessageBox]::Show("Bitte Akzeptieren","TGF Tuning Pack 4.3","OK","Error")
        } else {
            [System.Windows.Forms.MessageBox]::Show("Please Accept","TGF Tuning Pack 4.3","OK","Error")
        }
    }
}

#Close when Click Close
$buttonclose.Add_Click{WriteLog "TuningPack Closed";($FormTuningPack.Close())}

#Open Tool Folder
$ButtonToolsGotoFolder.Add_Click{(Start "$($MyDir)\");WriteLog "Opened the Tool Folder"}

#Make Everything German
$ButtonLanguageGerman.Add_Click{(Make-German)}

function Make-German{
    del .\Config\Language.txt
    Write-Output "de-DE" >> .\Config\Language.txt
    .\Update-German.ps1
    WriteLog "Changed Language to German"
}

#Translate to English
$ButtonLanguageEnglish.Add_Click{(Make-English)}
function Make-English{
    del .\Config\Language.txt
    Write-Output "en-EN" >> .\Config\Language.txt
    .\Update-Englisch.ps1
    WriteLog "Changed Langugage to English"
}

#Get Language 
if ($Language -eq "de-DE"){
    Make-German
} else {
    Make-English
}


#Add Ninite
$ButtonNinite.Add_Click{(.\Ninite\Ninite.ps1);WriteLog "Starte Ninite Client"}

#ComboBox Templates
$void = $ComboBoxTemplates.Items.Add("Best Performance")
$void = $ComboBoxTemplates.Items.Add("Maximum Battery Life")
$void = $ComboBoxTemplates.Items.Add("Maximum Privacy")
$void = $ComboBoxTemplates.Items.Add("Recommended")
$void = $ComboBoxTemplates.Items.Add("Clear")
$void = $ComboBoxTemplates.Items.Add("ULTIMATE PERFORMANCE")
$void = $ComboBoxTemplates.SelectedItem = "Clear"

#Progressbar Reset
$ProgressBarProgress.Value = 0
$LabelProgressPercent.Text = "0%"
$LabelProgressText.Text = "The Tweaks havent started yet. Click on 'Make FPS Rain!' to Start the Process!"

###################################################################################################################################################################################
#Main Tweak Function
###################################################################################################################################################################################
$ButtonStart.Add_Click{(Make-Tweaks)}
function Make-Tweaks{
    WriteLog "Clicked 'Make FPS Rain'"
    if ($Language -eq "de-DE"){
        Write-Host "Tuning Pack 4.3 by MinersWin: https://tuning-pack.de/"
        $msgBoxInput = [System.Windows.Forms.MessageBox]::Show("Tweaks werden ausgeführt. Bitte vor dem Bestätigen nochmal alle Tweaks Überprüfen. Hierbei kann einiges Kaputt gehen.","Tuning Pack Sicherheitswarnung",'YesNoCancel','Question')
        } else {
        Write-Host "Tuning Pack 4.3 by MinersWin: https://tuning-pack.de/"
        $msgBoxInput = [System.Windows.Forms.MessageBox]::Show("Tweaks are in progress. Please check all tweaks again before confirming. This can break some things.","Tuning Pack Security Warning",'YesNoCancel','Question')
        }
        switch  ($msgBoxInput) {
    
            'Yes' {
                WriteLog "Acccepted the Risk"
                Write-Host "YES" 
                Write-Host "Tweaks werden ausgeführt"
                TWEAK_THE_SHIT
            }
            'No' {
                WriteLog "Cancelled"
            }
            'Cancel' {
                WriteLog "Cancelled"
            }
        }
    }
function TWEAK_THE_SHIT{
    #Create RecoveryPoint
    WriteLog "Start the Tweaks ..."
    WriteLog
    WriteLog
    WriteLog
    if ($CheckBoxBackupRecoveryPoint.Checked){
        WriteLog "Created System Restore Point"
        wmic /namespace:\\root\default path SystemRestore call Enable C:\
        Write-Host "Die erstellung von Wiederherstellungspunkten wurde aktiviert"
        Checkpoint-Computer -Description "TGF_Tuning_Pack_4.3-$(Get-Date)"
        $Date = Get-Date
        Write-Host "Der Wiederherstellungspunkt wurde erstellt. Er trägt den Namen: $($Date) TGF Tuning Pack" -ForegroundColor Green
        WriteLog "Created System Restore Point with the Name: $($Date) TGF Tuning Pack"
    }
    if ($CheckBoxBackupRegistry.Checked){
        if ($Language -eq "de-DE"){
            $Backup = [System.Windows.Forms.MessageBox]::Show("Ein Backup der Registry wird ausgeführt. Eine Normale Windows Registry ist im Normalfall ca. 500mb Groß. Das Backup wird unter C:\RegBack\ Gespeichert.","TGF Tuning Pack 4.3 by MinersWin",'OK','Info')
            Write-Host "Ein Backup der Registry wird ausgeführt.... Eine Normale Windows Registry ist im Normalfall ca. 500mb Groß. Das Backup wird unter C:\RegBack\ Gespeichert." -ForegroundColor Green
        } else {
            $Backup = [System.Windows.Forms.MessageBox]::Show("The registry is backed up. A normal Windows registry is usually about 500mb in size. The backup is saved under C:\RegBack\.","TGF Tuning Pack 4.3 by MinersWin",'OK','Info')
            Write-Host "A backup of the registry is performed.... A normal Windows registry is normally about 500mb in size. The backup is stored under C:\RegBack\." -ForegroundColor Green
        }
        mkdir C:\RegBack\        
        WriteLog "Registry Backup started ..."
        reg export HKCR C:\RegBack\HKLM.Reg /y
        reg export HKCU C:\RegBack\HKCU.Reg /y
        reg export HKLM C:\RegBack\HKCR.Reg /y
        reg export HKU C:\RegBack\HKU.Reg /y
        reg export HKCC C:\RegBackHKCC.Reg /y
        WriteLog "Registry Backup finished"
}


    #Show Desktop Icon on Desktop
    if ($CheckBox1.Checked){
        reg import .\Scripts\Registry\Add_This-PC_Desktop_Icon.reg
        $ProgressBarProgress.Value = 1
        $LabelProgressPercent.Text = "1%"
        $LabelProgressText.Text = "The registry entry is added. The icon of 'This Computer' is now visible on the desktop."
        Write-Host "The registry entry is added. The icon of 'This Computer' is now visible on the desktop."
        WriteLog "The registry entry is added. The icon of 'This Computer' is now visible on the desktop."
    }
    #Show Network Icon on Desktop
    if ($CheckBox2.Checked){
        reg import .\Scripts\Registry\Add_Network_Desktop_Icon.reg
        $ProgressBarProgress.Value = 1
        $LabelProgressPercent.Text = "1%"
        $LabelProgressText.Text = "The registry entry is added. The icon of 'Network' is now visible on the desktop."
        Write-Host "The registry entry is added. The icon of 'Network' is now visible on the desktop."
        WriteLog "The registry entry is added. The icon of 'Network' is now visible on the desktop."
    }
    #Classic vertical Icon spacing
    if ($CheckBox3.Checked){
        reg import .\Scripts\Registry\Reset_Classic_Vertica_Icon_Spacing.reg
        $ProgressBarProgress.Value = 2
        $LabelProgressPercent.Text = "2%"
        $LabelProgressText.Text = "The default vertical icon spacing for the desktop is now set."
        Write-Host "The default vertical icon spacing for the desktop is now set."
        WriteLog "The default vertical icon spacing for the desktop is now set."
    }
    #Enable the ability to lock and unlock the taskbar
    if ($CheckBox4.Checked){
        reg import .\Scripts\Registry\Enable_ability_to_lock_and_unlock_taskbar.reg
        $ProgressBarProgress.Value = 2
        $LabelProgressPercent.Text = "2%"
        $LabelProgressText.Text = "Enable the Ability to lock and unlock the Taskbar."
        Write-Host "Enable the Ability to lock and unlock the Taskbar."
        WriteLog "Enable the Ability to lock and unlock the Taskbar."
    }
    if ($CheckBox5.Checked){
        reg import .\Scripts\Registry\Enable_Always_show_all_notification_area_icons_for_all_users.reg
        $ProgressBarProgress.Value = 3
        $LabelProgressPercent.Text = "3%"
        $LabelProgressText.Text = "Always show all Taskbar Icons and Notifications and restart explorer.exe"
        Write-Host "Always show all Taskbar Icons and Notifications and restart explorer.exe"
        WriteLog "Always show all Taskbar Icons and Notifications and restart explorer.exe"
    }
    if ($CheckBox6.Checked){
        reg import .\Scripts\Registry\Change-Delay-Time-Show-Taskbar-Thumbnails-to-10-sec.reg
        $ProgressBarProgress.Value = 3
        $LabelProgressPercent.Text = "3%"
        $LabelProgressText.Text = "Change the Time to Show Taskbar Thumbnails to 10 sec."
        Write-Host "Change the Time to Show Taskbar Thumbnails to 10 sec."
        WriteLog "Change the Time to Show Taskbar Thumbnails to 10 sec."
    }
    if ($CheckBox7.Checked){
        reg import .\Scripts\Registry\Enable_Control_Panel_and_Settings.reg
        $ProgressBarProgress.Value = 4
        $LabelProgressPercent.Text = "4%"
        $LabelProgressText.Text = "Enable Classic Control Panel View."
        Write-Host "Enable Classic Control Panel View."
        WriteLog "Enable Classic Control Panel View."
    }
    if ($CheckBox8.Checked){
        reg import .\Scripts\Registry\Permanently-disabling-sticky-keys.reg
        $ProgressBarProgress.Value = 4
        $LabelProgressPercent.Text = "4%"
        $LabelProgressText.Text = "Turn of Sticky Keys."
        Write-Host "Turn of Sticky Keys."
        WriteLog "Turn of Sticky Keys."
    }
    if ($CheckBox9.Checked){
        reg import .\Scripts\Registry\Permanently-disabling-sticky-keys.reg
        $ProgressBarProgress.Value = 5
        $LabelProgressPercent.Text = "5%"
        $LabelProgressText.Text = "Turn of Filter Keys."
        Write-Host "Turn of Filter Keys."
        WriteLog "Turn of Filter Keys."
    }
    if ($CheckBox10.Checked){
        reg import .\Scripts\Registry\Disable_Hibernate.reg
        $ProgressBarProgress.Value = 5
        $LabelProgressPercent.Text = "5%"
        $LabelProgressText.Text = "Disable Hibernation."
        Write-Host "Disable Hibernation."
        WriteLog "Disable Hibernation."
    }
    if ($CheckBox11.Checked){
        reg import .\Scripts\Registry\Turn_ON_underline_keyboard_shortcuts_in_menus.reg
        $ProgressBarProgress.Value = 6
        $LabelProgressPercent.Text = "6%"
        $LabelProgressText.Text = "Turned On the Underline of KeyBoard Shortcuts in Menus."
        Write-Host "Turned On the Underline of KeyBoard Shortcuts in Menus."
        WriteLog "Turned On the Underline of KeyBoard Shortcuts in Menus."
    }
    if ($CheckBox12.Checked){
        .\Scripts\Registry\Show_Known_Extensions_for_File_Types.vbs
        $ProgressBarProgress.Value = 6
        $LabelProgressPercent.Text = "6%"
        $LabelProgressText.Text = "Show Known File Extensions for File Types."
        Write-Host "Show Known File Extensions for File Types"
        WriteLog "Show Known File Extensions for File Types"
    }
    if ($CheckBox13.Checked){
        reg import .\Scripts\Registry\hide-ntfs-compression-blue-double-arrow-icon-overlay.reg
        $ProgressBarProgress.Value = 7
        $LabelProgressPercent.Text = "7%"
        $LabelProgressText.Text = "Hidden indication for compressed NTFS Files"
        Write-Host "Hidden indication for compressed NTFS Files"
        WriteLog "Hidden indication for compressed NTFS Files"
    }
    if ($CheckBox14.Checked){
        .\Scripts\Registry\Show_every_Hidden_File_in_Windows_Explorer.bat
        $ProgressBarProgress.Value = 7
        $LabelProgressPercent.Text = "7%"
        $LabelProgressText.Text = "Show every Hidden File in Windows Explorer"
        Write-Host "Show every Hidden File in Windows Explorer"
        WriteLog "Show every Hidden File in Windows Explorer"
    }
    if ($CheckBox15.Checked){
        .\Scripts\Registry\Show_Super_Hidden_Files_in_Windows_Explorer.bat
        $ProgressBarProgress.Value = 8
        $LabelProgressPercent.Text = "8%"
        $LabelProgressText.Text = "Show Super Hidden Files in Windows Explorer"
        Write-Host "Show Super Hidden Files in Windows Explorer"
        WriteLog "Show Super Hidden Files in Windows Explorer"
    }
    if ($CheckBox17.Checked){
        & '.\Scripts\Registry\Replace Utilman_with_CMD.bat'
        $ProgressBarProgress.Value = 8
        $LabelProgressPercent.Text = "8%"
        $LabelProgressText.Text = "Replaced Utilman with CMD"
        Write-Host "Replaced Utilman with CMD"
        WriteLog "Replaced Utilman with CMD"
    }
    if ($CheckBox18.Checked){
        .\Scripts\Registry\Add_the_option_Processor_performance_core_parking_min_core.bat
        $ProgressBarProgress.Value = 9
        $LabelProgressPercent.Text = "9%"
        $LabelProgressText.Text = "Added the option Processor performance core parking min core."
        Write-Host "Added the option Processor performance core parking min core."
        WriteLog "Added the option Processor performance core parking min core."
    }
    if ($CheckBox19.Checked){
        .\Scripts\Registry\Disable_CPU_Core_Parking.bat
        $ProgressBarProgress.Value = 9
        $LabelProgressPercent.Text = "9%"
        $LabelProgressText.Text = "Disabled CPU Core Parking"
        Write-Host "Disabled CPU Core Parking"
        WriteLog "Disabled CPU Core Parking"
    }
    if ($CheckBox20.Checked){
        .\Scripts\Registry\Remove_Logon_Scree_wallpaper-background.bat
        $ProgressBarProgress.Value = 10
        $LabelProgressPercent.Text = "10%"
        $LabelProgressText.Text = "Removed Logon screen wallpaper/background. Will use solid color instead (Accent color)"
        Write-Host "Removed Logon screen wallpaper/background. Will use solid color instead (Accent color)"
        WriteLog "Removed Logon screen wallpaper/background. Will use solid color instead (Accent color)"
    }
    if ($CheckBox21.Checked){
        .\Scripts\Registry\Disable_Lockscreen.bat
        $ProgressBarProgress.Value = 10
        $LabelProgressPercent.Text = "10%"
        $LabelProgressText.Text = "Disabled Lockscreen"
        Write-Host "Disabled Lockscreen"
        WriteLog "Disabled Lockscreen"
    }
    if ($CheckBox22.Checked){
        .\Scripts\Registry\Remove_versioning_tab_from_properties.bat
        $ProgressBarProgress.Value = 11
        $LabelProgressPercent.Text = "11%"
        $LabelProgressText.Text = "Removed versioning tab from properties"
        Write-Host "Removed versioning tab from properties"
        WriteLog "Removed versioning tab from properties"
    }
    if ($CheckBox23.Checked){
        .\Scripts\Registry\Disable_jump_lists.bat
        $ProgressBarProgress.Value = 11
        $LabelProgressPercent.Text = "11%"
        $LabelProgressText.Text = "Disabled jump lists"
        Write-Host "Disabled jump lists"
        WriteLog "Disabled jump lists"
    }
    if ($CheckBox24.Checked){
        .\Scripts\Registry\Disable_Windows_Error_Reporting.bat
        $ProgressBarProgress.Value = 12
        $LabelProgressPercent.Text = "12%"
        $LabelProgressText.Text = "Disabled Windows Error Reporting to Microsoft"
        Write-Host "Disabled Windows Error Reporting to Microsoft"
        WriteLog "Disabled Windows Error Reporting to Microsoft"
    }
    if ($CheckBox25.Checked){
        .\Scripts\Registry\Disable_Cortana.bat
        $ProgressBarProgress.Value = 12
        $LabelProgressPercent.Text = "12%"
        $LabelProgressText.Text = "Disabled Cortana (Speech Search Assistant, which also sends information to Microsoft"
        Write-Host "Disabled Cortana (Speech Search Assistant, which also sends information to Microsoft"
        WriteLog "Disabled Cortana (Speech Search Assistant, which also sends information to Microsoft"
    }
    if ($CheckBox26.Checked){
        .\Scripts\Registry\Hide_Search_Box_from_taskbar.bat
        $ProgressBarProgress.Value = 13
        $LabelProgressPercent.Text = "13%"
        $LabelProgressText.Text = "Hidden the search box from taskbar. You can still search by pressing the win key and start typing what you are looking for."
        Write-Host "Hidden the search box from taskbar. You can still search by pressing the win key and start typing what you are looking for"
        WriteLog "Hidden the search box from taskbar. You can still search by pressing the win key and start typing what you are looking for"
    }
    if ($CheckBox27.Checked){
        .\Scripts\Registry\Disable_MRU_lists.bat
        $ProgressBarProgress.Value = 13
        $LabelProgressPercent.Text = "13%"
        $LabelProgressText.Text = "Disabled MRU lists (jump lists) of XAML apps in Start Menu"
        Write-Host "Disabled MRU lists (jump lists) of XAML apps in Start Menu"
        WriteLog "Disabled MRU lists (jump lists) of XAML apps in Start Menu"
    }
    if ($CheckBox29.Checked){
        .\Scripts\Registry\Disable_MRU_Lists_Startmenu.bat
        $ProgressBarProgress.Value = 14
        $LabelProgressPercent.Text = "14%"
        $LabelProgressText.Text = "Disabled MRU lists (jump lists) of XAML apps in Start Menu"
        Write-Host "Disabled MRU lists (jump lists) of XAML apps in Start Menu"
        WriteLog "Disabled MRU lists (jump lists) of XAML apps in Start Menu"
    }
    if ($CheckBox30.Checked){
        .\Scripts\Registry\Disable_Creation_of_an_Advertising_ID.bat
        $ProgressBarProgress.Value = 14
        $LabelProgressPercent.Text = "14%"
        $LabelProgressText.Text = "Disabled creation of an Advertising ID"
        Write-Host "Disabled creation of an Advertising ID"
        WriteLog "Disabled creation of an Advertising ID"
    }
    if ($CheckBox31.Checked){
        .\Scripts\Registry\Remove_Pin_to_Start.bat
        $ProgressBarProgress.Value = 15
        $LabelProgressPercent.Text = "15%"
        $LabelProgressText.Text = "Removed Pin to start"
        Write-Host "Removed Pin to start"
        WriteLog "Removed Pin to start"
    }
    if ($CheckBox32.Checked){
        .\Scripts\Registry\Disable_Cortana_Bing_Search_and_Searchbar.bat
        $ProgressBarProgress.Value = 15
        $LabelProgressPercent.Text = "15%"
        $LabelProgressText.Text = "Disabled Cortana, Bing Search and Searchbar"
        Write-Host "Disabled Cortana, Bing Search and Searchbar"
        WriteLog "Disabled Cortana, Bing Search and Searchbar"
    }
    if ($CheckBox33.Checked){
        .\Scripts\Registry\Turn_off_the_Error_Dialog.bat
        $ProgressBarProgress.Value = 16
        $LabelProgressPercent.Text = "16%"
        $LabelProgressText.Text = "Turned off the Error Dialog"
        Write-Host "Turned off the Error Dialog"
        WriteLog "Turned off the Error Dialog"
    }
    if ($CheckBox34.Checked){
        .\Scripts\Registry\Disable_Administrative_Shares.bat
        $ProgressBarProgress.Value = 16
        $LabelProgressPercent.Text = "16%"
        $LabelProgressText.Text = "Disabled Administrative shares"
        Write-Host "Disabled Administrative shares"
        WriteLog "Disabled Administrative shares"
    }
    if ($CheckBox35.Checked){
        .\Scripts\Registry\Reboot_to_Recovery.bat
        $ProgressBarProgress.Value = 17
        $LabelProgressPercent.Text = "17%"
        $LabelProgressText.Text = "Added Reboot to Recovery to right-click menu of This PC"
        Write-Host "Added Reboot to Recovery to right-click menu of This PC"
        WriteLog "Added Reboot to Recovery to right-click menu of This PC"
    }
    if ($CheckBox36.Checked){
        .\Scripts\Registry\Change_Clock_and_Date_format_to_24H_metric.bat
        $ProgressBarProgress.Value = 17
        $LabelProgressPercent.Text = "17%"
        $LabelProgressText.Text = "Changed Clock and Date formats of current user to 24H, metric (Sign out required to see changes)"
        Write-Host "Changed Clock and Date formats of current user to 24H, metric (Sign out required to see changes)"
        WriteLog "Changed Clock and Date formats of current user to 24H, metric (Sign out required to see changes)"
    }
    if ($CheckBox37.Checked){
        .\Scripts\Registry\Enable_Developer_Mode.bat
        $ProgressBarProgress.Value = 18
        $LabelProgressPercent.Text = "18%"
        $LabelProgressText.Text = "Enabled Developer Mode (enables you to run XAML apps you develop in visual Studio which havent been certified yet)"
        Write-Host "Enabled Developer Mode (enables you to run XAML apps you develop in Visual Studio which havent been certified yet)"
        WriteLog "Enabled Developer Mode (enables you to run XAML apps you develop in Visual Studio which havent been certified yet)"
    }
    if ($CheckBox38.Checked){
        .\Scripts\Registry\Remove_Telemetry_and_Data_Collection.bat
        $ProgressBarProgress.Value = 18
        $LabelProgressPercent.Text = "18%"
        $LabelProgressText.Text = "Removed telemetry and data collection"
        Write-Host "Removed telemetry and data collection"
        WriteLog "Removed telemetry and data collection"
    }
    if ($CheckBox28.Checked){
        .\Scripts\Registry\Set_Windows_Explorer_to_Start_on_This_PC.bat
        $ProgressBarProgress.Value = 19
        $LabelProgressPercent.Text = "19%"
        $LabelProgressText.Text = "Set Windows Explorer to start on This PC instead of Quick Access"
        Write-Host "Set Windows Explorer to start on This PC instead of Quick Access"
        WriteLog "Set Windows Explorer to start on This PC instead of Quick Access"
    }
    if ($CheckBox16.Checked){
        .\Scripts\Registry\Prevent_Both_Windows_and_Office_from_creating_LNK_files.bat
        $ProgressBarProgress.Value = 19
        $LabelProgressPercent.Text = "19%"
        $LabelProgressText.Text = "Prevented both Windows and Office from creating LNK files in the Recents folder"
        Write-Host "Prevented both Windows and Office from creating LNK files in the Recent folder"
        WriteLog "Prevented both Windows and Office from creating LNK files in the Recent folder"
    }
    #
    # Removing Services tab
    #
    if ($CheckBox39.Checked){
        & '.\Scripts\Removing Services\DisableConnectedUserExperiencesandTelemetry.bat'
        $ProgressBarProgress.Value = 20
        $LabelProgressPercent.Text = "20%"
        $LabelProgressText.Text = "Disabled Connected User Experiences and Telemetry (To turn off Telemetry and Data collection)"
        Write-Host "Disabled Connected User Experiences and Telemetry (To turn off Telemetry and Data collection)"
        WriteLog "Disabled Connected User Experiences and Telemetry (To turn off Telemetry and Data collection)"
    }
    if ($CheckBox40.Checked){
        & '.\Scripts\Removing Services\DisableDiagnosticPolicyService.bat'
        $ProgressBarProgress.Value = 20
        $LabelProgressPercent.Text = "20%"
        $LabelProgressText.Text = "Disabled Diagnostic Policy Service"
        Write-Host "Disabled Diagnostic Policy Service"
        WriteLog "Disabled Diagnostic Policy Service"
    }
    if ($CheckBox41.Checked){
        & '.\Scripts\Removing Services\DisableDistributedLinkTrackingClient.bat'
        $ProgressBarProgress.Value = 21
        $LabelProgressPercent.Text = "21%"
        $LabelProgressText.Text = "Disabled Distributed Link Tracking Client (If your computer is not connected to any network)"
        Write-Host "Disabled Distributed Link Tracking Client (If your computer is not connected to any network)"
        WriteLog "Disabled Distributed Link Tracking Client (If your computer is not connected to any network)"
    }
    if ($CheckBox42.Checked){
        & '.\Scripts\Removing Services\DisableWAPPushMessageRoutingService.bat'
        $ProgressBarProgress.Value = 21
        $LabelProgressPercent.Text = "21%"
        $LabelProgressText.Text = "Disabled WAP Push Message Routing Service (To turn off Telemetry and Data Collection)"
        Write-Host "Disabled WAP Push Message Routing Service (To Turn off Telemetry and Data Collection)"
        WriteLog "Disabled WAP Push Message Routing Service (To Turn off Telemetry and Data Collection)"
    }
    if ($CheckBox43.Checked){
        & '.\Scripts\Removing Services\DisableDownloadedMapsManager.bat'
        $ProgressBarProgress.Value = 22
        $LabelProgressPercent.Text = "22%"
        $LabelProgressText.Text = "Disabled Downloaded Maps Manager (If you dont user Maps app)"
        Write-Host "Disabled Downloaded Maps Manager (If you dont use Maps app)"
        WriteLog "Disabled Downloaded Maps Manager (If you dont use Maps app)"
    }
    if ($CheckBox44.Checked){
        & '.\Scripts\Removing Services\DisableIPHelper.bat'
        $ProgressBarProgress.Value = 22
        $LabelProgressPercent.Text = "22%"
        $LabelProgressText.Text = "Disabled IP Helper (If you dont use IPv6 connection)"
        Write-Host "Disabled IP Helper (If you dont use IPv6 connection)"
        WriteLog "Disabled IP Helper (If you dont use IPv6 connection)"
    }
    if ($CheckBox45.Checked){
        & '.\Scripts\Removing Services\DisableProgramCompatibilityAssistantService.bat'
        $ProgressBarProgress.Value = 23
        $LabelProgressPercent.Text = "23%"
        $LabelProgressText.Text = "Disabled Program Compatibility Assistant Service"
        Write-Host "Disabled Program Compatibility Assistant Service"
        WriteLog "Disabled Program Compatibility Assistant Service"
    }
    if ($CheckBox46.Checked){
        & '.\Scripts\Removing Services\DisablePrintSpooler.bat'
        $ProgressBarProgress.Value = 23
        $LabelProgressPercent.Text = "23%"
        $LabelProgressText.Text = "Disabled Print Spooler (If you dont have a printer)"
        Write-Host "Disabled Print Spooler (If you dont have a printer)"
        WriteLog "Disabled Print Spooler (If you dont have a printer)"
    }
    if ($CheckBox47.Checked){
        & '.\Scripts\Removing Services\DisableRemoteRegistry.bat'
        $ProgressBarProgress.Value = 24
        $LabelProgressPercent.Text = "24%"
        $LabelProgressText.Text = "Disabled Remote Registry"
        Write-Host "Disabled Remote Registry"
        WriteLog "Disabled Remote Registry"
    }
    if ($CheckBox48.Checked){
        & '.\Scripts\Removing Services\DisableSecondaryLogon.bat'
        $ProgressBarProgress.Value = 24
        $LabelProgressPercent.Text = "24%"
        $LabelProgressText.Text = "Disabled Secondary Logon"
        Write-Host "Disabled Secondary Logon"
        WriteLog "Disabled Secondary Logon"
    }
    if ($CheckBox49.Checked){
        & '.\Scripts\Removing Services\DisableSecurityCenter.bat'
        $ProgressBarProgress.Value = 25
        $LabelProgressPercent.Text = "25%"
        $LabelProgressText.Text = "Disabled Security Center"
        Write-Host "Disabled Security Center"
        WriteLog "Disabled Security Center"
    }
    if ($CheckBox50.Checked){
        & '.\Scripts\Removing Services\IPNetBIOSHelper.bat'
        $ProgressBarProgress.Value = 25
        $LabelProgressPercent.Text = "25%"
        $LabelProgressText.Text = "Disabled TCP/IP NetBIOS Helper (If you are not in a workgroup network)"
        Write-Host "Disabled TCP/IP NetBIOS Helper (If you are not in a workgroup network)"
        WriteLog "Disabled TCP/IP NetBIOS Helper (If you are not in a workgroup network)"
    }
    if ($CheckBox51.Checked){
        & '.\Scripts\Removing Services\DisableTochKeyboardandHandwritingPanelService.bat'
        $ProgressBarProgress.Value = 26
        $LabelProgressPercent.Text = "26%"
        $LabelProgressText.Text = "Disabled Touch Keyboard and Handwriting Panel Service (If you want to use touch keyboard and handwriting features)"
        Write-Host "Disabled Touch Keyboard and Handwriting Panel Service (If you want to use touch keyboard and handwriting features)"
        WriteLog "Disabled Touch Keyboard and Handwriting Panel Service (If you want to use touch keyboard and handwriting features)"
    }
    if ($CheckBox52.Checked){
        & '.\Scripts\Removing Services\DisableWindowsErrorReportingService.bat'
        $ProgressBarProgress.Value = 26
        $LabelProgressPercent.Text = "26%"
        $LabelProgressText.Text = "Disabled Windows Error Reporting Service"
        Write-Host "Disabled Windows Error Reporting Service"
        WriteLog "Disabled Windows Error Reporting Service"
    }
    if ($CheckBox53.Checked){
        & '.\Scripts\Removing Services\DisableWindowsImageAcquisition.bat'
        $ProgressBarProgress.Value = 27
        $LabelProgressPercent.Text = "27%"
        $LabelProgressText.Text = "Disabled Windows Image Acquisition (WIA) (If you dont have a scannner)"
        Write-Host "Disabled Windows Image Acquisition (WIA) (If you dont have a scanner)"
        WriteLog "Disabled Windows Image Acquisition (WIA) (If you dont have a scanner)"
    }
    if ($CheckBox54.Checked){
        & '.\Scripts\Removing Services\DisableWindowsSearch.bat'
        $ProgressBarProgress.Value = 27
        $LabelProgressPercent.Text = "27%"
        $LabelProgressText.Text = "Disabled Windows Search"
        Write-Host "Disabled Windows Search"
        Writelog "Disabled Windows Search"
    }
    if ($CheckBox55.Checked){
        & '.\Scripts\Removing Services\DisableTrackingServices.bat'
        $ProgressBarProgress.Value = 28
        $LabelProgressPercent.Text = "28%"
        $LabelProgressText.Text = "Disabled Tracking Services"
        Write-Host "Disabled Tracking Services"
        WriteLog "Disabled Tracking Services"
    }

    #Scheduled Tasks

    #Disable SmartScreenSpecific
    if ($CheckBox86.Checked){
        .\Scripts\Batch\ScheduledTasks\SmartScreenSpecific.bat
        $ProgressBarProgress.Value = 28
        $LabelProgressPercent.Text = "28%"
        $LabelProgressText.Text = "Disabled Smart Screen Specific"
        Write-Host "Disabled SmartScreenSpecific"
        WriteLog "Disabled SmartScreenSpecific"
    }
    #Disable Microsoft Compatibility Appraiser
    if ($CheckBox87.Checked){
        .\Scripts\Batch\ScheduledTasks\Microsoft_Compatibility_Appraiser.bat
        $ProgressBarProgress.Value = 29
        $LabelProgressPercent.Text = "29%"
        $LabelProgressText.Text = "Disabled Microsoft Compatibility Appraiser"
        Write-Host "Disabled Microsoft Compatibility Appraiser"
        WriteLog "Disabled Microsoft Compatibility Appraiser"
    }
    #Disable Programm Data Updater
    if ($CheckBox88.Checked){
        .\Scripts\Batch\ScheduledTasks\ProgramDataUpdater.bat
        $ProgressBarProgress.Value = 29
        $LabelProgressPercent.Text = "29%"
        $LabelProgressText.Text = "Disabled Program Data Updater"
        Write-Host "Disabled Program Data Updater"
        WriteLog "Disabled Program Data Updater"
    }
    #Disable Startup App Task
    if ($CheckBox89.Checked){
        .\Scripts\Batch\ScheduledTasks\StartupAppTask.bat
        $ProgressBarProgress.Value = 30
        $LabelProgressPercent.Text = "30%"
        $LabelProgressText.Text = "Disabled Startup App Task"
        Write-Host "Disabled Startup App Task"
        WriteLog "Disabled Startup App Task"
    }
    #Disable Proxy
    if ($CheckBox90.Checked){
        .\Scripts\Batch\ScheduledTasks\Proxy.bat
        $ProgressBarProgress.Value = 30
        $LabelProgressPercent.Text = "30%"
        $LabelProgressText.Text = "Disabled Proxy"
        Write-Host "Disabled Proxy"
        WriteLog "Disabled Proxy"
    }
    #Disable Consolidator
    if ($CheckBox91.Checked){
        .\Scripts\Batch\ScheduledTasks\Consolidator.bat
        $ProgressBarProgress.Value = 31
        $LabelProgressPercent.Text = "31%"
        $LabelProgressText.Text = "Disabled Consolidator"
        Write-Host "Disabled Consolidator"
        WriteLog "Disabled Consolidator"
    }
    #Disable Kernel Ceip Task
    if ($CheckBox92.Checked){
        .\Scripts\Batch\ScheduledTasks\KernelCeipTask.bat
        $ProgressBarProgress.Value = 31
        $LabelProgressPercent.Text = "31%"
        $LabelProgressText.Text = "Disabled Kernel Ceip Task"
        Write-Host "Disabled Kernel Ceip Task"
        WriteLog "Disabled Kernel Ceip Task"
    }
    #Disable USB Ceip
    if ($CheckBox93.Checked){
        .\Scripts\Batch\ScheduledTasks\UsbCeip.bat
        $ProgressBarProgress.Value = 32
        $LabelProgressPercent.Text = "32%"
        $LabelProgressText.Text = "Disabled USBCeip"
        Write-Host "Disabled USBCeip"
        WriteLog "Disabled USBCeip"
    }
    #Disable Mirosoft Windows DiskDiagnosticDataCollector
    if ($CheckBox94.Checked){
        .\Scripts\Batch\ScheduledTasks\Microsoft-Windows-DiskDiagnosticDataCollector.bat
        $ProgressBarProgress.Value = 33
        $LabelProgressPercent.Text = "33%"
        $LabelProgressText.Text = "Disable Microsoft-Windows-DiskDiagnosticDataCollector"
        Write-Host "Disable Microsoft-Windows-DiskDiagnostikDataCollector"
        WriteLog "Disable Microsoft-Windows-DiskDiagnostikDataCollector"
    }
    #Disable File History (mainanance mode)
    if ($CheckBox95.Checked){
        .\Scripts\Batch\ScheduledTasks\File_History.bat
        $ProgressBarProgress.Value = 34
        $LabelProgressPercent.Text = "34%"
        $LabelProgressText.Text = "Disabled File History (maintanace mode)"
        Write-Host "Disabled File History (maintanace mode)"
        WriteLog "Disabled File History (maintanace mode)"
    }
    #Disable WinSAT
    if ($CheckBox96.Checked){
        .\Scripts\Batch\ScheduledTasks\WinSAT.bat
        $ProgressBarProgress.Value = 34
        $LabelProgressPercent.Text = "34%"
        $LabelProgressText.Text = "Disabled WinSAT"
        Write-Host "Disabled WinSAT"
        WriteLog "Disabled WinSAT"
    }
    #Disable Gather Network Info
    if ($CheckBox97.Checked){
        .\Scripts\Batch\ScheduledTasks\GatherNetworkInfo.bat
        $ProgressBarProgress.Value = 35
        $LabelProgressPercent.Text = "35%"
        $LabelProgressText.Text = "Disabled Gather Network Info"
        Write-Host "Disabled Gather Network Info"
        WriteLog "Disabled Gather Network Info"
    }
    #Disable Sqm-Tasks
    if ($CheckBox98.Checked){
        .\Scripts\Batch\ScheduledTasks\Sqm-Tasks.bat
        $ProgressBarProgress.Value = 35
        $LabelProgressPercent.Text = "35%"
        $LabelProgressText.Text = "Disabled Sqm-Tasks"
        Write-Host "Disabled Sqm-Tasks"
        WriteLog "Disabled Sqm-Tasks"
    }
    #Disable Force Syncronize Time
    if ($CheckBox99.Checked){
        .\Scripts\Batch\ScheduledTasks\ForceSynchronizeTime.bat
        $ProgressBarProgress.Value = 36
        $LabelProgressPercent.Text = "36%"
        $LabelProgressText.Text = "Disabled Force Syncronize Time"
        Write-Host "Disabled Force Syncronize Time"
        WriteLog "Disabled Force Syncronize Time"
    }
    #Disable Syncronize Time
    if ($CheckBox100.Checked){
        .\Scripts\Batch\ScheduledTasks\SynchronizeTime.bat
        $ProgressBarProgress.Value = 36
        $LabelProgressPercent.Text = "36%"
        $LabelProgressText.Text = "Disabled Syncronize Time"
        Write-Host "Disabled Syncronize Time"
        WriteLog "Disabled Syncronize Time"
    }
    #Disable Queue Reporting
    if ($CheckBox101.Checked){
        .\Scripts\Batch\ScheduledTasks\QueueReporting.bat
        $ProgressBarProgress.Value = 37
        $LabelProgressPercent.Text = "37%"
        $LabelProgressText.Text = "Disabled Queue Reporting"
        Write-Host "Disabled Queue Reporting"
        WriteLog "Disabled Queue Reporting"
    }
    #Disable Automatic App Update
    if ($CheckBox102.Checked){
        .\Scripts\Batch\ScheduledTasks\Automatic_App_Update.bat
        $ProgressBarProgress.Value = 37
        $LabelProgressPercent.Text = "37%"
        $LabelProgressText.Text = "Disabled Automatic App Update"
        Write-Host "Disabled Automatic App Update"
        WriteLog "Disabled Automatic App Update"
    }

    #Windows Default Apps

    #Remove 3D-Viewer
    if ($CheckBox80.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\3d.ps1'
        $ProgressBarProgress.Value = 38
        $LabelProgressPercent.Text = "38%"
        $LabelProgressText.Text = "Removed 3D-Viewer"
        Write-Host "Removed 3D-Viewer"
        WriteLog "Removed 3D-Viewer"
    }
    #Remove Bing
    if ($CheckBox103.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\bing.ps1'
        $ProgressBarProgress.Value = 38
        $LabelProgressPercent.Text = "38%"
        $LabelProgressText.Text = "Removed Bing"
        Write-Host "Removed Bing"
        WriteLog "Removed Bing"
    }
    #Remove Zune
    if ($CheckBox104.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\zune.ps1'
        $ProgressBarProgress.Value = 39
        $LabelProgressPercent.Text = "39%"
        $LabelProgressText.Text = "Removed Zune (Groove Music)"
        Write-Host "Removed Zune (Groove Music)"
        WriteLog "Removed Zune (Groove Music)"
    }
    #Remove Photo Viewer
    if ($CheckBox105.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\photo.ps1'
        $ProgressBarProgress.Value = 39
        $LabelProgressPercent.Text = "39%"
        $LabelProgressText.Text = "Removed Photo Viewer"
        Write-Host "Removed Photo Viewer"
        WriteLog "Removed Photo Viewer"
    }
    #Remove Windows Insider
    if ($CheckBox106.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\communi.ps1'
        $ProgressBarProgress.Value = 40
        $LabelProgressPercent.Text = "40%"
        $LabelProgressText.Text = "Removed Windows Community"
        Write-Host "Removed Windows Community"
        WriteLog "Removed Windows Community"
    }
    #Remove Solitare
    if ($CheckBox107.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\solit.ps1'
        $ProgressBarProgress.Value = 40
        $LabelProgressPercent.Text = "40%"
        $LabelProgressText.Text = "Removed Solitare"
        Write-Host "Removed Solitare"
        WriteLog "Removed Solitare"
    }
    #Remove Phone
    if ($CheckBox108.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\phone.ps1'
        $ProgressBarProgress.Value = 41
        $LabelProgressPercent.Text = "41%"
        $LabelProgressText.Text = "Removed Phone"
        Write-Host "Removed Phone"
        WriteLog "Removed Phone"
    }
    #Remove Soundrecorder
    if ($CheckBox109.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\soundrec.ps1'
        $ProgressBarProgress.Value = 41
        $LabelProgressPercent.Text = "41%"
        $LabelProgressText.Text = "Removed Soundrecorder"
        Write-Host "Removed Soundrecorder"
        WriteLog "Removed Soundrecorder"
    }
    #Remove Camera
    if ($CheckBox110.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\camera.ps1'
        $ProgressBarProgress.Value = 42
        $LabelProgressPercent.Text = "42%"
        $LabelProgressText.Text = "Removed Camera"
        Write-Host "Removed Camera"
        WriteLog "Removed Camera"
    }
    #Remove Microsoft People
    if ($CheckBox111.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\people.ps1'
        $ProgressBarProgress.Value = 42
        $LabelProgressPercent.Text = "42%"
        $LabelProgressText.Text = "Removed Microsoft People"
        Write-Host "Removed Microsoft People"
        WriteLog "Remove Microsoft People"
    }
    #Remove Office Live
    if ($CheckBox112.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\office.ps1'
        $ProgressBarProgress.Value = 43
        $LabelProgressPercent.Text = "43%"
        $LabelProgressText.Text = "Removed Office Live"
        Write-Host "Removed Ofiice Live"
        WriteLog "Removed Ofiice Live"
    }
    #Remove XBox
    if ($CheckBox113.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\xbox.ps1'
        $ProgressBarProgress.Value = 43
        $LabelProgressPercent.Text = "43%"
        $LabelProgressText.Text = "Removed XBox"
        Write-Host "Removed XBox"
        WriteLog "Removed XBox"
    }
    #Remove Remove OneDrive
    if ($CheckBox79.Checked){
        & '.\Scripts\Batch\Remove OneDrive\RemoveOneDrive.bat'
        $ProgressBarProgress.Value = 44
        $LabelProgressPercent.Text = "44%"
        $LabelProgressText.Text = "Removed OneDrive"
        Write-Host "Removed OneDrive"
        WriteLog "Removed OneDrive"
    }

    #Misc

    #Disable Windows Error Recovery in Startup
    if ($CheckBox81.Checked){
        & '.\Scripts\Batch\DisableWindowsErrorRecoveryonStartup.bat'
        $ProgressBarProgress.Value = 45
        $LabelProgressPercent.Text = "45%"
        $LabelProgressText.Text = "Disable Windows Error Recovery on Startup"
        Write-Host "Disable Windows Error Recovery on Startup"
        WriteLog "Disabled Windows Error Recovery on Startup"
    }
    #Internet Explorer 11 Tweaks
    if ($CheckBox82.Checked){
        & '.\Scripts\Batch\InternetExplorerTweaks.bat'
        $ProgressBarProgress.Value = 45
        $LabelProgressPercent.Text = "45%"
        $LabelProgressText.Text = "Applied Internet Explorer 11 Tweaks"
        Write-Host "Applied Internet Explorer 11 Tweaks"
        WriteLog "Applied Internet Explorer 11 Tweaks"
    }
    #Libary Tweaks
    if ($CheckBox83.Checked){
        if ($WinVersion -eq "10"){

        } else {
            & '.\Scripts\Batch\LibaryTweaks.bat'
        }
        $ProgressBarProgress.Value = 46
        $LabelProgressPercent.Text = "46%"
        $LabelProgressText.Text = "Applied Libary Tweaks"
        Write-Host "Applied Libary Tweaks"
        WriteLog "Applied Libary Twaks"
    }
    #Windows Update Tweaks
    if ($CheckBox84.Checked){
        & '.\Scripts\Batch\UpdateTweaks.bat'
        $ProgressBarProgress.Value = 46
        $LabelProgressPercent.Text = "46%"
        $LabelProgressText.Text = "Applied Windows Update Tweaks"
        Write-Host "Applied Windows Update Tweaks"
        WriteLog "Applied Windows Update Tweaks"
    }
    #Windows Defender Tweaks
    if ($CheckBox85.Checked){
        & '.\Scripts\Batch\WindowsDefenderTweaks.bat'
        $ProgressBarProgress.Value = 47
        $LabelProgressPercent.Text = "47%"
        $LabelProgressText.Text = "Applied Windows Defender Tweaks"
        Write-Host "Applied Windows Defender Tweaks"
        WriteLog "Applied Windows Defender Tweaks"
    }
    #Blocking Telemetry Servers
    if ($CheckBox56.Checked){
        & '.\Scripts\Batch\Blocking\Telemetry.bat'
        $ProgressBarProgress.Value = 47
        $LabelProgressPercent.Text = "47%"
        $LabelProgressText.Text = "Blocked Telemetry Servers"
        Write-Host "Blocked Telemetry Servers"
        WriteLog "Blocked Telemetry Servers"
    }
    #Blocking More Windows Servers
    if ($CheckBox78.Checked){
        & '.\Scripts\Batch\Blocking\BlockingMoreWindowsServers.bat'
        $ProgressBarProgress.Value = 48
        $LabelProgressPercent.Text = "48%"
        $LabelProgressText.Text = "Blocked more Windows Servers"
        Write-Host "Blocked more Windows Servers"
        WriteLog "Blocked more Windows Servers"
    }
    #Mouse Accelleration Fix
    if ($CheckBox114.Checked){
        .\Scripts\Registry\MouseFix\MouseAccelerationFix.ps1
        $ProgressBarProgress.Value = 48
        $LabelProgressPercent.Text = "48%"
        $LabelProgressText.Text = "Applied Mouse Accelleration Fix"
        Write-Host "Applied Mouse Accelleration Fix"
        WriteLog "Applied Mouse Acceleration Fix"
    }
    #Mouse Accelleration Fix
    if ($CheckBox114.Checked){
        reg import .\Scripts\Registry\Enable_Clipboard_History_for_all_users.reg
        $ProgressBarProgress.Value = 49
        $LabelProgressPercent.Text = "49%"
        $LabelProgressText.Text = "Enabled Clipboard History for all Users"
        Write-Host "Enabled Clipboard History for all Users"
        WriteLog "Enabled Clipboard History for all Users"
    }

    
    $ProgressBarProgress.Value = 100
    WriteLog "DONE"
    $LabelProgressPercent.Text = ":=)"
    $LabelProgressText.Text = "DONE"
    WriteLog "Die Tweaks wurden erfolgreich abgeschlossen."
    [System.Windows.Forms.MessageBox]::Show("Die Tweaks wurden erfolgreich abgeschlossen.","TGF Tuning Pack 4.2 by MinersWin",1)
    [System.Windows.Forms.MessageBox]::Show("$($MessageEnglish)","Tuning Pack",1)
    if ($Language -eq "de-DE"){
        Write-Host "100%" -ForegroundColor Blue
        Write-Host "Fertig" -ForegroundColor Blue
        Write-Host "--------------------------------------------------------------------------------------------------" -ForegroundColor Red
        Write-Host "Die Tweaks wurden erfolgreich abgeschlossen. Sollten Fehlermeldungen aufgetreten sein Liegt das wahrscheinlich am Auswählen nicht geeigneter Tweaks wie zum Beispiel Das entfernen von Windows 10 Apps unter Windows 7."  -ForegroundColor Green
        Write-Host "Wir Übernehmen keine Verantwortung für die Folgen und eventuelle Schäden an euren Systemen. Alle Tweaks wurden von euch Ausgewählt und mehrfach Bestätigt." -ForegroundColor Green
        Write-Host "Bei Fragen oder Problemen gerne im Discord nach Lösung Fragen, im Forum einen Thread erstellen oder auf den TeamSpeak joinen." -ForegroundColor Green
        Write-Host "Wir wärden uns Freuen eure Erfahrungen und Ergenisse zu sehen. Postet gerne Feedback im Discord." -ForegroundColor Green
        Write-Host "Unterstützung dieses und weiteren Tools: https://paypal.me/minerswin" -ForegroundColor Green
        Write-Host "Discord: https://discordapp.com/invite/qrXmqSq" -ForegroundColor Green
        Write-Host "TeamSpeak: ts.thegeekfreaks.de" -ForegroundColor Green
        Write-Host "Forum: forum.thegeekfreaks.de" -ForegroundColor Green
    } else {
        Write-Host "100%" -ForegroundColor Blue
        Write-Host "Done" -ForegroundColor Blue
        Write-Host "--------------------------------------------------------------------------------------------------" -ForegroundColor Red
        Write-Host "The tweaks have been successfully completed. If error messages have occurred, this is probably due to the selection of unsuitable tweaks such as removing Windows 10 apps under Windows 7."  -ForegroundColor Green
        Write-Host "We are not responsible for the consequences and possible damage to your systems. All tweaks were selected by you and confirmed several times." -ForegroundColor Green
        Write-Host "If you have any questions or problems, please feel free to ask for a solution in the Discord, create a Thread in the Forums or join the TeamSpeak." -ForegroundColor Green
        Write-Host "We would be happy to see your experiences and results. Feel free to post feedback in the Discord or the Forums." -ForegroundColor Green
        Write-Host "Support for this and other tools: https://paypal.me/minerswin" -ForegroundColor Green
        Write-Host "Discord: https://discordapp.com/invite/qrXmqSq" -ForegroundColor Green
        Write-Host "TeamSpeak: ts.thegeekfreaks.de" -ForegroundColor Green
        Write-Host "Forum: forum.thegeekfreaks.de" -ForegroundColor Green
    }

}

#Templates 
$ButtonCreateTemplate.Add_Click{($ShopLink = [System.Windows.Forms.MessageBox]::Show("In Version 5 (or 4.5 PRO)`nhttps://shop.thegeekfreaks.de","TGF Tuning Pack 4.3",1)); if ($ShopLink -eq "Cancel"){}else{explorer https://shop.thegeekfreaks.de}} #Will open the shop site, if OK is clicked
$ButtonApplyTemplate.Add_Click{(Apply-Template)}

function Apply-Template{
    if ($ComboBoxTemplates.SelectedItem -eq "Recommended"){
        .\Templates\Recommended.ps1
    }elseif ($ComboBoxTemplates.SelectedItem -eq "Best Performance"){
        .\Templates\BestPerformance.ps1
    }elseif ($ComboBoxTemplates.SelectedItem -eq "Maximum Battery Life"){
        .\Templates\SaveEnergy.ps1
    }elseif ($ComboBoxTemplates.SelectedItem -eq "Maximum Privacy"){
        .\Templates\Privacy.ps1
    }elseif ($ComboBoxTemplates.SelectedItem -eq "ULTIMATE PERFORMACE"){
        .\Templates\UltimatePerformance.ps1
    }elseif ($ComboBoxTemplates.SelectedItem -eq "Clear"){
        .\Templates\Clear.ps1
    }else{
        .\Templates\Recommended.ps1
    }
}

#Run script to Define the Tool Variables
.\Tools.ps1


#About Button
function About {
    # About Form Objects
    $aboutForm          = New-Object System.Windows.Forms.Form
    $aboutFormExit      = New-Object System.Windows.Forms.Button
    $aboutFormImage     = New-Object System.Windows.Forms.PictureBox
    $aboutFormNameLabel = New-Object System.Windows.Forms.Label
    $aboutFormText      = New-Object System.Windows.Forms.Label
    # About Form
    $aboutForm.AcceptButton  = $aboutFormExit
    $aboutForm.CancelButton  = $aboutFormExit
    $aboutForm.ClientSize    = "350, 110"
    $aboutForm.ControlBox    = $false
    $aboutForm.ShowInTaskBar = $false
    $aboutForm.StartPosition = "CenterParent"
    $aboutForm.Text          = "The Geek Freaks Tuning Pack 4.3"
    $aboutForm.Add_Load($aboutForm_Load)
    # About PictureBox
    $icon = [System.Drawing.Bitmap]::FromFile('.\Images\favicon.ico')
    $aboutFormImage.Image    = $icon
    $aboutFormImage.Location = "35, 15"
    $aboutFormImage.Size     = "64, 64"
    $aboutFormImage.SizeMode = "StretchImage"
    $aboutForm.Controls.Add($aboutFormImage)
    # About Name Label
    $aboutFormNameLabel.Font     = New-Object Drawing.Font("Microsoft Sans Serif", 9, [System.Drawing.FontStyle]::Bold)
    $aboutFormNameLabel.Location = "110, 20"
    $aboutFormNameLabel.Size     = "200, 18"
    $aboutFormNameLabel.Text     = "The Geek Freaks Tuning Pack 4.3"
    $aboutForm.Controls.Add($aboutFormNameLabel)
    # About Text Label
    $aboutFormText.Location = "100, 40"
    $aboutFormText.Size     = "300, 30"
    $aboutFormText.Text     = "          Created by MinersWin `n`r https://thegeekfreaks.de"
    $aboutFormText.Add_Click{(explorer https://thegeekfreaks.de); explorer https://youtube.com/minerswin; explorer https://miners.win}
    $aboutForm.Controls.Add($aboutFormText)
    # About Exit Button
    $aboutFormExit.Location = "135, 70"
    $aboutFormExit.Text     = "OK"
    $aboutForm.Controls.Add($aboutFormExit)
    [void]$aboutForm.ShowDialog()
} # End About


Apply-Template
$FormTuningPack.ShowDialog()
