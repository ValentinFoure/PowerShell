# Afficher la configuration actuelle des profils de pare-feu
Write-Output "Configuration actuelle des profils de pare-feu :"
Get-NetFirewallProfile | Format-Table Name, Enabled, DefaultInboundAction, DefaultOutboundAction

# Définir le port à bloquer
$port = 8080
$ruleName = "Blocage_Trafic_Sortant_$port"

# Ajouter une règle de pare-feu pour bloquer le trafic sortant sur ce port
New-NetFirewallRule -DisplayName $ruleName `
    -Direction Outbound `
    -Action Block `
    -Protocol TCP `
    -LocalPort $port `
    -Profile Any

Write-Output "Règle ajoutée : $ruleName"

# Vérifier la règle
Write-Output "Vérification de la règle :"
Get-NetFirewallRule -DisplayName $ruleName

# Suppression de la règle
Remove-NetFirewallRule -DisplayName $ruleName