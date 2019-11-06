::Disable Windows Error Reporting Service.
::TuningPack 4.0 by MinersWin
::06.11.2019
::https://tuning-pack.de
sc config WerSvc start= Disabled > nul 2>&1