$MyDir = Split-Path $script:MyInvocation.MyCommand.Path
Set-Location $MyDir
Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'GUI.designer.ps1')
$tooltip = New-Object System.Windows.Forms.ToolTip
$Config = Import-LocalizedData -BaseDirectory .\Config\ -FileName Config.psd1
$WinVersion = [System.Environment]::OSVersion.Version.Major

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
Get-Member -InputObject  $script:balloon 
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
The Geek Freaks Tuning Pack 4.3 Update 18.11.2020
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
$Label1.Text = "TGF Tuning Pack 4.2"
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
        "$(Get-Date) Internetverbindung: Online"
        WriteLog "Internet: Online"
    } else {
        "$(Get-Date) Internetverbindung: Offline"
        WriteLog "Internet: Offline"
    }
}
Test-InternetConnection
##################################################################################################################################################################################
$Language = Get-Content .\Config\Language.txt
if ($Language -eq "de-DE"){
[System.Windows.Forms.MessageBox]::Show("Dies ist noch eine sehr frühe Alpha Version. Die Tweaks sind zum Teil noch nicht funktionsfähig.","The Geek Freaks Tuning Pack 4.2 by MinersWin",'OK','Info')
} else {
[System.Windows.Forms.MessageBox]::Show("This is a very early alpha version. Some of the tweaks are not yet functional.","The Geek Freaks Tuning Pack 4.2 by MinersWin",'OK','Info')
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
$Panel1.Enabled = $false
$Panel3.Enabled = $false
$TabPage1.Enabled = $false
$TabPage2.Enabled = $false
$TabPage4.Enabled = $false
$CheckBox62.Enabled = $false
$CheckBox61.Enabled = $false
$TabPage1.visible = $false
$TabPage2.visible = $false
$TabPage4.Visible = $false
$TabPage5.Enabled = $false
$TabPage5.Visible = $false
$TabPage6.Enabled = $false
$TabPage6.Visible = $false
$TabPage8.Enabled = $false
$TabPage8.Visible = $false
$SpecialTweaks.Enabled = $false
$SpecialTweaks.Visible = $false
$TabControl1.Controls.Remove($SpecialTweaks)

#Button 43 PayPal Button
$ButtonPicture43 = ".\Images\48935-4-paypal-donate-button-image-free-transparent-image-hq.png"
$img43 = [System.Drawing.Image]::FromFile($ButtonPicture43)
$Button43.BackgroundImage = $img43
$Button43.BackgroundImageLayout = "Stretch"
$Button43.Add_Click{(explorer https://paypal.me/minerswin);WriteLog "clicked on PayPal Button, YAY"}
$Button43.Text = ""

#German Language Image
$Picture2 = ".\Images\German.jpg"
$img2 = [System.Drawing.Image]::Fromfile($Picture2)
$Button14.BackgroundImage = $img2
$Button14.Text = ""


#English Language Image
$Picture3 = ".\Images\English.jpg"
$img3 = [System.Drawing.Image]::Fromfile($Picture3)
$Button13.BackgroundImage = $img3
$Button13.Text = ""

#Internet Explorer Icon
$IEIcon = ".\Images\tron_icon\Dakirby309-Simply-Styled-Internet-Explorer.ico"
$Button4.Image = ([System.Drawing.Image]::FromFile($IEIcon))
$ToolTip.SetToolTip($Button4,"Executes only on Internet Explorer V7 and up. Runs the built-in Windows tool to clean and reset Internet Explorer")
#CCleaner Icon
$CCIcon = ".\Images\tron_icon\Cornmanthe3rd-Plex-Other-CCleaner.ico"
$Button20.Image = ([System.Drawing.Image]::FromFile($CCIcon))
$ToolTip.SetToolTip($Button20,"CCleaner utility by Pitiform. Used to clean temp files before running AV scanners. Note that CCleaner wipes %AppData% Local Storage.")
#BleachBit Icon
$BBIcon = ".\Images\tron_icon\favicon (1).ico"
$Button21.Image = ([System.Drawing.Image]::FromFile($BBIcon))
$ToolTip.SetToolTip($Button21,"Bleachbit utility. Used to clean temp files before running AV scanners.")
#Temp File Cleanup Icon
$TFCIcon = ".\Images\tron_icon\Hopstarter-Soft-Scraps-File-Delete.ico"
$Button22.Image = ([System.Drawing.Image]::FromFile($TFCIcon))

#USB Device Cleanup Icon
$USBIcon = ".\Images\tron_icon\Icons-Land-Vista-Hardware-Devices-USB-Flash-Card-With-Card-Reader.ico"
$Button23.Image = ([System.Drawing.Image]::FromFile($USBIcon))

#Cleanup Download
$DownloadIcon = ".\Images\tron_icon\Dakirby309-Windows-8-Metro-Folders-OS-Downloads-Folder-Metro.ico"
$Button24.Image = ([System.Drawing.Image]::FromFile($DownloadIcon))

#Event Log Cleanup Icon
$EventsIcon = ".\Images\tron_icon\Pelfusion-Flat-File-Type-Log.ico"
$Button25.Image = ([System.Drawing.Image]::FromFile($EventsIcon))

#Clear Windows Update Cache Icon
$UpdateIcon = ".\Images\tron_icon\Oxygen-Icons.org-Oxygen-Actions-edit-clear-history.ico"
$Button26.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#Clear CryptNet SSL Cache Icon
$UpdateIcon = ".\Images\tron_icon\Roundicons-100-Free-Solid-Ssl-screen.ico"
$Button7.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#Malwarebytes Icon
$UpdateIcon = ".\Images\tron_icon\Dakirby309-Simply-Styled-MalwareBytes.ico"
$Button8.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#Kaspersky Icon
$UpdateIcon = ".\Images\tron_icon\Hopstarter-3d-Cartoon-Vol3-Kaspersky.ico"
$Button9.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#Sophos Icon
$UpdateIcon = ".\Images\tron_icon\Blackvariant-Button-Ui-Requests-2-Sophos.ico"
$Button10.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#Page File Reset Icon
$UpdateIcon = ".\Images\tron_icon\Treetog-Junior-Folder-documents.ico"
$Button32.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#Defraggler Icon
$UpdateIcon = ".\Images\tron_icon\Dakirby309-Simply-Styled-Defraggler.ico"
$Button33.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#MSI installer cleanup Icon
$UpdateIcon = ".\Images\tron_icon\Celldrifter-Muku-Style-Sys-Installer.ico"
$Button11.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#System File Checker Icon
$UpdateIcon = ".\Images\tron_icon\Tpdkdesign.net-Refresh-Cl-System-Files-Download.ico"
$Button12.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#DISM image check and repair Icon
$UpdateIcon = ".\Images\tron_icon\Vexels-Office-Disc.ico"
$Button27.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#chkdsk Icon
$UpdateIcon = ".\Images\tron_icon\Treetog-Junior-Document-console.ico"
$Button28.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#Network Repair Icon
$UpdateIcon = ".\Images\tron_icon\Iconshock-Vista-General-Network.ico"
$Button30.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#File extension repair Icon
$UpdateIcon = ".\Images\tron_icon\Royalflushxx-Systematrix-Document.ico"
$Button31.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#ADSSpy Icon
$UpdateIcon = ".\Images\tron_icon\Hopstarter-Malware-Delete.ico"
$Button34.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#AdwCleaner Icon
$UpdateIcon = ".\Images\tron_icon\Igh0zt-Ios7-Style-Metro-Ui-MetroUI-Apps-Avast-Antivirus.ico"
$Button35.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#aswMBR Icon
$UpdateIcon = ".\Images\tron_icon\Chrisbanks2-Cold-Fusion-Hd-Cpu-spy.ico"
$Button36.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#autorun Icon
$UpdateIcon = ".\Images\tron_icon\Franksouza183-Fs-Places-folder-windows.ico"
$Button37.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#PChunter Icon
$UpdateIcon = ".\Images\tron_icon\favicon.ico"
$Button38.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#Net Adapter Repair Icon
$UpdateIcon = ".\Images\tron_icon\Oxygen-Icons.org-Oxygen-Actions-network-connect.ico"
$Button40.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#Kill Process Icon
$UpdateIcon = ".\Images\tron_icon\Icons8-Ios7-Logos-System-Task.ico"
$Button3.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#ParkControl Icon
$UpdateIcon = ".\Images\tron_icon\parkcontrol.ico"
$Button29.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#Systemwiederherstellung Icon
$UpdateIcon = ".\Images\tron_icon\Icons8-Windows-8-Database-Recovery.ico"
$Button39.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#Reboot to Recovery Icon
$UpdateIcon = ".\Images\tron_icon\shutdown-icon (1).png"
$Button42.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))


#All The Tools CHECK
function CheckTools{
    WriteLog "Checking for Tools"
    $Tools = Test-Path .\Tools
    if ($Tools){
        $Label18.ForeColor = "GREEN"
        $Label18.Text = "Tools found"
        $Panel8.Enabled = $true
        $Panel9.Enabled = $true
        $Panel10.Enabled = $true
        $Panel11.Enabled = $true
        $Panel12.Enabled = $true
        WriteLog "Tools Found"
    } else {
        $Label18.ForeColor = "RED"
        $Label18.Text = "Could not find the tools, please download first."
        $Panel8.Enabled = $false
        $Panel9.Enabled = $false
        $Panel10.Enabled = $false
        $Panel11.Enabled = $false
        $Panel12.Enabled = $false
        WriteLog "Tools not found, you have to Download them first"
    }
}
CheckTools
$Button46.Add_Click{(CheckTools)}

#Clipboard History
$Button44.Add_Click{(start cmd.exe 'cmd /c "echo off | clip"');WriteLog "Cleared Clipboard History"}
#System Propertys Performance
$Button15.Add_Click{(start SystemPropertiesPerformance.exe);WriteLog "Started SystemPropertiesPerformance Menu"}
#Download Tools
$Button5.Add_Click{
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
        Write-Host "Keine Internetverbindung mÃ¶glich. Bitte zu einem späteren Zeitpunkt erneut versuchen."
    }    
}

#Accept the Risk
$Button18.Add_Click{(Accept-Everything);WriteLog "Accepted Disclaimer"}
function Accept-Everything{
    if ($CheckBox63.Checked){
        $TabPage3.Enabled = $false
        $Panel1.Enabled = $true
        $Panel3.Enabled = $true
        $TabPage1.Enabled = $true  
        $TabPage2.Enabled = $true
        $TabPage4.Enabled = $true
        $CheckBox62.Enabled = $true
        $CheckBox61.Enabled = $true
        $Button16.Enabled = $true  
        $TabPage1.visible = $true
        $TabPage2.visible = $true
        $TabPage4.Visible = $true
        $TabPage3.Visible = $true
        $TabPage5.Enabled = $true
        $TabPage5.Visible = $true
        $TabPage6.Enabled = $true
        $TabPage6.Visible = $true
        $TabPage8.Enabled = $true
        $TabPage8.Visible = $true
        $TabControl1.SelectedTab = $TabPage1
    } else {
        if ($Language -eq "de-DE"){
            [System.Windows.Forms.MessageBox]::Show("Bitte Akzeptieren","TGF Tuning Pack 4.2","OK","Error")
        } else {
            [System.Windows.Forms.MessageBox]::Show("Please Accept","TGF Tuning Pack 4.2","OK","Error")
        }
    }
}

$Test = "https://discordapp.com/invite/qrXmqSq"

#Write Risk Labels
if ($Language -eq "de-DE"){
    $LinkLabel6.Text = "Wir Übernehmen keine Verantwortung für Probleme, die mit der Ausführung unseres Programms einhergehen! Dies ist ein Hobbyprojekt! Alles kann Fehler und Probleme erzeugen! Benutzung auf eigene Gefahr! Probleme und Bugs kÃ¶nnen gerne im Discord gemeldet werden: https://discordapp.com/invite/qrXmqSq Das Pack ist kein Wundermittel, es kann nicht mehr Leistung aus deinem System holen als du hast. Je nach PC, zusammenstellung, Nutzungsverhalten, Anwendungsgebiet ... können die Performanceverbesserungen extrem Variieren"
} else {
    $LinkLabel6.Text = "We do not take responsibility for problems that accompany the execution of our program! This is a hobby project! Everything can create errors and problems! Use at your own risk! Problems and bugs are welcome in the Discord: https://discordapp.com/invite/qrXmqSq . The pack is not a miracle cure, it cannot get more power out of your system than you have. Depending on the PC, composition, usage behavior, area of application ... the performance improvements can vary extremely"
}
#Close when Click Close
$button17.Add_Click{WriteLog "TuningPack Closed";($FormTuningPack.Close())}

#Open Tool Folder
$Button6.Add_Click{(Start "$($MyDir)\");WriteLog "Opened the Tool Folder"}

#Make Everything German
$Button14.Add_Click{(Make-German)}

function Make-German{
    del .\Config\Language.txt
    Write-Output "de-DE" >> .\Config\Language.txt
    .\Update-German.ps1
    WriteLog "Changed Language to German"
}

#Translate to English
$Button13.Add_Click{(Make-English)}
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
$Button19.Add_Click{(.\Ninite\Ninite.ps1);WriteLog "Starte Ninite Client"}

#ComboBox Templates
$ComboBox1.Items.Add("Best Performance")
$ComboBox1.Items.Add("Maximum Battery Life")
$ComboBox1.Items.Add("Maximum Privacy")
$ComboBox1.Items.Add("Recommended")
$ComboBox1.Items.Add("Clear")
$ComboBox1.Items.Add("ULTIMATE PERFORMANCE")
$ComboBox1.SelectedItem = "Recommended"

#Progressbar Reset
$ProgressBar1.Value = 0
$Label11.Text = "0%"
$Label12.Text = "The Tweaks havent started yet. Click on 'Make FPS Rain!' to Start the Process!"

###################################################################################################################################################################################
#Main Tweak Function
###################################################################################################################################################################################
$Button16.Add_Click{(Make-Tweaks)}
function Make-Tweaks{
    WriteLog "Clicked 'Make FPS Rain'"
    if ($Language -eq "de-DE"){
        Write-Host "Tuning Pack 4.2 by MinersWin: https://tuning-pack.de/"
        $msgBoxInput = [System.Windows.Forms.MessageBox]::Show("Tweaks werden ausgeführt. Bitte vor dem Bestätigen nochmal alle Tweaks Überprüfen. Hierbei kann einiges Kaputt gehen.","Tuning Pack Sicherheitswarnung",'YesNoCancel','Question')
        } else {
        Write-Host "Tuning Pack 4.2 by MinersWin: https://tuning-pack.de/"
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
    if ($CheckBox61.Checked){
        WriteLog "Created System Restore Point"
        wmic /namespace:\\root\default path SystemRestore call Enable C:\
        Write-Host "Die erstellung von Wiederherstellungspunkten wurde aktiviert"
        Checkpoint-Computer -Description "TGF_Tuning_Pack_4.2-$(Get-Date)"
        $Date = Get-Date
        Write-Host "Der Wiederherstellungspunkt wurde erstellt. Er trägt den Namen: $($Date) TGF Tuning Pack" -ForegroundColor Green
        WriteLog "Created System Restore Point with the Name: $($Date) TGF Tuning Pack"
    }
    if ($CheckBox62.Checked){
        if ($Language -eq "de-DE"){
            $Backup = [System.Windows.Forms.MessageBox]::Show("Ein Backup der Registry wird ausgeführt. Eine Normale Windows Registry ist im Normalfall ca. 500mb Groß. Das Backup wird unter C:\RegBack\ Gespeichert.","TGF Tuning Pack 4.2 by MinersWin",'OK','Info')
        } else {
            $Backup = [System.Windows.Forms.MessageBox]::Show("The registry is backed up. A normal Windows registry is usually about 500mb in size. The backup is saved under C:\RegBack\.","TGF Tuning Pack 4.2 by MinersWin",'OK','Info')
        }
        mkdir C:\RegBack\        
        Write-Host "Ein Backup der Registry wird ausgeführt.... Eine Normale Windows Registry ist im Normalfall ca. 500mb Groß. Das Backup wird unter C:\RegBack\ Gespeichert." -ForegroundColor Green
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
        $ProgressBar1.Value = 1
        $Label11.Text = "1%"
        $Label12.Text = "The registry entry is added. The icon of 'This Computer' is now visible on the desktop."
        Write-Host "The registry entry is added. The icon of 'This Computer' is now visible on the desktop."
        WriteLog "The registry entry is added. The icon of 'This Computer' is now visible on the desktop."
    }
    #Show Network Icon on Desktop
    if ($CheckBox2.Checked){
        reg import .\Scripts\Registry\Add_Network_Desktop_Icon.reg
        $ProgressBar1.Value = 1
        $Label11.Text = "1%"
        $Label12.Text = "The registry entry is added. The icon of 'Network' is now visible on the desktop."
        Write-Host "The registry entry is added. The icon of 'Network' is now visible on the desktop."
        WriteLog "The registry entry is added. The icon of 'Network' is now visible on the desktop."
    }
    #Classic vertical Icon spacing
    if ($CheckBox3.Checked){
        reg import .\Scripts\Registry\Reset_Classic_Vertica_Icon_Spacing.reg
        $ProgressBar1.Value = 2
        $Label11.Text = "2%"
        $Label12.Text = "The default vertical icon spacing for the desktop is now set."
        Write-Host "The default vertical icon spacing for the desktop is now set."
        WriteLog "The default vertical icon spacing for the desktop is now set."
    }
    #Enable the ability to lock and unlock the taskbar
    if ($CheckBox4.Checked){
        reg import .\Scripts\Registry\Enable_ability_to_lock_and_unlock_taskbar.reg
        $ProgressBar1.Value = 2
        $Label11.Text = "2%"
        $Label12.Text = "Enable the Ability to lock and unlock the Taskbar."
        Write-Host "Enable the Ability to lock and unlock the Taskbar."
        WriteLog "Enable the Ability to lock and unlock the Taskbar."
    }
    if ($CheckBox5.Checked){
        reg import .\Scripts\Registry\Enable_Always_show_all_notification_area_icons_for_all_users.reg
        $ProgressBar1.Value = 3
        $Label11.Text = "3%"
        $Label12.Text = "Always show all Taskbar Icons and Notifications and restart explorer.exe"
        Write-Host "Always show all Taskbar Icons and Notifications and restart explorer.exe"
        WriteLog "Always show all Taskbar Icons and Notifications and restart explorer.exe"
    }
    if ($CheckBox6.Checked){
        reg import .\Scripts\Registry\Change-Delay-Time-Show-Taskbar-Thumbnails-to-10-sec.reg
        $ProgressBar1.Value = 3
        $Label11.Text = "3%"
        $Label12.Text = "Change the Time to Show Taskbar Thumbnails to 10 sec."
        Write-Host "Change the Time to Show Taskbar Thumbnails to 10 sec."
        WriteLog "Change the Time to Show Taskbar Thumbnails to 10 sec."
    }
    if ($CheckBox7.Checked){
        reg import .\Scripts\Registry\Enable_Control_Panel_and_Settings.reg
        $ProgressBar1.Value = 4
        $Label11.Text = "4%"
        $Label12.Text = "Enable Classic Control Panel View."
        Write-Host "Enable Classic Control Panel View."
        WriteLog "Enable Classic Control Panel View."
    }
    if ($CheckBox8.Checked){
        reg import .\Scripts\Registry\Permanently-disabling-sticky-keys.reg
        $ProgressBar1.Value = 4
        $Label11.Text = "4%"
        $Label12.Text = "Turn of Sticky Keys."
        Write-Host "Turn of Sticky Keys."
        WriteLog "Turn of Sticky Keys."
    }
    if ($CheckBox9.Checked){
        reg import .\Scripts\Registry\Permanently-disabling-sticky-keys.reg
        $ProgressBar1.Value = 5
        $Label11.Text = "5%"
        $Label12.Text = "Turn of Filter Keys."
        Write-Host "Turn of Filter Keys."
        WriteLog "Turn of Filter Keys."
    }
    if ($CheckBox10.Checked){
        reg import .\Scripts\Registry\Disable_Hibernate.reg
        $ProgressBar1.Value = 5
        $Label11.Text = "5%"
        $Label12.Text = "Disable Hibernation."
        Write-Host "Disable Hibernation."
        WriteLog "Disable Hibernation."
    }
    if ($CheckBox11.Checked){
        reg import .\Scripts\Registry\Turn_ON_underline_keyboard_shortcuts_in_menus.reg
        $ProgressBar1.Value = 6
        $Label11.Text = "6%"
        $Label12.Text = "Turned On the Underline of KeyBoard Shortcuts in Menus."
        Write-Host "Turned On the Underline of KeyBoard Shortcuts in Menus."
        WriteLog "Turned On the Underline of KeyBoard Shortcuts in Menus."
    }
    if ($CheckBox12.Checked){
        .\Scripts\Registry\Show_Known_Extensions_for_File_Types.vbs
        $ProgressBar1.Value = 6
        $Label11.Text = "6%"
        $Label12.Text = "Show Known File Extensions for File Types."
        Write-Host "Show Known File Extensions for File Types"
        WriteLog "Show Known File Extensions for File Types"
    }
    if ($CheckBox13.Checked){
        reg import .\Scripts\Registry\hide-ntfs-compression-blue-double-arrow-icon-overlay.reg
        $ProgressBar1.Value = 7
        $Label11.Text = "7%"
        $Label12.Text = "Hidden indication for compressed NTFS Files"
        Write-Host "Hidden indication for compressed NTFS Files"
        WriteLog "Hidden indication for compressed NTFS Files"
    }
    if ($CheckBox14.Checked){
        .\Scripts\Registry\Show_every_Hidden_File_in_Windows_Explorer.bat
        $ProgressBar1.Value = 7
        $Label11.Text = "7%"
        $Label12.Text = "Show every Hidden File in Windows Explorer"
        Write-Host "Show every Hidden File in Windows Explorer"
        WriteLog "Show every Hidden File in Windows Explorer"
    }
    if ($CheckBox15.Checked){
        .\Scripts\Registry\Show_Super_Hidden_Files_in_Windows_Explorer.bat
        $ProgressBar1.Value = 8
        $Label11.Text = "8%"
        $Label12.Text = "Show Super Hidden Files in Windows Explorer"
        Write-Host "Show Super Hidden Files in Windows Explorer"
        WriteLog "Show Super Hidden Files in Windows Explorer"
    }
    if ($CheckBox17.Checked){
        & '.\Scripts\Registry\Replace Utilman_with_CMD.bat'
        $ProgressBar1.Value = 8
        $Label11.Text = "8%"
        $Label12.Text = "Replaced Utilman with CMD"
        Write-Host "Replaced Utilman with CMD"
        WriteLog "Replaced Utilman with CMD"
    }
    if ($CheckBox18.Checked){
        .\Scripts\Registry\Add_the_option_Processor_performance_core_parking_min_core.bat
        $ProgressBar1.Value = 9
        $Label11.Text = "9%"
        $Label12.Text = "Added the option Processor performance core parking min core."
        Write-Host "Added the option Processor performance core parking min core."
        WriteLog "Added the option Processor performance core parking min core."
    }
    if ($CheckBox19.Checked){
        .\Scripts\Registry\Disable_CPU_Core_Parking.bat
        $ProgressBar1.Value = 9
        $Label11.Text = "9%"
        $Label12.Text = "Disabled CPU Core Parking"
        Write-Host "Disabled CPU Core Parking"
        WriteLog "Disabled CPU Core Parking"
    }
    if ($CheckBox20.Checked){
        .\Scripts\Registry\Remove_Logon_Scree_wallpaper-background.bat
        $ProgressBar1.Value = 10
        $Label11.Text = "10%"
        $Label12.Text = "Removed Logon screen wallpaper/background. Will use solid color instead (Accent color)"
        Write-Host "Removed Logon screen wallpaper/background. Will use solid color instead (Accent color)"
        WriteLog "Removed Logon screen wallpaper/background. Will use solid color instead (Accent color)"
    }
    if ($CheckBox21.Checked){
        .\Scripts\Registry\Disable_Lockscreen.bat
        $ProgressBar1.Value = 10
        $Label11.Text = "10%"
        $Label12.Text = "Disabled Lockscreen"
        Write-Host "Disabled Lockscreen"
        WriteLog "Disabled Lockscreen"
    }
    if ($CheckBox22.Checked){
        .\Scripts\Registry\Remove_versioning_tab_from_properties.bat
        $ProgressBar1.Value = 11
        $Label11.Text = "11%"
        $Label12.Text = "Removed versioning tab from properties"
        Write-Host "Removed versioning tab from properties"
        WriteLog "Removed versioning tab from properties"
    }
    if ($CheckBox23.Checked){
        .\Scripts\Registry\Disable_jump_lists.bat
        $ProgressBar1.Value = 11
        $Label11.Text = "11%"
        $Label12.Text = "Disabled jump lists"
        Write-Host "Disabled jump lists"
        WriteLog "Disabled jump lists"
    }
    if ($CheckBox24.Checked){
        .\Scripts\Registry\Disable_Windows_Error_Reporting.bat
        $ProgressBar1.Value = 12
        $Label11.Text = "12%"
        $Label12.Text = "Disabled Windows Error Reporting to Microsoft"
        Write-Host "Disabled Windows Error Reporting to Microsoft"
        WriteLog "Disabled Windows Error Reporting to Microsoft"
    }
    if ($CheckBox25.Checked){
        .\Scripts\Registry\Disable_Cortana.bat
        $ProgressBar1.Value = 12
        $Label11.Text = "12%"
        $Label12.Text = "Disabled Cortana (Speech Search Assistant, which also sends information to Microsoft"
        Write-Host "Disabled Cortana (Speech Search Assistant, which also sends information to Microsoft"
        WriteLog "Disabled Cortana (Speech Search Assistant, which also sends information to Microsoft"
    }
    if ($CheckBox26.Checked){
        .\Scripts\Registry\Hide_Search_Box_from_taskbar.bat
        $ProgressBar1.Value = 13
        $Label11.Text = "13%"
        $Label12.Text = "Hidden the search box from taskbar. You can still search by pressing the win key and start typing what you are looking for."
        Write-Host "Hidden the search box from taskbar. You can still search by pressing the win key and start typing what you are looking for"
        WriteLog "Hidden the search box from taskbar. You can still search by pressing the win key and start typing what you are looking for"
    }
    if ($CheckBox27.Checked){
        .\Scripts\Registry\Disable_MRU_lists.bat
        $ProgressBar1.Value = 13
        $Label11.Text = "13%"
        $Label12.Text = "Disabled MRU lists (jump lists) of XAML apps in Start Menu"
        Write-Host "Disabled MRU lists (jump lists) of XAML apps in Start Menu"
        WriteLog "Disabled MRU lists (jump lists) of XAML apps in Start Menu"
    }
    if ($CheckBox29.Checked){
        .\Scripts\Registry\Disable_MRU_Lists_Startmenu.bat
        $ProgressBar1.Value = 14
        $Label11.Text = "14%"
        $Label12.Text = "Disabled MRU lists (jump lists) of XAML apps in Start Menu"
        Write-Host "Disabled MRU lists (jump lists) of XAML apps in Start Menu"
        WriteLog "Disabled MRU lists (jump lists) of XAML apps in Start Menu"
    }
    if ($CheckBox30.Checked){
        .\Scripts\Registry\Disable_Creation_of_an_Advertising_ID.bat
        $ProgressBar1.Value = 14
        $Label11.Text = "14%"
        $Label12.Text = "Disabled creation of an Advertising ID"
        Write-Host "Disabled creation of an Advertising ID"
        WriteLog "Disabled creation of an Advertising ID"
    }
    if ($CheckBox31.Checked){
        .\Scripts\Registry\Remove_Pin_to_Start.bat
        $ProgressBar1.Value = 15
        $Label11.Text = "15%"
        $Label12.Text = "Removed Pin to start"
        Write-Host "Removed Pin to start"
        WriteLog "Removed Pin to start"
    }
    if ($CheckBox32.Checked){
        .\Scripts\Registry\Disable_Cortana_Bing_Search_and_Searchbar.bat
        $ProgressBar1.Value = 15
        $Label11.Text = "15%"
        $Label12.Text = "Disabled Cortana, Bing Search and Searchbar"
        Write-Host "Disabled Cortana, Bing Search and Searchbar"
        WriteLog "Disabled Cortana, Bing Search and Searchbar"
    }
    if ($CheckBox33.Checked){
        .\Scripts\Registry\Turn_off_the_Error_Dialog.bat
        $ProgressBar1.Value = 16
        $Label11.Text = "16%"
        $Label12.Text = "Turned off the Error Dialog"
        Write-Host "Turned off the Error Dialog"
        WriteLog "Turned off the Error Dialog"
    }
    if ($CheckBox34.Checked){
        .\Scripts\Registry\Disable_Administrative_Shares.bat
        $ProgressBar1.Value = 16
        $Label11.Text = "16%"
        $Label12.Text = "Disabled Administrative shares"
        Write-Host "Disabled Administrative shares"
        WriteLog "Disabled Administrative shares"
    }
    if ($CheckBox35.Checked){
        .\Scripts\Registry\Reboot_to_Recovery.bat
        $ProgressBar1.Value = 17
        $Label11.Text = "17%"
        $Label12.Text = "Added Reboot to Recovery to right-click menu of This PC"
        Write-Host "Added Reboot to Recovery to right-click menu of This PC"
        WriteLog "Added Reboot to Recovery to right-click menu of This PC"
    }
    if ($CheckBox36.Checked){
        .\Scripts\Registry\Change_Clock_and_Date_format_to_24H_metric.bat
        $ProgressBar1.Value = 17
        $Label11.Text = "17%"
        $Label12.Text = "Changed Clock and Date formats of current user to 24H, metric (Sign out required to see changes)"
        Write-Host "Changed Clock and Date formats of current user to 24H, metric (Sign out required to see changes)"
        WriteLog "Changed Clock and Date formats of current user to 24H, metric (Sign out required to see changes)"
    }
    if ($CheckBox37.Checked){
        .\Scripts\Registry\Enable_Developer_Mode.bat
        $ProgressBar1.Value = 18
        $Label11.Text = "18%"
        $Label12.Text = "Enabled Developer Mode (enables you to run XAML apps you develop in visual Studio which havent been certified yet)"
        Write-Host "Enabled Developer Mode (enables you to run XAML apps you develop in Visual Studio which havent been certified yet)"
        WriteLog "Enabled Developer Mode (enables you to run XAML apps you develop in Visual Studio which havent been certified yet)"
    }
    if ($CheckBox38.Checked){
        .\Scripts\Registry\Remove_Telemetry_and_Data_Collection.bat
        $ProgressBar1.Value = 18
        $Label11.Text = "18%"
        $Label12.Text = "Removed telemetry and data collection"
        Write-Host "Removed telemetry and data collection"
        WriteLog "Removed telemetry and data collection"
    }
    if ($CheckBox28.Checked){
        .\Scripts\Registry\Set_Windows_Explorer_to_Start_on_This_PC.bat
        $ProgressBar1.Value = 19
        $Label11.Text = "19%"
        $Label12.Text = "Set Windows Explorer to start on This PC instead of Quick Access"
        Write-Host "Set Windows Explorer to start on This PC instead of Quick Access"
        WriteLog "Set Windows Explorer to start on This PC instead of Quick Access"
    }
    if ($CheckBox16.Checked){
        .\Scripts\Registry\Prevent_Both_Windows_and_Office_from_creating_LNK_files.bat
        $ProgressBar1.Value = 19
        $Label11.Text = "19%"
        $Label12.Text = "Prevented both Windows and Office from creating LNK files in the Recents folder"
        Write-Host "Prevented both Windows and Office from creating LNK files in the Recent folder"
        WriteLog "Prevented both Windows and Office from creating LNK files in the Recent folder"
    }
    #
    # Removing Services tab
    #
    if ($CheckBox39.Checked){
        & '.\Scripts\Removing Services\DisableConnectedUserExperiencesandTelemetry.bat'
        $ProgressBar1.Value = 20
        $Label11.Text = "20%"
        $Label12.Text = "Disabled Connected User Experiences and Telemetry (To turn off Telemetry and Data collection)"
        Write-Host "Disabled Connected User Experiences and Telemetry (To turn off Telemetry and Data collection)"
        WriteLog "Disabled Connected User Experiences and Telemetry (To turn off Telemetry and Data collection)"
    }
    if ($CheckBox40.Checked){
        & '.\Scripts\Removing Services\DisableDiagnosticPolicyService.bat'
        $ProgressBar1.Value = 20
        $Label11.Text = "20%"
        $Label12.Text = "Disabled Diagnostic Policy Service"
        Write-Host "Disabled Diagnostic Policy Service"
        WriteLog "Disabled Diagnostic Policy Service"
    }
    if ($CheckBox41.Checked){
        & '.\Scripts\Removing Services\DisableDistributedLinkTrackingClient.bat'
        $ProgressBar1.Value = 21
        $Label11.Text = "21%"
        $Label12.Text = "Disabled Distributed Link Tracking Client (If your computer is not connected to any network)"
        Write-Host "Disabled Distributed Link Tracking Client (If your computer is not connected to any network)"
        WriteLog "Disabled Distributed Link Tracking Client (If your computer is not connected to any network)"
    }
    if ($CheckBox42.Checked){
        & '.\Scripts\Removing Services\DisableWAPPushMessageRoutingService.bat'
        $ProgressBar1.Value = 21
        $Label11.Text = "21%"
        $Label12.Text = "Disabled WAP Push Message Routing Service (To turn off Telemetry and Data Collection)"
        Write-Host "Disabled WAP Push Message Routing Service (To Turn off Telemetry and Data Collection)"
        WriteLog "Disabled WAP Push Message Routing Service (To Turn off Telemetry and Data Collection)"
    }
    if ($CheckBox43.Checked){
        & '.\Scripts\Removing Services\DisableDownloadedMapsManager.bat'
        $ProgressBar1.Value = 22
        $Label11.Text = "22%"
        $Label12.Text = "Disabled Downloaded Maps Manager (If you dont user Maps app)"
        Write-Host "Disabled Downloaded Maps Manager (If you dont use Maps app)"
        WriteLog "Disabled Downloaded Maps Manager (If you dont use Maps app)"
    }
    if ($CheckBox44.Checked){
        & '.\Scripts\Removing Services\DisableIPHelper.bat'
        $ProgressBar1.Value = 22
        $Label11.Text = "22%"
        $Label12.Text = "Disabled IP Helper (If you dont use IPv6 connection)"
        Write-Host "Disabled IP Helper (If you dont use IPv6 connection)"
        WriteLog "Disabled IP Helper (If you dont use IPv6 connection)"
    }
    if ($CheckBox45.Checked){
        & '.\Scripts\Removing Services\DisableProgramCompatibilityAssistantService.bat'
        $ProgressBar1.Value = 23
        $Label11.Text = "23%"
        $Label12.Text = "Disabled Program Compatibility Assistant Service"
        Write-Host "Disabled Program Compatibility Assistant Service"
        WriteLog "Disabled Program Compatibility Assistant Service"
    }
    if ($CheckBox46.Checked){
        & '.\Scripts\Removing Services\DisablePrintSpooler.bat'
        $ProgressBar1.Value = 23
        $Label11.Text = "23%"
        $Label12.Text = "Disabled Print Spooler (If you dont have a printer)"
        Write-Host "Disabled Print Spooler (If you dont have a printer)"
        WriteLog "Disabled Print Spooler (If you dont have a printer)"
    }
    if ($CheckBox47.Checked){
        & '.\Scripts\Removing Services\DisableRemoteRegistry.bat'
        $ProgressBar1.Value = 24
        $Label11.Text = "24%"
        $Label12.Text = "Disabled Remote Registry"
        Write-Host "Disabled Remote Registry"
        WriteLog "Disabled Remote Registry"
    }
    if ($CheckBox48.Checked){
        & '.\Scripts\Removing Services\DisableSecondaryLogon.bat'
        $ProgressBar1.Value = 24
        $Label11.Text = "24%"
        $Label12.Text = "Disabled Secondary Logon"
        Write-Host "Disabled Secondary Logon"
        WriteLog "Disabled Secondary Logon"
    }
    if ($CheckBox49.Checked){
        & '.\Scripts\Removing Services\DisableSecurityCenter.bat'
        $ProgressBar1.Value = 25
        $Label11.Text = "25%"
        $Label12.Text = "Disabled Security Center"
        Write-Host "Disabled Security Center"
        WriteLog "Disabled Security Center"
    }
    if ($CheckBox50.Checked){
        & '.\Scripts\Removing Services\IPNetBIOSHelper.bat'
        $ProgressBar1.Value = 25
        $Label11.Text = "25%"
        $Label12.Text = "Disabled TCP/IP NetBIOS Helper (If you are not in a workgroup network)"
        Write-Host "Disabled TCP/IP NetBIOS Helper (If you are not in a workgroup network)"
        WriteLog "Disabled TCP/IP NetBIOS Helper (If you are not in a workgroup network)"
    }
    if ($CheckBox51.Checked){
        & '.\Scripts\Removing Services\DisableTochKeyboardandHandwritingPanelService.bat'
        $ProgressBar1.Value = 26
        $Label11.Text = "26%"
        $Label12.Text = "Disabled Touch Keyboard and Handwriting Panel Service (If you want to use touch keyboard and handwriting features)"
        Write-Host "Disabled Touch Keyboard and Handwriting Panel Service (If you want to use touch keyboard and handwriting features)"
        WriteLog "Disabled Touch Keyboard and Handwriting Panel Service (If you want to use touch keyboard and handwriting features)"
    }
    if ($CheckBox52.Checked){
        & '.\Scripts\Removing Services\DisableWindowsErrorReportingService.bat'
        $ProgressBar1.Value = 26
        $Label11.Text = "26%"
        $Label12.Text = "Disabled Windows Error Reporting Service"
        Write-Host "Disabled Windows Error Reporting Service"
        WriteLog "Disabled Windows Error Reporting Service"
    }
    if ($CheckBox53.Checked){
        & '.\Scripts\Removing Services\DisableWindowsImageAcquisition.bat'
        $ProgressBar1.Value = 27
        $Label11.Text = "27%"
        $Label12.Text = "Disabled Windows Image Acquisition (WIA) (If you dont have a scannner)"
        Write-Host "Disabled Windows Image Acquisition (WIA) (If you dont have a scanner)"
        WriteLog "Disabled Windows Image Acquisition (WIA) (If you dont have a scanner)"
    }
    if ($CheckBox54.Checked){
        & '.\Scripts\Removing Services\DisableWindowsSearch.bat'
        $ProgressBar1.Value = 27
        $Label11.Text = "27%"
        $Label12.Text = "Disabled Windows Search"
        Write-Host "Disabled Windows Search"
        Writelog "Disabled Windows Search"
    }
    if ($CheckBox55.Checked){
        & '.\Scripts\Removing Services\DisableTrackingServices.bat'
        $ProgressBar1.Value = 28
        $Label11.Text = "28%"
        $Label12.Text = "Disabled Tracking Services"
        Write-Host "Disabled Tracking Services"
        WriteLog "Disabled Tracking Services"
    }

    #Scheduled Tasks

    #Disable SmartScreenSpecific
    if ($CheckBox86.Checked){
        .\Scripts\Batch\ScheduledTasks\SmartScreenSpecific.bat
        $ProgressBar1.Value = 28
        $Label11.Text = "28%"
        $Label12.Text = "Disabled Smart Screen Specific"
        Write-Host "Disabled SmartScreenSpecific"
        WriteLog "Disabled SmartScreenSpecific"
    }
    #Disable Microsoft Compatibility Appraiser
    if ($CheckBox87.Checked){
        .\Scripts\Batch\ScheduledTasks\Microsoft_Compatibility_Appraiser.bat
        $ProgressBar1.Value = 29
        $Label11.Text = "29%"
        $Label12.Text = "Disabled Microsoft Compatibility Appraiser"
        Write-Host "Disabled Microsoft Compatibility Appraiser"
        WriteLog "Disabled Microsoft Compatibility Appraiser"
    }
    #Disable Programm Data Updater
    if ($CheckBox88.Checked){
        .\Scripts\Batch\ScheduledTasks\ProgramDataUpdater.bat
        $ProgressBar1.Value = 29
        $Label11.Text = "29%"
        $Label12.Text = "Disabled Program Data Updater"
        Write-Host "Disabled Program Data Updater"
        WriteLog "Disabled Program Data Updater"
    }
    #Disable Startup App Task
    if ($CheckBox89.Checked){
        .\Scripts\Batch\ScheduledTasks\StartupAppTask.bat
        $ProgressBar1.Value = 30
        $Label11.Text = "30%"
        $Label12.Text = "Disabled Startup App Task"
        Write-Host "Disabled Startup App Task"
        WriteLog "Disabled Startup App Task"
    }
    #Disable Proxy
    if ($CheckBox90.Checked){
        .\Scripts\Batch\ScheduledTasks\Proxy.bat
        $ProgressBar1.Value = 30
        $Label11.Text = "30%"
        $Label12.Text = "Disabled Proxy"
        Write-Host "Disabled Proxy"
        WriteLog "Disabled Proxy"
    }
    #Disable Consolidator
    if ($CheckBox91.Checked){
        .\Scripts\Batch\ScheduledTasks\Consolidator.bat
        $ProgressBar1.Value = 31
        $Label11.Text = "31%"
        $Label12.Text = "Disabled Consolidator"
        Write-Host "Disabled Consolidator"
        WriteLog "Disabled Consolidator"
    }
    #Disable Kernel Ceip Task
    if ($CheckBox92.Checked){
        .\Scripts\Batch\ScheduledTasks\KernelCeipTask.bat
        $ProgressBar1.Value = 31
        $Label11.Text = "31%"
        $Label12.Text = "Disabled Kernel Ceip Task"
        Write-Host "Disabled Kernel Ceip Task"
        WriteLog "Disabled Kernel Ceip Task"
    }
    #Disable USB Ceip
    if ($CheckBox93.Checked){
        .\Scripts\Batch\ScheduledTasks\UsbCeip.bat
        $ProgressBar1.Value = 32
        $Label11.Text = "32%"
        $Label12.Text = "Disabled USBCeip"
        Write-Host "Disabled USBCeip"
        WriteLog "Disabled USBCeip"
    }
    #Disable Mirosoft Windows DiskDiagnosticDataCollector
    if ($CheckBox94.Checked){
        .\Scripts\Batch\ScheduledTasks\Microsoft-Windows-DiskDiagnosticDataCollector.bat
        $ProgressBar1.Value = 33
        $Label11.Text = "33%"
        $Label12.Text = "Disable Microsoft-Windows-DiskDiagnosticDataCollector"
        Write-Host "Disable Microsoft-Windows-DiskDiagnostikDataCollector"
        WriteLog "Disable Microsoft-Windows-DiskDiagnostikDataCollector"
    }
    #Disable File History (mainanance mode)
    if ($CheckBox95.Checked){
        .\Scripts\Batch\ScheduledTasks\File_History.bat
        $ProgressBar1.Value = 34
        $Label11.Text = "34%"
        $Label12.Text = "Disabled File History (maintanace mode)"
        Write-Host "Disabled File History (maintanace mode)"
        WriteLog "Disabled File History (maintanace mode)"
    }
    #Disable WinSAT
    if ($CheckBox96.Checked){
        .\Scripts\Batch\ScheduledTasks\WinSAT.bat
        $ProgressBar1.Value = 34
        $Label11.Text = "34%"
        $Label12.Text = "Disabled WinSAT"
        Write-Host "Disabled WinSAT"
        WriteLog "Disabled WinSAT"
    }
    #Disable Gather Network Info
    if ($CheckBox97.Checked){
        .\Scripts\Batch\ScheduledTasks\GatherNetworkInfo.bat
        $ProgressBar1.Value = 35
        $Label11.Text = "35%"
        $Label12.Text = "Disabled Gather Network Info"
        Write-Host "Disabled Gather Network Info"
        WriteLog "Disabled Gather Network Info"
    }
    #Disable Sqm-Tasks
    if ($CheckBox98.Checked){
        .\Scripts\Batch\ScheduledTasks\Sqm-Tasks.bat
        $ProgressBar1.Value = 35
        $Label11.Text = "35%"
        $Label12.Text = "Disabled Sqm-Tasks"
        Write-Host "Disabled Sqm-Tasks"
        WriteLog "Disabled Sqm-Tasks"
    }
    #Disable Force Syncronize Time
    if ($CheckBox99.Checked){
        .\Scripts\Batch\ScheduledTasks\ForceSynchronizeTime.bat
        $ProgressBar1.Value = 36
        $Label11.Text = "36%"
        $Label12.Text = "Disabled Force Syncronize Time"
        Write-Host "Disabled Force Syncronize Time"
        WriteLog "Disabled Force Syncronize Time"
    }
    #Disable Syncronize Time
    if ($CheckBox100.Checked){
        .\Scripts\Batch\ScheduledTasks\SynchronizeTime.bat
        $ProgressBar1.Value = 36
        $Label11.Text = "36%"
        $Label12.Text = "Disabled Syncronize Time"
        Write-Host "Disabled Syncronize Time"
        WriteLog "Disabled Syncronize Time"
    }
    #Disable Queue Reporting
    if ($CheckBox101.Checked){
        .\Scripts\Batch\ScheduledTasks\QueueReporting.bat
        $ProgressBar1.Value = 37
        $Label11.Text = "37%"
        $Label12.Text = "Disabled Queue Reporting"
        Write-Host "Disabled Queue Reporting"
        WriteLog "Disabled Queue Reporting"
    }
    #Disable Automatic App Update
    if ($CheckBox102.Checked){
        .\Scripts\Batch\ScheduledTasks\Automatic_App_Update.bat
        $ProgressBar1.Value = 37
        $Label11.Text = "37%"
        $Label12.Text = "Disabled Automatic App Update"
        Write-Host "Disabled Automatic App Update"
        WriteLog "Disabled Automatic App Update"
    }

    #Windows Default Apps

    #Remove 3D-Viewer
    if ($CheckBox80.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\3d.ps1'
        $ProgressBar1.Value = 38
        $Label11.Text = "38%"
        $Label12.Text = "Removed 3D-Viewer"
        Write-Host "Removed 3D-Viewer"
        WriteLog "Removed 3D-Viewer"
    }
    #Remove Bing
    if ($CheckBox103.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\bing.ps1'
        $ProgressBar1.Value = 38
        $Label11.Text = "38%"
        $Label12.Text = "Removed Bing"
        Write-Host "Removed Bing"
        WriteLog "Removed Bing"
    }
    #Remove Zune
    if ($CheckBox104.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\zune.ps1'
        $ProgressBar1.Value = 39
        $Label11.Text = "39%"
        $Label12.Text = "Removed Zune (Groove Music)"
        Write-Host "Removed Zune (Groove Music)"
        WriteLog "Removed Zune (Groove Music)"
    }
    #Remove Photo Viewer
    if ($CheckBox105.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\photo.ps1'
        $ProgressBar1.Value = 39
        $Label11.Text = "39%"
        $Label12.Text = "Removed Photo Viewer"
        Write-Host "Removed Photo Viewer"
        WriteLog "Removed Photo Viewer"
    }
    #Remove Windows Insider
    if ($CheckBox106.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\communi.ps1'
        $ProgressBar1.Value = 40
        $Label11.Text = "40%"
        $Label12.Text = "Removed Windows Community"
        Write-Host "Removed Windows Community"
        WriteLog "Removed Windows Community"
    }
    #Remove Solitare
    if ($CheckBox107.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\solit.ps1'
        $ProgressBar1.Value = 40
        $Label11.Text = "40%"
        $Label12.Text = "Removed Solitare"
        Write-Host "Removed Solitare"
        WriteLog "Removed Solitare"
    }
    #Remove Phone
    if ($CheckBox108.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\phone.ps1'
        $ProgressBar1.Value = 41
        $Label11.Text = "41%"
        $Label12.Text = "Removed Phone"
        Write-Host "Removed Phone"
        WriteLog "Removed Phone"
    }
    #Remove Soundrecorder
    if ($CheckBox109.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\soundrec.ps1'
        $ProgressBar1.Value = 41
        $Label11.Text = "41%"
        $Label12.Text = "Removed Soundrecorder"
        Write-Host "Removed Soundrecorder"
        WriteLog "Removed Soundrecorder"
    }
    #Remove Camera
    if ($CheckBox110.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\camera.ps1'
        $ProgressBar1.Value = 42
        $Label11.Text = "42%"
        $Label12.Text = "Removed Camera"
        Write-Host "Removed Camera"
        WriteLog "Removed Camera"
    }
    #Remove Microsoft People
    if ($CheckBox111.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\people.ps1'
        $ProgressBar1.Value = 42
        $Label11.Text = "42%"
        $Label12.Text = "Removed Microsoft People"
        Write-Host "Removed Microsoft People"
        WriteLog "Remove Microsoft People"
    }
    #Remove Office Live
    if ($CheckBox112.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\office.ps1'
        $ProgressBar1.Value = 43
        $Label11.Text = "43%"
        $Label12.Text = "Removed Office Live"
        Write-Host "Removed Ofiice Live"
        WriteLog "Removed Ofiice Live"
    }
    #Remove XBox
    if ($CheckBox113.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\xbox.ps1'
        $ProgressBar1.Value = 43
        $Label11.Text = "43%"
        $Label12.Text = "Removed XBox"
        Write-Host "Removed XBox"
        WriteLog "Removed XBox"
    }
    #Remove Remove OneDrive
    if ($CheckBox79.Checked){
        & '.\Scripts\Batch\Remove OneDrive\RemoveOneDrive.bat'
        $ProgressBar1.Value = 44
        $Label11.Text = "44%"
        $Label12.Text = "Removed OneDrive"
        Write-Host "Removed OneDrive"
        WriteLog "Removed OneDrive"
    }

    #Misc

    #Disable Windows Error Recovery in Startup
    if ($CheckBox81.Checked){
        & '.\Scripts\Batch\DisableWindowsErrorRecoveryonStartup.bat'
        $ProgressBar1.Value = 45
        $Label11.Text = "45%"
        $Label12.Text = "Disable Windows Error Recovery on Startup"
        Write-Host "Disable Windows Error Recovery on Startup"
        WriteLog "Disabled Windows Error Recovery on Startup"
    }
    #Internet Explorer 11 Tweaks
    if ($CheckBox82.Checked){
        & '.\Scripts\Batch\InternetExplorerTweaks.bat'
        $ProgressBar1.Value = 45
        $Label11.Text = "45%"
        $Label12.Text = "Applied Internet Explorer 11 Tweaks"
        Write-Host "Applied Internet Explorer 11 Tweaks"
        WriteLog "Applied Internet Explorer 11 Tweaks"
    }
    #Libary Tweaks
    if ($CheckBox83.Checked){
        if ($WinVersion -eq "10"){

        } else {
            & '.\Scripts\Batch\LibaryTweaks.bat'
        }
        $ProgressBar1.Value = 46
        $Label11.Text = "46%"
        $Label12.Text = "Applied Libary Tweaks"
        Write-Host "Applied Libary Tweaks"
        WriteLog "Applied Libary Twaks"
    }
    #Windows Update Tweaks
    if ($CheckBox84.Checked){
        & '.\Scripts\Batch\UpdateTweaks.bat'
        $ProgressBar1.Value = 46
        $Label11.Text = "46%"
        $Label12.Text = "Applied Windows Update Tweaks"
        Write-Host "Applied Windows Update Tweaks"
        WriteLog "Applied Windows Update Tweaks"
    }
    #Windows Defender Tweaks
    if ($CheckBox85.Checked){
        & '.\Scripts\Batch\WindowsDefenderTweaks.bat'
        $ProgressBar1.Value = 47
        $Label11.Text = "47%"
        $Label12.Text = "Applied Windows Defender Tweaks"
        Write-Host "Applied Windows Defender Tweaks"
        WriteLog "Applied Windows Defender Tweaks"
    }
    #Blocking Telemetry Servers
    if ($CheckBox56.Checked){
        & '.\Scripts\Batch\Blocking\Telemetry.bat'
        $ProgressBar1.Value = 47
        $Label11.Text = "47%"
        $Label12.Text = "Blocked Telemetry Servers"
        Write-Host "Blocked Telemetry Servers"
        WriteLog "Blocked Telemetry Servers"
    }
    #Blocking More Windows Servers
    if ($CheckBox78.Checked){
        & '.\Scripts\Batch\Blocking\BlockingMoreWindowsServers.bat'
        $ProgressBar1.Value = 48
        $Label11.Text = "48%"
        $Label12.Text = "Blocked more Windows Servers"
        Write-Host "Blocked more Windows Servers"
        WriteLog "Blocked more Windows Servers"
    }
    #Mouse Accelleration Fix
    if ($CheckBox114.Checked){
        .\Scripts\Registry\MouseFix\MouseAccelerationFix.ps1
        $ProgressBar1.Value = 48
        $Label11.Text = "48%"
        $Label12.Text = "Applied Mouse Accelleration Fix"
        Write-Host "Applied Mouse Accelleration Fix"
        WriteLog "Applied Mouse Acceleration Fix"
    }
    #Mouse Accelleration Fix
    if ($CheckBox114.Checked){
        reg import .\Scripts\Registry\Enable_Clipboard_History_for_all_users.reg
        $ProgressBar1.Value = 49
        $Label11.Text = "49%"
        $Label12.Text = "Enabled Clipboard History for all Users"
        Write-Host "Enabled Clipboard History for all Users"
        WriteLog "Enabled Clipboard History for all Users"
    }

    
    $ProgressBar1.Value = 100
    WriteLog "DONE"
    $Label11.Text = ":=)"
    $Label12.Text = "DONE"
    WriteLog "Die Tweaks wurden erfolgreich abgeschlossen."
    [System.Windows.Forms.MessageBox]::Show("Die Tweaks wurden erfolgreich abgeschlossen.","TGF Tuning Pack 4.2 by MinersWin",1)
    [System.Windows.Forms.MessageBox]::Show("$($MessageEnglish)","Tuning Pack",1)
    if ($Language -eq "de-DE"){
        Write-Host "100%" -ForegroundColor Blue
        Write-Host "Fertig" -ForegroundColor Blue
        Write-Host "--------------------------------------------------------------------------------------------------" -ForegroundColor Red
        Write-Host "Die Tweaks wurden erfolgreich abgeschlossen. Sollten Fehlermeldungen aufgetreten sein Liegt das wahrscheinlich am Auswählen nicht geeigneter Tweaks wie zum Beispiel Das entfernen von Windows 10 Apps unter Windows 7."  -ForegroundColor Green
        Write-Host "Wir Übernehmen keine Verantwortung für die Folgen und eventuelle SchÃ¤den an euren Systemen. Alle Tweaks wurden von euch Ausgewählt und mehrfach Bestätigt." -ForegroundColor Green
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
$Button1.Add_Click{($ShopLink = [System.Windows.Forms.MessageBox]::Show("In Version 5 (or 4.5 PRO)`nhttps://shop.thegeekfreaks.de","TGF Tuning Pack 4.2",1); if ($ShopLink -eq "Cancel"){}else{explorer https://shop.thegeekfreaks.de})}
$Button2.Add_Click{(Apply-Template)}

function Apply-Template{
    if ($ComboBox1.SelectedItem -eq "Recommended"){
        .\Templates\Recommended.ps1
    }elseif ($ComboBox1.SelectedItem -eq "Best Performance"){
        .\Templates\BestPerformance.ps1
    }elseif ($ComboBox1.SelectedItem -eq "Maximum Battery Life"){
        .\Templates\SaveEnergy.ps1
    }elseif ($ComboBox1.SelectedItem -eq "Maximum Privacy"){
        .\Templates\Privacy.ps1
    }elseif ($ComboBox1.SelectedItem -eq "ULTIMATE PERFORMACE"){
        .\Templates\UltimatePerformance.ps1
    }elseif ($ComboBox1.SelectedItem -eq "Clear"){
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
    $aboutFormText.Text     = "          Created by MinersWin `n`r https://www.thegeekfreaks.de"
    $aboutFormText.Add_Click{(explorer https://thegeekfreaks.de); explorer https://youtube.com/minerswin}
    $aboutForm.Controls.Add($aboutFormText)
    # About Exit Button
    $aboutFormExit.Location = "135, 70"
    $aboutFormExit.Text     = "OK"
    $aboutForm.Controls.Add($aboutFormExit)
    [void]$aboutForm.ShowDialog()
} # End About


Apply-Template
$FormTuningPack.ShowDialog()
