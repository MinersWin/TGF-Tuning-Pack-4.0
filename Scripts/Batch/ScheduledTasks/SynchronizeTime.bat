::CheckBox100 Disable SyncronizeTime
::05.11.2019 by MinersWin
::https://tuning-pack.de
schtasks /Change /TN "Microsoft\Windows\Time Synchronization\SynchronizeTime" /Disable > nul 2>&1