# Charger les fonctions
. "$PSScriptRoot\fonctions.ps1"function MenuPrincipal {
    do {
        Clear-Host
        Write-Host "========= MENU PRINCIPAL =========" -ForegroundColor Cyan
        Write-Host "1. Maintenance système"
        Write-Host "2. Gestion utilisateur"
        Write-Host "3. Services Windows"
        Write-Host "4. Gestion du registre"
        Write-Host "5. Rapport et journalisation"
        Write-Host "6. Quitter"

        $choix = Read-Host "Entrez votre choix"
        switch ($choix) {
            "1" { MenuMaintenance }
            "2" { MenuUtilisateur }
            "3" { MenuServices }
            "4" { MenuRegistre }
            "5" { MenuJournalisation }
            "6" { Write-Host "Au revoir !" ; break }
            default { Write-Host "Choix invalide." -ForegroundColor Red }
        }
        Pause
    } while ($true)
}

# Exécuter le menu principal
MenuPrincipal