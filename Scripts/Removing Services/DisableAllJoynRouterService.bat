::Disable AllJoyn Router Service
::TuningPack 4.0 by MinersWin
::06.11.2019
::https://tuning-pack.de
rem  This service is used for routing the AllJoyn messages for AllJoyn clients.
sc config AJRouter start= Disabled > nul 2>&1