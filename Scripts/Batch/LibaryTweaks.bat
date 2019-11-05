::TuningPack 4.0 by MinersWin
::05.11.2019
::https://tuning-pack.de
del "C:\ProgramData\Microsoft\Windows\Start Menu Places\05 - Music.lnk"
del "C:\ProgramData\Microsoft\Windows\Start Menu Places\06 - Pictures.lnk"
del "C:\ProgramData\Microsoft\Windows\Start Menu Places\07 - Videos.lnk"

del "%userprofile%\AppData\Roaming\Microsoft\Windows\Libraries\Music.library-ms"
del "%userprofile%\AppData\Roaming\Microsoft\Windows\Libraries\Pictures.library-ms"
del "%userprofile%\AppData\Roaming\Microsoft\Windows\Libraries\Videos.library-ms"

reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\UsersLibraries" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{031E4825-7B94-4dc3-B131-E946B44C8DD5}" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderTypes\{59BD6DD1-5CEC-4d7e-9AD2-ECC64154418D}" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderTypes\{C4D98F09-6124-4fe0-9942-826416082DA9}" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{031E4825-7B94-4dc3-B131-E946B44C8DD5}" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderTypes\{59BD6DD1-5CEC-4d7e-9AD2-ECC64154418D}" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderTypes\{C4D98F09-6124-4fe0-9942-826416082DA9}" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\UsersLibraries" /f
reg delete "HKCU\SOFTWARE\Classes\Local Settings\MuiCache\1\52C64B7E" /v "@C:\Windows\system32\windows.storage.dll,-50691" /f

%SystemRoot%\System32\setaclx64 -on "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\SettingSync\WindowsSettingHandlers\UserLibraries" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\SettingSync\WindowsSettingHandlers\UserLibraries" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\SettingSync\WindowsSettingHandlers\UserLibraries" /f

%SystemRoot%\System32\setaclx64 -on "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\SettingSync\Namespace\Windows\UserLibraries" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\SettingSync\Namespace\Windows\UserLibraries" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\SettingSync\Namespace\Windows\UserLibraries" /f

%SystemRoot%\System32\setaclx64 -on "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Windows.NavPaneShowLibraries" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Windows.NavPaneShowLibraries" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Windows.NavPaneShowLibraries" /f

%SystemRoot%\System32\setaclx64 -on "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Namespace\Windows\UserLibraries" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Namespace\Windows\UserLibraries" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Namespace\Windows\UserLibraries" /f

%SystemRoot%\System32\setaclx64 -on "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\WindowsSettingHandlers\UserLibraries" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\WindowsSettingHandlers\UserLibraries" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\WindowsSettingHandlers\UserLibraries" /f

%SystemRoot%\System32\setaclx64 -on "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Windows.NavPaneShowLibraries" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Windows.NavPaneShowLibraries" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Windows.NavPaneShowLibraries" /f

%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{c51b83e5-9edd-4250-b45a-da672ee3c70e}" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{c51b83e5-9edd-4250-b45a-da672ee3c70e}" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKEY_CLASSES_ROOT\CLSID\{c51b83e5-9edd-4250-b45a-da672ee3c70e}" /f

%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{c51b83e5-9edd-4250-b45a-da672ee3c70e}" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{c51b83e5-9edd-4250-b45a-da672ee3c70e}" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{c51b83e5-9edd-4250-b45a-da672ee3c70e}" /f

%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{e9711a2f-350f-4ec1-8ebd-21245a8b9376}" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{e9711a2f-350f-4ec1-8ebd-21245a8b9376}" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKEY_CLASSES_ROOT\CLSID\{e9711a2f-350f-4ec1-8ebd-21245a8b9376}" /f

%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{1CF324EC-F905-4c69-851A-DDC8795F71F2}" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{1CF324EC-F905-4c69-851A-DDC8795F71F2}" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKEY_CLASSES_ROOT\CLSID\{1CF324EC-F905-4c69-851A-DDC8795F71F2}" /f

%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{1CF324EC-F905-4c69-851A-DDC8795F71F2}" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{1CF324EC-F905-4c69-851A-DDC8795F71F2}" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{1CF324EC-F905-4c69-851A-DDC8795F71F2}" /f

%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{51F649D3-4BFF-42f6-A253-6D878BE1651D}" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{51F649D3-4BFF-42f6-A253-6D878BE1651D}" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKEY_CLASSES_ROOT\CLSID\{51F649D3-4BFF-42f6-A253-6D878BE1651D}" /f

%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{51F649D3-4BFF-42f6-A253-6D878BE1651D}" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{51F649D3-4BFF-42f6-A253-6D878BE1651D}" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{51F649D3-4BFF-42f6-A253-6D878BE1651D}" /f

%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{896664F7-12E1-490f-8782-C0835AFD98FC}" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{896664F7-12E1-490f-8782-C0835AFD98FC}" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKEY_CLASSES_ROOT\CLSID\{896664F7-12E1-490f-8782-C0835AFD98FC}" /f

%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{896664F7-12E1-490f-8782-C0835AFD98FC}" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{896664F7-12E1-490f-8782-C0835AFD98FC}" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{896664F7-12E1-490f-8782-C0835AFD98FC}" /f

%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{031E4825-7B94-4dc3-B131-E946B44C8DD5}" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{031E4825-7B94-4dc3-B131-E946B44C8DD5}" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKEY_CLASSES_ROOT\CLSID\{031E4825-7B94-4dc3-B131-E946B44C8DD5}" /f

%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{031E4825-7B94-4dc3-B131-E946B44C8DD5}" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{031E4825-7B94-4dc3-B131-E946B44C8DD5}" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{031E4825-7B94-4dc3-B131-E946B44C8DD5}" /f

reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Music" /f
reg delete "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Music" /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Music" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\MyMusic" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "CommonMusic" /f
reg delete "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Music" /f
reg delete "HKEY_USERS\S-1-5-19\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Music" /f
reg delete "HKEY_USERS\S-1-5-20\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Music" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "CommonMusic" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "CommonMusic" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "CommonMusic" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderTypes\{3f2a72a7-99fa-4ddb-a5a8-c604edf61d6b}" /f

%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKEY_CLASSES_ROOT\CLSID\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" /f

%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKEY_CLASSES_ROOT\CLSID\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" /f

%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" /f
%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" /f

reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Pictures" /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Pictures" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\MyPictures" /f
reg delete "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Pictures" /f
reg delete "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Pictures" /f
reg delete "HKEY_USERS\.DEFAULT\Software\Classes\Local Settings\MuiCache\1\52C64B7E" /v "@C:\Windows\System32\Windows.UI.Immersive.dll,-38304" /f
reg delete "HKEY_USERS\S-1-5-19\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Pictures" /f
reg delete "HKEY_USERS\S-1-5-20\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Pictures" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "CommonPictures" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderTypes\{0b2baaeb-0042-4dca-aa4d-3ee8648d03e5}" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\StartMenu\StartPanel\PinnedItems\Pictures" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "CommonPictures" /f

%SystemRoot%\System32\setaclx64 -on "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderTypes\{b3690e58-e961-423b-b687-386ebfd83239}" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderTypes\{b3690e58-e961-423b-b687-386ebfd83239}" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderTypes\{b3690e58-e961-423b-b687-386ebfd83239}" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderTypes\{c1f8339f-f312-4c97-b1c6-ecdf5910c5c0}" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderTypes\{0b2baaeb-0042-4dca-aa4d-3ee8648d03e5}" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderTypes\{4dcafe13-e6a7-4c28-be02-ca8c2126280d}" /f

%SystemRoot%\System32\setaclx64 -on "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderTypes\{b3690e58-e961-423b-b687-386ebfd83239}" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderTypes\{b3690e58-e961-423b-b687-386ebfd83239}" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderTypes\{b3690e58-e961-423b-b687-386ebfd83239}" /f

reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderTypes\{c1f8339f-f312-4c97-b1c6-ecdf5910c5c0}" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "CommonPictures" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "CommonPictures" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" /f

%SystemRoot%\System32\setaclx64 -on "HKLM\SOFTWARE\Wow6432Node\Classes\CLSID\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKLM\SOFTWARE\Wow6432Node\Classes\CLSID\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKLM\SOFTWARE\Wow6432Node\Classes\CLSID\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" /f

%SystemRoot%\System32\setaclx64 -on "HKLM\SOFTWARE\Wow6432Node\Classes\CLSID\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKLM\SOFTWARE\Wow6432Node\Classes\CLSID\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKLM\SOFTWARE\Wow6432Node\Classes\CLSID\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" /f

%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKEY_CLASSES_ROOT\CLSID\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" /f

%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKEY_CLASSES_ROOT\CLSID\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" /f

%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" /f

reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Video" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "CommonVideo" /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Video" /f
reg delete "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Video" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\MyVideo" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "CommonVideo" /f
reg delete "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Video" /f
reg delete "HKEY_USERS\S-1-5-19\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Video" /f
reg delete "HKEY_USERS\S-1-5-20\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Video" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "CommonVideo" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderTypes\{51294DA1-D7B1-485b-9E9A-17CFFE33E187}" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderTypes\{ea25fbd7-3bf7-409e-b97f-3352240903f4}" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderTypes\{292108be-88ab-4f33-9a26-7748e62e37ad}" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderTypes\{5fa96407-7e77-483c-ac93-691d05850de8}" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "CommonVideo" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderTypes\{51294DA1-D7B1-485b-9E9A-17CFFE33E187}" /f

%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKEY_CLASSES_ROOT\CLSID\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /f

%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKEY_CLASSES_ROOT\CLSID\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" /f

%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /f

%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
%SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
reg delete "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" /f

reg delete "HKCU\SOFTWARE\Classes\Local Settings\MuiCache\1\52C64B7E" /v "@windows.storage.dll,-21790" /f
reg delete "HKCU\SOFTWARE\Classes\Local Settings\MuiCache\1\52C64B7E" /v "@windows.storage.dll,-34584" /f
reg delete "HKCU\SOFTWARE\Classes\Local Settings\MuiCache\1\52C64B7E" /v "@windows.storage.dll,-34595" /f
reg delete "HKCU\SOFTWARE\Classes\Local Settings\MuiCache\1\52C64B7E" /v "@windows.storage.dll,-34620" /f
reg delete "HKEY_USERS\.DEFAULT\Software\Classes\Local Settings\MuiCache\1\52C64B7E" /v "@windows.storage.dll,-21790" /f