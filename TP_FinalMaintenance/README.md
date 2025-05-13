# Centre de Maintenance Windows - Projet PowerShell

## But du projet

Ce projet PowerShell fournit une interface en ligne de commande pour effectuer la maintenance d’un poste Windows.  
Il permet à un administrateur système de :

- Diagnostiquer l’état du système
- Gérer les utilisateurs
- Superviser les services Windows
- Manipuler le registre
- Générer des rapports complets sur la machine locale

Un des modules clés permet de **générer un rapport d’audit détaillé** sur l’état du système couvrant les aspects matériels, logiciels, sécurité, réseau et plus encore.

---

## Modules Fonctionnels

### 1. Maintenance système
- Vérification de l’espace disque
- Nettoyage des fichiers temporaires
- Scan des mises à jour Windows

### 2. Gestion des utilisateurs
- Ajout, affichage et suppression d’utilisateurs (stockés dans `data/users.txt`)

### 3. Services Windows
- Affichage, démarrage et arrêt de services critiques

### 4. Registre Windows
- Création, modification, lecture et suppression de clés/valeurs dans `HKCU:\Software\TPFinal`

### 5. Journalisation & Rapport
- Génération d’un **rapport système complet**
- Lecture du journal d’activité (`logs/journal.txt`)
- Exportation du rapport global (`logs/rapport.txt`)

---

## Détail du rapport généré

Le rapport système couvre **9 grandes catégories** :

1. **Informations matérielles**  
   Nom du PC, processeur, RAM, disques durs.

2. **Logiciels installés**  
   Liste complète des logiciels (nom, éditeur, version).

3. **Sécurité**  
   Statut du pare-feu Windows et de Windows Defender.

4. **Utilisation système**  
   Utilisation actuelle du CPU, RAM et espace disque.

5. **Événements récents**  
   Les 20 dernières erreurs critiques du journal système.

6. **Comptes locaux**  
   Utilisateurs et groupes locaux présents sur le poste.

7. **Imprimantes et périphériques**  
   Liste des imprimantes et des périphériques USB connectés.

8. **Informations réseau**  
   Adresse IP, passerelle, DNS, interfaces réseau.

9. **Système d’exploitation**  
   Version de Windows, uptime, architecture (32/64 bits).

---

## Instructions d'exécution

### Prérequis

- **PowerShell 5.1** ou supérieur recommandé
- Lancer PowerShell **en tant qu’administrateur** pour un accès complet :
  - Lecture du journal des événements
  - Gestion des services et du registre
  - Informations complètes sur les utilisateurs

### Exécution

1. Ouvrez PowerShell en mode administrateur.
2. Positionnez-vous dans le dossier du projet : cd .\TPFinal-Maintenance\