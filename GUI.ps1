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