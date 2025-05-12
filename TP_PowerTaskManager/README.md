## But du projet

Ce projet PowerShell permet de d'automatiser l’administration d’un poste de travail Windows local. Il centralise les tâches courantes de gestion système telles que l’audit, le nettoyage, la surveillance des processus, la gestion des utilisateurs, la sauvegarde de fichiers, et la planification d’actions.

Le projet se compose de 7 scripts principaux, chacun spécialisé dans un domaine clé :

- **Audit système** : Nom du PC, version de l'OS, RAM, disques, uptime / Services actifs, utilisateurs locaux connectés / Export JSON et CSV (`audit.json`, `audit.csv`)

- **Nettoyage automatique** : Suppression des fichiers temporaires utilisateur / Nettoyage du dossier `Downloads` (fichiers > 30 jours) / Suppression des fichiers `.log` > 5 Mo

- **Surveillance des processus** : Affichage de tous les processus en cours / Filtrage des processus consommant > 100 Mo de RAM / Export CSV (`processus.csv`)

- **Sauvegarde de documents** : Copie des fichiers `.docx`, `.pdf`, `.txt` depuis un dossier source / Destination : `C:\Backup` / Vérification de la copie avec `Test-Path`

- **Gestion des utilisateurs** : Liste des comptes utilisateurs locaux / Création d’un compte (avec mot de passe) / Désactivation ou suppression d’un compte existant

- **Planification de tâches** : Création d’une tâche planifiée pour lancer l’audit chaque jour à 10h / Affichage des tâches planifiées via PowerShell

- **Menu interactif** : Interface en ligne de commande / Permet de sélectionner l’un des scripts ci-dessus via un menu texte

## Instructions d'exécution

### Prérequis

1. PowerShell version **5.1 ou supérieure**
2. Droits administrateur recommandés** pour exécuter certains scripts
3. Autorisation d'exécution des scripts PowerShell : Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

![Capture d'écran 2025-05-12 134505](https://github.com/user-attachments/assets/d2486518-33bc-4818-8d3a-929143b8570e)
