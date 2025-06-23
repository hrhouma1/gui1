### **Document de référence pédagogique : Analyse complète de l’interface principale Flutter (Application de recettes)**

---

#### **1. Structure générale de l’écran : AppMainScreen**

L’écran principal de l’application est organisé selon une logique **multi-écran à navigation par onglet**. L’état `selectedIndex` contrôle dynamiquement le contenu affiché via la barre de navigation inférieure (`BottomNavigationBar`).

```
+---------------------------------------------------------+
|                         AppBar                          |
|---------------------------------------------------------|
|                       Corps (body)                      |
|   ├── MyAppHomeScreen (si index = 0)                    |
|   ├── FavoriteScreen (si index = 1)                     |
|   └── Placeholder texte pour les autres indices         |
|                                                         |
|                  BottomNavigationBar                    |
|   [Home]  [Favorite]  [Meal Plan]  [Settings]           |
+---------------------------------------------------------+
```

Chaque bouton modifie `selectedIndex` et déclenche `setState()` pour redessiner l’interface avec la page correspondante.

---

#### **2. Composant MyAppHomeScreen : Interface d’accueil**

##### **2.1. Contexte graphique général**

L’interface utilise un `SafeArea` pour éviter les zones dangereuses (notch, barres système), enveloppe son contenu dans un `SingleChildScrollView` pour permettre un défilement vertical fluide.

```
+---------------------------------------------------------+
|                    MyAppHomeScreen                      |
|---------------------------------------------------------|
| SafeArea → évite les conflits avec la zone système      |
| └── SingleChildScrollView                               |
|     └── Column                                           |
|         ├── HeaderParts (titre + icône notification)    |
|         ├── Zone de recherche (TextField)               |
|         ├── Bannière promotionnelle (Stack + image)     |
|         ├── Liste horizontale de catégories             |
|         ├── Grille de recettes populaires               |
+---------------------------------------------------------+
```

---

##### **2.2. HeaderParts (bandeau supérieur)**

Widget contenant un `Row` :

* À gauche : un `Text` multiligne avec un style large (`fontSize: 32`)
* À droite : un `IconButton` personnalisable (notification)

Utilisation d’un `Spacer()` pour **pousser l’icône à droite**.

---

##### **2.3. Barre de recherche**

Widget central avec les propriétés suivantes :

* `TextField` dans un `Container` décoré
* Utilisation de `EdgeInsets.symmetric(horizontal: 20, vertical: 5)`
* Icône loupe placée à gauche via `prefixIcon`

---

##### **2.4. Bannière promotionnelle (`BannerToExplore`)**

Structure en `Stack` pour superposer :

* Un texte et un bouton "Explore" positionnés via `Positioned(top, left)`
* Une image de chef à droite (`Positioned(right: -20)`)

Ce modèle est utile pour illustrer la **superposition maîtrisée**.

---

##### **2.5. Liste des catégories (Firestore)**

Utilisation de `StreamBuilder` :

```dart
stream: _firestore.collection('App-Category').snapshots()
```

Chaque document contient un champ `name`. On génère dynamiquement une `Row` scrollable horizontale, où chaque catégorie est un `GestureDetector`.

Mise en évidence de la sélection via :

```dart
color: isSelected ? kprimaryColor : Colors.grey[200]
```

---

##### **2.6. Grille des recettes (GridView)**

Requête Firestore :

```dart
stream: selectedCategory == "All"
    ? _firestore.collection('Complete-Flutter-App').snapshots()
    : _firestore.collection('Complete-Flutter-App')
        .where('category', isEqualTo: selectedCategory)
        .snapshots()
```

### Schéma ASCII : une carte de recette

```
+-----------------------------+
| Image (si absente → icône) |
|  └─ Stack                  |
|     └─ Positioned Fav Btn  |
+-----------------------------+
| Nom de la recette          |
| Durée • Calories           |
| Note (étoile + nb avis)    |
+-----------------------------+
```

Chaque carte est un `GestureDetector` :

* **Au clic** → navigation vers `RecipeDetailScreen`

---

##### **2.7. Comportement des favoris (Provider)**

Utilisation du `Consumer<FavoriteProvider>` pour chaque carte de recette :

* `isExist(recipe)` détermine si la recette est en favori
* `toggleFavorite(recipe)` permet d’ajouter/retirer

Affichage dynamique de l’icône (`Iconsax.heart5` si favori, `Iconsax.heart` sinon).

---

### **3. Fonctionnalité de navigation entre écrans**

Le `BottomNavigationBar` déclenche la navigation interne :

```dart
onTap: (index) {
  setState(() {
    selectedIndex = index;
  });
}
```

La propriété `body` du `Scaffold` affiche le bon écran selon la valeur de `selectedIndex`.

---

### **4. Design adaptatif et responsive**

* Utilisation de `Expanded` pour équilibrer l’espace vertical entre image et contenu
* `GridView.builder` paramétré pour afficher 2 colonnes avec :

  * `crossAxisCount: 2`
  * `childAspectRatio: 0.8` (hauteur contrôlée)
* `Overflow.ellipsis` pour éviter les dépassements de texte

---

### **5. Sécurité des accès aux données**

Avant chaque lecture de champ depuis Firestore :

```dart
if (recipe.data() != null &&
    (recipe.data() as Map<String, dynamic>).containsKey('image')) {
    ...
}
```

Cette vérification protège l'application contre les erreurs de type `null`.

---

### **6. Logique Firestore et mise à jour automatique**

Tous les appels à Firestore utilisent `.snapshots()` :

* Cela crée un **flux de données en temps réel** (`Stream<QuerySnapshot>`)
* `StreamBuilder` permet d’**écouter les mises à jour** sans intervention manuelle

---

### **7. Conclusion pédagogique**

Cette interface repose sur une architecture typique :

* `StatefulWidget` avec gestion par index pour afficher différentes vues
* `StreamBuilder` pour réactivité temps réel
* `Provider` pour la gestion locale d’un état (favoris)
* Navigation entre écrans via `MaterialPageRoute`

Elle est **entièrement modulaire**, conçue pour séparer les responsabilités :

* Chargement dynamique des données
* Interactions utilisateur locales (favoris)
* Interface proprement structurée

---

Souhaitez-vous une version PDF mise en page de ce document pour intégration dans un syllabus officiel ou dans une plateforme comme Thinkific ou Moodle ?
