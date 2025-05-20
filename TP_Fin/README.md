# TP Final (Projet PowerShell)

## Objectif du Projet

Ce projet a pour objectif de vous familiariser avec **PowerShell sous Windows** à travers des **exercices pratiques** progressifs.  
Il permet de découvrir les bases du scripting, la gestion des erreurs, la manipulation de fichiers, ainsi que des équivalents PowerShell de commandes UNIX.

Le TP est destiné à un **public débutant à intermédiaire**, souhaitant maîtriser les fondamentaux du **développement de scripts PowerShell** dans un cadre d’administration système.

---

## Structure du Projet

Le projet est composé de **7 exercices**, chacun illustrant des fonctionnalités clés de PowerShell. Tous les scripts sont à exécuter dans **Windows PowerShell ISE**, avec commentaires intégrés pour faciliter la compréhension.

---

## ## Modules Fonctionnels des 7 Exercices

### Exercice 1 – Découverte de PowerShell
- Navigation dans les répertoires utilisateurs
- Affichage des fichiers (en excluant les dossiers)
- Recherche des commandes contenant le verbe `move` via différentes méthodes (dont filtre)
- Introduction à PowerShell ISE et vérification des droits d'exécution

### Exercice 2 – Vérification de Date
- **V1 :** Saisie utilisateur et validation de jour/mois/année
- **V2 :** Validation complète d’une date (mois valides, années bissextiles, etc.)
- Gestion d’erreurs conviviale et robuste

### Exercice 3 – Fusion de chaînes
- Fusion imbriquée de deux chaînes en alternance
- Fusion imbriquée de **plusieurs chaînes** avec sauvegarde dans un fichier

### Exercice 4 – Synchronisation de fichiers
- Script pour copier uniquement les fichiers plus récents d’un répertoire source vers destination
- Discussion sur une solution équivalente en Shell Unix/Linux

### Exercice 5 – Équivalents de commandes UNIX
- Comparaison et exemples PowerShell pour :
  - `grep` → `Select-String`
  - `find` → `Get-ChildItem` + filtres
  - `wc` → `Measure-Object`
- Réutilisation des scripts précédents si nécessaire

### Exercice 6 – Traitement de texte
- Affichage des mots contenant une séquence spécifique (ex. : `"sc"`)
- Comptage de ces mots dans des fichiers `.txt`
- Paramétrage du motif recherché (`"th"`, `"xtr"`, etc.)
- Remplacement de caractères dans un fichier texte (ex. : `;` → espace, tab → saut de ligne)

### Exercice 7 – Arborescence de répertoires
- Utilisation et analyse de la commande `tree` sous Windows
- Reproduction d’un affichage en arbre sans utiliser la commande `tree`

---

## Exécution des Scripts

1. Ouvrez PowerShell en mode administrateur.
2. Positionnez-vous dans le dossier du projet : cd .\TP_Fin\