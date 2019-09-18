Add-Type -AssemblyName System.Windows.Forms
$Panel13_Paint = {
}
Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'Ninite.designer.ps1')

#Close button
$Button2.Add_Click{($Form1.Close())}

#Instll Button
$Button1.Add_Click{(Install-Button)}


function Install-Button{
    $Link = "https://ninite.com/"
    if ($CheckBox1.Checked){
        $Link= $Link +  "-chrome"
    }
    if ($CheckBox2.Checked){
        $Link= $Link +  "-operaChromium"
    }
    if ($CheckBox3.Checked){
        $Link= $Link +  "-firefox"
    }
    if ($CheckBox4.Checked){
        $Link= $Link +  "-qbittorrent"
    }
    if ($CheckBox5.Checked){
        $Link= $Link +  "-7zip"
    }
    if ($CheckBox6.Checked){
        $Link= $Link +  "-peazip"
    }
    if ($CheckBox7.Checked){
        $Link= $Link +  "-winrar"
    }
    if ($CheckBox8.Checked){
        $Link= $Link +  "-discord"
    }
    if ($CheckBox9.Checked){
        $Link= $Link +  "-skype"
    }
    if ($CheckBox10.Checked){
        $Link= $Link +  "-pidgin"
    }
    if ($CheckBox11.Checked){
        $Link= $Link +  "-thunderbird"
    }
    if ($CheckBox12.Checked){
        $Link= $Link +  "-trillian"
    }
    if ($CheckBox13.Checked){
        $Link= $Link +  "-dropbox"
    }
    if ($CheckBox14.Checked){
        $Link= $Link +  "-googlebackupandsync"
    }
    if ($CheckBox15.Checked){
        $Link= $Link +  "-onedrive"
    }
    if ($CheckBox16.Checked){
        $Link= $Link +  "-sugarsync"
    }
    if ($CheckBox17.Checked){
        $Link= $Link +  "-itunes"
    }
    if ($CheckBox18.Checked){
        $Link= $Link +  "-vlc"
    }
    if ($CheckBox19.Checked){
        $Link= $Link +  "-aimp"
    }
    if ($CheckBox20.Checked){
        $Link= $Link +  "-foobar"
    }
    if ($CheckBox21.Checked){
        $Link= $Link +  "-winamp"
    }
    if ($CheckBox22.Checked){
        $Link= $Link +  "-musicbee"
    }
    if ($CheckBox23.Checked){
        $Link= $Link +  "-audacity"
    }
    if ($CheckBox24.Checked){
        $Link= $Link +  "-klitecodecs"
    }
    if ($CheckBox25.Checked){
        $Link= $Link +  "-gom"
    }
    if ($CheckBox26.Checked){
        $Link= $Link +  "-spotify"
    }
    if ($CheckBox27.Checked){
        $Link= $Link +  "-cccp"
    }
    if ($CheckBox28.Checked){
        $Link= $Link +  "-mediamonkey"
    }
    if ($CheckBox29.Checked){
        $Link= $Link +  "-handbrake"
    }
    if ($CheckBox31.Checked){
        $Link= $Link +  "-adoptjava8"
    }
    if ($CheckBox33.Checked){
        $Link= $Link +  "-.net-4.8"
    }
    if ($CheckBox34.Checked){
        $Link= $Link +  "-silverlight"
    }
    if ($CheckBox35.Checked){
        $Link= $Link +  "-air"
    }
    if ($CheckBox36.Checked){
        $Link= $Link +  "-evernote"
    }
    if ($CheckBox37.Checked){
        $Link= $Link +  "-googleearth"
    }
    if ($CheckBox38.Checked){
        $Link= $Link +  "-steam"
    }
    if ($CheckBox39.Checked){
        $Link= $Link +  "-keepass2"
    }
    if ($CheckBox40.Checked){
        $Link= $Link +  "-everything"
    }
    if ($CheckBox41.Checked){
        $Link= $Link +  "-nvda"
    }
    if ($CheckBox42.Checked){
        $Link= $Link +  "-krita"
    }
    if ($CheckBox43.Checked){
        $Link= $Link +  "-blender"
    }
    if ($CheckBox44.Checked){
        $Link= $Link +  "-paint.net"
    }
    if ($CheckBox45.Checked){
        $Link= $Link +  "-gimp"
    }
    if ($CheckBox46.Checked){
        $Link= $Link +  "-irfanview"
    }
    if ($CheckBox47.Checked){
        $Link= $Link +  "-xnview"
    }
    if ($CheckBox48.Checked){
        $Link= $Link +  "-inkscape"
    }
    if ($CheckBox49.Checked){
        $Link= $Link +  "-faststone"
    }
    if ($CheckBox50.Checked){
        $Link= $Link +  "-greenshot"
    }
    if ($CheckBox51.Checked){
        $Link= $Link +  "-sharex"
    }
    if ($CheckBox52.Checked){
        $Link= $Link +  "-foxit"
    }
    if ($CheckBox53.Checked){
        $Link= $Link +  "-libreoffice"
    }
    if ($CheckBox54.Checked){
        $Link= $Link +  "-sumatrapdf"
    }
    if ($CheckBox55.Checked){
        $Link= $Link +  "-cutepdf"
    }
    if ($CheckBox56.Checked){
        $Link= $Link +  "-pdfcreator"
    }
    if ($CheckBox57.Checked){
        $Link= $Link +  "-openoffice"
    }
    if ($CheckBox58.Checked){
        $Link= $Link +  "-teamviewer14"
    }
    if ($CheckBox59.Checked){
        $Link= $Link +  "-imgburn"
    }
    if ($CheckBox60.Checked){
        $Link= $Link +  "-realvnc"
    }
    if ($CheckBox61.Checked){
        $Link= $Link +  "-teracopy"
    }
    if ($CheckBox62.Checked){
        $Link= $Link +  "-cdburnerxp"
    }
    if ($CheckBox63.Checked){
        $Link= $Link +  "-revo"
    }
    if ($CheckBox64.Checked){
        $Link= $Link +  "-launchy"
    }
    if ($CheckBox65.Checked){
        $Link= $Link +  "-windirstat"
    }
    if ($CheckBox66.Checked){
        $Link= $Link +  "-glary"
    }
    if ($CheckBox67.Checked){
        $Link= $Link +  "-infrarecorder"
    }
    if ($CheckBox68.Checked){
        $Link= $Link +  "-classicstart"
    }
    if ($CheckBox69.Checked){
        $Link= $Link +  "-essentials"
    }
    if ($CheckBox70.Checked){
        $Link= $Link +  "-malwarebytes"
    }
    if ($CheckBox71.Checked){
        $Link= $Link +  "-avast"
    }
    if ($CheckBox72.Checked){
        $Link= $Link +  "-avg"
    }
    if ($CheckBox73.Checked){
        $Link= $Link +  "-spybot2"
    }
    if ($CheckBox74.Checked){
        $Link= $Link +  "-avira"
    }
    if ($CheckBox75.Checked){
        $Link= $Link +  "-super"
    }
    if ($CheckBox76.Checked){
        $Link= $Link +  "-python"
    }
    if ($CheckBox77.Checked){
        $Link= $Link +  "-filezilla"
    }
    if ($CheckBox78.Checked){
        $Link= $Link +  "-notepadplusplus"
    }
    if ($CheckBox80.Checked){
        $Link= $Link +  "-adoptjdk8"
    }
    if ($CheckBox79.Checked){
        $Link= $Link +  "-correttojdk8"
    }
    if ($CheckBox81.Checked){
        $Link= $Link +  "-winscp"
    }
    if ($CheckBox82.Checked){
        $Link= $Link +  "-putty"
    }
    if ($CheckBox83.Checked){
        $Link= $Link +  "-winmerge"
    }
    if ($CheckBox84.Checked){
        $Link= $Link +  "-eclipse"
    }
    if ($CheckBox85.Checked){
        $Link= $Link +  "-vscode"
    }
    $Link = $Link + "/ninite.exe"
    [System.Windows.Forms.MessageBox]::Show("Download wird gestartet","Ninite",1)
    wget $Link -OutFile 'Install.exe'
    .\Install.exe
}

$Form1.ShowDialog()