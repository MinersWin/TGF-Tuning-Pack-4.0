$Form1_Load = {
}
$ProgressBar1_Click = {
}
$TabPage4_Click = {
}
$CheckBox40_CheckedChanged = {
}
$CheckBox39_CheckedChanged = {
}
$TabPage2_Click = {
}
$Panel5_Paint = {
}
$TabPage1_Click = {
}
$CheckBox63_CheckedChanged = {
}
$CheckBox11_CheckedChanged = {
}
$CheckBox2_CheckedChanged = {
}
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

#Download Tools
$Button5.Add_Click({& '.\Tools\Download all Tools.ps1'})

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
$Button6.Add_Click{(Start "$($MyDir)\Tools\")}

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
    $checkBox56.Text = "Deaktiviere das Präventive laden häufig genutzter Programme in den RAM (Superfetch)"
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
    $CheckBox75.Text = "Disable Superfetch (Sollte bei SSDs unbedingt aktiviert werden, schadet auch bei HHDs nicht)"

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
    $checkBox56.Text = "disable Superfetch"
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
    $CheckBox74.Text = "Disavle Internet Connection Sharing (ICS)"
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
    #Show Desktop Icon on Desktop
    if ($CheckBox1.Checked){
        reg import .\Scripts\Registry\Add_This-PC_Desktop_Icon.reg
        $ProgressBar1.Value = 1
        $Label11.Text = "1%"
        $Label12.Text = "The registry entry is added. The icon of 'This Computer' is now visible on the desktop."
        Start-Sleep 0.3
    }
    #Show Network Icon on Desktop
    if ($CheckBox2.Checked){
        reg import .\Scripts\Registry\Add_Network_Desktop_Icon.reg
        $ProgressBar1.Value = 2
        $Label11.Text = "2%"
        $Label12.Text = "The registry entry is added. The icon of 'Network' is now visible on the desktop."
        Start-Sleep 0.3
    }
    #Classic vertical Icon spacing
    if ($CheckBox3.Checked){
        reg import .\Scripts\Registry\Reset_Classic_Vertica_Icon_Spacing.reg
        $ProgressBar1.Value = 3
        $Label11.Text = "3%"
        $Label12.Text = "The default vertical icon spacing for the desktop is now set."
        Start-Sleep 0.3
    }
    if ($CheckBox4.Checked){
        reg import .\Scripts\Registry\Enable_ability_to_lock_and_unlock_taskbar.reg
        $ProgressBar1.Value = 4
        $Label11.Text = "4%"
        $Label12.Text = "Enable the Ability to lock and unlock the Taskbar."
        Start-Sleep 0.3
    }
    if ($CheckBox5.Checked){
        reg import .\Scripts\Registry\Enable_Always_show_all_notification_area_icons_for_all_users.reg
        $ProgressBar1.Value = 5
        $Label11.Text = "5%"
        $Label12.Text = "Always show all Taskbar Icons and Notifications and restart explorer.exe"
        Start-Sleep 0.3
    }
    if ($CheckBox6.Checked){
        reg import .\Scripts\Registry\Change-Delay-Time-Show-Taskbar-Thumbnails-to-10-sec.reg
        $ProgressBar1.Value = 6
        $Label11.Text = "6%"
        $Label12.Text = "Change the Time to Show Taskbar Thumbnails to 10 sec."
        Start-Sleep 0.3
    }
}


























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
$Form1.ShowDialog()