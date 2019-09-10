$TabPage1_Click = {
}
$Panel5_Paint = {
}
$CheckBox2_CheckedChanged = {
}
$CheckBox39_CheckedChanged = {
}
$CheckBox40_CheckedChanged = {
}
$TabPage2_Click = {
}
$TabPage4_Click = {
}
$Form1_Load = {
}
$CheckBox63_CheckedChanged = {
}
$CheckBox11_CheckedChanged = {
}
$MyDir = Split-Path $script:MyInvocation.MyCommand.Path
Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'GUI.designer.ps1')

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


#Geek Freaks Logo
$Picture = '.\Images\Unbenannt-1-250x90.png'
$img = [System.Drawing.Image]::Fromfile($Picture)
$PictureBox1.Image = $img
$PictureBox1.Add_Click({start 'https://thegeekfreaks.de'})

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
    $CheckBox29.Text = "Deaktivieren Sie die Registerkarte Datenträgerkontingent, die als Registerkarte angezeigt wird, wenn Sie mit der rechten Maustaste auf Laufwerksbuchstabe - Eigenschaften klicken"
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
$Button19.Add_Click{(.\Ninite\Ninite.exe)}

#ComboBox Templates
$ComboBox1.Items.Add("Maximale Leistung")
$ComboBox1.Items.Add("Maximale Akkulaufzeit")
$ComboBox1.Items.Add("Maximale Privatsphäre")
$ComboBox1.Items.Add("Empfohlen")
$ComboBox1.SelectedItem = "Empfohlen"





$Form1.ShowDialog()