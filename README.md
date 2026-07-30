# 🔋 PEMFC-Assembly-Genetic-Optimization

![MATLAB](https://img.shields.io/badge/MATLAB-R2023b+-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)
![Domain](https://img.shields.io/badge/Domain-Energy%20%26%20Mechatronics-orange.svg)

## 📌 Présentation du Projet
Ce projet vise à optimiser l'assemblage mécanique d'une **pile à combustible à membrane échangeuse de protons (PEMFC)** afin de maximiser son rendement global. 

L'assemblage d'une PEMFC présente un compromis physique complexe :
- **Minimiser la résistance de contact électrique ($R_c$)** : nécessite une force de serrage importante.
- **Maximiser la porosité de la couche de diffusion de gaz ($P$)** : nécessite de limiter le serrage pour ne pas écraser le GDL.

Grâce à un **Algorithme Génétique (GA)** implémenté sous MATLAB, ce programme explore un espace de recherche discret combinant choix des matériaux, géométrie et force de serrage pour trouver la configuration idéale.

---

## 🛠️ Modélisation & Espace de Recherche

Le problème traite **10 variables d'optimisation discrètes** :
* **Conditions opératoires :** Température ($X_1$), Humidité relative ($X_4$)
* **Choix des matériaux :** GDL ($X_2$), Joints ($X_3$), Plaques Bipolaires ($X_8$), Plaques Terminales ($X_5$), Isolant ($X_6$), Collecteurs ($X_7$)
* **Géométrie & Structure :** Nombre de cellules ($X_9$)
* **Effort mécanique :** Force de serrage ($X_{10}$, de 50 N à 12 000 N par pas de 50 N)

---

## ⚙️ Stratégie d'Optimisation

- **Méthode :** Algorithme Génétique (GA) avec fonction de fitness scalaire :
  $$F(X) = R_c(X) - P(X)$$
- **Taille de la population :** Jusqu'à 1 000 individus
- **Interface MATLAB :**
  - `runModel.m` : Gestion de l'interface avec la boîte noire de simulation.
  - `ObjectiveFcn.m` : Calcul de la fonction coût / fitness pour la population.

---

## 🎯 Résultats Clés
Après convergence de l'algorithme, la configuration optimale identifiée (Force de serrage de 12 000 N avec matériaux à forte rigidité structurales) permet d'atteindre :
- **Porosité finale ($P$) :** `0.6828`
- **Résistance de contact ($R_c$) :** `6.2442`

---

## 🎓 Contexte
Projet réalisé dans le cadre du Master ISC-Mécatronique à l'**UTBM** (Université de Technologie de Belfort-Montbéliard).
