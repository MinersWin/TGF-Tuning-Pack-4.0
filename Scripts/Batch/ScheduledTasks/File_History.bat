::CheckBox95 Disable File History (maintenance mode)
::04.11.2019 by MinersWin
::https://tuning-pack.de
schtasks /Change /TN "Microsoft\Windows\FileHistory\File History (maintenance mode)" /Disable > nul 2>&1