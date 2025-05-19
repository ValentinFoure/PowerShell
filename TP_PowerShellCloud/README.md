# PowerShellCloud (Projet PowerShell)

## Objectif du Projet

**PowerShellCloud** est un projet pédagogique conçu pour automatiser des tâches d’intégration de données dans **Snowflake** à l’aide de **PowerShell**.  
Il permet d’exécuter des opérations SQL (CRUD), de manipuler des bases Snowflake à distance, et d’explorer deux approches : via les **Cmdlets CData**

Ce projet est idéal pour les **étudiants**, **administrateurs de données**, ou **développeurs** souhaitant apprendre à **automatiser les workflows de données cloud** avec PowerShell.

---

## Fonctionnalités Clés

### 1. Connexion à Snowflake via PowerShell
- Utilisation des Cmdlets CData (`Connect-Snowflake`, `Invoke-Snowflake`)  
- Lecture des identifiants via fichier `.env` pour sécuriser les accès

### 2. Exécution automatisée de scripts SQL
- Chargement et exécution de requêtes depuis le dossier `requetes/`
- Insertion automatisée de jeux de données (ex : stations Vélib)

### 3. Opérations CRUD sur Snowflake
- Création de tables (`CREATE TABLE`)
- Insertion de données (`INSERT`)
- Lecture et filtrage (`SELECT`)
- Mise à jour des données (`UPDATE`)
- Suppression (optionnel)

---

##  Exécution

1. Ouvrez PowerShell en mode administrateur.
2. Positionnez-vous dans le dossier du projet : cd .\TP_PowerShellCloud\