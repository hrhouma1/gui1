## Calendrier des livraisons 

| Date                | Livraison | Travail                                                                   | Mode                   | Pondération |
| ------------------- | --------- | ------------------------------------------------------------------------- | ---------------------- | ----------- |
| **27 mai 2025**     | Sprint 1  | Cahier des charges + prototype V1 (1 écran)                               | Individuel             | 25 %        |
| **10 juin 2025**    | Sprint 2  | Version intermédiaire (≥ 3 écrans, navigation, premières logiques métier) | Équipe                 | 35 %        |
| **07 juillet 2025** | Sprint 3  | Version finale + quiz individuel (API / BD, gestion d’état avancée)       | Équipe (+ quiz indiv.) | 40 %        |



## Gabarit minimal du **cahier des charges** (à remettre le 27 mai)

1. **Contexte & but de l’application** (½ page)
2. **Personas cibles** (1–2 profils succincts)
3. **Exigences fonctionnelles prioritaires** (liste numérotée de 5–7 items)
4. **Exigences non fonctionnelles** (performance, accessibilité, plateformes, etc.)
5. **Architecture fonctionnelle** : diagramme simple ou description textuelle des modules (UI, logique, persistance).
6. **Maquettes basse fidélité** (wireframes des principaux écrans, croquis acceptés)
7. **Plan de sprints** : backlog initial + jalons clés pour les trois dates.
8. **Critères d’acceptation de la V1** (ce qui doit absolument fonctionner au 27 mai).

*(Un cahier des charges de 1–3 pages suffit)*



# Trois énoncés de TP (choisissez-en un)

### 1. Gestionnaire de tâches & habitudes « TaskBuddy »

| Sprint                 | Objectifs principaux                                                                                                                                                         |
| ---------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **1 – Prototype**      | • Afficher la liste du jour (titre, case à cocher)  <br> • Ajouter / supprimer une tâche                                                                                     |
| **2 – Version 1**      | • Trois écrans : Liste du jour, Historique, Paramètres  <br> • Thème clair/sombre manuel  <br> • Statistiques simples (nombre de tâches terminées)                           |
| **3 – Version finale** | • Persistance locale *sqflite* *ou* synchro API REST gratuite (par ex. Supabase)  <br> • Notification quotidienne de rappel  <br> • Filtrage avancé + graphiques d’habitudes |

**Difficulté :** ★★☆☆☆ (facile)

<br/>

### 2. Carnet de recettes « CookBook »

| Sprint                 | Objectifs principaux                                                                                                                                                        |
| ---------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **1 – Prototype**      | • Page d’accueil avec liste statique de recettes  <br> • Fiche recette (image + étapes)                                                                                     |
| **2 – Version 1**      | • Trois écrans : Accueil, Recherche filtrée par ingrédient, Favoris  <br> • Navigation par *BottomNavigationBar*  <br> • Gestion des favoris en mémoire                     |
| **3 – Version finale** | • Base de données locale *sqflite* (stockage recettes + favoris)  <br> • Import JSON depuis une API publique (*themealdb.com* ou similaire)  <br> • Mode hors-ligne (cache) |

**Difficulté :** ★★★☆☆ (un peu plus de logique données)

<br/>

### 3. Suivi de dépenses personnelles « BudgetEasy »

| Sprint                 | Objectifs principaux                                                                                                                                        |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **1 – Prototype**      | • Formulaire d’ajout de dépense (montant, catégorie)  <br> • Liste des dépenses du jour                                                                     |
| **2 – Version 1**      | • Trois écrans : Dépenses, Graphiques mensuels, Paramètres  <br> • Graphique circulaire (package *charts\_flutter*)  <br> • Thèmes de couleur par catégorie |
| **3 – Version finale** | • Sauvegarde sur API Firebase *ou* *sqflite*  <br> • Authentification anonyme Firebase  <br> • Export CSV local                                             |

**Difficulté :** ★★★☆☆



## Livraisons

* **Sprint 1 (individuel)** : concentrez-vous sur la mise en place du projet Flutter, de la hiérarchie de widgets et d’un premier écran entièrement fonctionnel.
* **Sprint 2 (équipe)** : répartissez-vous les trois interfaces (un responsable par écran) et intégrez les branches Git avant la date limite. Ajoutez une documentation interne (README) et un *help* embarqué dans l’app.
* **Sprint 3 (équipe)** : choisissez une solution de persistance (API simple ou BD locale) suffisamment abordable ; visez la stabilité, la gestion des états (Provider/Bloc ou équivalent) et une navigation sans bugs. Le quiz individuel vérifiera vos choix techniques (routes, widgets *Stateful*, cycle de vie, etc.).

