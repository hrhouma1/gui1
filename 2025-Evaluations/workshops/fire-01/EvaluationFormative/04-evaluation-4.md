#  **Section A — Questions d’analyse / compréhension**



**1. Architecture Provider – Question ouverte**

Expliquez en détail la différence entre `ChangeNotifierProvider` et `Provider`. Donnez un cas d’usage concret pour chacun.



**2. Firestore – Analyse critique**

Vous utilisez Firestore dans une app Flutter et remarquez une lenteur lorsque vous ouvrez une vue avec un `StreamBuilder`. Listez les causes possibles et proposez des solutions.



**3. StreamBuilder vs FutureBuilder — Cas d’usage**

Dans une application de recettes, à quel moment serait-il plus approprié d’utiliser `FutureBuilder` au lieu de `StreamBuilder` ? Justifiez par un scénario complet.



**4. SafeArea et Responsive Design — Réflexion**

Expliquez pourquoi `SafeArea` ne suffit pas toujours pour garantir un affichage optimal sur tous les types d’écrans (encoches, tablettes, etc.). Que faut-il ajouter ?



**5. Firestore – Indexation automatique**

Lorsque vous utilisez une clause `where` combinée à `orderBy` dans une requête Firestore, une erreur s’affiche concernant l’index. Pourquoi ? Et que faire ?



**6. Provider – Anti-patterns**

Citez deux mauvaises pratiques fréquentes avec `Provider` dans Flutter. Pour chaque exemple, expliquez pourquoi cela pose problème et comment le corriger.



**7. Widget Lifecycle – Approfondissement**

Dans un `StatefulWidget`, à quoi sert `didChangeDependencies()` ? Dans quel cas ce callback est indispensable ?



**8. Firebase Auth – Sécurité**

Votre application utilise `FirebaseAuth` pour gérer les connexions. Que faut-il faire pour empêcher l’accès à certaines routes si l’utilisateur n’est pas authentifié ? Montrez un exemple conceptuel.



**9. Firebase Firestore – Consistance des données**

Dans un document Firestore partagé entre plusieurs utilisateurs, comment gérer les conflits d’écriture ? Donnez une stratégie concrète.



**10. Gestion des erreurs – StreamBuilder**

Pourquoi est-il important de traiter explicitement `snapshot.hasError` dans un `StreamBuilder` ? Que peut-il arriver si ce n’est pas fait ?



###  **Section B — Développement partiel**



**11. Exercice : Mise à jour dynamique avec Provider**

Créez une classe Provider nommée `CartProvider` qui permet d’ajouter, retirer et vider une liste de produits. Implémentez un écran qui affiche dynamiquement le total en fonction des articles.



**12. Exercice : Affichage de données Firestore avec filtre**

Créez un écran Flutter qui affiche uniquement les recettes de la catégorie `"Breakfast"` depuis la collection `recipes` de Firestore. Utilisez `StreamBuilder`.



**13. Exercice : Formulaire d’ajout Firebase**

Créez un écran avec un formulaire permettant à l’utilisateur d’ajouter un produit à Firestore (`name`, `price`, `description`). Affichez une confirmation à la fin.



**14. Exercice : Application de favoris (LocalStorage ou Firestore)**

Implémentez un système de favoris pour une liste d’articles. L’utilisateur peut cliquer sur un cœur pour ajouter/retirer un favori. Les favoris sont persistés dans Firestore ou `SharedPreferences`.



**15. Exercice : Page d’accueil responsive**

Créez un écran d’accueil comportant une `AppBar`, une `GridView` de 2 colonnes, et un `Drawer`. L’interface doit s’adapter aux petits et grands écrans.



**16. Exercice : SafeArea + ScrollView combinés**

Implémentez une page contenant beaucoup de contenu (liste, textes, boutons) en vous assurant que rien n’est masqué sur les écrans modernes. Utilisez `SafeArea` et `SingleChildScrollView`.



**17. Exercice : FutureBuilder avec chargement personnalisé**

Créez un écran qui charge une seule fois des données depuis Firestore avec `FutureBuilder`. Affichez un message personnalisé pendant le chargement et en cas d’erreur.



**18. Exercice : Page de détails avec navigation**

Créez deux écrans : un écran de liste (`ListView`) et un écran de détail. Lorsqu’on clique sur un élément de la liste, on navigue vers l’écran de détail avec toutes les infos du document Firestore.



**19. Exercice : Mini-App de gestion d’utilisateurs**

Structurez une petite application où l’on peut afficher, ajouter et supprimer des utilisateurs (champ `name`, `email`) via Firestore. Bonus : ajouter un filtre par nom.



**20. Exercice : Interface de commentaires avec StreamBuilder**
Développez un écran où les utilisateurs peuvent ajouter des commentaires (champ texte). Les commentaires sont affichés en direct via `StreamBuilder`.

