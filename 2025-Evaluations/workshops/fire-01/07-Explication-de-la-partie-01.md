
# 1 - App_main_screen.dart 

```
+------------------------------------+
|         AppMainScreen             |
|------------------------------------|
| - BottomNavigationBar             |
|     ├── Home (Index 0) ─────────┐ |
|     ├── Favorite (Index 1)      │ |
|     ├── Meal Plan (Index 2)     │ |
|     └── Setting (Index 3)       │ |
|                                  ↓
| - Body                           |
|     └─ selectedIndex == 0 ? MyAppHomeScreen : Text()  
+------------------------------------+

              ↓

+------------------------------------+
|         MyAppHomeScreen           |
|------------------------------------|
| - SafeArea                        |
|   └─ SingleChildScrollView        |
|      └─ Column                    |
|         ├── headerParts()         |
|         │   └─ Row                |
|         │      ├─ Text (Title)   |
|         │      └─ IconButton     |
|         ├── mySearchBar()        |
|         │   └─ TextField         |
|         ├── BannerToExplore()    |
|         │   └─ Stack             |
|         │       ├─ Text + Button |
|         │       └─ Image         |
|         ├── Text: "Categories"   |
|         ├── categoryButtons()    |
|         │   └─ Scrollable Row    |
|         │       └─ Buttons from Firestore
|         ├── GridView (height=400)│
|         │   └─ Recipes from Firestore
|         │       └─ Card per item:
|         │           ├─ Image (Network or Icon)
|         │           ├─ Name
|         │           ├─ Time + Calories
|         │           └─ Rating + Reviews
+------------------------------------+
```

###  1.1. Détail des sources Firestore :

* `App-Category` → Liste des catégories (pour les boutons horizontaux)
* `Complete-Flutter-App` → Recettes filtrées selon `category`

###  1.2. Résumé navigation :

* **BottomNavigationBar** sélectionne l’index de page
* Index `0` charge `MyAppHomeScreen` (les autres affichent un `Text` avec l’index)

<br/>

<br/>

# 2 - Explications - Comprendre la structure de l’écran principal dans Flutter

### Objectif pédagogique :

À la fin de cette leçon, vous serez capable de :

* Comprendre comment fonctionne un `StatefulWidget`
* Afficher plusieurs pages grâce à une barre de navigation inférieure (`BottomNavigationBar`)
* Charger dynamiquement des données depuis Firebase Firestore
* Créer une grille d’éléments (cartes de recettes)
* Appliquer une logique simple de sélection et de filtrage (catégories)



## 1. Présentation générale du fichier

Ce fichier Dart contient la classe principale de l’application, qui affiche différentes pages selon l’onglet sélectionné en bas de l’écran. La classe utilise une barre de navigation (bottomNavigationBar) avec 4 boutons : Accueil (Home), Favoris, Plan de repas, Réglages.



## 2. Structure générale du code

```dart
class AppMainScreen extends StatefulWidget { ... }
```

### ➤ Pourquoi `StatefulWidget` ?

Un `StatefulWidget` est un composant d'interface utilisateur qui peut **changer d’apparence ou de comportement dans le temps**, par exemple :

* quand on change d’onglet,
* quand on sélectionne une catégorie,
* quand on recharge les données.

Cela signifie qu’il y a **un "état interne"** qu’on peut modifier (dans notre cas, c’est `selectedIndex`, qui détermine la page affichée).


## 3. Explication ligne par ligne – AppMainScreen

```dart
int selectedIndex = 0;
```

* Cela signifie que par défaut, **l’onglet sélectionné est le premier** (index 0 = Accueil).

```dart
bottomNavigationBar: BottomNavigationBar(
  ...
  onTap: (index) {
    setState(() {
      selectedIndex = index;
    });
  },
),
```

* Ici, chaque fois qu’un utilisateur **appuie sur un des boutons du bas**, on **met à jour l’index sélectionné**. Cela déclenche un **rafraîchissement automatique** de l’interface (`setState()`).

```dart
body: selectedIndex == 0 ? MyAppHomeScreen() : Center(child: Text("Page index: $selectedIndex"))
```

* Si l’onglet sélectionné est 0, on affiche l'écran principal (`MyAppHomeScreen`). Sinon, on affiche un simple texte avec l'index (à améliorer plus tard).



## 4. Détail de `MyAppHomeScreen` (écran d’accueil)

Cet écran contient plusieurs **composants clés**, empilés verticalement.

### ➤ Structure visuelle simplifiée :

```
+------------------------------+
| Titre principal              |
| Barre de recherche          |
| Bandeau de promotion        |
| Boutons de catégories       |
| Grille de recettes (cards)  |
+------------------------------+
```


## 5. Le haut de l’écran – `headerParts()`

```dart
Row(
  children: [
    Text("What are you cooking today?"),
    Spacer(),
    IconButton(notification),
  ]
)
```

* Ce `Row` affiche à gauche un texte motivant, à droite une icône de notification.
* `Spacer()` pousse l’icône vers la droite.
* Cette partie **reste toujours visible** et est appelée `header`.



## 6. Barre de recherche – `mySearchBar()`

```dart
TextField(
  decoration: InputDecoration(
    hintText: "Search any recipes",
    prefixIcon: Icon(Iconsax.search_normal),
  )
)
```

* Affiche une **zone de texte** dans laquelle on peut taper une recherche.
* L’icône loupe est automatiquement affichée à gauche.
* Le champ n’est pas encore connecté à une vraie recherche (fonctionnalité à venir).



## 7. Le bandeau promotionnel – `BannerToExplore()`

```dart
Container avec Stack {
  Texte à gauche
  Image du chef à droite
  Bouton "Explore"
}
```

* Ce bloc met en avant un message marketing ("Cook the best recipes...").
* Il utilise un `Stack` pour superposer les éléments (texte, bouton, image).



## 8. Boutons de catégories

```dart
StreamBuilder(
  stream: _firestore.collection('App-Category').snapshots(),
  builder: (context, snapshot) {
    ...
    return categoryButtons(categories);
  }
)
```

* Ces boutons sont **générés automatiquement depuis Firestore**.
* Chaque document dans la collection `App-Category` contient un nom de catégorie.
* Le bouton "All" est ajouté manuellement pour permettre de **voir toutes les recettes**.

> **⚠️ Important :** `StreamBuilder` écoute Firestore en temps réel. Si les données changent dans la base, l’interface se met à jour sans action de l’utilisateur.



## 9. Grille des recettes – `GridView.builder`

```dart
GridView.builder(
  itemCount: snapshot.data!.docs.length,
  itemBuilder: (context, index) {
    ...
    return Container(
      image (si disponible)
      nom de la recette
      durée, calories
      note et nombre d’avis
    );
  }
)
```

* Ce bloc crée une **grille responsive** (2 colonnes).
* Chaque case de la grille (card) affiche :

  * Une image ou une icône si image absente
  * Le nom de la recette
  * La durée de préparation et les calories
  * La note (ex : 4.8) et le nombre de commentaires (ex : 35)

> **Bonne pratique :** chaque champ est vérifié avec `.containsKey()` pour éviter les erreurs si des données sont manquantes.



## 10. Navigation et logique de sélection

### `selectedCategory`

```dart
String selectedCategory = "All";
```

* Cette variable garde **la catégorie actuellement sélectionnée** (ex : Lunch, Dinner…)
* Quand on clique sur un bouton, on met à jour cette variable.

### Récupération conditionnelle des recettes :

```dart
stream: selectedCategory == "All"
  ? firestore.collection('Complete-Flutter-App')
  : firestore.collection('Complete-Flutter-App').where('category', isEqualTo: selectedCategory)
```

* Si "All", on récupère toutes les recettes
* Sinon, on filtre celles qui correspondent à la catégorie choisie



## 11. Résumé pour ne rien oublier

| Élément                      | Rôle                                                   |
| ---------------------------- | ------------------------------------------------------ |
| `AppMainScreen`              | Point d’entrée, barre de navigation inférieure         |
| `selectedIndex`              | Permet de changer de page selon l’onglet sélectionné   |
| `MyAppHomeScreen`            | Écran principal avec toutes les recettes               |
| `StreamBuilder` (catégories) | Récupère les boutons de catégorie depuis Firestore     |
| `StreamBuilder` (recettes)   | Affiche dynamiquement les recettes selon la catégorie  |
| `GridView`                   | Présente les recettes en forme de grille               |
| `setState()`                 | Sert à redessiner l’écran quand on change une variable |



## 12. Travail à faire

1. Essayez de modifier la catégorie par défaut (remplacez `"All"` par `"Lunch"` par exemple).
2. Ajoutez un print dans la fonction `onTap()` de la `BottomNavigationBar` pour vérifier quel index est sélectionné.
3. Créez une nouvelle recette dans Firestore et vérifiez qu’elle apparaît sans redémarrer l’application.


