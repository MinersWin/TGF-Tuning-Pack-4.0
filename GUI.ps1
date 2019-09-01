Set-ExecutionPolicy Unrestricted -Scope Process
$Form1_Load = {
}
$CheckBox63_CheckedChanged = {
}
$CheckBox11_CheckedChanged = {
}
$MyDir = Split-Path $script:MyInvocation.MyCommand.Path
$icon = New-Object system.drawing.icon (".\Images\favicon.ico")
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
$button17.Add_Click{(Get-Process powershell | Stop-Process -Force)}

#Open Tool Folder
$Button6.Add_Click{(Start "$($MyDir)\Tools\")}






$Form1.ShowDialog()