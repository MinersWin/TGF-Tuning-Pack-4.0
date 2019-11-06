::Disable Action Center & Security Center.
::TuningPack 4.0 by MinersWin
::06.11.2019
::https://tuning-pack.de
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseActionCenterExperience" /t REG_DWORD /d 0 /f
sc config wscsvc start= disabled