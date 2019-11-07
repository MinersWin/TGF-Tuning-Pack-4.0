$MyDir = Split-Path $script:MyInvocation.MyCommand.Path
Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'GUI.designer.ps1')

Write-Host "
___________ __                                    __     ___________                      __            
\__    ___/|  |__   ____      ____   ____   ____ |  | __ \_   _____/______   ____ _____  |  | __  ______
  |    |   |  |  \_/ __ \    / ___\_/ __ \_/ __ \|  |/ /  |    __) \_  __ \_/ __ \\__  \ |  |/ / /  ___/
  |    |   |   Y  \  ___/   / /_/  >  ___/\  ___/|    <   |     \   |  | \/\  ___/ / __ \|    <  \___ \ 
  |____|   |___|  /\___  >  \___  / \___  >\___  >__|_ \  \___  /   |__|    \___  >____  /__|_ \/____  >
                \/     \/  /_____/      \/     \/     \/      \/                \/     \/     \/     \/ 
                ___________           .__                                      __        _____    _______   
                \__    ___/_ __  ____ |__| ____    ____   ___________    ____ |  | __   /  |  |   \   _  \  
                  |    | |  |  \/    \|  |/    \  / ___\  \____ \__  \ _/ ___\|  |/ /  /   |  |_  /  /_\  \ 
                  |    | |  |  /   |  \  |   |  \/ /_/  > |  |_> > __ \\  \___|    <  /    ^   /  \  \_/   \
                  |____| |____/|___|  /__|___|  /\___  /  |   __(____  /\___  >__|_ \ \____   | /\ \_____  /
                                    \/        \//_____/   |__|       \/     \/     \/      |__| \/       \/                                                                                
 _             __  __ _                  __          ___       
| |           |  \/  (_)                 \ \        / (_)      
| |__  _   _  | \  / |_ _ __   ___ _ __ __\ \  /\  / / _ _ __  
| '_ \| | | | | |\/| | | '_ \ / _ \ '__/ __\ \/  \/ / | | '_ \ 
| |_) | |_| | | |  | | | | | |  __/ |  \__ \\  /\  /  | | | | |
|_.__/ \__, | |_|  |_|_|_| |_|\___|_|  |___/ \/  \/   |_|_| |_|
        __/ |                                                  
       |___/     
The Geek Freaks Tuning Pack 4.0 Update 12.09.2019
Download the newest Version: https://Github.com/MinersWin/TGF-Tuning-Pack-4.0
WE ASSUME NO RESPONSIBILITY FOR PROBLEMS WHICH COME WITH THE EXECUTION OF OUR PROGRAM!
This is a hobby project! Everything can create errors and problems! Use at your own risk!
WIR ÜBERNEHMEN KEINE VERANTWORTUNG FÜR PROBLEME DIE MIT DER AUSFÜHRUNG UNSERES PROGRAMMS EINHERGEHEN!
Das hier ist ein Hobbyprojekt! Alles kann Fehler und Probleme erzeugen! Benutzung auf eigene Gefahr!
"
##################################################################################################################################################################################
[System.Windows.Forms.MessageBox]::Show("Dies ist noch eine sehr frühe Alpha Version. Die Tweaks sind noch nicht funktionsfähig.","The Geek Freaks Tuning Pack 4.0 by MinersWin",1)



#Icon
$bitmap = [System.Drawing.Bitmap]::FromFile('.\Images\favicon.ico')
$bitmap.MakeTransparent()
$hicon = $bitmap.GetHicon()
$Form1.Icon = [system.drawing.icon]::FromHandle($hicon)


#Alles Ausgrauen
$Panel1.Enabled = $false
$Panel3.Enabled = $false
$TabPage1.Enabled = $false
$TabPage2.Enabled = $false
$TabPage4.Enabled = $false
$Button15.Enabled = $false
$CheckBox62.Enabled = $false
$CheckBox61.Enabled = $false
$Button16.Enabled = $false
$TabPage1.visible = $false
$TabPage2.visible = $false
$TabPage4.Visible = $false
6

#Geek Freaks Logo
$Picture = '.\Images\Unbenannt-1-250x90.png'
$img = [System.Drawing.Image]::Fromfile($Picture)
$PictureBox1.Image = $img
$PictureBox1.Add_Click({About})

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
$ToolTip_IE = New-Object System.Windows.Forms.ToolTip
$ToolTip_IE.SetToolTip($Button4,"Executes only on Internet Explorer V7 and up. Runs the built-in Windows tool to clean and reset Internet Explorer")
#CCleaner Icon
$CCIcon = ".\Images\tron_icon\Cornmanthe3rd-Plex-Other-CCleaner.ico"
$Button20.Image = ([System.Drawing.Image]::FromFile($CCIcon))
$ToolTip_CCleaner = New-Object System.Windows.Forms.ToolTip
$ToolTip_CCleaner.SetToolTip($Button20,"CCleaner utility by Pitiform. Used to clean temp files before running AV scanners. Note that CCleaner wipes %AppData% Local Storage.")
#BleachBit Icon
$BBIcon = ".\Images\tron_icon\favicon (1).ico"
$Button21.Image = ([System.Drawing.Image]::FromFile($BBIcon))
$ToolTip_Bleachbit = New-Object System.Windows.Forms.ToolTip
$ToolTip_Bleachbit.SetToolTip($Button21,"Bleachbit utility. Used to clean temp files before running AV scanners.")
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
$Tools = Test-Path .\Tools
if ($Tools){
    $Label18.ForeColor = "GREEN"
    $Label18.Text = "Tools found"
    $Panel8.Enabled = $true
    $Panel9.Enabled = $true
    $Panel10.Enabled = $true
    $Panel11.Enabled = $true
    $Panel12.Enabled = $true
} else {
    $Label18.ForeColor = "RED"
    $Label18.Text = "Could not find the tools, please download first."
    $Panel8.Enabled = $false
    $Panel9.Enabled = $false
    $Panel10.Enabled = $false
    $Panel11.Enabled = $false
    $Panel12.Enabled = $false
}



#Download Tools
$Button5.Add_Click({Start-Process PowerShell.exe "Write-Host 'Der Download Startet, dies kann je nach Internetgeschwindigkeit ca. 5-10 Minuten dauern. (500MB)'; Write-Host 'The download starts, this may take about 5-10 minutes, depending on the internet speed. (500MB)'; & '.\Download all Tools.ps1'"})

#Accept the Risk
$Button18.Add_Click{(Accept-Everything)}
function Accept-Everything{
    if ($CheckBox63.Checked){
        $TabPage3.Enabled = $false
        $Panel1.Enabled = $true
        $Panel3.Enabled = $true
        $TabPage1.Enabled = $true  
        $TabPage2.Enabled = $true
        $TabPage4.Enabled = $true
        $Button15.Enabled = $true
        $CheckBox62.Enabled = $true
        $CheckBox61.Enabled = $true
        $Button16.Enabled = $true  
        $TabPage1.visible = $true
        $TabPage2.visible = $true
        $TabPage4.Visible = $true
        $TabPage3.Visible = $false
        $TabControl1.SelectedTab = $TabPage1
    } else {
        [System.Windows.Forms.MessageBox]::Show("Please Accept | Bitte Akzeptieren","TGF Tuning Pack 4.0",1)
    }
}

#Write Risk Labels
$Label6.Text = "English:    "
$Label7.Text = "We do not take responsibility for problems that accompany the execution of our program! This is a hobby project! Everything can create errors and problems! Use at your own risk! Problems and bugs are welcome in the Discord: https://discordapp.com/invite/k5kMSa    "
$Label8.Text = "German: "
$Label9.Text = "Wir übernehmen keine Verantwortung für Probleme, die mit der Ausführung unseres Programms einhergehen! Dies ist ein hobbyprojekt! Alles kann Fehler und Probleme erzeugen! Benutzung auf eigene Gefahr! Probleme und Bugs können gerne im Discord gemeldet werden: https://discordapp.com/invite/k5kMSa "
$CheckBox61.Text = "Create System Recovery Point"

#Close when Click Close
$button17.Add_Click{($Form1.Close())}

#Open Tool Folder
$Button6.Add_Click{(Start "$($MyDir)\")}

#Make Everything German
$Button14.Add_Click{(Make-German)}

function Make-German{
    #Form
    $Label3.Text = "erstellt von MinersWin"

    #Registry Tweaks
    $CheckBox1.Text = "Zeige die 'Dieser PC' Verknüpfung auf dem Desktop"
    $CheckBox2.Text = "Zeige die 'Netzwerk' Verknüpfung auf dem Desktop"
    $CheckBox3.Text = "Klassischer Vertikaler Symbolabstand"
    $checkBox4.Text = "Fixiere die Taskleiste"
    $CheckBox5.Text = "Zeige immer alle Icons in der Taskleiste"
    $checkBox6.Text = "Verzögere die Anzeige von Miniaturansichten in der Taskleiste um 10 Sekunden"
    $CheckBox7.Text = "Aktiviere die Klassische Systemsteuerungsansicht"
    $CheckBox8.Text = "Deaktivieren der Einrastfunktion beim 5 maligen Drücken der SHIFT Taste"
    $CheckBox9.Text = "Deaktivieren der Filterfunktion beim 8 Sekunden langen drücken der SHIFT Taste"
    $CheckBox10.Text = "Deaktiviere den Ruhemodus"
    $CheckBox11.Text = "Unterstreiche Tastenkombinationen und Zugangsschlüssel"
    $CheckBox12.Text = "Zeige Dateiendungen im Windows Explorer"
    $checkBox13.Text = "Komprimierte NTFS-Dateien ausblenden"
    $CheckBox14.Text = "Zeige Versteckte Daten"
    $CheckBox15.Text = "Zeige Versteckte Systemdaten"
    $CheckBox17.Text = "Ersetze die Utilman.exe mit der Cmd.exe"
    $CheckBox18.Text = "Parke nur noch die Minimale Anzahl an Kernen"
    $CheckBox19.Text = "Deaktiviere CPU-Core-Parking"
    $CheckBox20.Text = "Entferne das Hintergrundbild im Anmeldebildschirm und setzte eine Statische Farbe (BLAU)"
    $CheckBox21.Text = "Deaktiviere den Sperrbildschirm"
    $CheckBox22.Text = "Entferne den Vorgängerversionen Tab aus den Eigenschaften"
    $CheckBox23.Text = "Deaktiviere Jump Lists"
    $CheckBox24.Text = "Deaktiviere das Senden von Errormeldungen an Microsoft"
    $CheckBox25.Text = "Deaktiviere Cortana (Sprache und Suchhilfe, welche auch Informationen an Microsoft sendet)"
    $CheckBox26.Text = "Verstecke die Suchbox aus der Taskleiste (Das Suchen über das Startmenü ist immer noch möglich)"
    $CheckBox27.Text = "MRU-Listen (Jump Lists) von XAML-Apps im Startmenü deaktivieren"
    $CheckBox29.Text = "Deaktivieren Sie die Registerkarte Datenträgerkontingent, die als Registerkarte in den Eigenschaften eines Laufwerks angezeigt wird"
    $CheckBox30.Text = "Verhindere die erstellung einer Werbe-ID"
    $CheckBox31.Text = "Entferne 'An Start anheften'"
    $CheckBox32.Text = "Deaktiviere Cortana, Bing, Suche und die Suchleiste"
    $CheckBox33.Text = "Deaktiviere den Error Dialog"
    $CheckBox34.Text = "Deaktiviere Administrative Freigaben"
    $CheckBox35.Text = "Füge 'Reboot to Recovery' zum Rechtsklickmenü von 'Dieser PC' hinzu"
    $CheckBox36.Text = "Änder das Uhrzeit und Datumsformat des Angemeldeten Nutzers zu 24H, metrisch"
    $CheckBox37.Text = "Aktiviere den Developer (Programmierer) Modus"
    $Checkbox38.Text = "Entferne die Nutzungs und Datenerfassung von Microsoft"
    $CheckBox28.Text = "Setze den Windows Explorer Start zu 'Dieser PC' anstatt 'Zuletzt Verwendet'"
    $CheckBox16.Text = "Hinder Windows und Office daran LNK Daten im 'Zuletzt Verwendet' Ordner zu erstellen."
    $CheckBox76.Text = "Zeige das User Profil auf dem Desktop"
    $CheckBox77.Text = "zeige die Systemsteuerung auf dem Desktop"

    #Removing Services
    $CheckBox39.Text = "Deaktivieren der Telemetrie und Datenerfassung"
    $CheckBox40.Text = "Deaktiviere Diagnose Service"
    $checkBox41.Text = "Deaktiviere den Distributed Link Tracking Client (Wenn der computer mit keinem Netzwerk verbunden ist)"
    $CheckBox42.Text = "Deaktiviere den WAP Push Message Routing Service (Um die Telemetrie und Datenerfassung zu unterbinden)"
    $checkBox43.Text = "Deaktiviere den Heruntergeladene Karten Manager (Wenn die Karten App nicht verwendet wird)"
    $CheckBox44.Text = "Deaktiviere den IP Helper (Wenn kein IPv6 verwendet wird)"
    $checkBox45.Text = "Deaktiviere den Programm Kompatibilitäts Assistenten Service"
    $CheckBox46.Text = "Deaktiviere den Druckwarteschlangendienst (wenn kein Drucker verwendet wird)"
    $CheckBox47.Text = "Deaktiviere die Remote Registry (aus Sicherheitsgründen DEAKTIVIEREN)"
    $CheckBox48.Text = "Deaktiviere die Zweitanmeldung"
    $CheckBox49.Text = "Deaktiviere das Security Center"
    $CheckBox50.Text = "Deaktiviere den TCP/IP NetBIOS Helper (Wenn keine WORKGROUP oder Active Directory benötigt wird)"
    $CheckBox51.Text = "Deaktiviere die Bildschirmtastatur und das Handschriftpanel (Wenn diese Features nicht benötigt werden)"
    $CheckBox52.Text = "Deaktiviere den Windows Error Melde Service"
    $CheckBox53.Text = "Deaktiviere den Windows Image Acquisition (WIA) Service (Wenn kein Scanner benötigt wird)"
    $checkBox54.Text = "Deaktiviere die Windows Suche (Senkt erheblich die Festplattenauslastung)"
    $CheckBox55.Text = "Deaktiviere die Tracking Services"
    $checkBox57.Text = "Deaktiviere die XBox Services"
    $CheckBox58.Text = "Deaktiviere den AllJoyn Router Service (Wenn kein Peer-2-Peer genutzt wird)"
    $CheckBox59.Text = "Deaktiviere den Bluetooth Service (Wenn keine Bluethooth Geräte genutzt werden)"
    $checkBox60.Text = "Deaktiviere den Standortservice"
    $CheckBox64.Text = "Deaktiviere den Windows Phone Service"
    $CheckBox65.Text = "Deaktiviere die Biometric Services"
    $checkBox66.Text = "Deaktiviere den Windows Mobile Hotspot Service"
    $checkBox67.Text = "Deaktiviere den Windows Media Player Network Sharing Service"
    $CheckBox68.Text = "Deaktiviere den Windows Update Service"
    $CheckBox69.Text = "Deaktiviere den Enterprise App Management Service"
    $checkBox70.Text = "Deaktiviere den Hyper-V Service"
    $CheckBox71.Text = "Deaktiviere den HomeGroup Listener"
    $CheckBox72.Text = "Deaktiviere den Net.Tcp Port Sharing Service"
    $CheckBox73.Text = "Deaktiviere den Routing Remote Access"
    $CheckBox74.Text = "Deaktiviere den Internet Connection Sharing (ICS) Service"
    $CheckBox75.Text = "Disable Superfetch (Sollte bei SSDs unbedingt deaktiviert werden, schadet auch bei HHDs nicht)"

    #Side Menu
    $Label4.Text = "Beispiele"
    $CheckBox62.Text = "Registry Sichern"
    $CheckBox61.Text = "Erstelle einen Wiederherstellungspunkt"
    $Button17.Text = "Beenden"
    $Button16.Text = "Make FPS Rain!"
}

#Translate to English
$Button13.Add_Click{(Make-English)}
function Make-English{
    #Form
    $Label3.Text = "created by MinersWin"

    #Registry Tweaks
    $CheckBox1.Text = "Show Computer Shortcut on Desktop"
    $CheckBox2.Text = "Show Network Shortcut on Desktop"
    $CheckBox3.Text = "Classic vertical Icon spacing"
    $checkBox4.Text = "Lock the Taskbar"
    $CheckBox5.Text = "Always show all icons on the Taskbar"
    $checkBox6.Text = "Delay taskbar thumbnail pop-ups to 10 seconds"
    $CheckBox7.Text = "Enable Classic control panel view"
    $CheckBox8.Text = "Turn OFF Sticky Keys when SHIFT is prssed 5 Times"
    $CheckBox9.Text = "Turn OFF Filter Keys when SHIFT is pressed for 8 seconds"
    $CheckBox10.Text = "Disable Hibernation"
    $CheckBox11.Text = "Underline keyboard shortcuts and access keys"
    $CheckBox12.Text = "Show known file extensions in Explorer"
    $checkBox13.Text = "Hide indication for compressed NTFS Files"
    $CheckBox14.Text = "Show Hidden files in Explorer"
    $CheckBox15.Text = "Show super Hidden System files in Explorer"
    $CheckBox17.Text = "Replace Utilman with CMD"
    $CheckBox18.Text = "Add the option 'Processor performance core parking min cores'"
    $CheckBox19.Text = "Disable CPU core Parking"
    $CheckBox20.Text = "Remove Logon screen wallpaper/background. Will use solid color instead (Accent color)"
    $CheckBox21.Text = "Disable lockscreen"
    $CheckBox22.Text = "Remove versioning tab from properties"
    $CheckBox23.Text = "Disable jump lists"
    $CheckBox24.Text = "Disable Windows Error Reporting"
    $CheckBox25.Text = "Disable Cortana (Speech, Search Assistant, which also sends information to Microsoft)"
    $CheckBox26.Text = "Hide search box from taskbar. You can still search by pressing the win key and start typing what youre looking for"
    $CheckBox27.Text = "Disable MRU lists (jump lists) of XAML apps in Start Menu"
    $CheckBox29.Text = "Disable Disk Quota tab, which appears as a tab when right-clicking on drive letter - Properties"
    $CheckBox30.Text = "Disable creation of an Advertising ID"
    $CheckBox31.Text = "Remove 'Pin to Start'"
    $CheckBox32.Text = "Disable Cortana, Bing, Search and Searchbar"
    $CheckBox33.Text = "Turn off the Error Dialog"
    $CheckBox34.Text = "Disable Administrative shares"
    $CheckBox35.Text = "Add 'Reboot to Recovery' to right-click menu of 'This PC'"
    $CheckBox36.Text = "Change Clock and Date formats of current User to: 24H, metric"
    $CheckBox37.Text = "Enable Developer Mode"
    $Checkbox38.Text = "remove telemetry and data collection"
    $CheckBox28.Text = "Set Windows Explorer to start on 'This PC' instead of 'Quick Access'"
    $CheckBox16.Text = "Prevent both windows and Office from creating LNK files in the Recents folder"
    $CheckBox76.Text = "Show User Profile on Desktop"
    $CheckBox77.Text = "Show Control Panel on Desktop"

    #Removing Services
    $CheckBox39.Text = "Disable Connected User Experiences and Telemetry (To turn off Telemetry and data collection)"
    $CheckBox40.Text = "Disable Diagnostic Policy Service"
    $checkBox41.Text = "Disable Distributed Link Tracking Client (If your computer is not connected to any network)"
    $CheckBox42.Text = "Disable WAP Pust Message Routing Service (To turn off Telemetry and Data Collection)"
    $checkBox43.Text = "Disable Downloaded Maps Manager (If you dont use Maps app)"
    $CheckBox44.Text = "Disable IP Helper (If you dont use IPv6 Connection)"
    $checkBox45.Text = "Disable Program Compatibility Assistant Service"
    $CheckBox46.Text = "Disable Printer Spooler (If you dont have a printer)"
    $CheckBox47.Text = "Disable Remote Registry (You can set it to DISABLED for Security purposes"
    $CheckBox48.Text = "Disable Secondary Logon"
    $CheckBox49.Text = "Disable Security center"
    $CheckBox50.Text = "Disable TCP/IP NetIOS Helper (If you are not in a workgroup network)"
    $CheckBox51.Text = "Disable Touch Keyboard and Handwriting Panel Service (If you dont want to use touch keyboard and handwriting features)"
    $CheckBox52.Text = "Disable Windows error Reporting Service"
    $CheckBox53.Text = "Disable Windows Image Acquisition (WIA) (If you dont have a scanner)"
    $checkBox54.Text = "Disable Windows Search"
    $CheckBox55.Text = "Disable tracking services"
    $checkBox57.Text = "Disable Xbox Services"
    $CheckBox58.Text = "Disable AllJoyn Router Services (If ou dont use Peer2Peer)"
    $CheckBox59.Text = "Disable Bluetooth Services"
    $checkBox60.Text = "Disable Geolocation Service"
    $CheckBox64.Text = "Disable Phone Service"
    $CheckBox65.Text = "Disable Windows Biometric Service"
    $checkBox66.Text = "Disable Windows Mobile Hotspot Service"
    $checkBox67.Text = "Disable Windows Media Player Network Sharing"
    $CheckBox68.Text = "Disable Windows Update Service"
    $CheckBox69.Text = "Disable Enterprise App Management Service"
    $checkBox70.Text = "Disable Hyper-V Services"
    $CheckBox71.Text = "Disable HomeGroup Listener"
    $CheckBox72.Text = "Disable Net.Tcp Port Sharing Service"
    $CheckBox73.Text = "Disable Routing and Remote Access"
    $CheckBox74.Text = "Disable Internet Connection Sharing (ICS)"
    $CheckBox75.Text = "Disable Superfetch (A must for SSD drives, but good in general)"

    #Side Menu
    $Label4.Text = "Templates"
    $CheckBox62.Text = "Backup Registry"
    $CheckBox61.Text = "Create System Recovery Point"
    $Button17.Text = "Close"
    $Button16.Text = "Make FPS Rain!"
}

#Add Ninite
$Button19.Add_Click{(.\Ninite\Ninite.ps1)}

#ComboBox Templates
$ComboBox1.Items.Add("Best Performance")
$ComboBox1.Items.Add("Maximum Battery Life")
$ComboBox1.Items.Add("Maximum Privacy")
$ComboBox1.Items.Add("Recommended")
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
    #Create RecoveryPoint
    if ($CheckBox61.Checked){
        wmic /namespace:\\root\default path SystemRestore call Enable C:\
        Write-Host "Die erstellung von Wiederherstellungspunkten wurde aktiviert"
        Checkpoint-Computer -Description 'TGF_Tuning_Pack_4' -RestorePointType MODIFY_SETTINGS
        $Date = Get-Date
        Write-Host "Der Wiederherstellungspunkt wurde erstellt. Er trägt den Namen: $($Date) TGF Tuning Pack"
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
        $ProgressBar1.Value = 1
        $Label11.Text = "1%"
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
        $ProgressBar1.Value = 2
        $Label11.Text = "2%"
        $Label12.Text = "Always show all Taskbar Icons and Notifications and restart explorer.exe"
        Write-Host "Always show all Taskbar Icons and Notifications and restart explorer.exe"
    }
    if ($CheckBox6.Checked){
        reg import .\Scripts\Registry\Change-Delay-Time-Show-Taskbar-Thumbnails-to-10-sec.reg
        $ProgressBar1.Value = 2
        $Label11.Text = "2%"
        $Label12.Text = "Change the Time to Show Taskbar Thumbnails to 10 sec."
        Write-Host "Change the Time to Show Taskbar Thumbnails to 10 sec."
    }
    if ($CheckBox7.Checked){
        reg import .\Scripts\Registry\Enable_Control_Panel_and_Settings.reg
        $ProgressBar1.Value = 3
        $Label11.Text = "3%"
        $Label12.Text = "Enable Classic Control Panel View."
        Write-Host "Enable Classic Control Panel View."
    }
    if ($CheckBox8.Checked){
        reg import .\Scripts\Registry\Permanently-disabling-sticky-keys.reg
        $ProgressBar1.Value = 3
        $Label11.Text = "3%"
        $Label12.Text = "Turn of Sticky Keys."
        Write-Host "Turn of Sticky Keys."
    }
    if ($CheckBox9.Checked){
        reg import .\Scripts\Registry\Permanently-disabling-sticky-keys.reg
        $ProgressBar1.Value = 3
        $Label11.Text = "3%"
        $Label12.Text = "Turn of Filter Keys."
        Write-Host "Turn of Filter Keys."
    }
    if ($CheckBox10.Checked){
        reg import .\Scripts\Registry\Disable_Hibernate.reg
        $ProgressBar1.Value = 4
        $Label11.Text = "4%"
        $Label12.Text = "Disable Hibernation."
        Write-Host "Disable Hibernation."
    }
    if ($CheckBox11.Checked){
        reg import .\Scripts\Registry\Turn_ON_underline_keyboard_shortcuts_in_menus.reg
        $ProgressBar1.Value = 4
        $Label11.Text = "4%"
        $Label12.Text = "Turned On the Underline of KeyBoard Shortcuts in Menus."
        Write-Host "Turned On the Underline of KeyBoard Shortcuts in Menus."
    }
    if ($CheckBox12.Checked){
        .\Scripts\Registry\Show_Known_Extensions_for_File_Types.vbs
        $ProgressBar1.Value = 4
        $Label11.Text = "4%"
        $Label12.Text = "Show Known File Extensions for File Types."
        Write-Host "Show Known File Extensions for File Types"
    }
    if ($CheckBox13.Checked){
        reg import .\Scripts\Registry\hide-ntfs-compression-blue-double-arrow-icon-overlay.reg
        $ProgressBar1.Value = 5
        $Label11.Text = "5%"
        $Label12.Text = "Hide indication for compressed NTFS Files"
        Write-Host "Hide indication for compressed NTFS Files"
    }
    if ($CheckBox14.Checked){
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f
        $ProgressBar1.Value = 5
        $Label11.Text = "5%"
        $Label12.Text = "Show every Hidden File in Windows Explorer"
        Write-Host = "Show every Hidden File in Windows Explorer"
    }
    if ($CheckBox15.Checked){
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /t REG_DWORD /d 1 /f
        $ProgressBar1.Value = 5
        $Label11.Text = "5%"
        $Label12.Text = "Show Super Hidden Files in Windows Explorer"
        Write-Host = "Show Super Hidden Files in Windows Explorer"
    }
    if ($CheckBox17.Checked){
        reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\utilman.exe" /v "Debugger" /t REG_SZ /d "cmd.exe" /f
        $ProgressBar1.Value = 6
        $Label11.Text = "6%"
        $Label12.Text = "Replace Utilman with CMD"
        Write-Host = "Replace Utilman with CMD"
    }
    if ($CheckBox18.Checked){
        reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "Attributes" /t REG_DWORD /d 0 /f
        $ProgressBar1.Value = 6
        $Label11.Text = "6%"
        $Label12.Text = "Add the option Processor performance core parking min core."
        Write-Host = "Add the option Processor performance core parking min core."
    }
    if ($CheckBox19.Checked){
        reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d 0 /f
        $ProgressBar1.Value = 6
        $Label11.Text = "6%"
        $Label12.Text = "Disable CPU Core Parking"
        Write-Host = "Disable CPU Core Parking"
    }
    if ($CheckBox20.Checked){
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "DisableLogonBackgroundImage" /t REG_DWORD /d 1 /f
        $ProgressBar1.Value = 7
        $Label11.Text = "7%"
        $Label12.Text = "Remove Logon screen wallpaper/background. Will use solid color instead (Accent color)"
        Write-Host = "Remove Logon screen wallpaper/background. Will use solid color instead (Accent color)"
    }
    if ($CheckBox21.Checked){
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v "NoLockScreen" /t REG_DWORD /d 1 /f
        $ProgressBar1.Value = 7
        $Label11.Text = "7%"
        $Label12.Text = "Disable Lockscreen"
        Write-Host = "Disable Lockscreen"
    }
    if ($CheckBox22.Checked){
        reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v NoPreviousVersionsPage /t REG_DWORD /d 1 /f
        $ProgressBar1.Value = 7
        $Label11.Text = "7%"
        $Label12.Text = "Remove versioning tab from properties"
        Write-Host = "Remove versioning tab from properties"
    }
    if ($CheckBox23.Checked){
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d 0 /f
        $ProgressBar1.Value = 8
        $Label11.Text = "8%"
        $Label12.Text = "Disable jump lists"
        Write-Host = "Disable jump lists"
    }
    if ($CheckBox24.Checked){
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f
        $ProgressBar1.Value = 8
        $Label11.Text = "8%"
        $Label12.Text = "Disable Windows Error Reporting"
        Write-Host = "Disable Windows Error Reporting"
    }
    if ($CheckBox25.Checked){
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
        $ProgressBar1.Value = 8
        $Label11.Text = "8%"
        $Label12.Text = "Disable Cortana (Speech Search Assistant, which also sends information to Microsoft"
        Write-Host = "Disable Cortana (Speech Search Assistant, which also sends information to Microsoft"
    }
    if ($CheckBox26.Checked){
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f
        $ProgressBar1.Value = 9
        $Label11.Text = "9%"
        $Label12.Text = "Hide the search box from taskbar. You can still search by pressing the win key and start typing what you are looking for."
        Write-Host = "Hide the search box from taskbar. You can still search by pressing the win key and start typing what you are looking for"
    }
    if ($CheckBox27.Checked){
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d 0 /f
        $ProgressBar1.Value = 9
        $Label11.Text = "9%"
        $Label12.Text = "Disable MRU lists (jump lists) of XAML apps in Start Menu"
        Write-Host = "Disable MRU lists (jump lists) of XAML apps in Start Menu"
    }
    if ($CheckBox29.Checked){
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d 0 /f
        $ProgressBar1.Value = 9
        $Label11.Text = "9%"
        $Label12.Text = "Disable MRU lists (jump lists) of XAML apps in Start Menu"
        Write-Host = "Disable MRU lists (jump lists) of XAML apps in Start Menu"
    }
    if ($CheckBox30.Checked){
        reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f
        $ProgressBar1.Value = 10
        $Label11.Text = "10%"
        $Label12.Text = "Disable creation of an Advertising ID"
        Write-Host = "Disable creation of an Advertising ID"
    }
    if ($CheckBox31.Checked){
        reg delete "HKEY_CLASSES_ROOT\exefile\shellex\ContextMenuHandlers\PintoStartScreen" /f
        reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\PintoStartScreen" /f
        reg delete "HKEY_CLASSES_ROOT\mscfile\shellex\ContextMenuHandlers\PintoStartScreen" /f
        $ProgressBar1.Value = 10
        $Label11.Text = "10%"
        $Label12.Text = "Remove Pin to start"
        Write-Host = "Remove Pin to start"
    }
    if ($CheckBox32.Checked){
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d 0 /f
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f
        $ProgressBar1.Value = 10
        $Label11.Text = "10%"
        $Label12.Text = "Disable Cortana, Bing Search and Searchbar"
        Write-Host = "Disable Cortana, Bing Search and Searchbar"
    }
    if ($CheckBox33.Checked){
        reg add "HKCU\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "DontShowUI" /t REG_DWORD /d 1 /f
        reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "DontShowUI" /t REG_DWORD /d 1 /f
        $ProgressBar1.Value = 11
        $Label11.Text = "11%"
        $Label12.Text = "Turn off the Error Dialog"
        Write-Host = "Turn off the Error Dialog"
    }
    if ($CheckBox34.Checked){
        reg add "HKLM\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareWks" /t REG_DWORD /d 0 /f
        reg add "HKLM\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareServer" /t REG_DWORD /d 0 /f
        $ProgressBar1.Value = 11
        $Label11.Text = "11%"
        $Label12.Text = "Disable Administrative shares"
        Write-Host = "Disable Administrative shares"
    }
    if ($CheckBox35.Checked){
        %SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
        %SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
        reg add "HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\Reboot to Recovery" /v "Icon" /t REG_SZ /d "%SystemRoot%\System32\imageres.dll,-110" /f
        reg add "HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\Reboot to Recovery\command" /ve /d "shutdown.exe -r -o -f -t 00" /f
        $ProgressBar1.Value = 11
        $Label11.Text = "11%"
        $Label12.Text = "Add Reboot to Recovery to right-click menu of This PC"
        Write-Host = "Add Reboot to Recovery to right-click menu of This PC"
    }
    if ($CheckBox36.Checked){
        reg add "HKCU\Control Panel\International" /v "iMeasure" /t REG_SZ /d "0" /f
        reg add "HKCU\Control Panel\International" /v "iNegCurr" /t REG_SZ /d "1" /f
        reg add "HKCU\Control Panel\International" /v "iTime" /t REG_SZ /d "1" /f
        reg add "HKCU\Control Panel\International" /v "sShortDate" /t REG_SZ /d "yyyy/MM/dd" /f
        reg add "HKCU\Control Panel\International" /v "sShortTime" /t REG_SZ /d "HH:mm" /f
        reg add "HKCU\Control Panel\International" /v "sTimeFormat" /t REG_SZ /d "H:mm:ss" /f
        $ProgressBar1.Value = 12
        $Label11.Text = "12%"
        $Label12.Text = "Change Clock and Date formats of current user to 24H, metric (Sign out required to see changes)"
        Write-Host = "Change Clock and Date formats of current user to 24H, metric (Sign out required to see changes)"
    }
    if ($CheckBox37.Checked){
        reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /v "AllowAllTrustedApps" /t REG_DWORD /d 1 /f
        reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /v "AllowDevelopmentWithoutDevLicense" /t REG_DWORD /d 1 /f
        $ProgressBar1.Value = 12
        $Label11.Text = "12%"
        $Label12.Text = "Enable Developer Mode (enables you to run XAML apps you develop in visual Studio which havent been certified yet)"
        Write-Host = "Enable Developer Mode (enables you to run XAML apps you develop in Visual Studio which havent been certified yet)"
    }
    if ($CheckBox38.Checked){
        reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f
        reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
        reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v DontOfferThroughWUAU /t REG_DWORD /d 1 /f
        reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1 /f
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
        reg add "HKLM\COMPONENTS\DerivedData\Components\amd64_microsoft-windows-c..lemetry.lib.cortana_31bf3856ad364e35_10.0.10240.16384_none_40ba2ec3d03bceb0" /v "f!dss-winrt-telemetry.js" /t REG_DWORD /d 0 /f
        reg add "HKLM\COMPONENTS\DerivedData\Components\amd64_microsoft-windows-c..lemetry.lib.cortana_31bf3856ad364e35_10.0.10240.16384_none_40ba2ec3d03bceb0" /v "f!proactive-telemetry.js" /t REG_DWORD /d 0 /f
        reg add "HKLM\COMPONENTS\DerivedData\Components\amd64_microsoft-windows-c..lemetry.lib.cortana_31bf3856ad364e35_10.0.10240.16384_none_40ba2ec3d03bceb0" /v "f!proactive-telemetry-event_8ac43a41e5030538" /t REG_DWORD /d 0 /f
        reg add "HKLM\COMPONENTS\DerivedData\Components\amd64_microsoft-windows-c..lemetry.lib.cortana_31bf3856ad364e35_10.0.10240.16384_none_40ba2ec3d03bceb0" /v "f!proactive-telemetry-inter_58073761d33f144b" /t REG_DWORD /d 0 /f

        reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f
        reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d 0 /f
        reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Telemetry" /v "Enabled" /t REG_DWORD /d 0 /f
        $ProgressBar1.Value = 12
        $Label11.Text = "12%"
        $Label12.Text = "Remove telemetry and data collection"
        Write-Host = "Remove telemetry and data collection"
    }
    if ($CheckBox28.Checked){
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f
        $ProgressBar1.Value = 13
        $Label11.Text = "13%"
        $Label12.Text = "Set Windows Explorer to start on This PC instead of Quick Access"
        Write-Host = "Set Windows Explorer to start on This PC instead of Quick Access"
    }
    if ($CheckBox16.Checked){
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRecentDocsHistory" /t REG_DWORD /d 1 /f
        $ProgressBar1.Value = 13
        $Label11.Text = "13%"
        $Label12.Text = "Prevent both Windows and Office from creating LNK files in the Recents folder"
        Write-Host = "Prevent both Windows and Office from creating LNK files in the Recent folder"
    }
    #
    # Removing Services tab
    #
    if ($CheckBox39.Checked){
        & '.\Scripts\Removing Services\DisableConnectedUserExperiencesandTelemetry.bat'
        $ProgressBar1.Value = 13
        $Label11.Text = "13%"
        $Label12.Text = "Disable Connected User Experiences and Telemetry (To turn off Telemetry and Data collection)"
        Write-Host = "Disable Connected User Experiences and Telemetry (To turn off Telemetry and Data collection)"
    }
    if ($CheckBox40.Checked){
        & '.\Scripts\Removing Services\DisableDiagnosticPolicyService.bat'
        $ProgressBar1.Value = 14
        $Label11.Text = "14%"
        $Label12.Text = "Disable Diagnostic Policy Service"
        Write-Host = "Disable Diagnostic Policy Service"
    }
    if ($CheckBox41.Checked){
        & '.\Scripts\Removing Services\DisableDistributedLinkTrackingClient.bat'
        $ProgressBar1.Value = 14
        $Label11.Text = "14%"
        $Label12.Text = "Disable Distributed Link Tracking Client (If your computer is not connected to any network)"
        Write-Host = "Disable Distributed Link Tracking Client (If your computer is not connected to any network)"
    }
    if ($CheckBox42.Checked){
        & '.\Scripts\Removing Services\DisableWAPPushMessageRoutingService.bat'
        $ProgressBar1.Value = 14
        $Label11.Text = "14%"
        $Label12.Text = "Disable WAP Push Message Routing Service (To turn off Telemetry and Data Collection)"
        Write-Host = "Disable WAP Push Message Routing Service (To Turn off Telemetry and Data Collection)"
    }
    if ($CheckBox43.Checked){
        & '.\Scripts\Removing Services\DisableDownloadedMapsManager.bat'
        $ProgressBar1.Value = 15
        $Label11.Text = "15%"
        $Label12.Text = "Disable Downloaded Maps Manager (If you dont user Maps app)"
        Write-Host = "Disable Downloaded Maps Manager (If you dont use Maps app)"
    }
    if ($CheckBox44.Checked){
        & '.\Scripts\Removing Services\DisableIPHelper.bat'
        $ProgressBar1.Value = 15
        $Label11.Text = "15%"
        $Label12.Text = "Disable IP Helper (If you dont use IPv6 connection)"
        Write-Host = "Disable IP Helper (If you dont use IPv6 connection)"
    }
    if ($CheckBox45.Checked){
        & '.\Scripts\Removing Services\DisableProgramCompatibilityAssistantService.bat'
        $ProgressBar1.Value = 15
        $Label11.Text = "15%"
        $Label12.Text = "Disable Program Compatibility Assistant Service"
        Write-Host = "Disable Program Compatibility Assistant Service"
    }
    if ($CheckBox46.Checked){
        & '.\Scripts\Removing Services\DisablePrintSpooler.bat'
        $ProgressBar1.Value = 16
        $Label11.Text = "16%"
        $Label12.Text = "Disable Print Spooler (If you dont have a printer)"
        Write-Host = "Disable Print Spooler (If you dont have a printer)"
    }
    if ($CheckBox47.Checked){
        & '.\Scripts\Removing Services\DisableRemoteRegistry.bat'
        $ProgressBar1.Value = 16
        $Label11.Text = "16%"
        $Label12.Text = "Disable Remote Registry"
        Write-Host = "Disable Remote Registry"
    }
    if ($CheckBox48.Checked){
        & '.\Scripts\Removing Services\DisableSecondaryLogon.bat'
        $ProgressBar1.Value = 16
        $Label11.Text = "16%"
        $Label12.Text = "Disable Secondary Logon"
        Write-Host = "Disable Secondary Logon"
    }
    if ($CheckBox49.Checked){
        & '.\Scripts\Removing Services\DisableSecurityCenter.bat'
        $ProgressBar1.Value = 17
        $Label11.Text = "17%"
        $Label12.Text = "Disable Security Center"
        Write-Host = "Disable Security Center"
    }
    if ($CheckBox50.Checked){
        & '.\Scripts\Removing Services\IPNetBIOSHelper.bat'
        $ProgressBar1.Value = 17
        $Label11.Text = "17%"
        $Label12.Text = "Disable TCP/IP NetBIOS Helper (If you are not in a workgroup network)"
        Write-Host = "Disable TCP/IP NetBIOS Helper (If you are not in a workgroup network)"
    }
    if ($CheckBox51.Checked){
        & '.\Scripts\Removing Services\DisableTochKeyboardandHandwritingPanelService.bat'
        $ProgressBar1.Value = 17
        $Label11.Text = "17%"
        $Label12.Text = "Disable Touch Keyboard and Handwriting Panel Service (If you want to use touch keyboard and handwriting features)"
        Write-Host = "Disable Touch Keyboard and Handwriting Panel Service (If you want to use touch keyboard and handwriting features)"
    }
    if ($CheckBox52.Checked){
        & '.\Scripts\Removing Services\DisableWindowsErrorReportingService.bat'
        $ProgressBar1.Value = 18
        $Label11.Text = "18%"
        $Label12.Text = "Disable Windows Error Reporting Service"
        Write-Host = "Disable Windows Error Reporting Service"
    }
    if ($CheckBox53.Checked){
        & '.\Scripts\Removing Services\DisableWindowsImageAcquisition.bat'
        $ProgressBar1.Value = 18
        $Label11.Text = "18%"
        $Label12.Text = "Disable Windows Image Acquisition (WIA) (If you dont have a scannner)"
        Write-Host = "Disable Windows Image Acquisition (WIA) (If you dont have a scanner)"
    }
    if ($CheckBox54.Checked){
        & '.\Scripts\Removing Services\DisableWindowsSearch.bat'
        $ProgressBar1.Value = 18
        $Label11.Text = "18%"
        $Label12.Text = "Disable Windows Search"
        Write-Host = "Disable Windows Search"
    }
    if ($CheckBox55.Checked){
        & '.\Scripts\Removing Services\DisableTrackingServices.bat'
        $ProgressBar1.Value = 19
        $Label11.Text = "19%"
        $Label12.Text = "Disable Tracking Services"
        Write-Host = "Disable Tracking Services"
    }
    #Finish Progressbar
    $ProgressBar1.Value = 50
    $Label11.Text = "50%"
    Start-Sleep 1
    $ProgressBar1.Value = 51
    $Label11.Text = "51%"
    Start-Sleep 1
    $ProgressBar1.Value = 52
    $Label11.Text = "52%"
    Start-Sleep 1
    $ProgressBar1.Value = 53
    $Label11.Text = "53%"
    Start-Sleep 1
    $ProgressBar1.Value = 54
    $Label11.Text = "54%"
    Start-Sleep 1
    $ProgressBar1.Value = 56
    $Label11.Text = "56%"
    Start-Sleep 1
    $ProgressBar1.Value = 57
    $Label11.Text = "57%"
    Start-Sleep 1
    $ProgressBar1.Value = 100
    $Label11.Text = "100%"

}
if ($CheckBox39.Checked){
        sc config DiagTrack start= Disabled
        $ProgressBar1.Value = 12
        $Label11.Text = "12%"
        $Label12.Text = "Remove telemetry and data collection"
        Write-Host = "Remove telemetry and data collection"
    }
#Templates 
$Button1.Add_Click{([System.Windows.Forms.MessageBox]::Show("Work in Progress!","TGF Tuning Pack 4.0",1))}
$Button2.Add_Click{(Apply-Template)}

function Apply-Template{##############FIXME##############
    if ($ComboBox1.SelectedItem -eq "Recommended"){
        $CheckBox1.Checked = $true 
        $CheckBox2.Checked = $true
        $CheckBox3.Checked = $true
        $CheckBox4.Checked = $true
        $CheckBox5.Checked = $true
        $CheckBox6.Checked = $false
        $CheckBox7.Checked = $true
        $CheckBox8.Checked = $true
        $CheckBox9.Checked = $true
        $CheckBox10.Checked = $true
        $CheckBox11.Checked = $true
        $CheckBox12.Checked = $true
        $CheckBox13.Checked = $true
        $CheckBox14.Checked = $true
        $CheckBox15.Checked = $true
        $CheckBox16.Checked = $true
        $CheckBox17.Checked = $true
        $CheckBox18.Checked = $true
        $CheckBox19.Checked = $true
        $CheckBox20.Checked = $true
        $CheckBox21.Checked = $true
        $CheckBox22.Checked = $true
        $CheckBox23.Checked = $true
        $CheckBox24.Checked = $true
        $CheckBox25.Checked = $true
        $CheckBox26.Checked = $true
        $CheckBox27.Checked = $true
        $CheckBox29.Checked = $true
        $CheckBox30.Checked = $true
        $CheckBox31.Checked = $false
        $CheckBox32.Checked = $true
        $CheckBox33.Checked = $true
        $CheckBox34.Checked = $true
        $CheckBox35.Checked = $true
        $CheckBox36.Checked = $true
        $CheckBox37.Checked = $true
        $CheckBox38.Checked = $true
        $CheckBox28.Checked = $true
        $CheckBox39.Checked = $true
        $CheckBox40.Checked = $true
        $CheckBox41.Checked = $false
        $CheckBox42.Checked = $true
        $CheckBox43.Checked = $true
        $CheckBox44.Checked = $false
        $CheckBox45.Checked = $true
        $CheckBox46.Checked = $false
        $CheckBox47.Checked = $true
        $CheckBox48.Checked = $true
        $CheckBox49.Checked = $true
        $CheckBox50.Checked = $false
        $CheckBox51.Checked = $true
        $CheckBox52.Checked = $true
        $CheckBox53.Checked = $false
        $CheckBox54.Checked = $true
        $CheckBox55.Checked = $true
        $CheckBox57.Checked = $true
        $CheckBox58.Checked = $true
        $CheckBox60.Checked = $true
        $CheckBox64.Checked = $true
        $CheckBox65.Checked = $true
        $CheckBox66.Checked = $true
        $CheckBox69.Checked = $true
        $CheckBox70.Checked = $true
        $CheckBox71.Checked = $true
        $CheckBox72.Checked = $true
        $CheckBox74.Checked = $true
        $CheckBox75.Checked = $true
    }
}

#Add Tooltips
$tooltip1 = New-Object System.Windows.Forms.ToolTip
$tooltip1.SetToolTip($CheckBox1,"Add the 'My Computer' Icon to the Windows 10 Desktop")
$tooltip2 = New-Object System.Windows.Forms.ToolTip
$tooltip2.SetToolTip($CheckBox2,"Add the 'Network' Icon to the Windows 10 Desktop")
$tooltip3 = New-Object System.Windows.Forms.ToolTip
$tooltip3.SetToolTip($CheckBox3,"Icon vertical spacing is for how much vertical (up/down)empty space there is inbetween the icons on your desktop separate them wich.")
$tooltip4 = New-Object System.Windows.Forms.ToolTip
$tooltip4.SetToolTip($CheckBox4,"You can keep the taskbar in one place by locking it, which can prevent accidental moving or resizing. If you unlock it, you can drag the taskbar to resize or move it to the bottom, left or right side, or top of your display(s).")
$tooltip5 = New-Object System.Windows.Forms.ToolTip
$tooltip5.SetToolTip($CheckBox5,"Always show all Icons in the Notificationbar")
$tooltip6 = New-Object System.Windows.Forms.ToolTip
$tooltip6.SetToolTip($CheckBox6,"Delay the Taskbars on mouse hover to 10 Seconds")
$tooltip7 = New-Object System.Windows.Forms.ToolTip
$tooltip7.SetToolTip($CheckBox7,"Enables the Classic Control Panel View without Categories")
$tooltip8 = New-Object System.Windows.Forms.ToolTip
$tooltip8.SetToolTip($CheckBox8,"Say something")


######################################################################################################################################################################################
### All the Tools ###
######################################################################################################################################################################################
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
    [System.Windows.Forms.MessageBox]::Show("Prozesse werden beendet","TGF Tuning Pack 4.0",1)
    Write-Host "Prozesse werden beendet."
    & '.\Scripts\ProcessKiller-Tuning-Pack.bat'
    Write-Host "Die Prozesse wurden beendet"
    Test_Kill_Process
}
function Download_Kill-Process{
    Set-Location .\Scripts\
    wget 'http://download.tuning-pack.de/TGF/Scripts/ProcessKiller-Tuning-Pack.bat' -OutFile 'ProcessKiller-Tuning-Pack.bat'
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
        wget 'http://download.tuning-pack.de/TGF/Tools/IE%20Cleanup.zip' -OutFile 'IE_Cleanup.zip'
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
        wget 'http://download.tuning-pack.de/TGF/Tools/CCleaner.zip' -OutFile 'CCleaner.zip'
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
        wget 'http://download.tuning-pack.de/TGF/Tools/BleachBit.zip' -OutFile 'BleachBit.zip'
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
        wget 'http://download.tuning-pack.de/TGF/Tools/Temp%20File%20Cleanup.zip' -OutFile 'TempFileCleanup.zip'
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
        wget 'http://download.tuning-pack.de/TGF/Tools/Drive%20Cleanup.zip' -OutFile 'DriveCleanup.zip'
        Expand-Archive .\DriveCleanup.zip -DestinationPath .\
        rm DriveCleanup.zip
        Set-Location .\..\
        Test_USBDeviceCleanup
    }
#Cleanup Duplicate Downloads
###FIXME###

#$Button24.Add_Click{([System.Windows.Forms.MessageBox]::Show("WIP","TGF Tuning Pack 4.0"1))}

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
        wget 'http://download.tuning-pack.de/TGF/Tools/Clear%20Update%20Cache.zip' -OutFile 'ClearUpdateCache.zip'
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
    [System.Windows.Forms.MessageBox]::Show("Diese funktion ist momentan nicht verfügbar, Microsoft hat dieses Feature eingestellt. Ich arbeite momentan an einer Alternative","TGF Tuning Pack 4.0 by MinersWin",1)
}
#System File Checker
$Button12.Add_Click{(System-File-Checker)}
function System-File-Checker{
    [System.Windows.Forms.MessageBox]::Show("Es wird sich gleich ein Konsolenfenster öffnen, in welchem ein Windows Image heruntergeladen wird, mit welchem das System auf Fehler geprüft wird. Das Image wird nach Abschluss des Vorgangs wieder gelöscht. Zum Bestätigen OK drücken","TGF Tuning Pack 4.0 by MinersWin",1)
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

function Refresh_Tools{
Test_Kill_Process
Test_IE_Clean
Test_CCleaner
Test_BleachBit
Test_TFC
Test_USBDeviceCleanup
Test_Clear-UpdateCache
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
    $aboutForm.Text          = "The Geek Freaks Tuning Pack 4.0"
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
    $aboutFormNameLabel.Text     = "The Geek Freaks Tuning Pack 4.0"
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