# TP (ProjetPowerShell)

## Objectif du Projet

**TPSecuritePS** est un projet pédagogique en PowerShell conçu pour apprendre à gérer la **sécurité système sur Windows**, créer des **scripts robustes** et utiliser les **outils de débogage** intégrés à PowerShell.  
Il s’adresse aux **étudiants**, **administrateurs débutants** ou toute personne souhaitant approfondir ses compétences en **scripting PowerShell** sur un environnement Windows.

Le projet est structuré de manière claire, versionné avec Git, et conçu pour être exécuté dans **Visual Studio Code** avec les outils de débogage intégrés.

---

## Fonctionnalités Clés

Le projet s’organise autour de trois scripts principaux :

### 1. Gestion du Pare-feu Windows (`Exercice1-Firewall.ps1`)
- Affichage de la configuration actuelle des profils de pare-feu
- Création d’une règle bloquant le trafic sortant sur un port TCP
- Vérification et suppression de la règle
- Manipulation des commandes `Get-NetFirewallProfile`, `New-NetFirewallRule`, `Remove-NetFirewallRule`

### 2. Création et Débogage de Script (`Exercice2-Debug.ps1`)
- Script paramétrable (ex. : nom de l’utilisateur)
- Affichage des paramètres d’exécution et du chemin du script
- Intégration de **points d’arrêt** pour le débogage
- Utilisation de `break`, `$PSCommandPath`, et du débogueur intégré de VS Code

### 3. Gestion des Erreurs (`Exercice3-Erreurs.ps1`)
- Simulation d’une erreur d’accès à un fichier inexistant
- Gestion des exceptions avec `try/catch/finally`
- Affichage d’un message clair pour l’utilisateur
- Script résilient et propre à l’exécution

---

### Exécution

1. Ouvrez PowerShell en mode administrateur.
2. Positionnez-vous dans le dossier du projet : cd .\TPFinal-Maintenance\