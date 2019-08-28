Add-Type -AssemblyName System.Windows.Forms
Set-Location .\Tools

Write-Host "VirenScanModul wird heruntergeladen (18MB)"
wget 'http://downloadcenter.mcafee.com/products/mcafee-avert/stinger/stinger32.exe' -OutFile 'stinger32.exe'
Write-Host "RootKitRemove Modul wir heruntergeladen (5MB)"
wget 'http://dl.cdn.chip.de/downloads/18802803/tdss28killer.zip?cid=60863044&platform=chip&1566913358-1566920858-9e999b-B-2754ea96eeae2dcb0a758e134f1f7e99' -OutFile 'tdss28killer.zip'
Expand-Archive .\tdss28killer.zip -DestinationPath .\tdss28killer
cp .\tdss28killer\TDSSKiller.exe .\tdss28killer.exe
rm .\tdss28killer.zip
rm .\tdss28killer -Recurse