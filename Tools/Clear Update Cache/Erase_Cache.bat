net stop wuauserv  
CD %Windir%          
CD SoftwareDistribution          
DEL /F /S /Q Download
net start wuauserv