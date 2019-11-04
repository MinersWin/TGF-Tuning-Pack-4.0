::CheckBox94 Disable Microsoft-Windows-DiskDiagnosticDataCollector
::04.11.2019 by MinersWin
::https://tuning-pack.de
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable > nul 2>&1