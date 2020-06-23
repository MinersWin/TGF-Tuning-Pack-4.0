Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'Changelog.designer.ps1')
$ButtonChangelog.Add_Click{($FormChangelog.Close())}
$bitmap = [System.Drawing.Bitmap]::FromFile($Config.Application.Icon)
$bitmap.MakeTransparent()
$hicon = $bitmap.GetHicon()
$FormChangelog.Icon = [system.drawing.icon]::FromHandle($hicon)
$FormChangelog.Text = "TGF Tuning Pack 4.2-release 23.06.2020"
$Label1.Text="
23.06.2020
v.4.2-release
- Fixed German Spelling Errors (thx gummipunkt)
- Removed DAU Problem Sources
- Added more Messages to prevent frequently asked Questions
- Fixed many Preset Problems
- Removed unused Presets
- Added Translation for every Output except the Tweaks
- Added Ballon Tool Tips
- Compiled new Excecutable
- Created new CA
- Removed start.bat due to missunderstanding of the functionality
- Tools are now Legacy
- Added ToolTips for every Registry Tweak
- Added Catch to prevent the Main FAQ DAU Question
- Added better Template Feedback
- Updatet Risk Label
- Switched Icons of a few MessageBoxes
- Renamed startup to launcher
- Fixed Language Bug on Startup
- Removed Auto Accept
"
$FormChangelog.ShowDialog()