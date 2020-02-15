function SetDns{
    param(
        $DnsSettings,
        $Adapters
    )

    foreach($Adapter in $Adapters){
        
        $DnsInfo = Get-DNSClientServerAddress -InterfaceAlias $Adapter -AddressFamily IPv4
        
        if($DnsInfo.ServerAddresses -NotMatch $DnsSettings){

            Set-DNSClientServerAddress -InterfaceAlias $Adapter –ServerAddresses $DnsSettings

        }
        
    }
    
}
