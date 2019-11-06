::Disable Superfetch.
::TuningPack 4.0 by MinersWin
::06.11.2019
::https://tuning-pack.de
rem Disabling this service prevents further creation of PF files in C:\Windows\Prefetch.
rem After disabling this service, it is completely safe to delete everything in that folder, except for the ReadyBoot folder.
sc config SysMain start= disabled
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d 0 /f > nul 2>&1