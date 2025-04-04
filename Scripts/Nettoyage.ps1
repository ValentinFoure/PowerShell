# 1. Supprimer les fichiers temporaires de l'utilisateur

# Récupérer le chemin des dossiers temporaires
$tempFolder = [System.IO.Path]::GetTempPath()

Write-Host "Nettoyage des fichiers temporaires dans: $tempFolder"

# Supprimer tous les fichiers et sous-dossiers dans le dossier temporaire
Remove-Item -Path "$tempFolder*" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Fichiers temporaires supprimés."

# 2. Nettoyer le dossier Downloads (fichiers de plus de 30 jours)

# Récupérer le chemin du dossier Downloads de l'utilisateur
$downloadsFolder = [Environment]::GetFolderPath('MyDocuments') + "\Downloads"

Write-Host "Nettoyage des fichiers dans le dossier Downloads : $downloadsFolder"

# Supprimer les fichiers dans le dossier Downloads qui ont plus de 30 jours
$thirtyDaysAgo = (Get-Date).AddDays(-30)
Get-ChildItem -Path $downloadsFolder | Where-Object { $_.LastWriteTime -lt $thirtyDaysAgo } | Remove-Item -Force -ErrorAction SilentlyContinue
Write-Host "Fichiers de plus de 30 jours dans le dossier Downloads supprimés."

# 3. Supprimer les fichiers .log de plus de 5 Mo

Write-Host "Suppression des fichiers .log de plus de 5 Mo"

# Récupérer tous les fichiers .log sur le système qui sont plus gros que 5 Mo
$logFiles = Get-ChildItem -Path "C:\" -Recurse -Filter "*.log" -File | Where-Object { $_.Length -gt 5MB }

# Supprimer les fichiers .log trouvés
foreach ($logFile in $logFiles) {
    Remove-Item -Path $logFile.FullName -Force -ErrorAction SilentlyContinue
    Write-Host "Fichier supprimé : $($logFile.FullName)"
}

Write-Host "Nettoyage terminé."