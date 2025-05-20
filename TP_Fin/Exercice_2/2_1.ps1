# Demande et vérifie les entrées
$jour = Read-Host "Entrez un jour (1-31)"
$mois = Read-Host "Entrez un mois (ex: Janvier)"
$annee = Read-Host "Entrez une année"

# Liste des mois valides
$moisValides = @("Janvier","Février","Mars","Avril","Mai","Juin","Juillet","Août","Septembre","Octobre","Novembre","Décembre")

if (($jour -match '^\d+$') -and ($jour -ge 1 -and $jour -le 31) -and
    ($moisValides -contains $mois) -and
    ($annee -match '^\d+$')) {
    Write-Host "Données valides"
} else {
    Write-Host "Entrées invalides"
}