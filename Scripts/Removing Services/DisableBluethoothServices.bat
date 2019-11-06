::Disable Bluethooth Services
::TuningPack 4.0 by MinersWin
::06.11.2019
::https://tuning-pack.de
rem Bluetooth Handsfree Service
sc config BthHFSrv start= Disabled > nul 2>&1
rem Bluetooth Support Service
sc config bthserv start= Disabled > nul 2>&1