::Disable Tracking Services
::TuningPack 4.0 by MinersWin
::06.11.2019
::https://tuning-pack.de
sc config diagnosticshub.standardcollector.service start= Disabled > nul 2>&1
sc config WMPNetworkSvc start= Disabled > nul 2>&1