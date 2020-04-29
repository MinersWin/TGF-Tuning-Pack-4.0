
function RemoveTemp {
    param($Folders)
    Remove-Item $Folders -force -recurse
}


function WindowsDiskCleanUp {
    
    #Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\*' -Name StateFlags0001 -ErrorAction SilentlyContinue | Remove-ItemProperty -Name StateFlags0001 -ErrorAction SilentlyContinue

    #Enable Update Cleanup. This is done automatically in Windows 10 via a scheduled task.'
    #New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Update Cleanup' -Name StateFlags0001 -Value 2 -PropertyType DWord

    #Enable Temporary Files Cleanup
    #New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Files' -Name StateFlags0001 -Value 2 -PropertyType DWord

    #Start CleanMgr.exe
    Start-Process -FilePath CleanMgr.exe -ArgumentList '/sagerun:1' -WindowStyle Hidden -Wait

    #Waiting for CleanMgr and DismHost processes. Second wait neccesary as CleanMgr.exe spins off separate processes
    Get-Process -Name cleanmgr,dismhost -ErrorAction SilentlyContinue | Wait-Process
    
}


# Author    :   Baldwin D.  empty recycle bin
function RecycleBinEmpty { 
    
    [CmdletBinding()]
    Param
    (
        $RetentionTime = "30",
        [Switch]$DeleteItems
    )

    $Global:Collection = @()
    $Shell = New-Object -ComObject Shell.Application
    $Global:Recycler = $Shell.NameSpace(0xa)

    $User = $env:USERNAME
    $Computer = $env:COMPUTERNAME
    $DateRun = Get-Date

    foreach($item in $Recycler.Items()){
        $DeletedDate = $Recycler.GetDetailsOf($item,2) -replace "\u200f|\u200e","" #Invisible Unicode Characters
        $DeletedDate_datetime = get-date $DeletedDate   
        [Int]$DeletedDays = (New-TimeSpan -Start $DeletedDate_datetime -End $(Get-Date)).Days
      
        If($DeletedDays -ge $RetentionTime){
            If ($DeleteItems){
                Remove-Item -Path $item.Path -Confirm:$false -Force -Recurse                        
            }      
        }
    }  
}


function clearBrowserCache{
	
	
	dir C:\Users | select Name | Export-Csv -Path C:\users\$env:USERNAME\users.csv -NoTypeInformation
	$list = Test-Path C:\users\$env:USERNAME\users.csv
	Stop-Process -Name 'chrome' -ErrorAction SilentlyContinue
	Stop-Process -Name 'Firefox' -ErrorAction SilentlyContinue
	Stop-Process -Name 'Internet Explorer' -ErrorAction SilentlyContinue
	
	if ($list)
	{
		Import-CSV -Path C:\users\$env:USERNAME\users.csv -Header Name | foreach {
			Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache\* -Recurse -Force -EA SilentlyContinue -Verbose
			Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache\*.* -Recurse -Force -EA SilentlyContinue -Verbose
			Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache2\entries\*.* -Recurse -Force -EA SilentlyContinue -Verbose
			Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\thumbnails\* -Recurse -Force -EA SilentlyContinue -Verbose
			Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\cookies.sqlite -Recurse -Force -EA SilentlyContinue -Verbose
			Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\webappsstore.sqlite -Recurse -Force -EA SilentlyContinue -Verbose
			Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\chromeappsstore.sqlite -Recurse -Force -EA SilentlyContinue -Verbose
		}
		
		Import-CSV -Path C:\users\$env:USERNAME\users.csv -Header Name | foreach {
			Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cache\*" -Recurse -Force -EA SilentlyContinue -Verbose
			Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cache2\entries\*" -Recurse -Force -EA SilentlyContinue -Verbose
			Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cookies" -Recurse -Force -EA SilentlyContinue -Verbose
			Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Media Cache" -Recurse -Force -EA SilentlyContinue -Verbose
			Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cookies-Journal" -Recurse -Force -EA SilentlyContinue -Verbose
		}
		
		Import-CSV -Path C:\users\$env:USERNAME\users.csv | foreach {
			Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Microsoft\Windows\Temporary Internet Files\*" -Recurse -Force -EA SilentlyContinue -Verbose
			Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Microsoft\Windows\WER\*" -Recurse -Force -EA SilentlyContinue -Verbose
			Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Temp\*" -Recurse -Force -EA SilentlyContinue -Verbose
			Remove-Item -path "C:\Windows\Temp\*" -Recurse -Force -EA SilentlyContinue -Verbose
			Remove-Item -path "C:\`$recycle.bin\" -Recurse -Force -EA SilentlyContinue -Verbose
		}
		
	}
	
}
