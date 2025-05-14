# PowerTaskManager – Gestion Automatisée d’un Poste Windows (Projet PowerShell)

## Objectif du Projet

**PowerTaskManager** est une suite de scripts PowerShell conçue pour automatiser les tâches d’administration d’un poste de travail Windows.  
Elle facilite la gestion courante d’un poste local en centralisant plusieurs fonctionnalités essentielles dans un ensemble de scripts modulaires.

Ce projet est particulièrement adapté à un usage pédagogique ou à une première approche de l'automatisation avec PowerShell.

---

## Modules Fonctionnels

### 1. Audit système – `Audit.ps1`
- Affiche des informations système : nom de l’ordinateur, version de l’OS, RAM, espace disque, uptime.
- Liste des services en cours d'exécution et des utilisateurs locaux actifs.
- Exporte les résultats dans `audit.json` et `audit.csv`.

### 2. Nettoyage automatique – `Nettoyage.ps1`
- Supprime les fichiers temporaires de l'utilisateur.
- Vide les fichiers du dossier `Downloads` ayant plus de 30 jours.
- Supprime les fichiers `.log` dépassant 5 Mo.

### 3. Surveillance des processus – `Processus.ps1`
- Liste les processus en cours.
- Filtre les processus consommant plus de 100 Mo de RAM.
- Exporte la liste dans `processus.csv`.

### 4. Sauvegarde de documents – `Sauvegarde.ps1`
- Copie tous les fichiers `.docx`, `.pdf` et `.txt` depuis un dossier source vers `C:\Backup`.
- Vérifie la réussite de la copie avec `Test-Path`.

### 5. Gestion des utilisateurs – `Utilisateurs.ps1`
- Liste les comptes utilisateurs locaux.
- Permet la création d’un utilisateur (avec mot de passe).
- Désactive ou supprime un utilisateur existant.

### 6. Planification de tâches – `Planification.ps1`
- Crée une tâche planifiée pour exécuter `Audit.ps1` chaque jour à 10h.
- Affiche les tâches planifiées existantes.

### 7. Menu interactif – `Menu.ps1`
- Propose une interface texte pour sélectionner l’une des fonctionnalités ci-dessus.
- Interface simple pour un usage tout-en-un.

---

### Exécution

1. Ouvrez PowerShell en mode administrateur.
2. Positionnez-vous dans le dossier du projet : cd .\TP_PowerTaskManager\