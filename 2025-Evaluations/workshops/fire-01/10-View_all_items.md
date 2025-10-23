## 🔹 Diagramme ASCII de l’architecture `view_all_items.dart`

```
+-------------------------------+
| ViewAllItems (StatefulWidget)|
|------------------------------|
| - Paramètre : title          |
| - Paramètre : category (opt) |
|                              |
| State : _ViewAllItemsState   |
|------------------------------|
| - Firebase Firestore Instance|
| - build(context)             |
|   └─ Scaffold                |
|      ├─ AppBar               |
|      │   └─ Retour + Titre   |
|      └─ Body: Padding        |
|         └─ StreamBuilder     |
|            └─ GridView.builder
|               └─ Card recette (xN)
|                   ├─ Image / Icone
|                   │   └─ Stack :
|                   │       └─ Positioned Favorite
|                   └─ Contenu :
|                       ├─ Nom de la recette
|                       ├─ Temps + Calories
|                       └─ Note + Avis
+-------------------------------+
```



## 🔹 Partie 1 – Introduction à la classe `ViewAllItems`

### 1.1 – Signature

```dart
class ViewAllItems extends StatefulWidget
```

On utilise un **`StatefulWidget`** car l’interface devra réagir aux **changements dynamiques des données Firestore**.

### 1.2 – Paramètres requis

```dart
final String title;       // Titre à afficher dans l’AppBar
final String? category;   // Filtrage optionnel par catégorie
```

L’écran peut recevoir une **catégorie** ou non. S’il n’en reçoit pas, on affichera toutes les recettes.



## 🔹 Partie 2 – L’interface principale avec `Scaffold`

### 2.1 – AppBar

```dart
AppBar(
  leading: IconButton(...),
  title: Text(widget.title),
)
```

* Le bouton **retour** permet de revenir à l’écran précédent.
* Le **titre** est défini dynamiquement via `widget.title`.

---

## 🔹 Partie 3 – Le corps : `StreamBuilder` + `GridView`

### 3.1 – Utilisation de `StreamBuilder`

```dart
StreamBuilder<QuerySnapshot>(
  stream: widget.category == null 
          ? _firestore.collection('Complete-Flutter-App').snapshots()
          : _firestore.collection('Complete-Flutter-App')
                     .where('category', isEqualTo: widget.category)
                     .snapshots(),
  builder: ...
)
```

**Explication pédagogique** :

* On **écoute Firestore en temps réel**.
* Si la catégorie est spécifiée, on filtre les recettes.
* Sinon, on récupère **toutes les recettes** de la collection.

### 3.2 – Cas avec données (`snapshot.hasData`)

* Si les données sont prêtes, on affiche une **grille de recettes**.
* Sinon, on montre un **cercle de chargement**.



## 🔹 Partie 4 – Grille de cartes : `GridView.builder`

```dart
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(...),
  itemBuilder: ...
)
```

* `crossAxisCount: 2` → 2 colonnes
* `childAspectRatio: 0.75` → chaque carte est plus haute que large



## 🔹 Partie 5 – Carte d’une recette

Chaque carte utilise deux `Expanded` :

1. **Image / icône + bouton favori** (flex: 3)
2. **Contenu texte** (flex: 2)

### 5.1 – Image ou icône par défaut

* Si une image existe → `NetworkImage`
* Sinon → icône `restaurant`

### 5.2 – Bouton favori (`Positioned` dans `Stack`)

```dart
Positioned(
  top: 10,
  right: 10,
  child: GestureDetector(
    onTap: () => favoriteProvider.toggleFavorite(recipe),
    child: Icon(...),
  )
)
```

* Le bouton favori change dynamiquement :

  * Icône pleine si l’élément est en favori
  * Icône vide sinon

> Ceci utilise le **`Consumer<FavoriteProvider>`** pour écouter les favoris en temps réel.


## 🔹 Partie 6 – Informations affichées sous l’image

### 6.1 – Nom de la recette

* Vérification sécurisée avec `containsKey('name')`
* Limité à 2 lignes avec `TextOverflow.ellipsis`

### 6.2 – Temps et calories

```dart
"${recipe['time']} min • ${recipe['cal']} cal"
```

* Affiche un résumé pratique, ou `Temps non spécifié` si manquant

### 6.3 – Évaluation

```dart
Icon(Icons.star), Text("4.2 (25)")
```

* Icône de note (étoile)
* Nombre de points et d’avis (reviews)


## 🔹 Partie 7 – Navigation vers la fiche recette

Chaque carte est un `GestureDetector` :

```dart
onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => RecipeDetailScreen(recipe: recipe),
    ),
  );
}
```

> En cliquant sur une carte, on ouvre une **fiche détaillée** dans `recipe_detail_screen.dart`.


## 🔹 Résumé de fonctionnement logique

| Élément Flutter        | Fonction                                             |
| ---------------------- | ---------------------------------------------------- |
| `ViewAllItems`         | Écran dynamique selon le titre et la catégorie reçus |
| `StreamBuilder`        | Écoute en temps réel les recettes dans Firestore     |
| `GridView.builder`     | Affiche les recettes sous forme de grille            |
| `Expanded`             | Gère la hauteur relative entre image et contenu      |
| `Stack` + `Positioned` | Permet de superposer le bouton favori sur l’image    |
| `Consumer`             | Permet de réagir aux favoris via Provider            |
| `Navigator.push()`     | Ouvre l’écran de détail de la recette                |

