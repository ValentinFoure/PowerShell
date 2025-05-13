function MenuPrincipal {
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

function MenuMaintenance {
    do {
        Clear-Host
        Write-Host "===== MAINTENANCE SYSTÈME =====" -ForegroundColor Cyan
        Write-Host "1. Vérifier l’espace disque"
        Write-Host "2. Supprimer les fichiers temporaires"
        Write-Host "3. Scanner les mises à jour Windows"
        Write-Host "4. Retour menu principal"

        $choix = Read-Host "Choix"
        switch ($choix) {
            "1" { Get-PSDrive C }
            "2" { Remove-Item -Path "$env:TEMP\*" -Recurse -Force }
            "3" { Get-WindowsUpdateLog }
            "4" { return }
            default { Write-Host "Choix invalide." }
        }
        Pause
    } while ($true)
}

function MenuUtilisateur {
    do {
        Clear-Host
        Write-Host "===== GESTION UTILISATEUR =====" -ForegroundColor Cyan
        Write-Host "1. Ajouter un utilisateur"
        Write-Host "2. Afficher tous les utilisateurs"
        Write-Host "3. Supprimer un utilisateur"
        Write-Host "4. Retour menu principal"

        $choix = Read-Host "Choix"
        switch ($choix) {
            "1" {
                $nom = Read-Host "Nom"
                $email = Read-Host "Email"
                "$nom,$email" | Out-File -Append -FilePath "data\users.txt"
                Add-Journal "Ajout de l'utilisateur $nom"
            }
            "2" { Get-Content "data\users.txt" }
            "3" {
                $nom = Read-Host "Nom de l’utilisateur à supprimer"
                (Get-Content "data\users.txt") | Where-Object { $_ -notmatch "^$nom," } | Set-Content "data\users.txt"
                Add-Journal "Suppression de l'utilisateur $nom"
            }
            "4" { return }
            default { Write-Host "Choix invalide." }
        }
        Pause
    } while ($true)
}

function MenuServices {
    do {
        Clear-Host
        Write-Host "===== SERVICES WINDOWS =====" -ForegroundColor Cyan
        Write-Host "1. Afficher les services critiques"
        Write-Host "2. Démarrer un service"
        Write-Host "3. Arrêter un service"
        Write-Host "4. Retour menu principal"

        $choix = Read-Host "Choix"
        switch ($choix) {
            "1" { Get-Service | Where-Object { $_.Status -ne 'Running' -and $_.StartType -eq 'Automatic' } }
            "2" {
                $svc = Read-Host "Nom du service"
                Start-Service -Name $svc
                Add-Journal "Démarrage du service $svc"
            }
            "3" {
                $svc = Read-Host "Nom du service"
                Stop-Service -Name $svc
                Add-Journal "Arrêt du service $svc"
            }
            "4" { return }
            default { Write-Host "Choix invalide." }
        }
        Pause
    } while ($true)
}

function MenuRegistre {
    do {
        Clear-Host
        Write-Host "===== GESTION DU REGISTRE =====" -ForegroundColor Cyan
        Write-Host "1. Créer une clé"
        Write-Host "2. Ajouter/Modifier une valeur"
        Write-Host "3. Lire une valeur"
        Write-Host "4. Supprimer la clé"
        Write-Host "5. Retour menu principal"

        $choix = Read-Host "Choix"
        $keyPath = "HKCU:\Software\TPFinal"
        switch ($choix) {
            "1" { New-Item -Path $keyPath -Force }
            "2" {
                $name = Read-Host "Nom de la valeur"
                $val = Read-Host "Contenu"
                Set-ItemProperty -Path $keyPath -Name $name -Value $val
            }
            "3" {
                $name = Read-Host "Nom de la valeur à lire"
                Get-ItemProperty -Path $keyPath -Name $name
            }
            "4" { Remove-Item -Path $keyPath -Recurse -Force }
            "5" { return }
            default { Write-Host "Choix invalide." }
        }
        Pause
    } while ($true)
}

function MenuJournalisation {
    do {
        Clear-Host
        Write-Host "===== RAPPORT & JOURNALISATION =====" -ForegroundColor Cyan
        Write-Host "1. Générer un rapport système"
        Write-Host "2. Lire le journal d’activité"
        Write-Host "3. Exporter le rapport"
        Write-Host "4. Retour menu principal"

        $choix = Read-Host "Choix"
        switch ($choix) {
            "1" {
                Get-ComputerInfo | Out-File "logs\rapport.txt"
                Add-Journal "Rapport système généré"
            }
            "2" { Get-Content "logs\journal.txt" }
            "3" {
                Copy-Item -Path "logs\rapport.txt" -Destination "logs\rapport_exporté.txt"
                Add-Journal "Rapport exporté"
            }
            "4" { return }
            default { Write-Host "Choix invalide." }
        }
        Pause
    } while ($true)
}

function Add-Journal($message) {
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $message" | Out-File -Append -FilePath "logs\journal.txt"
}