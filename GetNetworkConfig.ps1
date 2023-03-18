Function Get-NetworkConfg
{
    param()

    $ipadapter = Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration `
                    -Filter "IPEnabled = $true"

    $computerInfo = Get-ComputerInfo

    $ipv4Object = [PSCustomObject]@{
        IPv4Address = $ipadapter.IPAddress[0]
        SubnetMast  = $ipadapter.IPSubnet[0]
        DefGateway  = $ipadapter.DefaultIPGateway[0]
        MACAddress  = $ipadapter.MACAddress
        DNSAddress  = $ipadapter.DNSServerSearchOrder[0]
        FQDN        = $ipadapter.DNSHostName + "." + $computerInfo.CsDomain
    }
    Write-Output $ipv4Object
}

Get-NetworkConfg