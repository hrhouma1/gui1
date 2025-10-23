### **Document d'analyse pédagogique complète : `RecipeDetailScreen`**

---

## **1. Introduction**

L’écran `RecipeDetailScreen` présente une **fiche détaillée** pour une recette sélectionnée. Il utilise :

* Un `SliverAppBar` dynamique avec image en-tête
* Des données reçues via un `DocumentSnapshot` (Firestore)
* Deux `Provider`s : `FavoriteProvider` pour les favoris, `QuantityProvider` pour gérer les quantités
* Un design orienté **UX fluide, clair, structuré**, avec boutons interactifs, contrôle du nombre de portions, et section ingrédients.

---

## **2. Schéma de structure globale (ASCII)**

```
+--------------------------------------------------------+
|               SliverAppBar (Image flexible)           |
|  - Bouton retour                                       |
|  - Bouton favori (Provider)                            |
|  - Image de la recette (ou icône par défaut)           |
+--------------------------------------------------------+
| SliverToBoxAdapter (Contenu principal)                |
|  ├─ Nom de la recette                                  |
|  ├─ Temps – Calories – Note                            |
|  ├─ Section "Ingredients"                              |
|  │   ├─ Contrôle de la quantité (Provider)             |
|  │   └─ Liste calculée des ingrédients                |
|  ├─ Bouton "Start Cooking"                             |
+--------------------------------------------------------+
```

---

## **3. Chargement initial avec `initState`**

```dart
WidgetsBinding.instance.addPostFrameCallback((_) {
  Provider.of<QuantityProvider>(context, listen: false).resetQuantity();
});
```

Dès que la page est montée, le compteur de quantité est **réinitialisé à 1**, garantissant que chaque recette débute avec une quantité neutre.

---

## **4. Affichage de l'image avec `SliverAppBar`**

### Fonctionnalités :

* **Hauteur flexible** : `expandedHeight: 300`
* **Rendu fluide** à l’ouverture
* **`Pinned: true`** : garde la barre visible lors du scroll
* **Image conditionnelle** :

  * Si présente → `NetworkImage`
  * Sinon → icône `restaurant` centrée

### Boutons :

* **Retour (`Navigator.pop`)**
* **Ajout/Retrait favori via `FavoriteProvider`**

---

## **5. Contenu textuel : nom, durée, calories, note**

```dart
Text(recipeData['name'] ?? 'Sans nom')
```

* Mise en page horizontale avec :

  * `Iconsax.clock` → Temps
  * `Icons.local_fire_department` → Calories
  * `Icons.star` → Note moyenne
  * Texte complémentaire `"(${reviews} Reviews)"`

---

## **6. Contrôle dynamique de la quantité**

La section "Ingredients" est pilotée par `QuantityProvider`, qui expose :

* `quantity` → quantité actuelle
* `increaseQuantity()` / `decreaseQuantity()` → modifier
* `calculateIngredientAmount(amount)` → ajustement dynamique

### Interface :

* Deux boutons `+` et `–`
* Valeur centrale affichée dynamiquement

```dart
"${quantityProvider.quantity}" // affichage actuel
```

---

## **7. Liste des ingrédients calculés**

Les ingrédients sont construits dynamiquement avec `_buildIngredientItem(...)` :

```dart
Text(quantityProvider.calculateIngredientAmount("100g"))
```

> L’unité est automatiquement **multipliée par la quantité** choisie pour s’adapter aux besoins de l’utilisateur (ex. : "100g" → "200g" si quantité = 2)

### Design :

* Icône illustrative à gauche
* Nom de l’ingrédient
* Quantité ajustée affichée à droite

---

## **8. Bouton "Start Cooking"**

### Comportement :

```dart
ElevatedButton(
  onPressed: () {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Starting to cook ${name}!"))
    );
  },
)
```

* Bouton de validation large
* Affichage d’une **notification SnackBar**
* Fonctionne comme un **signal de début de cuisson**

---

## **9. Gestion d’erreurs et fallback**

Chaque champ du document Firestore est validé :

```dart
recipeData.containsKey('image') &&
recipeData['image'] != null &&
recipeData['image'].toString().isNotEmpty
```

Cela évite :

* les erreurs null
* les crashes liés aux données incomplètes
* les comportements inattendus

---

## **10. Interaction avec Firestore (lecture uniquement)**

```dart
final DocumentSnapshot recipe;
```

L’écran repose sur un document reçu en paramètre et **n’écrit aucune donnée dans Firestore**. Toute modification d’état (favoris, quantité) est **locale ou partagée par Provider**.

---

## **11. Gestion de l’état avec Provider (2 couches)**

| Provider           | Rôle                                     |
| ------------------ | ---------------------------------------- |
| `FavoriteProvider` | Gère la liste des favoris, ajoute/retire |
| `QuantityProvider` | Stocke la quantité, ajuste les mesures   |

### Pourquoi `Consumer` ?

```dart
Consumer<FavoriteProvider>(
  builder: (context, favoriteProvider, child) {
```

* Permet de **réagir aux changements en temps réel**
* Redessine **uniquement la partie concernée**
* Respecte le principe de séparation de responsabilités

---

## **12. Résumé pédagogique**

| Élément                     | Fonction principale                                           |
| --------------------------- | ------------------------------------------------------------- |
| `SliverAppBar`              | Affichage dynamique avec image flexible                       |
| `CustomScrollView`          | Gestion fluide du défilement structuré                        |
| `Provider`                  | Gestion d’état optimisée, sans mutation directe du widget     |
| `StreamBuilder` (indirect)  | Non utilisé ici, car les données sont injectées en paramètre  |
| `SnackBar`                  | Message utilisateur au clic sur "Start Cooking"               |
| `_buildIngredientItem(...)` | Construction modulaire et responsive d’une ligne d’ingrédient |

---

Souhaitez-vous une version imprimable de ce document pour Thinkific ou Moodle, ou bien un exercice guidé où l’utilisateur peut créer sa propre version dynamique de fiche recette avec de nouveaux ingrédients et ajustements ? Je peux également intégrer des cas pratiques pour l’évaluation en cours ou un TP étape par étape.
