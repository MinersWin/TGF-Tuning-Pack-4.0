Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'Changelog.designer.ps1')
$ButtonChangelog.Add_Click{($FormChangelog.Close())}
$bitmap = [System.Drawing.Bitmap]::FromFile($Config.Application.Icon)
$bitmap.MakeTransparent()
$hicon = $bitmap.GetHicon()
$FormChangelog.Icon = [system.drawing.icon]::FromHandle($hicon)
$FormChangelog.Text = "TGF Tuning Pack 4.1-beta.5 16.02.2020"
$Label1.Text="
16.02.2020
v.4.1-beta.5
- Added Changelogs
- Added Changelog Form at first Startup
- Added VersionCheck on every Start
- Added Download Windows
- Fixed Downloadserver
- Added Storage Cleanup
- Added Idle Fix
- Added Huge Performance Boost
- Added SSD Tweaks
- Added Windows Timing Tweaks
- Added YouTube Tweaks
- Added Service Tweaks
- Added TCP Tweaks
- Reworked Registry Tweaks (69 new Tweaks!)
"
$FormChangelog.ShowDialog()