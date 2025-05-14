$securityInfo = @{}

# Statut du pare-feu
$firewallStatus = Get-NetFirewallProfile | Select-Object Name, Enabled
$securityInfo["Pare-feu"] = $firewallStatus | Format-Table -AutoSize

# Statut de l'antivirus (Windows Defender)
$defenderStatus = Get-MpComputerStatus
$securityInfo["Antivirus"] = "Windows Defender (Actif : $($defenderStatus.AntivirusEnabled))"

$securityInfo