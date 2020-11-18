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
        $Internet = $false
    } else {
        $Internet = $true
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
$Form1.Text = $Config.Application.Name

#New Update
if (Test-Path .\Config\Accept.dat){

} else {
    WriteLog "First Startup, Show Changelog"
    .\Changelog\Changelog.ps1
    WriteLog "Changelog Accepted"
   Out-File -FilePath .\Config\Accept.dat
}

#Icon
$bitmap = [System.Drawing.Bitmap]::FromFile($Config.Application.Icon)
$bitmap.MakeTransparent()
$hicon = $bitmap.GetHicon()
$Form1.Icon = [system.drawing.icon]::FromHandle($hicon)


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

#Geek Freaks Logo
$Picture = ".\Images\Logo_v1.png"
$img = [System.Drawing.Image]::Fromfile($Picture)
$PictureBox1.BackgroundImage = $img
$PictureBox1.BackgroundImageLayout = "Stretch"
$PictureBox1.Add_Click({About})

#Tuning Pack Banner
$Picture48 = ".\Images\Logo_4.0.png"
$img48 = [System.Drawing.Image]::FromFile($Picture48)
$PictureBox2.BackgroundImage = $img48
$PictureBox2.BackgroundImageLayout = "Stretch"

#Button 43 PayPal Button
$ButtonPicture43 = ".\Images\48935-4-paypal-donate-button-image-free-transparent-image-hq.png"
$img43 = [System.Drawing.Image]::FromFile($ButtonPicture43)
$Button43.BackgroundImage = $img43
$Button43.BackgroundImageLayout = "Stretch"
$Button43.Add_Click{(explorer https://paypal.me/minerswin)}
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
        curl -o Tools.zip root3.minerswin.de/TGF/Tools.zip -UseBasicParsing
        WriteLog "Download wurde abgeschlossen, Archiv wird entpackt"
        Expand-Archive .\Tools.zip -DestinationPath .\
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
$button17.Add_Click{($Form1.Close())}

#Open Tool Folder
$Button6.Add_Click{(Start "$($MyDir)\")}

#Make Everything German
$Button14.Add_Click{(Make-German)}

function Make-German{
    del .\Config\Language.txt
    Write-Output "de-DE" >> .\Config\Language.txt
    .\Update-German.ps1
}

#Translate to English
$Button13.Add_Click{(Make-English)}
function Make-English{
    del .\Config\Language.txt
    Write-Output "en-EN" >> .\Config\Language.txt
    .\Update-Englisch.ps1
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
    if ($Language -eq "de-DE"){
        Write-Host "Tuning Pack 4.2 by MinersWin: https://tuning-pack.de/"
        $msgBoxInput = [System.Windows.Forms.MessageBox]::Show("Tweaks werden ausgeführt. Bitte vor dem Bestätigen nochmal alle Tweaks Überprüfen. Hierbei kann einiges Kaputt gehen.","Tuning Pack Sicherheitswarnung",'YesNoCancel','Question')
        } else {
        Write-Host "Tuning Pack 4.2 by MinersWin: https://tuning-pack.de/"
        $msgBoxInput = [System.Windows.Forms.MessageBox]::Show("Tweaks are in progress. Please check all tweaks again before confirming. This can break some things.","Tuning Pack Security Warning",'YesNoCancel','Question')
        }
        switch  ($msgBoxInput) {
    
            'Yes' {
                Write-Host "YES" 
                Write-Host "Tweaks werden ausgeführt"
                TWEAK_THE_SHIT
            }
            'No' {
            }
            'Cancel' {
            }
        }
    }
function TWEAK_THE_SHIT{
    #Create RecoveryPoint
    if ($CheckBox61.Checked){
        wmic /namespace:\\root\default path SystemRestore call Enable C:\
        Write-Host "Die erstellung von Wiederherstellungspunkten wurde aktiviert"
        Checkpoint-Computer -Description "TGF_Tuning_Pack_4.2-$(Get-Date)"
        $Date = Get-Date
        Write-Host "Der Wiederherstellungspunkt wurde erstellt. Er trägt den Namen: $($Date) TGF Tuning Pack" -ForegroundColor Green
    }
    if ($CheckBox62.Checked){
        if ($Language -eq "de-DE"){
            $Backup = [System.Windows.Forms.MessageBox]::Show("Ein Backup der Registry wird ausgeführt. Eine Normale Windows Registry ist im Normalfall ca. 500mb Groß. Das Backup wird unter C:\RegBack\ Gespeichert.","TGF Tuning Pack 4.2 by MinersWin",'OK','Info')
        } else {
            $Backup = [System.Windows.Forms.MessageBox]::Show("The registry is backed up. A normal Windows registry is usually about 500mb in size. The backup is saved under C:\RegBack\.","TGF Tuning Pack 4.2 by MinersWin",'OK','Info')
        }
        mkdir C:\RegBack\        
        Write-Host "Ein Backup der Registry wird ausgeführt.... Eine Normale Windows Registry ist im Normalfall ca. 500mb Groß. Das Backup wird unter C:\RegBack\ Gespeichert." -ForegroundColor Green
        reg export HKCR C:\RegBack\HKLM.Reg /y
        reg export HKCU C:\RegBack\HKCU.Reg /y
        reg export HKLM C:\RegBack\HKCR.Reg /y
        reg export HKU C:\RegBack\HKU.Reg /y
        reg export HKCC C:\RegBackHKCC.Reg /y
}


    #Show Desktop Icon on Desktop
    if ($CheckBox1.Checked){
        reg import .\Scripts\Registry\Add_This-PC_Desktop_Icon.reg
        $ProgressBar1.Value = 1
        $Label11.Text = "1%"
        $Label12.Text = "The registry entry is added. The icon of 'This Computer' is now visible on the desktop."
        Write-Host "The registry entry is added. The icon of 'This Computer' is now visible on the desktop."
    }
    #Show Network Icon on Desktop
    if ($CheckBox2.Checked){
        reg import .\Scripts\Registry\Add_Network_Desktop_Icon.reg
        $ProgressBar1.Value = 1
        $Label11.Text = "1%"
        $Label12.Text = "The registry entry is added. The icon of 'Network' is now visible on the desktop."
        Write-Host "The registry entry is added. The icon of 'Network' is now visible on the desktop."
    }
    #Classic vertical Icon spacing
    if ($CheckBox3.Checked){
        reg import .\Scripts\Registry\Reset_Classic_Vertica_Icon_Spacing.reg
        $ProgressBar1.Value = 2
        $Label11.Text = "2%"
        $Label12.Text = "The default vertical icon spacing for the desktop is now set."
        Write-Host "The default vertical icon spacing for the desktop is now set."
    }
    #Enable the ability to lock and unlock the taskbar
    if ($CheckBox4.Checked){
        reg import .\Scripts\Registry\Enable_ability_to_lock_and_unlock_taskbar.reg
        $ProgressBar1.Value = 2
        $Label11.Text = "2%"
        $Label12.Text = "Enable the Ability to lock and unlock the Taskbar."
        Write-Host "Enable the Ability to lock and unlock the Taskbar."
    }
    if ($CheckBox5.Checked){
        reg import .\Scripts\Registry\Enable_Always_show_all_notification_area_icons_for_all_users.reg
        $ProgressBar1.Value = 3
        $Label11.Text = "3%"
        $Label12.Text = "Always show all Taskbar Icons and Notifications and restart explorer.exe"
        Write-Host "Always show all Taskbar Icons and Notifications and restart explorer.exe"
    }
    if ($CheckBox6.Checked){
        reg import .\Scripts\Registry\Change-Delay-Time-Show-Taskbar-Thumbnails-to-10-sec.reg
        $ProgressBar1.Value = 3
        $Label11.Text = "3%"
        $Label12.Text = "Change the Time to Show Taskbar Thumbnails to 10 sec."
        Write-Host "Change the Time to Show Taskbar Thumbnails to 10 sec."
    }
    if ($CheckBox7.Checked){
        reg import .\Scripts\Registry\Enable_Control_Panel_and_Settings.reg
        $ProgressBar1.Value = 4
        $Label11.Text = "4%"
        $Label12.Text = "Enable Classic Control Panel View."
        Write-Host "Enable Classic Control Panel View."
    }
    if ($CheckBox8.Checked){
        reg import .\Scripts\Registry\Permanently-disabling-sticky-keys.reg
        $ProgressBar1.Value = 4
        $Label11.Text = "4%"
        $Label12.Text = "Turn of Sticky Keys."
        Write-Host "Turn of Sticky Keys."
    }
    if ($CheckBox9.Checked){
        reg import .\Scripts\Registry\Permanently-disabling-sticky-keys.reg
        $ProgressBar1.Value = 5
        $Label11.Text = "5%"
        $Label12.Text = "Turn of Filter Keys."
        Write-Host "Turn of Filter Keys."
    }
    if ($CheckBox10.Checked){
        reg import .\Scripts\Registry\Disable_Hibernate.reg
        $ProgressBar1.Value = 5
        $Label11.Text = "5%"
        $Label12.Text = "Disable Hibernation."
        Write-Host "Disable Hibernation."
    }
    if ($CheckBox11.Checked){
        reg import .\Scripts\Registry\Turn_ON_underline_keyboard_shortcuts_in_menus.reg
        $ProgressBar1.Value = 6
        $Label11.Text = "6%"
        $Label12.Text = "Turned On the Underline of KeyBoard Shortcuts in Menus."
        Write-Host "Turned On the Underline of KeyBoard Shortcuts in Menus."
    }
    if ($CheckBox12.Checked){
        .\Scripts\Registry\Show_Known_Extensions_for_File_Types.vbs
        $ProgressBar1.Value = 6
        $Label11.Text = "6%"
        $Label12.Text = "Show Known File Extensions for File Types."
        Write-Host "Show Known File Extensions for File Types"
    }
    if ($CheckBox13.Checked){
        reg import .\Scripts\Registry\hide-ntfs-compression-blue-double-arrow-icon-overlay.reg
        $ProgressBar1.Value = 7
        $Label11.Text = "7%"
        $Label12.Text = "Hide indication for compressed NTFS Files"
        Write-Host "Hide indication for compressed NTFS Files"
    }
    if ($CheckBox14.Checked){
        .\Scripts\Registry\Show_every_Hidden_File_in_Windows_Explorer.bat
        $ProgressBar1.Value = 7
        $Label11.Text = "7%"
        $Label12.Text = "Show every Hidden File in Windows Explorer"
        Write-Host "Show every Hidden File in Windows Explorer"
    }
    if ($CheckBox15.Checked){
        .\Scripts\Registry\Show_Super_Hidden_Files_in_Windows_Explorer.bat
        $ProgressBar1.Value = 8
        $Label11.Text = "8%"
        $Label12.Text = "Show Super Hidden Files in Windows Explorer"
        Write-Host "Show Super Hidden Files in Windows Explorer"
    }
    if ($CheckBox17.Checked){
        & '.\Scripts\Registry\Replace Utilman_with_CMD.bat'
        $ProgressBar1.Value = 8
        $Label11.Text = "8%"
        $Label12.Text = "Replace Utilman with CMD"
        Write-Host "Replace Utilman with CMD"
    }
    if ($CheckBox18.Checked){
        .\Scripts\Registry\Add_the_option_Processor_performance_core_parking_min_core.bat
        $ProgressBar1.Value = 9
        $Label11.Text = "9%"
        $Label12.Text = "Add the option Processor performance core parking min core."
        Write-Host "Add the option Processor performance core parking min core."
    }
    if ($CheckBox19.Checked){
        .\Scripts\Registry\Disable_CPU_Core_Parking.bat
        $ProgressBar1.Value = 9
        $Label11.Text = "9%"
        $Label12.Text = "Disable CPU Core Parking"
        Write-Host "Disable CPU Core Parking"
    }
    if ($CheckBox20.Checked){
        .\Scripts\Registry\Remove_Logon_Scree_wallpaper-background.bat
        $ProgressBar1.Value = 10
        $Label11.Text = "10%"
        $Label12.Text = "Remove Logon screen wallpaper/background. Will use solid color instead (Accent color)"
        Write-Host "Remove Logon screen wallpaper/background. Will use solid color instead (Accent color)"
    }
    if ($CheckBox21.Checked){
        .\Scripts\Registry\Disable_Lockscreen.bat
        $ProgressBar1.Value = 10
        $Label11.Text = "10%"
        $Label12.Text = "Disable Lockscreen"
        Write-Host "Disable Lockscreen"
    }
    if ($CheckBox22.Checked){
        .\Scripts\Registry\Remove_versioning_tab_from_properties.bat
        $ProgressBar1.Value = 11
        $Label11.Text = "11%"
        $Label12.Text = "Remove versioning tab from properties"
        Write-Host "Remove versioning tab from properties"
    }
    if ($CheckBox23.Checked){
        .\Scripts\Registry\Disable_jump_lists.bat
        $ProgressBar1.Value = 11
        $Label11.Text = "11%"
        $Label12.Text = "Disable jump lists"
        Write-Host "Disable jump lists"
    }
    if ($CheckBox24.Checked){
        .\Scripts\Registry\Disable_Windows_Error_Reporting.bat
        $ProgressBar1.Value = 12
        $Label11.Text = "12%"
        $Label12.Text = "Disable Windows Error Reporting"
        Write-Host "Disable Windows Error Reporting"
    }
    if ($CheckBox25.Checked){
        .\Scripts\Registry\Disable_Cortana.bat
        $ProgressBar1.Value = 12
        $Label11.Text = "12%"
        $Label12.Text = "Disable Cortana (Speech Search Assistant, which also sends information to Microsoft"
        Write-Host "Disable Cortana (Speech Search Assistant, which also sends information to Microsoft"
    }
    if ($CheckBox26.Checked){
        .\Scripts\Registry\Hide_Search_Box_from_taskbar.bat
        $ProgressBar1.Value = 13
        $Label11.Text = "13%"
        $Label12.Text = "Hide the search box from taskbar. You can still search by pressing the win key and start typing what you are looking for."
        Write-Host "Hide the search box from taskbar. You can still search by pressing the win key and start typing what you are looking for"
    }
    if ($CheckBox27.Checked){
        .\Scripts\Registry\Disable_MRU_lists.bat
        $ProgressBar1.Value = 13
        $Label11.Text = "13%"
        $Label12.Text = "Disable MRU lists (jump lists) of XAML apps in Start Menu"
        Write-Host "Disable MRU lists (jump lists) of XAML apps in Start Menu"
    }
    if ($CheckBox29.Checked){
        .\Scripts\Registry\Disable_MRU_Lists_Startmenu.bat
        $ProgressBar1.Value = 14
        $Label11.Text = "14%"
        $Label12.Text = "Disable MRU lists (jump lists) of XAML apps in Start Menu"
        Write-Host "Disable MRU lists (jump lists) of XAML apps in Start Menu"
    }
    if ($CheckBox30.Checked){
        .\Scripts\Registry\Disable_Creation_of_an_Advertising_ID.bat
        $ProgressBar1.Value = 14
        $Label11.Text = "14%"
        $Label12.Text = "Disable creation of an Advertising ID"
        Write-Host "Disable creation of an Advertising ID"
    }
    if ($CheckBox31.Checked){
        .\Scripts\Registry\Remove_Pin_to_Start.bat
        $ProgressBar1.Value = 15
        $Label11.Text = "15%"
        $Label12.Text = "Remove Pin to start"
        Write-Host "Remove Pin to start"
    }
    if ($CheckBox32.Checked){
        .\Scripts\Registry\Disable_Cortana_Bing_Search_and_Searchbar.bat
        $ProgressBar1.Value = 15
        $Label11.Text = "15%"
        $Label12.Text = "Disable Cortana, Bing Search and Searchbar"
        Write-Host "Disable Cortana, Bing Search and Searchbar"
    }
    if ($CheckBox33.Checked){
        .\Scripts\Registry\Turn_off_the_Error_Dialog.bat
        $ProgressBar1.Value = 16
        $Label11.Text = "16%"
        $Label12.Text = "Turn off the Error Dialog"
        Write-Host "Turn off the Error Dialog"
    }
    if ($CheckBox34.Checked){
        .\Scripts\Registry\Disable_Administrative_Shares.bat
        $ProgressBar1.Value = 16
        $Label11.Text = "16%"
        $Label12.Text = "Disable Administrative shares"
        Write-Host "Disable Administrative shares"
    }
    if ($CheckBox35.Checked){
        .\Scripts\Registry\Reboot_to_Recovery.bat
        $ProgressBar1.Value = 17
        $Label11.Text = "17%"
        $Label12.Text = "Add Reboot to Recovery to right-click menu of This PC"
        Write-Host "Add Reboot to Recovery to right-click menu of This PC"
    }
    if ($CheckBox36.Checked){
        .\Scripts\Registry\Change_Clock_and_Date_format_to_24H_metric.bat
        $ProgressBar1.Value = 17
        $Label11.Text = "17%"
        $Label12.Text = "Change Clock and Date formats of current user to 24H, metric (Sign out required to see changes)"
        Write-Host "Change Clock and Date formats of current user to 24H, metric (Sign out required to see changes)"
    }
    if ($CheckBox37.Checked){
        .\Scripts\Registry\Enable_Developer_Mode.bat
        $ProgressBar1.Value = 18
        $Label11.Text = "18%"
        $Label12.Text = "Enable Developer Mode (enables you to run XAML apps you develop in visual Studio which havent been certified yet)"
        Write-Host "Enable Developer Mode (enables you to run XAML apps you develop in Visual Studio which havent been certified yet)"
    }
    if ($CheckBox38.Checked){
        .\Scripts\Registry\Remove_Telemetry_and_Data_Collection.bat
        $ProgressBar1.Value = 18
        $Label11.Text = "18%"
        $Label12.Text = "Remove telemetry and data collection"
        Write-Host "Remove telemetry and data collection"
    }
    if ($CheckBox28.Checked){
        .\Scripts\Registry\Set_Windows_Explorer_to_Start_on_This_PC.bat
        $ProgressBar1.Value = 19
        $Label11.Text = "19%"
        $Label12.Text = "Set Windows Explorer to start on This PC instead of Quick Access"
        Write-Host "Set Windows Explorer to start on This PC instead of Quick Access"
    }
    if ($CheckBox16.Checked){
        .\Scripts\Registry\Prevent_Both_Windows_and_Office_from_creating_LNK_files.bat
        $ProgressBar1.Value = 19
        $Label11.Text = "19%"
        $Label12.Text = "Prevent both Windows and Office from creating LNK files in the Recents folder"
        Write-Host "Prevent both Windows and Office from creating LNK files in the Recent folder"
    }
    #
    # Removing Services tab
    #
    if ($CheckBox39.Checked){
        & '.\Scripts\Removing Services\DisableConnectedUserExperiencesandTelemetry.bat'
        $ProgressBar1.Value = 20
        $Label11.Text = "20%"
        $Label12.Text = "Disable Connected User Experiences and Telemetry (To turn off Telemetry and Data collection)"
        Write-Host "Disable Connected User Experiences and Telemetry (To turn off Telemetry and Data collection)"
    }
    if ($CheckBox40.Checked){
        & '.\Scripts\Removing Services\DisableDiagnosticPolicyService.bat'
        $ProgressBar1.Value = 20
        $Label11.Text = "20%"
        $Label12.Text = "Disable Diagnostic Policy Service"
        Write-Host "Disable Diagnostic Policy Service"
    }
    if ($CheckBox41.Checked){
        & '.\Scripts\Removing Services\DisableDistributedLinkTrackingClient.bat'
        $ProgressBar1.Value = 21
        $Label11.Text = "21%"
        $Label12.Text = "Disable Distributed Link Tracking Client (If your computer is not connected to any network)"
        Write-Host "Disable Distributed Link Tracking Client (If your computer is not connected to any network)"
    }
    if ($CheckBox42.Checked){
        & '.\Scripts\Removing Services\DisableWAPPushMessageRoutingService.bat'
        $ProgressBar1.Value = 21
        $Label11.Text = "21%"
        $Label12.Text = "Disable WAP Push Message Routing Service (To turn off Telemetry and Data Collection)"
        Write-Host "Disable WAP Push Message Routing Service (To Turn off Telemetry and Data Collection)"
    }
    if ($CheckBox43.Checked){
        & '.\Scripts\Removing Services\DisableDownloadedMapsManager.bat'
        $ProgressBar1.Value = 22
        $Label11.Text = "22%"
        $Label12.Text = "Disable Downloaded Maps Manager (If you dont user Maps app)"
        Write-Host "Disable Downloaded Maps Manager (If you dont use Maps app)"
    }
    if ($CheckBox44.Checked){
        & '.\Scripts\Removing Services\DisableIPHelper.bat'
        $ProgressBar1.Value = 22
        $Label11.Text = "22%"
        $Label12.Text = "Disable IP Helper (If you dont use IPv6 connection)"
        Write-Host "Disable IP Helper (If you dont use IPv6 connection)"
    }
    if ($CheckBox45.Checked){
        & '.\Scripts\Removing Services\DisableProgramCompatibilityAssistantService.bat'
        $ProgressBar1.Value = 23
        $Label11.Text = "23%"
        $Label12.Text = "Disable Program Compatibility Assistant Service"
        Write-Host "Disable Program Compatibility Assistant Service"
    }
    if ($CheckBox46.Checked){
        & '.\Scripts\Removing Services\DisablePrintSpooler.bat'
        $ProgressBar1.Value = 23
        $Label11.Text = "23%"
        $Label12.Text = "Disable Print Spooler (If you dont have a printer)"
        Write-Host "Disable Print Spooler (If you dont have a printer)"
    }
    if ($CheckBox47.Checked){
        & '.\Scripts\Removing Services\DisableRemoteRegistry.bat'
        $ProgressBar1.Value = 24
        $Label11.Text = "24%"
        $Label12.Text = "Disable Remote Registry"
        Write-Host "Disable Remote Registry"
    }
    if ($CheckBox48.Checked){
        & '.\Scripts\Removing Services\DisableSecondaryLogon.bat'
        $ProgressBar1.Value = 24
        $Label11.Text = "24%"
        $Label12.Text = "Disable Secondary Logon"
        Write-Host "Disable Secondary Logon"
    }
    if ($CheckBox49.Checked){
        & '.\Scripts\Removing Services\DisableSecurityCenter.bat'
        $ProgressBar1.Value = 25
        $Label11.Text = "25%"
        $Label12.Text = "Disable Security Center"
        Write-Host "Disable Security Center"
    }
    if ($CheckBox50.Checked){
        & '.\Scripts\Removing Services\IPNetBIOSHelper.bat'
        $ProgressBar1.Value = 25
        $Label11.Text = "25%"
        $Label12.Text = "Disable TCP/IP NetBIOS Helper (If you are not in a workgroup network)"
        Write-Host "Disable TCP/IP NetBIOS Helper (If you are not in a workgroup network)"
    }
    if ($CheckBox51.Checked){
        & '.\Scripts\Removing Services\DisableTochKeyboardandHandwritingPanelService.bat'
        $ProgressBar1.Value = 26
        $Label11.Text = "26%"
        $Label12.Text = "Disable Touch Keyboard and Handwriting Panel Service (If you want to use touch keyboard and handwriting features)"
        Write-Host "Disable Touch Keyboard and Handwriting Panel Service (If you want to use touch keyboard and handwriting features)"
    }
    if ($CheckBox52.Checked){
        & '.\Scripts\Removing Services\DisableWindowsErrorReportingService.bat'
        $ProgressBar1.Value = 26
        $Label11.Text = "26%"
        $Label12.Text = "Disable Windows Error Reporting Service"
        Write-Host "Disable Windows Error Reporting Service"
    }
    if ($CheckBox53.Checked){
        & '.\Scripts\Removing Services\DisableWindowsImageAcquisition.bat'
        $ProgressBar1.Value = 27
        $Label11.Text = "27%"
        $Label12.Text = "Disable Windows Image Acquisition (WIA) (If you dont have a scannner)"
        Write-Host "Disable Windows Image Acquisition (WIA) (If you dont have a scanner)"
    }
    if ($CheckBox54.Checked){
        & '.\Scripts\Removing Services\DisableWindowsSearch.bat'
        $ProgressBar1.Value = 27
        $Label11.Text = "27%"
        $Label12.Text = "Disable Windows Search"
        Write-Host "Disable Windows Search"
    }
    if ($CheckBox55.Checked){
        & '.\Scripts\Removing Services\DisableTrackingServices.bat'
        $ProgressBar1.Value = 28
        $Label11.Text = "28%"
        $Label12.Text = "Disable Tracking Services"
        Write-Host "Disable Tracking Services"
    }

    #Scheduled Tasks

    #Disable SmartScreenSpecific
    if ($CheckBox86.Checked){
        .\Scripts\Batch\ScheduledTasks\SmartScreenSpecific.bat
        $ProgressBar1.Value = 28
        $Label11.Text = "28%"
        $Label12.Text = "Disable Smart Screen Specific"
        Write-Host "Disable SmartScreenSpecific"
    }
    #Disable Microsoft Compatibility Appraiser
    if ($CheckBox87.Checked){
        .\Scripts\Batch\ScheduledTasks\Microsoft_Compatibility_Appraiser.bat
        $ProgressBar1.Value = 29
        $Label11.Text = "29%"
        $Label12.Text = "Disable Microsoft Compatibility Appraiser"
        Write-Host "Disable Microsoft Compatibility Appraiser"
    }
    #Disable Programm Data Updater
    if ($CheckBox88.Checked){
        .\Scripts\Batch\ScheduledTasks\ProgramDataUpdater.bat
        $ProgressBar1.Value = 29
        $Label11.Text = "29%"
        $Label12.Text = "Disable Program Data Updater"
        Write-Host "Disable Program Data Updater"
    }
    #Disable Startup App Task
    if ($CheckBox89.Checked){
        .\Scripts\Batch\ScheduledTasks\StartupAppTask.bat
        $ProgressBar1.Value = 30
        $Label11.Text = "30%"
        $Label12.Text = "Disable Startup App Task"
        Write-Host "Disable Startup App Task"
    }
    #Disable Proxy
    if ($CheckBox90.Checked){
        .\Scripts\Batch\ScheduledTasks\Proxy.bat
        $ProgressBar1.Value = 30
        $Label11.Text = "30%"
        $Label12.Text = "Disable Proxy"
        Write-Host "Disable Proxy"
    }
    #Disable Consolidator
    if ($CheckBox91.Checked){
        .\Scripts\Batch\ScheduledTasks\Consolidator.bat
        $ProgressBar1.Value = 31
        $Label11.Text = "31%"
        $Label12.Text = "Disable Consolidator"
        Write-Host "Disable Consolidator"
    }
    #Disable Kernel Ceip Task
    if ($CheckBox92.Checked){
        .\Scripts\Batch\ScheduledTasks\KernelCeipTask.bat
        $ProgressBar1.Value = 31
        $Label11.Text = "31%"
        $Label12.Text = "Disable Kernel Ceip Task"
        Write-Host "Disable Kernel Ceip Task"
    }
    #Disable USB Ceip
    if ($CheckBox93.Checked){
        .\Scripts\Batch\ScheduledTasks\UsbCeip.bat
        $ProgressBar1.Value = 32
        $Label11.Text = "32%"
        $Label12.Text = "Disable USBCeip"
        Write-Host "Disable USBCeip"
    }
    #Disable Mirosoft Windows DiskDiagnosticDataCollector
    if ($CheckBox94.Checked){
        .\Scripts\Batch\ScheduledTasks\Microsoft-Windows-DiskDiagnosticDataCollector.bat
        $ProgressBar1.Value = 33
        $Label11.Text = "33%"
        $Label12.Text = "Disable Microsoft-Windows-DiskDiagnosticDataCollector"
        Write-Host "Disable Microsoft-Windows-DiskDiagnostikDataCollector"
    }
    #Disable File History (mainanance mode)
    if ($CheckBox95.Checked){
        .\Scripts\Batch\ScheduledTasks\File_History.bat
        $ProgressBar1.Value = 34
        $Label11.Text = "34%"
        $Label12.Text = "Disable File History (maintanace mode)"
        Write-Host "Disable File History (maintanace mode)"
    }
    #Disable WinSAT
    if ($CheckBox96.Checked){
        .\Scripts\Batch\ScheduledTasks\WinSAT.bat
        $ProgressBar1.Value = 34
        $Label11.Text = "34%"
        $Label12.Text = "Disable WinSAT"
        Write-Host "Disable WinSAT"
    }
    #Disable Gather Network Info
    if ($CheckBox97.Checked){
        .\Scripts\Batch\ScheduledTasks\GatherNetworkInfo.bat
        $ProgressBar1.Value = 35
        $Label11.Text = "35%"
        $Label12.Text = "Disable Gather Network Info"
        Write-Host "Disable Gather Network Info"
    }
    #Disable Sqm-Tasks
    if ($CheckBox98.Checked){
        .\Scripts\Batch\ScheduledTasks\Sqm-Tasks.bat
        $ProgressBar1.Value = 35
        $Label11.Text = "35%"
        $Label12.Text = "Disable Sqm-Tasks"
        Write-Host "Disable Sqm-Tasks"
    }
    #Disable Force Syncronize Time
    if ($CheckBox99.Checked){
        .\Scripts\Batch\ScheduledTasks\ForceSynchronizeTime.bat
        $ProgressBar1.Value = 36
        $Label11.Text = "36%"
        $Label12.Text = "Disable Force Syncronize Time"
        Write-Host "Disable Force Syncronize Time"
    }
    #Disable Syncronize Time
    if ($CheckBox100.Checked){
        .\Scripts\Batch\ScheduledTasks\SynchronizeTime.bat
        $ProgressBar1.Value = 36
        $Label11.Text = "36%"
        $Label12.Text = "Disable Syncronize Time"
        Write-Host "Disable Syncronize Time"
    }
    #Disable Queue Reporting
    if ($CheckBox101.Checked){
        .\Scripts\Batch\ScheduledTasks\QueueReporting.bat
        $ProgressBar1.Value = 37
        $Label11.Text = "37%"
        $Label12.Text = "Disable Queue Reporting"
        Write-Host "Disable Queue Reporting"
    }
    #Disable Automatic App Update
    if ($CheckBox102.Checked){
        .\Scripts\Batch\ScheduledTasks\Automatic_App_Update.bat
        $ProgressBar1.Value = 37
        $Label11.Text = "37%"
        $Label12.Text = "Disable Automatic App Update"
        Write-Host "Disable Automatic App Update"
    }

    #Windows Default Apps

    #Remove 3D-Viewer
    if ($CheckBox80.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\3d.ps1'
        $ProgressBar1.Value = 38
        $Label11.Text = "38%"
        $Label12.Text = "Remove 3D-Viewer"
        Write-Host "Remove 3D-Viewer"
    }
    #Remove Bing
    if ($CheckBox103.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\bing.ps1'
        $ProgressBar1.Value = 38
        $Label11.Text = "38%"
        $Label12.Text = "Remove Bing"
        Write-Host "Remove Bing"
    }
    #Remove Zune
    if ($CheckBox104.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\zune.ps1'
        $ProgressBar1.Value = 39
        $Label11.Text = "39%"
        $Label12.Text = "Remove Zune (Groove Music)"
        Write-Host "Remove Zune (Groove Music)"
    }
    #Remove Photo Viewer
    if ($CheckBox105.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\photo.ps1'
        $ProgressBar1.Value = 39
        $Label11.Text = "39%"
        $Label12.Text = "Remove Photo Viewer"
        Write-Host "Remove Photo Viewer"
    }
    #Remove Windows Insider
    if ($CheckBox106.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\communi.ps1'
        $ProgressBar1.Value = 40
        $Label11.Text = "40%"
        $Label12.Text = "Remove Windows Community"
        Write-Host "Remove Windows Community"
    }
    #Remove Solitare
    if ($CheckBox107.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\solit.ps1'
        $ProgressBar1.Value = 40
        $Label11.Text = "40%"
        $Label12.Text = "Remove Solitare"
        Write-Host "Remove Solitare"
    }
    #Remove Phone
    if ($CheckBox108.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\phone.ps1'
        $ProgressBar1.Value = 41
        $Label11.Text = "41%"
        $Label12.Text = "Remove Phone"
        Write-Host "Remove Phone"
    }
    #Remove Soundrecorder
    if ($CheckBox109.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\soundrec.ps1'
        $ProgressBar1.Value = 41
        $Label11.Text = "41%"
        $Label12.Text = "Remove Soundrecorder"
        Write-Host "Remove Soundrecorder"
    }
    #Remove Camera
    if ($CheckBox110.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\camera.ps1'
        $ProgressBar1.Value = 42
        $Label11.Text = "42%"
        $Label12.Text = "Remove Camera"
        Write-Host "Remove Camera"
    }
    #Remove Microsoft People
    if ($CheckBox111.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\people.ps1'
        $ProgressBar1.Value = 42
        $Label11.Text = "42%"
        $Label12.Text = "Remove Microsoft People"
        Write-Host "Remove Microsoft People"
    }
    #Remove Office Live
    if ($CheckBox112.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\office.ps1'
        $ProgressBar1.Value = 43
        $Label11.Text = "43%"
        $Label12.Text = "Remove Office Live"
        Write-Host "Remove Ofiice Live"
    }
    #Remove XBox
    if ($CheckBox113.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\xbox.ps1'
        $ProgressBar1.Value = 43
        $Label11.Text = "43%"
        $Label12.Text = "Remove XBox"
        Write-Host "Remove XBox"
    }
    #Remove Remove OneDrive
    if ($CheckBox79.Checked){
        & '.\Scripts\Batch\Remove OneDrive\RemoveOneDrive.bat'
        $ProgressBar1.Value = 44
        $Label11.Text = "44%"
        $Label12.Text = "Remove OneDrive"
        Write-Host "Remove OneDrive"
    }

    #Misc

    #Disable Windows Error Recovery in Startup
    if ($CheckBox81.Checked){
        & '.\Scripts\Batch\DisableWindowsErrorRecoveryonStartup.bat'
        $ProgressBar1.Value = 45
        $Label11.Text = "45%"
        $Label12.Text = "Disable Windows Error Recovery on Startup"
        Write-Host "Disable Windows Error Recovery on Startup"
    }
    #Internet Explorer 11 Tweaks
    if ($CheckBox82.Checked){
        & '.\Scripts\Batch\InternetExplorerTweaks.bat'
        $ProgressBar1.Value = 45
        $Label11.Text = "45%"
        $Label12.Text = "Internet Explorer 11 Tweaks"
        Write-Host "Internet Explorer 11 Tweaks"
    }
    #Libary Tweaks
    if ($CheckBox83.Checked){
        if ($WinVersion -eq "10"){

        } else {
            & '.\Scripts\Batch\LibaryTweaks.bat'
        }
        $ProgressBar1.Value = 46
        $Label11.Text = "46%"
        $Label12.Text = "Libary Tweaks"
        Write-Host "Libary Tweaks"
    }
    #Windows Update Tweaks
    if ($CheckBox84.Checked){
        & '.\Scripts\Batch\UpdateTweaks.bat'
        $ProgressBar1.Value = 46
        $Label11.Text = "46%"
        $Label12.Text = "Windows Update Tweaks"
        Write-Host "Windows Update Tweaks"
    }
    #Windows Defender Tweaks
    if ($CheckBox85.Checked){
        & '.\Scripts\Batch\WindowsDefenderTweaks.bat'
        $ProgressBar1.Value = 47
        $Label11.Text = "47%"
        $Label12.Text = "Windows Defender Tweaks"
        Write-Host "Windows Defender Tweaks"
    }
    #Blocking Telemetry Servers
    if ($CheckBox56.Checked){
        & '.\Scripts\Batch\Blocking\Telemetry.bat'
        $ProgressBar1.Value = 47
        $Label11.Text = "47%"
        $Label12.Text = "Blocking Telemetry Servers"
        Write-Host "Blocking Telemetry Servers"
    }
    #Blocking More Windows Servers
    if ($CheckBox78.Checked){
        & '.\Scripts\Batch\Blocking\BlockingMoreWindowsServers.bat'
        $ProgressBar1.Value = 48
        $Label11.Text = "48%"
        $Label12.Text = "Blocking more Windows Servers"
        Write-Host "Blocking more Windows Servers"
    }
    #Mouse Accelleration Fix
    if ($CheckBox114.Checked){
        .\Scripts\Registry\MouseFix\MouseAccelerationFix.ps1
        $ProgressBar1.Value = 48
        $Label11.Text = "48%"
        $Label12.Text = "Mouse Accelleration Fix"
        Write-Host "Mouse Accelleration Fix"
    }
    #Mouse Accelleration Fix
    if ($CheckBox114.Checked){
        reg import .\Scripts\Registry\Enable_Clipboard_History_for_all_users.reg
        $ProgressBar1.Value = 49
        $Label11.Text = "49%"
        $Label12.Text = "Enable Clipboard History for all Users"
        Write-Host "Enable Clipboard History for all Users"
    }

    
    $ProgressBar1.Value = 100
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
        $Label11.Text = ":=)"
        $Label12.Text = "Fertig"
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
        $Label11.Text = ":=)"
        $Label12.Text = "DONE"
    }

}

#Templates 
$Button1.Add_Click{([System.Windows.Forms.MessageBox]::Show("In Version 5!","TGF Tuning Pack 4.2",1))}
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


######################################################################################################################################################################################
### All the Tools ###
######################################################################################################################################################################################
<# REMOVED BECAUSE OF REWRITE
#Process Killer
function Test_Kill_Process{
$Kill_Process = Test-Path .\Scripts\ProcessKiller-Tuning-Pack.bat
if ($Kill_Process){
    $Button3.Add_Click{(Kill-Process)}
    $Button3.ForeColor = 'Green'
} else {
    $Button3.Add_Click{(Download_Kill-Process)}
    $Button3.ForeColor = 'RED'
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
        $Button20.Add_Click{(CCleaner)}
        $Button20.ForeColor = 'Green'
    } else {
        $Button20.Add_Click{(Download_CCleaner)}
        $Button20.ForeColor = 'RED'
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
        $Button21.Add_Click{(BleachBit)}
        $Button21.ForeColor = 'Green'
    } else {
        $Button21.Add_Click{(Download_BleachBit)}
        $Button21.ForeColor = 'RED'
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
        $Button22.Add_Click{(TFC)}
        $Button22.ForeColor = 'Green'
    } else {
        $Button22.Add_Click{(Download_TFC)}
        $Button22.ForeColor = 'RED'
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
        $Button23.Add_Click{(USBDeviceCleanup)}
        $Button23.ForeColor = 'Green'
    } else {
        $Button23.Add_Click{(Download_USBDeviceCleanup)}
        $Button23.ForeColor = 'RED'
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

#$Button24.Add_Click{([System.Windows.Forms.MessageBox]::Show("WIP","TGF Tuning Pack 4.1"1))}

#Clear Windows event logs
$Button25.ForeColor = 'GREEN'
$Button25.Add_Click{(Clear-EventLog Application,Security,System)}
#Clear Windows Update Cache
function Test_Clear-UpdateCache{
    $IE_Clean = Test-Path '.\Tools\Clear Update Cache\Erase_Cache.bat'
    if ($IE_Clean){
        $Button26.Add_Click{(Clear-UpdateCache)}
        $Button26.ForeColor = 'Green'
    } else {
        $Button26.Add_Click{(Download_Clear-UpdateCache)}
        $Button26.ForeColor = 'RED'
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
$Button7.Add_Click{(Clear-SSL)}
function Clear-SSL{
    certutil -URLcache * delete
}
#Malwarebytes
$Button8.Add_Click{(Malwarebytes)}
function Malwarebytes{
    .\Tools\Malwarebytes\mb3-setup-consumer-3.8.3.2965-1.0.613-1.0.11878.exe
}
#Kaspersky Virus Removal Tool
$Button9.Add_Click{(KVRT)}
function KVRT{
    .\Tools\KVRT\KVRT.exe
}
#Sophos Virus Removal Tool
$Button10.Add_Click{(Sophos)}
function Sophos{
    & '.\tools\Sophos Virus Removal Tool\Sophos Virus Removal Tool.exe'
}
#MSI installer Cleanup
$Button11.Add_Click{(Installer-Cleanup)}
function Installer-Cleanup{
    [System.Windows.Forms.MessageBox]::Show("Diese funktion ist momentan nicht verfÃ¼gbar, Microsoft hat dieses Feature eingestellt. Ich arbeite momentan an einer Alternative","TGF Tuning Pack 4.1 by MinersWin",1)
}
#System File Checker
$Button12.Add_Click{(System-File-Checker)}
function System-File-Checker{
    [System.Windows.Forms.MessageBox]::Show("Es wird sich gleich ein Konsolenfenster Ã¶ffnen, in welchem ein Windows Image heruntergeladen wird, mit welchem das System auf Fehler geprÃ¼ft wird. Das Image wird nach Abschluss des Vorgangs wieder gelÃ¶scht. Zum BestÃ¤tigen OK drÃ¼cken","TGF Tuning Pack 4.1 by MinersWin",1)    
    & '.\Tools\System File Checker\Check.bat'
}
#DISM image check and repair
$Button27.Add_Click{(System-File-Checker)}
#CheckDisk
$button28.Add_Click{(start cmd.exe 'chkdsk C: /f /r')}
#Network Repair
$Button30.Add_Click{(Network-Repair)}
function Network-Repair{
    ipconfig /flushdns
    netsh interface ip delete arpcache
    netsh winsock reset catalog
}
#Page File Reset
$Button32.Add_Click{(Page-File-Reset)}
function Page-File-Reset{
    C: computersystem where name="%computername%" set AutomaticManagedPagefile=True
}
#Defraggler
$Button33.Add_Click{(Defraggler-Start)}
function Defraggler-Start{
    .\Tools\Defraggler\Defraggler64.exe
}
$Button34.Add_Click{(ADSSPy)}
function ADSSPy{
    .\Tools\ADSSpy\ADSSpy.exe
}
#Adwcleaner
$Button35.Add_Click{(ADWCleaner)}
function ADWCleaner{
    .\Tools\AdwCleaner\adwcleaner_7.4.1.exe
}
#aswMBR
$Button36.Add_Click{(aswMBR)}
function aswMBR{
    .\Tools\aswMBR\aswmbr.exe
}
#autorun
$button37.Add_Click{(autorun)}
function autorun{
    .\Tools\autorun\Autoruns64.exe
}
#PCHunter
$Button38.Add_Click{(PCHunter)}
function PCHunter{
    .\Tools\PCHunter\PCHunter64.exe
}
#Net Adapter Repair
$Button40.Add_Click{(Net-Adapter-Repair)}
function Net-Adapter-Repair{
    .\tools\NetAdapterRepair\NetAdapterRepair1.2.exe
}
#ParkControl
$Button29.Add_Click{(Park-Control)}
function Park-Control{
    .\Tools\ParkControl\ParkControl.exe
}
#System Recovery
$Button39.Add_Click{(System-Recovery)}
function System-Recovery{
    rstrui.exe
}
#Reboot to Recovery
$Button42.Add_Click{(Reboot-Recovery)}
function Reboot-Recovery{
    shutdown /r /o /f /t 00
}


#>
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
    $aboutForm.Text          = "The Geek Freaks Tuning Pack 4.2"
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
    $aboutFormNameLabel.Text     = "The Geek Freaks Tuning Pack 4.2"
    $aboutForm.Controls.Add($aboutFormNameLabel)
    # About Text Label
    $aboutFormText.Location = "100, 40"
    $aboutFormText.Size     = "300, 30"
    $aboutFormText.Text     = "          Created by MinersWin `n`r https://www.thegeekfreaks.de"
    $aboutFormText.Add_Click{(explorer https://thegeekfreaks.de)}
    $aboutForm.Controls.Add($aboutFormText)
    # About Exit Button
    $aboutFormExit.Location = "135, 70"
    $aboutFormExit.Text     = "OK"
    $aboutForm.Controls.Add($aboutFormExit)
    [void]$aboutForm.ShowDialog()
} # End About


Apply-Template
$Form1.ShowDialog()
