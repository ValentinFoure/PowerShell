# Méthode 1 : Rechercher avec Get-Command
Get-Command -Verb move

# Méthode 2 : Filtrage avec Where-Object
Get-Command | Where-Object { $_.Verb -eq "Move" }

# Méthode 3 : Utilisation de la recherche dans les noms
Get-Command *move*