$jour = Read-Host "Jour"
$mois = Read-Host "Mois"
$annee = Read-Host "Année"

try {
    $dateString = "$jour $mois $annee"
    $culture = [System.Globalization.CultureInfo]::GetCultureInfo("fr-FR")
    $date = [datetime]::ParseExact($dateString, "d MMMM yyyy", $culture)
    Write-Host "Date valide : $date"
} catch {
    Write-Host "Date invalide"
}