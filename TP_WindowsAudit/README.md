## But du projet

Ce projet PowerShell permet de générer un rapport détaillé sur l'état d’un poste Windows.

Il couvre 9 grandes catégories d’informations :

- **Informations matérielles** : Nom de l'ordinateur, processeur, RAM, disques durs.
- **Logiciels installés** : Liste des logiciels présents avec nom, éditeur et version.
- **Sécurité** : Statut du pare-feu et de Windows Defender.
- **Utilisation système** : Pourcentage d'utilisation du CPU, RAM et espace disque.
- **Événements récents** : Les 20 dernières erreurs dans le journal des événements système.
- **Comptes locaux** : Liste des utilisateurs et des groupes locaux.
- **Imprimantes et périphériques** : Liste des imprimantes installées et des périphériques USB connectés.
- **Informations réseau** : Adresse IP, passerelle, DNS, adaptateurs réseau.
- **Système d'exploitation** : Version de Windows, date de démarrage (uptime), architecture (32 ou 64 bits).

Le but est de fournir un rapport complet sur l'état du système pour des audits, des diagnostics ou des analyses de performance.

## Instructions d'exécution

### Prérequis

1. **PowerShell** doit être installé sur la machine (version 5.1 ou supérieure recommandée).
2. Exécution en **mode administrateur** pour accéder à toutes les informations système (journal des événements, utilisateurs locaux, etc.).

### Étapes pour exécuter le script

1. Ouvrez **PowerShell en tant qu’administrateur**.
2. Téléchargez ou copiez le script `Audit.ps1` sur votre machine.
3. Exécutez le script en utilisant la commande suivante : .\Audit.ps1