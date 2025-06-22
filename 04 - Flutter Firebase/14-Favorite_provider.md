# Fichier : `favorite_provider.dart`

```dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
```

* On importe :

  * `flutter/material.dart` : pour la classe `ChangeNotifier`, utilisée pour créer un provider.
  * `cloud_firestore.dart` : pour accéder à la base de données Firestore de Google.



##  Classe `FavoriteProvider`

```dart
class FavoriteProvider extends ChangeNotifier {
```

* `FavoriteProvider` est une **classe qui gère l’état global des favoris**.
* Elle **hérite de `ChangeNotifier`**, ce qui permet à l’application d’être notifiée lorsqu’il y a un changement d’état (par exemple, un élément est ajouté/retiré des favoris).



###  Variables internes

```dart
List<String> _favoriteIds = [];
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
```

* `_favoriteIds` : liste privée contenant les identifiants des recettes favorites (les ID des documents Firestore).
* `_firestore` : instance de Firestore qui permet de lire/écrire des données dans la base.



###  Accesseur public

```dart
List<String> get favorites => _favoriteIds;
```

* Fournit un accès en lecture seule à la liste des favoris.
* Permet à l’interface utilisateur ou à d'autres classes d'accéder aux favoris **sans pouvoir les modifier directement**.



###  Constructeur

```dart
FavoriteProvider() {
  _loadFavorites();
}
```

* Lorsque le `FavoriteProvider` est créé, il appelle automatiquement la méthode `_loadFavorites()` pour charger les favoris depuis Firestore.



##  Méthode : `_loadFavorites()`

```dart
void _loadFavorites() async {
  DocumentSnapshot userDoc = await _firestore.collection('userFavorites').doc('user1').get();
  if (userDoc.exists) {
    _favoriteIds = List<String>.from(userDoc['favorites'] ?? []);
    notifyListeners();
  }
}
```

* **But :** lire depuis Firestore les recettes favorites du document `user1` dans la collection `userFavorites`.
* **Processus :**

  * Récupère le document.
  * Si le document existe, on extrait la liste des ID et on l’ajoute à `_favoriteIds`.
  * Ensuite, on appelle `notifyListeners()` pour **reconstruire tous les widgets consommateurs** automatiquement.



##  Méthode : `toggleFavorite()`

```dart
void toggleFavorite(DocumentSnapshot product)
```

* **But :** ajouter ou retirer une recette des favoris.
* **Comment ça marche :**

  * Si l’ID du produit est déjà présent → on le supprime et on met à jour Firestore.
  * Sinon, on l’ajoute et on met aussi à jour Firestore.
  * `notifyListeners()` permet de déclencher la mise à jour visuelle.



## ➕ `_addFavorite()` et ➖ `_removeFavorite()`

```dart
Future<void> _addFavorite(String productId)
Future<void> _removeFavorite(String productId)
```

* Ces méthodes sont responsables de la **synchronisation avec Firestore**.
* `_addFavorite` utilise `set()` avec `merge: true` pour **ajouter ou mettre à jour** sans écraser les autres champs.
* `_removeFavorite` utilise `update()` pour remplacer la liste par `_favoriteIds` actuelle, sans inclure le favori supprimé.



##  `isExist()`

```dart
bool isExist(DocumentSnapshot product)
```

* Retourne `true` si le produit est déjà présent dans la liste des favoris.
* Permet d’afficher l’état du bouton cœur (plein ou vide) dans l’interface.



##  Méthode : `getFavoriteItemsStream()`

```dart
Stream<List<DocumentSnapshot>> getFavoriteItemsStream()
```

* **But :** obtenir en temps réel les documents de recettes qui ont été ajoutés aux favoris.
* **Fonctionnement :**

  * Si la liste `_favoriteIds` est vide, on retourne un flux vide.
  * Sinon, on utilise `whereIn` pour filtrer la collection `'Complete-Flutter-App'` uniquement avec les ID des favoris.
  * `snapshots()` écoute en temps réel les changements de la base.
  * On retourne uniquement la liste `docs`.


##  Résumé du fonctionnement général

| Élément                    | Rôle                                                                          |
| -------------------------- | ----------------------------------------------------------------------------- |
| `FavoriteProvider`         | Gère l’état global des favoris (ajout/suppression/lecture)                    |
| `favorites`                | Accès à la liste actuelle des favoris                                         |
| `_loadFavorites()`         | Lit les favoris de Firestore au démarrage                                     |
| `toggleFavorite()`         | Ajoute ou retire une recette de la liste + met à jour Firestore               |
| `isExist()`                | Vérifie si un élément est dans les favoris                                    |
| `getFavoriteItemsStream()` | Permet de récupérer les recettes favorites à afficher dans un `StreamBuilder` |



##  À quoi ça sert dans ton application ?

* **`FavoriteScreen`** utilise `getFavoriteItemsStream()` pour afficher dynamiquement les favoris.
* **`ViewAllItems` et `RecipeDetailScreen`** utilisent `toggleFavorite()` pour ajouter/retirer une recette.
* Grâce à **`ChangeNotifierProvider`**, tous les widgets consommateurs sont automatiquement mis à jour.

