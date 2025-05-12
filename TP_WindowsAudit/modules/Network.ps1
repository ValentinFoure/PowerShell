# Nom d'hôte
$hostname = $env:COMPUTERNAME
Write-Output "`nNom d'hôte : $hostname"

# Adaptateurs réseau actifs
Write-Output "`nAdaptateurs réseau actifs :"
Get-NetAdapter | Where-Object { $_.Status -eq "Up" } |
Select-Object Name, InterfaceDescription, InterfaceType, Status | Format-Table -AutoSize

# Informations IP détaillées
Write-Output "`nAdresses IP, passerelle, DNS :"
$netIPs = Get-NetIPConfiguration | Where-Object { $_.IPv4Address -ne $null }
foreach ($adapter in $netIPs) {
    Write-Output "`nAdaptateur : $($adapter.InterfaceAlias)"
    Write-Output "Adresse IP : $($adapter.IPv4Address.IPAddress)"
    Write-Output "Passerelle par défaut : $($adapter.IPv4DefaultGateway.NextHop)"
    Write-Output "Serveurs DNS : $($adapter.DnsServer.ServerAddresses -join ', ')"
}