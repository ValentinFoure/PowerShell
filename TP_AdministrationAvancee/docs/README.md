# Administration Avancée (Projet PowerShell)

## Objectif du Projet

**AdminAvancee** est un projet modulaire en PowerShell destiné à automatiser et simplifier les tâches avancées d’administration système sur Windows.  
Il permet de gérer des processus en arrière-plan, d’administrer des systèmes à distance et de planifier des tâches récurrentes grâce à des scripts organisés et réutilisables.

Ce projet est idéal pour les **administrateurs système**, **étudiants** ou **formateurs** qui souhaitent s’initier ou approfondir leurs compétences en **scripting PowerShell** et en **gestion d’infrastructure Windows**.

---

## Fonctionnalités Clés

Le projet est structuré autour de trois modules principaux :

### 1. Gestion des Processus (scripts/gestion-processus.ps1)
- Lancement de tâches longues en arrière-plan
- Suivi de l’état d’un processus (en cours, terminé, échoué)
- Journalisation des erreurs et états

### 2. Administration à Distance (scripts/admin-distance.ps1)
- Connexion à des machines distantes via **PowerShell Remoting**
- Exécution sécurisée de commandes avec **Get-Credential**
- Exemple : obtenir les services actifs à distance

### 3. Planification de Tâches (scripts/taches-planifiees.ps1)
- Création de tâches planifiées locales
- Définition d’actions et de déclencheurs (quotidien, hebdomadaire…)
- Planification distante via **Invoke-Command**

### Fonctions Utilitaires (scripts/utils.ps1)
- Fonctions de gestion des logs (`Write-Log`)
- Fonctions d’affichage réutilisables
- Centralisation du traitement des erreurs

---

### Exécution

1. Ouvrez PowerShell en mode administrateur.
2. Positionnez-vous dans le dossier du projet : cd .\TP_AdministrationAvancee\

![Capture d'écran 2025-05-14 131953](https://github.com/user-attachments/assets/0854a8a7-a807-4bb3-9b6a-cbb5de6e3044)
