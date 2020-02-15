function DisableSchTask {
    
    PARAM(
        [string]$Tasks
    )

    foreach ($Task in $Tasks) {
        $Parts = $Task.split('\')
        $Name = $Parts[-1]
        $Path = $Parts[0..($Parts.length-2)] -join '\'

        Disable-ScheduledTask -TaskName "$Name" -TaskPath "$Path" -ErrorAction SilentlyContinue
    }

}

function CreateSchTask{

    param(
        $TaskParams
    )

    if($TaskParams.UserID){$TaskRunUser = $TaskParams.UserID}else{$TaskRunUser = "NT AUTHORITY\SYSTEM"}

    $TaskActionParams = @{}
    if($TaskParams.Execute){$TaskActionParams.add("Execute",$TaskParams.Execute)}
    if($TaskParams.Argument){$TaskActionParams.add("Argument",$TaskParams.Argument )}            

    $TaskUserParams = @{} 
    if($TaskParams.UserID){$TaskUserParams.add("UserID",$TaskParams.UserID)}else{$TaskUserParams.add("UserID", "NT AUTHORITY\SYSTEM")}
    if($TaskParams.LogonType){$TaskUserParams.add("LogonType",$TaskParams.LogonType)}else{$TaskUserParams.add("LogonType", "ServiceAccount")}
    if($TaskParams.RunLevel){$TaskUserParams.add("RunLevel",$TaskParams.RunLevel)}else{$TaskUserParams.add("RunLevel", "Highest")}                              
    
                          
    $TaskTriggerParams = @{}
    if($TaskParams.Frequency -eq "Weekly"){
        if($TaskParams.DaysOfWeek){$TaskTriggerParams.add("DaysOfWeek",$TaskParams.DaysOfWeek)}else{$TaskTriggerParams.add("DaysOfWeek","Sunday")}
    }
    if($TaskParams.Time){$TaskTriggerParams.add("at",$TaskParams.Time)}else{$TaskTriggerParams.add("at","18:00")}
    

    #Creates Scheduled Task Action
    $TaskAction1 = New-ScheduledTaskAction @TaskActionParams

    #Assigns Task Principal
    $TaskUserName = New-ScheduledTaskPrincipal @TaskUserParams

    #Task Trigger
    if($TaskParams.Frequency -eq "Once"){
        $TaskTrigger  = New-ScheduledTaskTrigger @TaskTriggerParams
    }
    if($TaskParams.Frequency -eq "Daily"){
        $TaskTrigger  = New-ScheduledTaskTrigger -Daily @TaskTriggerParams
    }
    if($TaskParams.Frequency -eq "Weekly"){
        $TaskTrigger  = New-ScheduledTaskTrigger -Weekly @TaskTriggerParams
    } 

    #Create Scheduled Task
    $Task = New-ScheduledTask -Action $TaskAction1 -Principal $TaskUserName -Trigger $TaskTrigger

    #Register Scheduled Task
    Register-ScheduledTask $TaskParams.Name -InputObject $Task -Force



    #fill missing values
    $Task = Get-ScheduledTask -TaskName $TaskParams.Name

    
    if($TaskParams.Settings.Setting){
        foreach($setting in $TaskParams.Settings.Setting){
            if($setting.Name){
               $SettingPath = $setting.Name
               $Task.Settings.$SettingPath = $setting.Value
               
            }
        }
    }

    if($TaskParams.Settings.IdleSettings){
        foreach($setting in $TaskParams.Settings.IdleSettings.Setting){
            if($setting.Name){
                $IdleSettingPath = $setting.Name   
                $Task.Settings.IdleSettings.$IdleSettingPath = $setting.Value 
                $Task.Settings.IdleSettings.$IdleSettingPath
            }
        }
    }


    if($TaskParams.CalendarTrigger.Repetition){
        foreach($setting in $TaskParams.CalendarTrigger.Repetition.Setting){
            if($setting.Name){
                $CalSettingPath = $setting.Name   
                $Task.Triggers.Repetition.$CalSettingPath = $setting.Value
            }
        }
    }

    

    #if($TaskParams.CalendarTrigger.Settings){
    #    foreach($setting in $TaskParams.CalendarTrigger.Settings.Setting){
    #        if($setting.Name){
    #            $RepetitionSettingPath = $setting.Name   
    #            $Task.Triggers.$RepetitionSettingPath = $setting.Value 
    #        }
    #    }
    #}
        
    
    $Task | Set-ScheduledTask -User $TaskRunUser

}


function TaskSchedBKRestore{
    <# 
    .SYNOPSIS 
    This script can be used for backup and restore of scheduled tasks.

    .DESCRIPTION 
    This script can be used for backup and restore of scheduled tasks. This also can be used to backup scheduled tasks from one system and restore it other system.

    .PARAMETER BackupRestore

    Accepts  a single computer name or an array of computer names. You may also provide IP addresses.
    Default value : local computer
 

     .PARAMETER Path
 
    Provide path to for backup scheduled tasks or to specify path for xml file restore


     .EXAMPLE 
    Restore Scheduled Tasks

    .\Backup-Restore-ScheduledTasks.ps1 -BackupRestore Restore -Path C:\Scripts


    .Link 
 
    If you have any question, you can post to
    http://vikramathare.wordpress.com/ or
    https://gallery.technet.microsoft.com/PowerShell-Bakcup-and-e4482583
 
    .Notes
    Version - 1.0
    #>
     param( 
        [parameter(Mandatory=$true)] 
        [ValidateSet(“Backup”,”Restore”)]  
        [String]$BackupRestore, 
        [parameter(Mandatory=$true)] 
        [ValidateScript({Test-Path $_ })] 
        [string]$Path 
    ) 
    if ($BackupRestore -eq 'Backup') { 
    # Bakcup Scheduled tasks 
        $Tasks = Get-ScheduledTask -TaskPath \ | Select TaskName 
        foreach($Task in $Tasks){ 
            $TaskName = $Task.TaskName 
            Write-Host "Backup of Task: $TaskName" -ForegroundColor White 
            Export-ScheduledTask -TaskName $TaskName | Out-File "$Path\$TaskName.xml" -Force 
        } 
        Write-Host "Backup of scheduled task is completed" -ForegroundColor White 
    } 
    if ($BackupRestore -eq 'Restore') { 
    # Restore Scheduled tasks 
        #$UserName = Read-Host -Prompt "Enter UserName to configure scheduled task(Domain\UserName)" 
        #$Password = Read-Host -Prompt "Enter Password For $UserName"  -AsSecureString 
        #$Password = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($Password) 
        #$Password = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($Password) 
        $Items = Get-ChildItem $Path -Filter '*.XML' 
        foreach($Item in $Items){ 
            $TaskName = ($Item.Name).Split('.')[0] 
            Write-Host "Restoring Task: $TaskName" -ForegroundColor White 
            #cmd.exe /c schtasks /create /xml $Item.FullName /tn $TaskName  /ru $UserName /rp $Password
            cmd.exe /c schtasks /create /xml $Item.FullName /tn $TaskName 
        } 
        Write-Host "Restore of scheduled task is completed" -ForegroundColor White 
    }
}