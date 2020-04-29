function PageSizeOptimal{
     
    Param
    (
        $pageSize = "1.5"
    ) 
      
    $MemorySize = CheckMemorySizePage
    $PageInfo = GetLHSPageFileUsage
    [int]$InitSize = $MemorySize * $pageSize


    if ($PageInfo.AutomaticManagedPagefile -Match "True"){
        SetPageFile -Path $PageLocation -InitialSize  $InitSize -MaximumSize $InitSize
    }

    if ($PageInfo.AllocatedBaseSize_MB -ne $InitSize -And $PageInfo.AutomaticManagedPagefile -Match "False"){
        SetPageFile -Path $PageLocation -InitialSize $InitSize -MaximumSize $InitSize
    }

}


function CheckMemorySizePage {
    $bytes = (Get-WmiObject -class "cim_physicalmemory" | Measure-Object -Property Capacity -Sum).Sum
    $mb = $bytes / 1024 / 1024
    return $mb
}


Function GetLHSPageFileUsage
{
<#
.SYNOPSIS
    Get PageFile Usage on local or remote Computer.

.DESCRIPTION
    Get PageFile Usage on local or remote Computer.
    Using CIM -ClassName 'Win32_PageFileUsage' and Win32_ComputerSystem
    Get the Pagefile used for handling virtual memory file swapping on a Win32 system. 

.PARAMETER ComputerName
    The computer name(s) to retrieve the info from. 
    Default to local Computer

.PARAMETER Credential
    Alternate Credential to connect to the remote Computer

.EXAMPLE
    Get-LHSPageFileUsage -ComputerName Server1

    ComputerName             : Server1
    PageFile                 : C:\pagefile.sys
    AutomaticManagedPagefile : True
    AllocatedBaseSize_MB     : 6192
    PeakUsage_MB             : 4593
    CurrentUsage_MB          : 3604
    isTempPageFile           : False
    InstallDate              : 15.12.2011 22:37:34

    AutomaticManagedPagefile = True, If the System is configured to manage the pagefile 
    automatically by the system

.EXAMPLE
    $Cred = Get-Credential
    Get-LHSPageFileUsage -ComputerName Server1 -Credential $Cred

    ComputerName             : Server1
    PageFile                 : C:\pagefile.sys
    AutomaticManagedPagefile : True
    AllocatedBaseSize_MB     : 6192
    PeakUsage_MB             : 4593
    CurrentUsage_MB          : 3604
    isTempPageFile           : False
    InstallDate              : 15.12.2011 22:37:34
    
.INPUTS
    System.String, you can pipe ComputerNames to this Function

.OUTPUTS
    Custom PSObjects 

.NOTES
    If the System is configured to manage the pagefile automatically by the system than you would not see
    any infos using get-wmiobject -class "Win32_PageFileSetting" -namespace "root\CIMV2" 

    # to check if AutomaticManagedPagefile is enabled run:
    Get-WmiObject -Class Win32_ComputerSystem | Select AutomaticManagedPagefile

    AUTHOR: Pasquale Lantella 
    LASTEDIT: 27.01.2016
    Version : 1.0 
    KEYWORDS: PageFile, PageFileUsage

.LINK
    Win32_PageFileUsage class
    https://msdn.microsoft.com/en-us/library/windows/desktop/aa394246%28v=vs.85%29.aspx 

.LINK
    Win32_ComputerSystem class
    https://msdn.microsoft.com/en-us/library/windows/desktop/aa394102%28v=vs.85%29.aspx

#Requires -Version 3.0
#>
   
[cmdletbinding()]  

[OutputType('PSObject')] 

Param(

    [Parameter(ParameterSetName='Default', Position=0,Mandatory=$False,ValueFromPipeline=$True,
        HelpMessage='An array of computer names. The default is the local computer.')]
	[alias("CN")]
	[string[]]$ComputerName = $Env:COMPUTERNAME,

    [parameter(Position=1)]
    [Alias('RunAs')]
    [System.Management.Automation.Credential()]$Credential = [System.Management.Automation.PSCredential]::Empty
    
   )

BEGIN {

    Set-StrictMode -Version 2
    ${CmdletName} = $Pscmdlet.MyInvocation.MyCommand.Name


    Function Get-LHSCimSession 
    {
    <#
    .SYNOPSIS
        Create CIMSessions to retrieve WMI data.

    .DESCRIPTION
        This is a function to be used in other advanced function.

        The Get-CimInstance cmdlet in PowerShell V3 can be used to retrieve WMI information
        from a remote computer using the WSMAN protocol instead of the legacy WMI service
        that uses DCOM and RPC. However, the remote computers must be running PowerShell
        3 and WSMAN protocol version 3. When querying a remote computer,
        Get-CIMInstance setups a temporary CIMSession. However, if the remote computer is
        running PowerShell 2.0 this will fail. You have to manually create a CIMSession
        with a CIMSessionOption to use the DCOM protocol. This Script does it for you
        and creates a CimSession depending on the remote Computer capabilities.

    .PARAMETER ComputerName
        The computer name to connect to. 
        Default to local Computer

    .PARAMETER Credential
        [Optional] alternate Credential to connect to remote computer.

    .EXAMPLE
        $CimSession = Get-LHSCimSession -ComputerName PC1
        $BIOS = Get-CimInstance -ClassName Win32_BIOS -CimSession $CimSession
        Remove-CimSession -CimSession $CimSession    

    .EXAMPLE
        $cred = Get-Credential Domain01\User02 
        $CimSession = Get-LHSCimSession -ComputerName PC1 -Credential $cred
        $Volume = Get-CimInstance -ClassName Win32_Volume -Filter "Name = 'C:\\'" -CimSession $CimSession
        Remove-CimSession -CimSession $CimSession 

    .INPUTS
        None.

    .OUTPUTS
        Microsoft.Management.Infrastructure.CimSession

    .NOTES
        to get rid of CimSession because of testing use the following to remove all CimSessions
        Get-CimSession | Remove-CimSession -whatif

        Most of the CIM Cmdlets do not have a -Credential parameter. The only way to specify 
        alternate credentials is to manually build a new CIM session object, and pass that 
        into the -CimSession parameter on the other cmdlets.

        AUTHOR: Pasquale Lantella 
        LASTEDIT: 
        KEYWORDS: CIMSession

    .LINK
        Http://www.ScriptingGuys.com 

    #Requires -Version 3.0
    #>
   
    [cmdletbinding()]  

    [OutputType('Microsoft.Management.Infrastructure.CimSession')] 

    Param(

        [Parameter(Position=0,HelpMessage='A computer name. The default is the local computer.')]
	    [alias("CN")]
	    [string]$ComputerName = $Env:COMPUTERNAME,

        [Parameter()]
        [System.Management.Automation.Credential()]$Credential = [System.Management.Automation.PSCredential]::Empty
    )

    BEGIN {

        Set-StrictMode -Version Latest
        ${CmdletName} = $Pscmdlet.MyInvocation.MyCommand.Name

        Function Test-IsWsman3 {
        # Test if WSMan is greater or eqaul Version 3.0
        # Tested against Powershell 4.0
            [cmdletbinding()]
            Param(
            [Parameter()]
            [string]$ComputerName = $env:computername
            )
 
            Begin {
                #a regular expression pattern to match the ending
                [regex]$rx="\d\.\d$"
            }
            Process {
			    $result = $Null
                Try {
                    $result = Test-WSMan -ComputerName $ComputerName -ErrorAction Stop
                }
                Catch {
                    #Write-Error $_
                    $False
                }
                if ($result) {
                    $m = $rx.match($result.productversion).value
                    if ($m -ge '3.0') {
                        $True
                    }
                    else {
                        $False
                    }
                }
            } #process
            End {}
        } #end Test-IsWSMan

    } # end BEGIN

    PROCESS {
        Write-Verbose "${CmdletName}: Starting Process Block"
        Write-Debug ("PROCESS:`n{0}" -f ($PSBoundParameters | Out-String))
    

        $SessionParams = @{
              ComputerName  = $ComputerName
              ErrorAction = 'Stop'
        } 
        If ($PSBoundParameters['Credential'])
        {
            Write-Verbose "Adding alternate credential for CIMSession"
            $SessionParams.Add("Credential",$Credential)
        }


        If (Test-IsWsman3 –ComputerName $ComputerName)
        {
         $Option = New-CimSessionOption -Protocol WSMan
         $SessionParams.SessionOption = $Option      
        }
        Else
        {
         $Option = New-CimSessionOption -Protocol DCOM
         $SessionParams.SessionOption = $Option 
        }

        New-CimSession @SessionParams
    

    } # end PROCESS

    END { Write-Verbose "Function ${CmdletName} finished." }

    } # end Function Get-LHSCimSession                
   
   
         


} # end BEGIN

PROCESS {

    ForEach ($Computer in $ComputerName) 
    {
        IF (Test-Connection -ComputerName $Computer -count 2 -quiet) 
        { 
            Try
            {
                if ($PSBoundParameters['Credential'])  
                {
                    Write-Verbose "Adding alternate credential for CIMSession"
                    $CimSession = Get-LHSCimSession -ComputerName $Computer -Credential $Credential
                }
                Else
                {
                    $CimSession = Get-LHSCimSession -ComputerName $Computer
                }

                $PageFileUsage = Get-CimInstance -ClassName 'Win32_PageFileUsage' -Namespace 'root\CIMV2' -CimSession $CimSession -ErrorAction Stop
                $ComputerSystem = Get-CimInstance -ClassName 'Win32_ComputerSystem' -Namespace 'root\CIMV2' -CimSession $CimSession -ErrorAction Stop           

                $outputObject = New-Object PSObject -Property @{
                
                       ComputerName = $Computer;
                       PageFile = $PageFileUsage.Name;
                       AutomaticManagedPagefile = $ComputerSystem.AutomaticManagedPagefile
                       AllocatedBaseSize_MB = $PageFileUsage.AllocatedBaseSize;
                       PeakUsage_MB = $PageFileUsage.PeakUsage;
                       CurrentUsage_MB = $PageFileUsage.CurrentUsage;
                       isTempPageFile = $PageFileUsage.TempPageFile
                       InstallDate = $PageFileUsage.InstallDate
                
                } | Select ComputerName,PageFile,AutomaticManagedPagefile,AllocatedBaseSize_MB,PeakUsage_MB,CurrentUsage_MB,isTempPageFile,InstallDate
                

                $outputObject     


                Remove-CimSession -CimSession $CimSession -ErrorAction Stop

            }
            Catch
            {
                Write-Error $_
            }
                
        } 
        Else 
        {
            Write-Warning "\\$Computer DO NOT reply to ping" 
        } # end IF (Test-Connection -ComputerName $Computer -count 2 -quiet)
	   
    } # end ForEach ($Computer in $ComputerName)

} # end PROCESS

END { Write-Verbose "Function ${CmdletName} finished." }

} # end Function Get-LHSPageFileUsage   






function SetPageFile {
    <#
    .SYNOPSIS
        Sets Page File to custom size
 
    .DESCRIPTION
        Disables automatic management of the pagefile, then applies the given values for path and page file size.
        Defaults to C:\pagefile.sys with a 4 gig pagefile.
 
    .PARAMETER Path
        The page file's fully qualified file name (such as C:\pagefile.sys)
 
    .PARAMETER InitialSize
        The page file's initial size [MB]
 
    .PARAMETER MaximumSize
        The page file's maximum size [MB]
 
    .EXAMPLE
        C:\PS> Set-PageFile "C:\pagefile.sys" 4096 6144
    #>
    
    PARAM(
        [string]$Path = "C:\pagefile.sys",
        [int]$InitialSize = 4096,
        [int]$MaximumSize = 4096
    )
     
    $ComputerSystem = $null
    $CurrentPageFile = $null
    $modify = $false
 
    # Disables automatically managed page file setting first
    $ComputerSystem = Get-WmiObject -Class Win32_ComputerSystem -EnableAllPrivileges
    if ($ComputerSystem.AutomaticManagedPagefile) {
        $ComputerSystem.AutomaticManagedPagefile = $false
        $ComputerSystem.Put()
    }
 
    $CurrentPageFile = Get-WmiObject -Class Win32_PageFileSetting
    if ($CurrentPageFile.Name -eq $Path) {
        # Keeps the existing page file
        if ($CurrentPageFile.InitialSize -ne $InitialSize) {
            $CurrentPageFile.InitialSize = $InitialSize
            $modify = $true
        }
        if ($CurrentPageFile.MaximumSize -ne $MaximumSize) {
            $CurrentPageFile.MaximumSize = $MaximumSize
            $modify = $true
        }
        if ($modify) { $CurrentPageFile.Put() }
    }
    else {
        # Creates a new page file
        $CurrentPageFile.Delete()
        Set-WmiInstance -Class Win32_PageFileSetting -Arguments @{Name=$Path; InitialSize = $InitialSize; MaximumSize = $MaximumSize}
    }
}