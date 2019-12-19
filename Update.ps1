$GitHub = "https://github.com/MinersWin/TGF-Tuning-Pack-4.0/archive/master.zip"
$Path = Get-Location
$Path
wget $GitHub -OutFile 'Update.zip'
Expand-Archive .\Update.zip -DestinationPath .\
Start-Process powershell .\GUI.ps1
exit
