#modify value, create key if not exist
function ModifyRegistryKey{

    PARAM(
        $RegKeys,
        $DefaultValue
    )

    foreach($RegKey in $RegKeys){ 
        
        if ($DefaultValue){
            $RegKeyValue = $RegKey.DefaultValue
        }
        else{
            $RegKeyValue = $RegKey.Value
        }
        
        $KeyTest = Test-RegistryEntry -key $RegKey.path -name $RegKey.Name
        
        if ($KeyTest -Match "False"){
            
            $RootKeyString = $RegKey.path -replace '\:',""  
            [string]$rootKey = "'$RootKeyString'" -replace '\\',"' '"

            invoke-expression  "CreateRegistryKeys -rootKey $rootKey"
            
            Set-RegistryEntry -key $RegKey.path -name $RegKey.Name -value $RegKeyValue -type $RegKey.Type
        }
        
        
        if (Read-RegistryEntry -key $RegKey.path -name $RegKey.Name -ne $RegKeyValue){
            Set-RegistryEntry -key $RegKey.path -name $RegKey.Name -value $RegKeyValue
        }
    }

}




function CreateRegistryKey([string] $keyPath)
{   
    if ( -not (Test-Path $keyPath) )
    {
        New-Item -Path "$keyPath";
    }
}
 
function CreateRegistryKeys([string] $rootKey){

    
    [string] $keyPath = [String]::Format("{0}:", $rootKey);
    
    foreach($keyName in $args)
    {
        [string] $keyPath = [String]::Format("{0}\{1}", $keyPath, $keyName);
        CreateRegistryKey $keyPath;
    }
}
 
function DeleteRegistryKey([string] $rootKey, [string] $keyName)
{
    [string] $keyPath = [String]::Format("{0}:\{1}", $rootKey, $keyName);
    
    if ( Test-Path $keyPath )
    {
        Remove-Item -Path "$keyPath" -Recurse;
    }
}
 
function Test-RegistryEntry ([string] $key, [string] $name)
{
    Get-ItemProperty -Path $key -Name $name -ErrorAction SilentlyContinue | Out-Null;
    return $?;
}
function Read-RegistryEntry ([string] $key, [string] $name)
{   
    if ( Test-RegistryEntry $key $name )
    {         
        return (Get-ItemProperty -Path $key -Name $name).$name;       
    }
    else
    {
        return '';
    }
}
 
function Set-RegistryEntry ([string] $key, [string] $name, [string] $value, [string] $type = 'String')
{
    if ( -not (Test-RegistryEntry $key $name) )
    {
        if ( ($type -eq 'DWORD') -or ( $type -eq 'String' ) )
        {
            New-ItemProperty -Path $key -Name $name -PropertyType $type -Value $value;
        }
    }
    else
    {
        Set-ItemProperty -Path $key -Name $name -Value $value;
        Write-Output "The Entry [$key/$name = $value] is modified.";
    }
}
 
function Rename-RegistryEntry ([string] $key, [string] $name, [string] $newName)
{
    if ( Test-RegistryEntry $key $name)
    {
        Rename-ItemProperty -Path $key -Name $name -NewName $newName;
    }
}
 
function Remove-RegistryEntry ([string] $key, [string] $name)
{
    if ( Test-RegistryEntry $key $name)
    {
        Remove-ItemProperty -Path $key -Name $name;       
    }
}
 
function Test ()
{
    CreateRegistryKeys 'HKCU' 'Software' 'My App' 'Settings';
    Set-RegistryEntry 'HKCU:\Software\My App\Settings' 'LogFile1' 'C:\log1' 'String'
    Set-RegistryEntry 'HKCU:\Software\My App\Settings' 'DebugOn' '0' 'DWORD'
 
    $a = (Read-RegistryEntry 'HKCU:\Software\My App\Settings' 'LogFile1');
    $b = (Read-RegistryEntry 'HKCU:\Software\My App\Settings' 'DebugOn');
 
    Rename-RegistryEntry 'HKCU:\Software\My App\Settings' 'LogFile1' 'LogFile'
 
    Set-RegistryEntry 'HKCU:\Software\My App\Settings' 'LogFile' 'C:\log'
    Set-RegistryEntry 'HKCU:\Software\My App\Settings' 'DebugOn' '1'
 
    $c = (Read-RegistryEntry 'HKCU:\Software\My App\Settings' 'LogFile');
    $d = (Read-RegistryEntry 'HKCU:\Software\My App\Settings' 'DebugOn');
 
    Remove-RegistryEntry 'HKCU:\Software\My App\Settings' 'DebugOn'
 
    $e = (Read-RegistryEntry 'HKCU:\Software\My App\Settings' 'DebugOn');
 
    DeleteRegistryKey 'HKCU' 'Software/My App'
 
    "a = $a";
    "b = $b";
    "c = $c";
    "d = $d";
    "e = $e";
}
 
# Test;

