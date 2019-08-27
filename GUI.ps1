$CheckBox11_CheckedChanged = {
}
Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'GUI.designer.ps1')

#Geek Freaks Logo
$Picture = "C:\Users\MinersWin\Downloads\Unbenannt-1-250x90.png"
$img = [System.Drawing.Image]::Fromfile($Picture)
$PictureBox1.Image = $img


$Form1.ShowDialog()