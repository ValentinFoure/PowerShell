param(
    [string]$Nom = "Utilisateur"
)

Write-Output "Nom fourni : $Nom"
Write-Output "Chemin du script : $PSCommandPath"
Write-Output "Dossier du script : $(Split-Path -Path $PSCommandPath)"

# Point d'arrêt pour le débogage
break

Write-Output "Script terminé"