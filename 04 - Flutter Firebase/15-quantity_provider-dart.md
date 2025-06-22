
##  Fichier : `quantity_provider.dart`

```dart
import 'package:flutter/material.dart';
```

* On importe le package Flutter de base pour utiliser la classe `ChangeNotifier`.



##  Classe `QuantityProvider`

```dart
class QuantityProvider extends ChangeNotifier {
```

* `QuantityProvider` est une **classe qui stocke l’état d’une quantité numérique**.
* Elle hérite de `ChangeNotifier`, ce qui signifie qu’elle peut **notifier les widgets qui l’écoutent** lorsqu’une mise à jour a lieu.
* Elle est utilisée dans l’interface pour ajuster dynamiquement la quantité d’ingrédients d’une recette.



## Variable privée

```dart
int _quantity = 1;
```

* `_quantity` est un entier privé.
* Il représente **la quantité actuelle choisie par l’utilisateur** (par défaut : 1).
* Cette variable est **privée** (commence par un `_`), donc elle ne peut pas être directement consultée ou modifiée depuis l’extérieur.



##  Getter public

```dart
int get quantity => _quantity;
```

* Fournit un accès en **lecture seule** à la valeur actuelle de la quantité.
* Permet d’utiliser `provider.quantity` dans les widgets sans risquer de modifier la donnée.



##  `increaseQuantity()`

```dart
void increaseQuantity() {
  _quantity++;
  notifyListeners();
}
```

* Incrémente la quantité de **1**.
* Appelle `notifyListeners()` pour **reconstruire tous les widgets consommateurs** (interface utilisateur, boutons, etc.).
* Permet à l’utilisateur d’augmenter la quantité dans l’interface (par exemple de 1 à 2 portions).



##  `decreaseQuantity()`

```dart
void decreaseQuantity() {
  if (_quantity > 1) {
    _quantity--;
    notifyListeners();
  }
}
```

* Décrémente la quantité de **1**, mais uniquement si la valeur est **supérieure à 1**.
* On empêche l’utilisateur de descendre en dessous de 1 pour éviter les quantités nulles ou négatives.
* `notifyListeners()` est déclenché seulement en cas de changement réel.



##  `resetQuantity()`

```dart
void resetQuantity() {
  _quantity = 1;
  notifyListeners();
}
```

* Réinitialise la quantité à **1**.
* Utile lorsqu’un nouvel écran s’ouvre, ou lorsqu’un utilisateur change de recette.
* Cette méthode est souvent appelée dans `initState()` d’un écran de détail.



##  `calculateIngredientAmount()`

```dart
String calculateIngredientAmount(String baseAmount)
```

### Objectif :

Adapter la quantité d’un ingrédient à la quantité choisie par l’utilisateur.

### Fonctionnement :

* On reçoit une chaîne de texte comme `"100g"`, `"2 cups"`, `"1 piece"`, etc.
* Le code **extrait la partie numérique** avec une expression régulière :

  ```dart
  RegExp regExp = RegExp(r'(\d+)');
  ```
* Si un nombre est trouvé :

  * Il est multiplié par `_quantity` pour obtenir la nouvelle quantité.
  * L’unité (`g`, `cups`, etc.) est conservée telle quelle.
  * Le tout est reconstruit dans une nouvelle chaîne : `"$newValue$unit"`

#### Exemples :

| Entrée (`baseAmount`) | `_quantity` | Sortie      |
| --------------------- | ----------- | ----------- |
| `"100g"`              | 2           | `"200g"`    |
| `"2 cups"`            | 3           | `"6 cups"`  |
| `"1 piece"`           | 4           | `"4 piece"` |

* Si aucune valeur numérique n’est trouvée, le texte d’origine est renvoyé tel quel.



##  Résumé des rôles

| Méthode                       | Rôle pédagogique                                                                 |
| ----------------------------- | -------------------------------------------------------------------------------- |
| `quantity` (getter)           | Lire la quantité actuelle sélectionnée                                           |
| `increaseQuantity()`          | Incrémenter la quantité d’une unité                                              |
| `decreaseQuantity()`          | Décrémenter la quantité (sans descendre en dessous de 1)                         |
| `resetQuantity()`             | Remettre la quantité à 1                                                         |
| `calculateIngredientAmount()` | Adapter dynamiquement les valeurs des ingrédients selon la quantité sélectionnée |



##  Utilisation dans l’interface

Le `QuantityProvider` est utilisé dans **`recipe_detail_screen.dart`** :

* Pour afficher les boutons ➕ et ➖ avec `Consumer<QuantityProvider>`.
* Pour recalculer en temps réel les quantités des ingrédients affichés.
* Pour afficher le bon total selon la portion sélectionnée.



##  Pourquoi utiliser `Provider` ici ?

* Permet à plusieurs widgets d’accéder **en temps réel** à une valeur centrale.
* Ne nécessite **aucun `setState()`** dans les widgets.
* Assure que les données sont cohérentes entre tous les composants (quantité, interface, logique).

