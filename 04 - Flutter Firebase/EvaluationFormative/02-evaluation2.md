### **1. SafeArea — Choix multiple**

**Question :**
Pourquoi utilise-t-on le widget `SafeArea` dans une application Flutter moderne ?

**Choix :**

A) Pour appliquer une bordure décorative aux écrans

B) Pour éviter que des contenus soient recouverts par les éléments système (notch, barre de statut)

C) Pour centrer une `Column`

D) Pour créer des marges extérieures automatiques

---

### **2. SingleChildScrollView — Vrai / Faux**

**Question :**
`SingleChildScrollView` permet d’avoir un seul enfant scrollable, généralement une `Column` ou une `Row`.

---

### **3. Stack et Positioned — Complétion**

**Complétez ce bloc pour positionner une icône à 10px du haut et à 15px de la droite dans un `Stack`.**

```dart
Stack(
  children: [
    Container(color: Colors.grey),
    Positioned(
      top: ___,
      right: ___,
      child: Icon(Icons.star),
    ),
  ],
)
```

---

### **4. Padding — Choix multiple**

**Question :**
Laquelle des expressions suivantes ajoute une marge intérieure de 25px à gauche et à droite, et 10px en haut et en bas ?

**Choix :**
A) `EdgeInsets.only(left: 25)`
B) `EdgeInsets.all(10)`
C) `EdgeInsets.symmetric(horizontal: 25, vertical: 10)`
D) `EdgeInsets.zero`

---

### **5. Spacer — Question ouverte**

**Question :**
Dans une `Row`, à quoi sert un `Spacer()` et dans quel cas serait-il préférable à un `SizedBox(width: 20)` ?

---

### **6. StreamBuilder — Choix multiple**

**Question :**
Que permet de faire un `StreamBuilder` dans une application utilisant Firestore ?

**Choix :**
A) Écouter une base de données en continu et reconstruire l’interface
B) Créer une animation de transition
C) Sauvegarder des fichiers
D) Charger un fichier JSON local une seule fois

---

### **7. .snapshots() — Vrai / Faux**

**Question :**
`.snapshots()` de Firestore retourne un `Stream` mis à jour en temps réel à chaque modification de la base.

---

### **8. Provider — Complétion de code**

**Complétez le bloc suivant pour injecter un `ChangeNotifierProvider` au démarrage de l’application.**

```dart
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ___,
      child: MyApp(),
    ),
  );
}
```

---

### **9. notifyListeners() — Compréhension**

**Question :**
Expliquez le rôle de `notifyListeners()` dans une classe Provider héritant de `ChangeNotifier`.

---

### **10. calculateIngredientAmount — Logique métier**

**Question :**
Comment la méthode `calculateIngredientAmount()` adapte-t-elle une chaîne comme `"200g"` en fonction de la quantité choisie par l’utilisateur ?

---

### **11. toggleFavorite() — Application**

**Question :**
Décrivez ce que fait la méthode `toggleFavorite(DocumentSnapshot product)` dans un Provider de favoris.

---

### **12. GridView\.builder — Choix multiple**

**Question :**
Dans quel cas utilise-t-on `GridView.builder` dans une application de type catalogue de recettes ?

**Choix :**
A) Pour afficher une image en plein écran
B) Pour afficher une grille de cartes avec données dynamiques
C) Pour faire défiler un seul élément
D) Pour gérer la navigation entre pages

---

### **13. Firebase — Compréhension**

**Question :**
Quelle est la différence entre Firestore et Firebase Realtime Database ?

---

### **14. Firestore — Analyse de code**

**Question :**
Que fait la ligne suivante ?

```dart
FirebaseFirestore.instance.collection('recettes').snapshots()
```

---

### **15. ConnectionState — Question à réponse courte**

**Question :**
Quels sont les états possibles de `snapshot.connectionState` dans un `StreamBuilder` ?

---

### **16. RecipeDetailScreen — Logique de navigation**

**Question :**
Décrivez comment l’utilisateur arrive sur l’écran de détails (`RecipeDetailScreen`) depuis la grille de recettes (`ViewAllItems`).

---

### **17. MultiProvider — Compréhension**

**Question :**
Pourquoi utilise-t-on `MultiProvider` dans le fichier `main.dart` plutôt que plusieurs `ChangeNotifierProvider` imbriqués ?

---

### **18. QuantityProvider — Sécurité**

**Question :**
Pourquoi impose-t-on une limite inférieure à 1 dans la méthode `decreaseQuantity()` ?

---

### **19. calculateIngredientAmount — Pratique**

**Question :**
Donnez un exemple de sortie de la méthode `calculateIngredientAmount()` si l’entrée est `"100g"` et la quantité choisie est 3.

---

### **20. Firestore – Mise à jour**

**Question :**
Expliquez comment une modification dans Firestore est propagée automatiquement dans l’interface Flutter via `StreamBuilder`.

---

### **21. isExist() — Logique**

**Question :**
À quoi sert la méthode `isExist(DocumentSnapshot product)` dans `FavoriteProvider` ?

---

### **22. FavoriteProvider — Séparation des responsabilités**

**Question :**
Expliquez pourquoi on sépare les méthodes `_addFavorite()` et `_removeFavorite()` dans le Provider.

---

### **23. Provider vs setState — Vrai / Faux**

**Question :**
`Provider` et `setState` sont deux approches identiques pour mettre à jour l’interface Flutter.

---

### **24. Firestore — Types de données**

**Question :**
Quels types de données peut-on stocker dans un document Firestore ?

---

### **25. Firebase.initializeApp() — Explication**

**Question :**
Pourquoi doit-on appeler `Firebase.initializeApp()` dans `main()` avant toute interaction avec Firestore ?

---

### **26. Stream vs Future — Choix multiple**

**Question :**
Quelle est la principale différence entre `StreamBuilder` et `FutureBuilder` ?

**Choix :**
A) `StreamBuilder` ne peut être utilisé qu’avec Firebase
B) `FutureBuilder` permet des mises à jour en continu
C) `StreamBuilder` reconstruit l’interface à chaque nouvelle valeur du flux
D) `FutureBuilder` fonctionne sans asynchronisme

---

### **27. Firestore — Lecture conditionnelle**

**Question :**
Comment filtre-t-on une collection Firestore pour n’obtenir que les recettes de la catégorie `"Dinner"` ?

---

### **28. Consumer — Utilité**

**Question :**
Pourquoi utiliser `Consumer<FavoriteProvider>` dans l’affichage d’un cœur de favoris ?

---

### **29. Encapsulation — Bonnes pratiques**

**Question :**
Pourquoi la variable `_favoriteIds` est-elle privée (avec un underscore) dans le Provider ?

---

### **30. Workflow de navigation — Question synthèse**

**Question :**
Décrivez le parcours complet d’un utilisateur depuis le lancement de l’application (`main.dart`) jusqu’à l’ajout d’une recette à ses favoris.


