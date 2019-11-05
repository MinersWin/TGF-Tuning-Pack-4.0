::CheckBox99 Disable ForceSyncronizeTime
::05.11.2019 by MinersWin
::https://tuning-pack.de
schtasks /Change /TN "Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" /Disable > nul 2>&1