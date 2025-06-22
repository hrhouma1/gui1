# 📁 Structure des fichiers (résumé)

```
lib/
│
├── Provider/
│   ├── favorite_provider.dart
│   └── quantity_provider.dart
│
├── Views/
│   ├── app_main_screen.dart         ← Page principale (accueil)
│   ├── favorite_screen.dart         ← Liste des favoris
│   ├── recipe_detail_screen.dart    ← Détails d’une recette
│   └── view_all_items.dart          ← Affiche toutes les recettes filtrées
│
├── constants.dart                   ← Couleurs, styles, variables globales
├── firebase_options.dart            ← Configuration générée par Firebase
└── main.dart                        ← Point d’entrée de l’application
```



##  **Flux d’appel entre les fichiers**

### `main.dart` (point d’entrée)

* Initialise Firebase
* Configure les **providers** (FavoriteProvider, QuantityProvider)
* Affiche le **widget `AppMainScreen`** comme première page



### `app_main_screen.dart`

* **Page d’accueil**
* Contient généralement des boutons ou des tuiles pour accéder à :

  * 🔸 `favorite_screen.dart` → via un onglet ou bouton favoris
  * 🔸 `view_all_items.dart` → pour voir tous les plats d’une catégorie
  * 🔸 `recipe_detail_screen.dart` → lorsqu'on clique sur une carte de recette



### `view_all_items.dart`

* Affiche toutes les recettes d’une catégorie avec un **`StreamBuilder`**
* Chaque carte de recette permet de naviguer vers :

  * 🔸 `recipe_detail_screen.dart` en passant la recette sélectionnée
* Utilise :

  * `favorite_provider.dart` (pour activer ou désactiver le cœur de favoris)



### `recipe_detail_screen.dart`

* Affiche **les détails d’une recette** :

  * Nom, image, calories, temps, étoiles
  * Bouton “Start Cooking”
  * Liste dynamique des ingrédients
* Utilise :

  * `quantity_provider.dart` pour augmenter/diminuer les quantités
  * `favorite_provider.dart` pour ajouter ou retirer la recette des favoris



### `favorite_screen.dart`

* Affiche la **liste des recettes ajoutées aux favoris**
* Utilise :

  * `favorite_provider.dart` via un `StreamBuilder` pour afficher les recettes favorites sauvegardées dans Firestore



### `constants.dart`

* Définit des constantes visuelles : `kPrimaryColor`, styles de texte, etc.
* Partagé dans tous les fichiers, notamment pour styliser les boutons et les textes



### `favorite_provider.dart` (dans `/Provider`)

* Contient la logique pour :

  * Ajouter / supprimer un favori
  * Vérifier si une recette est déjà un favori (`isExist`)
  * Récupérer les favoris depuis Firestore (`getFavoriteItemsStream()`)



### `quantity_provider.dart` (dans `/Provider`)

* Gère un compteur `quantity` :

  * `increaseQuantity()` / `decreaseQuantity()`
  * `calculateIngredientAmount()` (multiplie une quantité par le nombre de portions)
* Utilisé **dans `recipe_detail_screen.dart` uniquement**



##  Résumé final du "Qui appelle qui ?"

| Appelant                | Appelé (navigation ou logique utilisée)                | Rôle                                           |
| ----------------------- | ------------------------------------------------------ | ---------------------------------------------- |
| `main.dart`             | `AppMainScreen`                                        | Point d’entrée, configure les `Provider`       |
| `AppMainScreen`         | `FavoriteScreen`, `ViewAllItems`, `RecipeDetailScreen` | Navigation utilisateur vers différentes vues   |
| `ViewAllItems`          | `RecipeDetailScreen`, `FavoriteProvider`               | Affiche cartes, gère favoris                   |
| `RecipeDetailScreen`    | `QuantityProvider`, `FavoriteProvider`                 | Affiche la recette + quantité + favori         |
| `FavoriteScreen`        | `FavoriteProvider`                                     | Affiche uniquement les favoris sauvegardés     |
| `constants.dart`        | Utilisé dans tous les fichiers                         | Contient les styles globaux                    |
| `firebase_options.dart` | Utilisé implicitement dans `main.dart`                 | Configuration Firebase générée automatiquement |

