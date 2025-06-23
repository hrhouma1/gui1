### **1. SafeArea — Mise en situation**

**Question :**
Vous développez une application destinée aux téléphones avec encoche. Quelles conséquences peut avoir l’absence de `SafeArea` sur l’expérience utilisateur ? Proposez une solution.



### **2. SingleChildScrollView — Analyse de bug**

**Question :**
Un développeur signale que sa page dépasse de l’écran et affiche une erreur de type "Bottom overflowed by XX pixels".
Proposez une correction efficace en utilisant un widget adapté.



### **3. FutureBuilder — Choix de widget**

**Question :**
Dans une application qui doit afficher les données d’un utilisateur une seule fois au chargement de la page, quel widget est le plus approprié : `StreamBuilder` ou `FutureBuilder` ? Justifiez votre choix.



### **4. Firestore — Structure**

**Question :**
Expliquez la différence entre une `collection` et un `document` dans Firestore. Donnez un exemple d’utilisation typique pour chaque.



### **5. Provider — Réflexion architecturale**

**Question :**
Pourquoi est-il préférable d’utiliser `Provider` plutôt que de passer manuellement les données d’un widget parent à plusieurs niveaux d’enfants ?



### **6. StreamBuilder — Analyse de comportement**

**Question :**
Dans un `StreamBuilder`, que se passe-t-il si le flux fournit une nouvelle valeur toutes les secondes ? Décrivez comment l’interface est affectée.



### **7. Firestore — Requête filtrée**

**Question :**
Vous souhaitez afficher uniquement les recettes appartenant à la catégorie "Dinner" à partir d'une collection Firestore. Quelle requête utilisez-vous et dans quel widget peut-elle être intégrée ?



### **8. Firebase — Initialisation**

**Question :**
Quelle est l’importance de la ligne `WidgetsFlutterBinding.ensureInitialized();` avant `Firebase.initializeApp();` dans `main.dart` ? Que pourrait-il se passer si elle est omise ?



### **9. Firestore — Droit d’accès**

**Question :**
Un utilisateur reçoit une erreur "Missing or insufficient permissions" lors de l'accès à une collection Firestore. Quelles sont les causes possibles et les solutions associées ?



### **10. Provider — Utilisation d’un Consumer**

**Question :**
Expliquez l’intérêt d’utiliser `Consumer<T>()` plutôt que `Provider.of<T>(context)` dans le `build()` d’un widget. Donnez un exemple de situation où cela améliore la performance.



### **11. Firestore — Gestion des erreurs**

**Question :**
Lors d’une opération d’écriture dans Firestore, quelle structure Flutter permettrait de capturer et d’afficher une erreur à l’utilisateur ?



### **12. Stream vs Future — Comparaison**

**Question :**
Présentez deux scénarios différents où il est préférable d’utiliser un `Stream` plutôt qu’un `Future`, et inversement.



### **13. Firebase — Avantages du cloud**

**Question :**
Pourquoi Firebase est-il particulièrement adapté au développement d'applications mobiles Flutter ? Citez au moins trois raisons techniques ou fonctionnelles.



### **14. QuantityProvider — Logique applicative**

**Question :**
Un utilisateur modifie la quantité d’un ingrédient dans une recette. Décrivez comment le Provider lié pourrait automatiquement mettre à jour toutes les quantités visibles à l’écran.



### **15. Encapsulation des Providers**

**Question :**
Expliquez pourquoi les champs internes d’un `Provider` (comme `_favoriteIds`) sont souvent déclarés en privé (`_`) et accessibles uniquement via des getters. Quel est l’intérêt de cette pratique ?


