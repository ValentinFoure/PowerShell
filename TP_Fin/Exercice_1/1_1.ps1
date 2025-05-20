# Ouvre le répertoire utilisateur
cd ~
# Affiche le contenu complet (fichiers + dossiers)
Get-ChildItem
# Affiche uniquement les fichiers
Get-ChildItem | Where-Object { -not $_.PSIsContainer }