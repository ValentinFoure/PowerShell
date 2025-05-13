# WindowsAudit – Audit Complet d’un Système Windows

## Objectif du Projet

**WindowsAudit** est un projet PowerShell modulaire permettant de réaliser un **audit complet et automatisé** d’un poste de travail sous Windows.  
Le script principal, appuyé par plusieurs modules spécialisés, collecte les informations critiques d’un système et génère un **rapport structuré** prêt à l’emploi.

Ce projet est particulièrement utile pour les administrateurs système, les formateurs ou les étudiants souhaitant découvrir l’automatisation de l’administration Windows via PowerShell.

---

## Fonctionnalités Clés

Le script couvre les domaines suivants :

### 1. Informations Matérielles (`modules/Hardware.ps1`)
- Nom de l’ordinateur
- Fabricant, modèle
- Type et quantité de RAM
- Processeur
- Disques (capacité totale et espace libre)

### 2. Logiciels Installés (`modules/Software.ps1`)
- Liste complète des logiciels installés avec :
  - Nom
  - Éditeur
  - Version

### 3. Sécurité (`modules/Security.ps1`)
- Statut du pare-feu Windows
- Statut de l’antivirus (Windows Defender)

### 4. Utilisation Système (`modules/Performance.ps1`)
- Utilisation actuelle du CPU (%)
- Utilisation actuelle de la RAM (%)
- Espace libre sur les disques (%)

### 5. Événements Récents (`modules/Events.ps1`)
- Dernières **20 erreurs** critiques du journal d’événements système

### 6. Comptes Locaux (`modules/Users.ps1`)
- Liste des utilisateurs locaux
- Liste des groupes locaux

### 7. Imprimantes et Périphériques (`modules/Devices.ps1`)
- Liste des imprimantes installées
- Périphériques USB connectés

### 8. Informations Réseau (`modules/Network.ps1`)
- Adresse IP, passerelle, DNS
- Nom d’hôte
- Adaptateurs réseau

### 9. Système d’exploitation (`modules/OS.ps1`)
- Version de Windows
- Durée de fonctionnement (uptime)
- Architecture (32 ou 64 bits)

---

## Instructions d’Utilisation

### Prérequis

- Système : **Windows 10 ou 11**
- PowerShell version **5.1 ou supérieure**
- Exécuter PowerShell **en tant qu’administrateur**

### Exécution

1. Cloner le projet ou télécharger l’archive : cd .\WindowsAudit\