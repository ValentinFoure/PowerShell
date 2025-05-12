Write-Output "=== Comptes locaux ==="

# --- Liste des utilisateurs locaux ---
Write-Output "`nUtilisateurs locaux :"
try {
    Get-LocalUser | Select-Object Name, Enabled, LastLogon | Format-Table -AutoSize
} catch {
    Write-Output " Erreur : Cette commande nécessite PowerShell 5.1+ et Windows 10+."
}

# --- Liste des groupes locaux ---
Write-Output "`nGroupes locaux :"
try {
    Get-LocalGroup | Select-Object Name, Description | Format-Table -AutoSize
} catch {
    Write-Output " Erreur : Cette commande nécessite PowerShell 5.1+ et Windows 10+."
}