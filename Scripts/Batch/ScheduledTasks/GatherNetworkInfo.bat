::CheckBox97 Disable GatherNetworkInfo
::05.11.2019 by MinersWin
::https://tuning-pack.de
schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable > nul 2>&1