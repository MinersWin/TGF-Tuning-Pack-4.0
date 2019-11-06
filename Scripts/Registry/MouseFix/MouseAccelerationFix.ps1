#TuningPack 4.0 by MinersWin
#05.11.2019
#https://tuning-pack.de
$DPISetting = (Get-ItemProperty 'HKCU:\Control Panel\Desktop\WindowMetrics' -Name AppliedDPI).AppliedDPI
switch ($DPISetting){
    96 {reg import '.\Windows 10 + 8 TGFMOUSEFIX für Bildschirmskalierung 100%.reg'}
    120 {reg import '.\Windows 10 + 8 TGFMOUSEFIX für Bildschirmskalierung 125%.reg'}
    144 {reg import '.\Windows 10 + 8 TGFMOUSEFIX für Bildschirmskalierung 150%.reg'}
    192 {reg import '.\Windows 10 + 8 TGFMOUSEFIX für Bildschirmskalierung 200%.reg'}
}