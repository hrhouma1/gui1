### **1. SafeArea — Choix multiple**

**Question :**
Quel est le rôle principal du widget `SafeArea` en Flutter ?

**Choix :**
A) Ajouter une marge entre les widgets
B) Permettre le scroll du contenu
C) Éviter que le contenu soit masqué par les éléments système (notch, barre de statut)
D) Centrer un widget

**Réponse attendue :**
**C**



### **2. SingleChildScrollView — Vrai / Faux**

**Question :**
Le widget `SingleChildScrollView` permet d’afficher plusieurs enfants les uns à la suite dans une `ListView`.

**Réponse attendue :**
**Faux**

> Il permet d’afficher un seul enfant (généralement une `Column`) dans une zone scrollable.


### **3. Stack et Positioned — Complétion de code**

**Complétez le code suivant pour positionner une icône à 20 pixels du haut et 10 pixels de la droite dans un `Stack`.**

```dart
Stack(
  children: [
    Container(color: Colors.blue),
    Positioned(
      top: __,
      right: __,
      child: Icon(Icons.star),
    ),
  ],
)
```

**Réponse attendue :**

```dart
top: 20,
right: 10
```



### **4. Padding — Choix multiple**

**Question :**
Quelle option correspond à une marge interne horizontale de 30 pixels et verticale de 10 pixels ?

**Choix :**
A) `EdgeInsets.all(30)`
B) `EdgeInsets.symmetric(horizontal: 30, vertical: 10)`
C) `EdgeInsets.only(left: 10)`
D) `EdgeInsets.zero`

**Réponse attendue :**
**B**



### **5. Spacer — Question ouverte**

**Question :**
Expliquez l’utilité du widget `Spacer` dans une `Row` ou une `Column`.

**Réponse attendue :**
Le widget `Spacer()` permet de prendre **l’espace vide restant** entre les widgets dans une `Row` ou une `Column`, facilitant leur **alignement** ou leur **espacement proportionnel**. Il est utile pour pousser un élément vers une extrémité ou répartir l’espace.







### **6. StreamBuilder — Choix multiple**

**Question :**
Que permet de faire le widget `StreamBuilder` dans une application Flutter ?

**Choix :**
A) Créer une navigation dynamique entre les pages
B) Écouter un flux de données et reconstruire l’interface automatiquement
C) Stocker localement des données
D) Modifier l’état d’un Provider

**Réponse attendue :**
**B**



### **7. snapshots() — Vrai / Faux**

**Question :**
La méthode `.snapshots()` retourne un flux (`Stream`) qui permet de recevoir les changements en temps réel d’une collection Firestore.

**Réponse attendue :**
**Vrai**



### **8. Provider / ChangeNotifier — Complétion de code**

**Complétez le code ci-dessous pour créer un Provider dans la méthode `main()`.**

```dart
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MyProvider(),
      child: MyApp(),
    ),
  );
}
```

**Réponse attendue :** *(correct tel quel – il s’agit de validation de structure)*



### **9. QuantityProvider — Analyse de code**

**Question :**
Dans `QuantityProvider`, expliquez le rôle de la méthode `notifyListeners()`.

**Réponse attendue :**
Elle permet d’**informer tous les widgets** qui écoutent ce provider que l’état a changé, afin qu’ils se reconstruisent avec les **nouvelles valeurs de quantité**.



### **10. calculateIngredientAmount — Question ouverte**

**Question :**
Décrivez le fonctionnement général de la méthode `calculateIngredientAmount()` dans `QuantityProvider`.

**Réponse attendue :**
La méthode prend une chaîne de texte représentant une quantité de base (ex. "100g"), extrait la partie numérique, la multiplie par la quantité actuelle choisie par l’utilisateur, puis recompose une nouvelle chaîne avec l’unité. Si aucun nombre n’est trouvé, la chaîne originale est retournée.



### **11. FavoriteProvider — Cas pratique**

**Énoncé :**
Dans `FavoriteProvider`, lorsqu’un utilisateur appuie sur un bouton cœur, on veut :

1. Ajouter ou retirer l’ID d’un produit à la liste `_favoriteIds`
2. Mettre à jour Firestore
3. Rafraîchir l’interface

**Question :**
Quelle méthode faut-il appeler, et que fait-elle exactement ?

**Réponse attendue :**
Il faut appeler `toggleFavorite(product)`. Cette méthode :

* Vérifie si l’ID du produit est déjà dans `_favoriteIds`
* Ajoute ou supprime cet ID selon le cas
* Met à jour Firestore en appelant `_addFavorite()` ou `_removeFavorite()`
* Appelle `notifyListeners()` pour mettre à jour l’interface



### **12. ViewAllItems — Choix multiple**

**Question :**
Quel widget est utilisé pour afficher dynamiquement une grille de recettes en fonction d’un flux Firestore ?

**Choix :**
A) `ListView.builder`
B) `Column`
C) `StreamBuilder` + `GridView.builder`
D) `FutureBuilder` + `Stack`

**Réponse attendue :**
**C**



### **13. Firestore – Analyse de code**

**Énoncé :**

On utilise la méthode suivante pour récupérer des données depuis Firestore en temps réel :

```dart
FirebaseFirestore.instance.collection('Complete-Flutter-App').snapshots()
```

**Question :**
Expliquez ce que retourne cette ligne de code, et dans quel contexte elle est utilisée.

**Réponse attendue :**
Elle retourne un `Stream<QuerySnapshot>` représentant un flux de documents de la collection `Complete-Flutter-App`. Cette ligne est généralement utilisée dans un `StreamBuilder`, permettant d’afficher dynamiquement les documents et de mettre à jour automatiquement l’interface en cas de modification dans Firestore.



### **14. StreamBuilder – Ordre d'exécution**

**Énoncé :**
Voici un extrait simplifié d’un `StreamBuilder` :

```dart
StreamBuilder(
  stream: ...,
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.hasData) {
      return Text("Données reçues");
    } else {
      return Text("Erreur ou vide");
    }
  },
)
```

**Question :**
Décrivez ce qui se passe dans les 3 cas suivants :

1. `ConnectionState.waiting`
2. `snapshot.hasData`
3. Aucun des deux

**Réponse attendue :**

1. Flutter attend que le flux envoie des données : on affiche un indicateur de chargement.
2. Des données ont été reçues : on peut les afficher.
3. Si aucun des deux, il y a soit une erreur, soit aucune donnée à afficher.



### **15. SafeArea – Cas pratique**

**Question :**
Expliquez pourquoi on utiliserait `SafeArea` dans l’écran principal d’une application. Donnez un exemple de ce qui pourrait se passer si ce widget n’était pas utilisé.

**Réponse attendue :**
`SafeArea` empêche que le contenu soit masqué par des éléments du système comme l’encoche, la barre de statut ou la barre de navigation. Sans `SafeArea`, des textes ou boutons situés en haut ou en bas de l’écran peuvent être invisibles ou inaccessibles, surtout sur des téléphones modernes avec bords arrondis ou encoche.



### **16. GridView\.builder – Connaissance technique**

**Question :**
À quoi sert le paramètre `childAspectRatio` dans un `GridView.builder` ?

**Réponse attendue :**
Il permet de définir le **rapport largeur/hauteur** des éléments de la grille. Par exemple, un `childAspectRatio: 0.75` signifie que chaque enfant sera plus haut que large, ce qui est utile pour des cartes visuellement équilibrées comme des recettes ou produits.



### **17. Provider – Vrai / Faux**

**Question :**
Il est obligatoire d’utiliser `setState()` lorsqu’on utilise un `ChangeNotifierProvider`.

**Réponse attendue :**
**Faux.**
`Provider` remplace justement le besoin de `setState()` en notifiant automatiquement les widgets abonnés grâce à `notifyListeners()`.


### **18. Spacer – Application**

**Question :**
Dans quel cas utiliseriez-vous un widget `Spacer()` plutôt qu’un `SizedBox(width: 20)` ? Quelle est la différence ?

**Réponse attendue :**
On utilise `Spacer()` lorsqu’on veut **remplir dynamiquement tout l’espace vide** restant entre deux éléments dans une `Row` ou `Column`. Contrairement à `SizedBox` qui a une taille fixe, `Spacer()` prend **tout l’espace possible**, ce qui est utile pour aligner des éléments ou les répartir proportionnellement.





### **19. Positioned – Application**

**Question :**
Pourquoi le widget `Positioned` ne peut-il être utilisé qu’à l’intérieur d’un `Stack` ? Donnez un exemple d’utilisation.

**Réponse attendue :**
`Positioned` permet de placer un widget à des coordonnées spécifiques (top, left, etc.), mais uniquement dans un `Stack` car seul ce widget permet le positionnement libre sur le plan Z. Exemple :

```dart
Stack(
  children: [
    Container(color: Colors.blue),
    Positioned(top: 10, right: 10, child: Icon(Icons.star)),
  ],
)
```



### **20. EdgeInsets – Interprétation**

**Question :**
Que signifie cette ligne :

```dart
EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0)
```

Et dans quel cas est-ce utile ?

**Réponse attendue :**
Elle ajoute un espace intérieur de 16 pixels à gauche et à droite, et de 8 pixels en haut et en bas autour d’un widget. C’est utile pour donner de la lisibilité à l’interface, en évitant que les éléments soient collés aux bords.



### **21. MultiProvider – Compréhension**

**Question :**
Quel est le rôle de `MultiProvider` dans le fichier `main.dart` ? Pourquoi est-il préféré à plusieurs `ChangeNotifierProvider` imbriqués ?

**Réponse attendue :**
`MultiProvider` permet de regrouper plusieurs fournisseurs d’état (`FavoriteProvider`, `QuantityProvider`, etc.) en un seul point. Cela rend le code plus lisible et évite une structure trop profonde et difficile à maintenir.



### **22. Toggle Favorite – Logique**

**Question :**
Expliquez ce que fait cette méthode dans le `FavoriteProvider` :

```dart
void toggleFavorite(DocumentSnapshot product)
```

**Réponse attendue :**
Elle ajoute ou retire un identifiant de produit de la liste des favoris. Si le produit est déjà dans la liste (`_favoriteIds`), il est retiré et mis à jour dans Firestore. Sinon, il est ajouté. `notifyListeners()` est appelé pour mettre à jour l’interface.



### **23. Firestore – Sécurité des données**

**Question :**
Pourquoi faut-il vérifier que `recipe.data()` n’est pas `null` avant d’accéder aux champs d’un document Firestore ?

**Réponse attendue :**
Pour éviter des erreurs de type `NullPointerException`. Si le document n’a pas encore chargé ou que le champ est manquant, accéder à ses données directement peut faire planter l’application.



### **24. QuantityProvider – Validation**

**Question :**
Pourquoi impose-t-on une limite inférieure dans `decreaseQuantity()` ?

**Réponse attendue :**
Pour éviter que la quantité passe en dessous de 1, ce qui n’aurait pas de sens dans un contexte de portions ou d’achats. Cela protège aussi contre des erreurs de calcul dans `calculateIngredientAmount()`.



### **25. Stream vs Future – Compréhension**

**Question :**
Quelle est la différence principale entre un `StreamBuilder` et un `FutureBuilder` ?

**Réponse attendue :**

* `StreamBuilder` écoute un **flux continu de données** (ex. : Firestore `.snapshots()`), et reconstruit l’interface à chaque nouvelle valeur.
* `FutureBuilder` attend **une seule réponse asynchrone** (ex. : `.get()`), utile pour des données chargées une seule fois.



### **26. .map dans Stream**

**Question :**
Que permet cette portion de code dans `FavoriteProvider` :

```dart
.map((snapshot) => snapshot.docs);
```

**Réponse attendue :**
Elle transforme un `QuerySnapshot` (réponse complète de Firestore) en une simple liste de documents (`List<DocumentSnapshot>`), qui est plus facile à parcourir et à afficher.



### **27. `notifyListeners()` – Fonction**

**Question :**
Quel est le rôle exact de `notifyListeners()` dans un `ChangeNotifier` ?

**Réponse attendue :**
Il déclenche la **reconstruction de tous les widgets abonnés** via `Consumer`, afin qu’ils affichent les nouvelles données ou réagissent à un changement d’état.



### **28. `Consumer` – Utilité**

**Question :**
À quoi sert le widget `Consumer<FavoriteProvider>` ?

**Réponse attendue :**
Il permet d’**écouter les changements** dans une classe `Provider` (ici `FavoriteProvider`) et de reconstruire uniquement une partie spécifique de l’interface (comme une icône de favori) sans rafraîchir tout l’écran.



### **29. Encapsulation – Cas de `_favoriteIds`**

**Question :**
Pourquoi la liste `_favoriteIds` est-elle définie comme **privée** (avec `_`) dans le `FavoriteProvider` ?

**Réponse attendue :**
Pour **protéger l’accès direct** à la variable depuis l’extérieur. Seules les méthodes internes (comme `toggleFavorite`, `isExist`) peuvent la modifier, ce qui évite les erreurs ou incohérences dans les données.



### **30. Architecture – Appel de vues**

**Question :**
Décrivez le parcours complet d’un utilisateur depuis `main.dart` jusqu’à l’affichage d’une recette en détail.

**Réponse attendue :**

1. `main.dart` lance `MyApp`, qui utilise `MultiProvider` pour injecter les Providers.
2. `home:` est défini sur `AppMainScreen()`.
3. L’utilisateur navigue via une interface principale (ex. : `BottomNavigationBar`).
4. Il accède à `ViewAllItems`, qui utilise `StreamBuilder` pour afficher les recettes.
5. En tapant sur une recette, il est redirigé vers `RecipeDetailScreen(recipe: recipe)`.




