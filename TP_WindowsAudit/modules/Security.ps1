# Vérifie le statut du pare-feu Windows
$firewallProfiles = Get-NetFirewallProfile
foreach ($profile in $firewallProfiles) {
    Write-Output "Pare-feu [$($profile.Name)] : $($profile.Enabled)"
}

# Vérifie le statut de Windows Defender (antivirus)
$defender = Get-MpComputerStatus

Write-Output "`n=== Windows Defender ==="
Write-Output "Antivirus activé : $($defender.AntivirusEnabled)"
Write-Output "Protection en temps réel : $($defender.RealTimeProtectionEnabled)"
Write-Output "Signature à jour : $($defender.AntispywareSignatureLastUpdated)"
Write-Output "Version des signatures : $($defender.AntivirusSignatureVersion)"
Write-Output "Dernière analyse rapide : $($defender.LastQuickScanStartTime)"
Write-Output "Statut global : $($defender.AMServiceEnabled -and $defender.AntivirusEnabled -and $defender.RealTimeProtectionEnabled)"