$filePath = "C:\fichier_inexistant.txt"

try {
    Write-Output "Tentative d'accès au fichier : $filePath"
    $contenu = Get-Content -Path $filePath -ErrorAction Stop
    Write-Output $contenu
}
catch {
    Write-Error "Erreur : Impossible d'accéder au fichier. $_"
}
finally {
    Write-Output "Bloc finally exécuté. Nettoyage terminé."
}

Write-Output "Fin du script."