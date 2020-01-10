 ::Created by: MinersWin
 ::Created on: January 10th 2020
 ::Download:   https://tuning-pack.de

rem Default value is 100 decimal.
rem Basically "Core parking" means that the OS can use less CPU cores when they are not needed, and saving power.
rem This, however, can somewhat hamper performance, so advanced users prefer to disable this feature.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d 0 /f  > nul 2>&1