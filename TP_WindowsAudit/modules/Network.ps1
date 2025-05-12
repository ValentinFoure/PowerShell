$networkInfo = @{}

# Adresse IP
$ipAddress = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias "Ethernet" | Select-Object -First 1).IPAddress
$networkInfo["Adresse IP"] = $ipAddress

# Passerelle et DNS
$gateway = (Get-NetRoute -DestinationPrefix '0.0.0.0/0' | Select-Object -First 1).NextHop
$dns = (Get-DnsClientServerAddress -AddressFamily IPv4 | Select-Object -First 1).ServerAddresses
$networkInfo["Passerelle"] = $gateway
$networkInfo["DNS"] = $dns -join ", "

# Nom d'hôte
$hostname = hostname
$networkInfo["Nom d'hôte"] = $hostname

# Adaptateurs réseau
$networkAdapters = Get-NetAdapter | Select-Object Name, Status
$networkInfo["Adaptateurs réseau"] = $networkAdapters

$networkInfo