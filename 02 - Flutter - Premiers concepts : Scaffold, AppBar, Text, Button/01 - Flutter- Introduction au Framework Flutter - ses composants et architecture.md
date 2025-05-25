# Introduction au Framework Flutter

# 1. Qu'est-ce que Flutter ?

**Flutter** est un framework open-source développé par Google pour créer des **interfaces graphiques modernes**.
Il permet de construire des applications **mobiles, web et desktop** avec un seul code source, en utilisant le langage **Dart**.

* **Langage :** Dart (optimisé pour les interfaces utilisateurs réactives)
* **Moteur de rendu :** Skia (très performant)
* **Avantages :**

  * Interface moderne native sur Android, iOS, Web, macOS, Windows et Linux
  * Un seul code pour plusieurs plateformes
  * Expérience utilisateur fluide et réactive
  * Communauté active et documentation riche



# 2. Objectifs de Flutter

Flutter permet de :

* Créer des interfaces utilisateurs dynamiques, fluides et personnalisées
* Gérer des événements comme les clics, les entrées utilisateur, les gestes
* Organiser les éléments visuels à l’écran avec des structures réactives
* Intégrer des appels API, gérer l’état, la navigation et le stockage local
* Compiler en code natif performant, sans pont entre plateforme et logique



# 3. Principaux composants (widgets)

Voici une sélection des **widgets de base** disponibles avec Flutter :

| Widget           | Rôle                                                           |
| ---------------- | -------------------------------------------------------------- |
| `Text`           | Affiche une chaîne de caractères                               |
| `ElevatedButton` | Bouton surélevé avec une action associée                       |
| `TextField`      | Champ de saisie de texte                                       |
| `Column`         | Organise les widgets verticalement                             |
| `Row`            | Organise les widgets horizontalement                           |
| `Container`      | Boîte générique (taille, couleur, marge, etc.)                 |
| `Scaffold`       | Structure standard (barre d’app, corps, bouton flottant, etc.) |
| `AppBar`         | Barre de titre avec actions                                    |
| `ListView`       | Liste défilante                                                |
| `Form`           | Conteneur de champs avec validation                            |
| `Checkbox`       | Case à cocher                                                  |
| `Radio`          | Bouton radio (choix exclusif)                                  |
| `Switch`         | Interrupteur on/off                                            |
| `Navigator`      | Gère la navigation entre les écrans                            |



# 4. Architecture de base d'une application Flutter

1. Définir une **fonction principale `main()`** qui appelle `runApp()`
2. Créer un widget racine (`StatelessWidget` ou `StatefulWidget`)
3. Organiser les composants avec des widgets (`MaterialApp`, `Scaffold`, `Column`, etc.)
4. Implémenter les **fonctions de logique** (interactions, état, etc.)
5. Relancer l’affichage avec `setState()` si l’état change



# 5. Cas d’usage typiques

Flutter est adapté pour :

* Applications mobiles (iOS, Android)
* Applications web (SPA, PWA)
* Interfaces de tableaux de bord
* Applications multi-écrans avec navigation
* Prototypes interactifs d’interfaces
* Projets éducatifs ou démonstratifs
* Interfaces pour services web ou APIs



# 6. Avantages et limites

### Avantages :

* Interface moderne et réactive, très fluide
* Un seul code source pour toutes les plateformes
* Grande bibliothèque de composants prêts à l’emploi
* Forte personnalisation visuelle (animations, transitions, etc.)
* Support actif de Google et communauté très dynamique

### Limites :

* Nécessite l’apprentissage du langage Dart
* Taille importante des applications initiales (surtout sur le web)
* Certaines plateformes (ex. iOS) peuvent nécessiter Xcode pour le déploiement
* Moins adapté aux applications CLI ou systèmes très bas-niveau



# 7. Exemples de projets réalisables avec Flutter

* Application de prise de notes
* Gestionnaire de budget personnel
* Application de réservation (hôtels, événements, etc.)
* Interface client pour une API REST
* Jeux simples (quiz, puzzle)
* Dashboard de statistiques
* Calculatrice multi-fonction
* Application éducative mobile interactive
* Formulaire sécurisé avec validation et authentification



# 8. Annexe - Est-ce que Flutter est une librairie ?

Flutter n’est **pas une simple librairie**, c’est un **framework complet** de développement d’interfaces utilisateur multiplateforme.



## Flutter : Framework, pas une librairie

| Élément                           | Description                                                                                                                                                                                                         |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Type**                          | Framework                                                                                                                                                                                                           |
| **Langage utilisé**               | Dart                                                                                                                                                                                                                |
| **Développé par**                 | Google                                                                                                                                                                                                              |
| **Fonction principale**           | Créer des interfaces mobiles, web, desktop et embarquées                                                                                                                                                            |
| **Rôle**                          | Fournit un moteur de rendu, des widgets UI, des outils de compilation, et un SDK complet                                                                                                                            |
| **Différence avec une librairie** | Une **librairie** est un **composant** qu’on ajoute à un projet. Un **framework** est une **structure complète** qui organise le projet, impose des règles, et pilote le flux du programme. Flutter fait tout cela. |



* Une **librairie** t’aide à faire quelque chose (comme `http`, `math`, `intl`).
* Un **framework** t’impose une structure complète pour construire l’ensemble de ton application — Flutter **structure, contrôle et orchestre** toute ton app.


