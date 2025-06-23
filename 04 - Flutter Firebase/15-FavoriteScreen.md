### **Document de Référence Structurée – Interface Flutter : `FavoriteScreen`**

---

#### **1. Présentation Générale**

Le fichier `favorite_screen.dart` implémente un écran complet d’affichage des recettes ajoutées aux favoris par l’utilisateur. Cet écran est **entièrement dynamique** et s’actualise **en temps réel** grâce à un `Stream` alimenté par Firestore, en passant par un `Provider`.

L’objectif est de garantir une expérience réactive, claire, lisible, et structurée pour la gestion des favoris dans une application de recettes.

---

## **2. Schéma ASCII global de l’écran Favoris**

```
+----------------------------------------------------+
|                       AppBar                       |
|----------------------------------------------------|
|                    Titre : "Favorite"              |
|                    (sans flèche retour)            |
+----------------------------------------------------+
|                    Corps (body)                    |
| +----------------------------------------------+   |
| | Consumer<FavoriteProvider>                   |   |
| | └── StreamBuilder<List<DocumentSnapshot>>    |   |
| |     ├── Si en attente → Cercle de chargement |   |
| |     ├── Si vide → Message d'information      |   |
| |     └── Sinon → Liste verticale des cartes   |   |
| +----------------------------------------------+   |
+----------------------------------------------------+
```

---

## **3. Gestion de l’état et du flux des données**

Le `Consumer<FavoriteProvider>` encapsule la logique d'accès au stream des favoris.

### **Utilisation du `StreamBuilder`**

```dart
stream: favoriteProvider.getFavoriteItemsStream()
```

* Cette fonction retourne un **`Stream<List<DocumentSnapshot>>`**
* Ce stream est **écouté en permanence**, et les nouvelles données sont **automatiquement injectées** dans l’interface

---

## **4. Trois comportements selon le `snapshot`**

### **4.1. État : Chargement**

```dart
if (snapshot.connectionState == ConnectionState.waiting)
```

> Affiche un `CircularProgressIndicator` centré.

---

### **4.2. État : Données vides**

```dart
if (!snapshot.hasData || snapshot.data!.isEmpty)
```

> Affiche une **illustration simple avec un message** :

* Icône `Iconsax.heart`
* Texte "No favorites yet"
* Message secondaire : "Add some recipes to your favorites!"

---

### **4.3. État : Données disponibles**

> La liste des recettes favorites est affichée sous forme de **cartes verticales**, dans un `ListView.builder`.

---

## **5. Structure d’une carte de recette favorite**

Chaque carte représente une recette avec ses détails. Elle est stylisée avec ombre, coins arrondis, et marges verticales.

### **Schéma ASCII de la carte :**

```
+-----------------------------------------------------+
| [IMAGE]        Titre de la recette                  |
|                Durée • Calories                    |
|                Note (étoile + nombre d’avis)        |
|                Bouton suppression (icône rouge)     |
+-----------------------------------------------------+
```

### **Détails d’implémentation :**

* `Container` principal avec `BoxDecoration` :

  * Fond blanc
  * Coins arrondis (radius 15)
  * Légère ombre grise

* **Zone image (à gauche)** :

  * Taille fixe 80×80
  * Si image absente, on montre une icône `restaurant` centrée

* **Zone texte (à droite)** :

  * Titre (`Text`) avec `maxLines: 2`
  * Ligne de durée + calories : `"$time min • $cal cal"`
  * Évaluation :

    * Icône étoile
    * Texte `"4.5 (24)"` avec fallback `"0.0 (0)"`

* **Bouton suppression (à droite)** :

  * Icône rouge `Icons.delete_outline`
  * Appel à `favoriteProvider.toggleFavorite(...)` pour retirer l’élément

---

## **6. Sécurité des accès aux données Firestore**

À chaque lecture de champ :

```dart
recipe.data() != null &&
(recipe.data() as Map<String, dynamic>).containsKey('image')
```

Cela protège contre :

* Les champs absents dans les documents Firestore
* Les valeurs nulles
* Les conversions de types invalides

---

## **7. Utilisation du Provider**

### **Principe**

Le fichier repose sur `Provider`, un mécanisme de gestion d’état :

* Le `FavoriteProvider` expose :

  * une méthode `getFavoriteItemsStream()`
  * une méthode `toggleFavorite(...)`
  * une méthode `isExist(...)`

### **Pourquoi utiliser un `Consumer` ici ?**

```dart
Consumer<FavoriteProvider>(
  builder: (context, favoriteProvider, child) {
```

Le `Consumer` permet de :

* Accéder à l’instance du provider
* Re-construire uniquement l’interface associée aux favoris
* Assurer une séparation claire entre l’**interface** et la **logique métier**

---

## **8. Adaptabilité et responsive design**

* Images gérées avec `BoxFit.cover` et fond gris clair par défaut
* `Expanded` dans la `Row` pour adapter la largeur des colonnes
* `SizedBox` pour espacement contrôlé entre les composants
* `TextOverflow.ellipsis` pour éviter les débordements de texte

---

## **9. Conclusion pédagogique**

Ce fichier constitue un exemple complet de :

* **Chargement dynamique de données Firestore** avec `StreamBuilder`
* **Gestion d’état locale via Provider**
* **Conception réactive et sécurisée** de cartes d’éléments
* **Interface mobile propre, accessible et intuitive**

Il illustre les compétences clés suivantes :

* Gestion asynchrone via `snapshot`
* Séparation claire UI / logique métier
* Fiabilité des données et fallback visuel

---

Souhaitez-vous une version prête à publier (PDF mise en page, export Thinkific, fiche A4 imprimable, ou QCM de validation sur ce composant) ? Je peux également ajouter des cas limites et des exercices guidés à partir de ce module.
