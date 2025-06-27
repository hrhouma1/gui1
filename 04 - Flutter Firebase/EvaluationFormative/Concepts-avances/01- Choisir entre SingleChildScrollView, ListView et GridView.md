# Choisir entre `SingleChildScrollView`, `ListView` et `GridView`


# 1. Introduction générale

Flutter propose plusieurs widgets de défilement (scrollables) adaptés à des scénarios très différents. Les trois plus courants sont :

| Widget                  | Nature de l’enfant                             | Rendu paresseux | Structure visuelle               |
| ----------------------- | ---------------------------------------------- | --------------- | -------------------------------- |
| `SingleChildScrollView` | Un seul enfant (souvent une `Column` ou `Row`) | Non             | Libre (verticale ou horizontale) |
| `ListView`              | Liste d’items homogènes                        | Oui             | Axe principal vertical           |
| `GridView`              | Grille d’items homogènes                       | Oui             | Quadrillage à deux dimensions    |

Comprendre leur fonctionnement permet d’optimiser la mémoire, la fluidité et la maintenabilité de vos interfaces.



# 2. `SingleChildScrollView`

### 2.1 Principe

* Accepte **un seul widget enfant**.
* Défile verticalement (par défaut) ou horizontalement (`scrollDirection`).
* Le moteur **rend tout le contenu** dès la construction ; aucun recyclage n’est effectué.

### 2.2 Cas d’usage

* Contenu statique ou faiblement dynamique : formulaires, pages de profil, termes juridiques.
* Composition variée : images, paragraphes, boutons, graphiques, etc.

### 2.3 Points techniques

| Propriété         | Effet                                                            |
| ----------------- | ---------------------------------------------------------------- |
| `scrollDirection` | Sens du défilement (`Axis.vertical` ou `Axis.horizontal`).       |
| `reverse`         | Inverse l’ordre de défilement.                                   |
| `physics`         | Contrôle du comportement inertiel (ex. `BouncingScrollPhysics`). |

### 2.4 Limites

* **Performance** : si le contenu est très long, tout est gardé en mémoire.
* **Pas de recyclage** : contrairement à `ListView` et `GridView`, aucun item n’est détruit hors écran.

### 2.5 Exemple

```dart
SingleChildScrollView(
  padding: const EdgeInsets.all(16),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Profil', style: Theme.of(context).textTheme.headline4),
      const SizedBox(height: 20),
      CircleAvatar(radius: 40),
      const SizedBox(height: 20),
      TextFormField(decoration: const InputDecoration(labelText: 'Nom')),
      // autres champs...
    ],
  ),
)
```



# 3. `ListView`

### 3.1 Principe

* Conçue pour des listes longues ou infinies.
* Utilise un **système de recyclage** (slivers) : seuls les widgets visibles sont dans l’arbre.
* Variantes : `ListView.builder`, `ListView.separated`, `ListView.custom`.

### 3.2 Cas d’usage

* Flux de messages, notifications, catalogues, résultats paginés.
* Données récupérées en continu (Firestore, REST).

### 3.3 Points techniques

| Variante    | Description                                          |
| ----------- | ---------------------------------------------------- |
| `children`  | Liste statique courte.                               |
| `builder`   | Génère chaque item à la demande à partir d’un index. |
| `separated` | Comme `builder`, avec un séparateur entre les items. |
| `custom`    | Fournit vos propres slivers pour un contrôle total.  |

| Propriété clé                   | Effet                                                                             |
| ------------------------------- | --------------------------------------------------------------------------------- |
| `itemExtent` ou `prototypeItem` | Améliore la performance si tous les items ont la même hauteur.                    |
| `shrinkWrap`                    | Force la liste à adopter la taille minimale (utile dans un autre scrollable).     |
| `physics` / `primary`           | Gestion du comportement de défilement quand plusieurs scrollables sont imbriqués. |

### 3.4 Pièges à éviter

* **ListView dans une `Column` sans contrainte** : provoque un overflow.
* **Imbrication non gérée** de `ListView` dans un autre scrollable : utiliser `shrinkWrap:true` + `physics: NeverScrollableScrollPhysics()`.

### 3.5 Exemple

```dart
ListView.builder(
  itemCount: products.length,
  itemBuilder: (context, index) {
    final product = products[index];
    return ListTile(
      leading: Image.network(product.imageUrl),
      title: Text(product.name),
      subtitle: Text('${product.price} €'),
    );
  },
)
```



# 4. `GridView`

### 4.1 Principe

* Affiche les éléments dans un **quadrillage**, défilement vertical ou horizontal.
* Recyclage identique à `ListView`.
* Variantes : `GridView.count`, `GridView.extent`, `GridView.builder`, `GridView.custom`.

### 4.2 Cas d’usage

* Galeries d’images, mosaïques de cartes (recettes, produits), sélecteurs d’icônes, dashboards.

### 4.3 Délégations de grille

| Délégation                                  | Description                                              |
| ------------------------------------------- | -------------------------------------------------------- |
| `SliverGridDelegateWithFixedCrossAxisCount` | Nombre fixe de colonnes (`crossAxisCount`).              |
| `SliverGridDelegateWithMaxCrossAxisExtent`  | Largeur max d’une tuile ; calcule le nombre de colonnes. |

Autres paramètres : `mainAxisSpacing`, `crossAxisSpacing`, `childAspectRatio`.

### 4.4 Meilleures pratiques

* Adapter `childAspectRatio` pour respecter le ratio image/texte.
* Dans un environnement responsive, opter pour `SliverGridDelegateWithMaxCrossAxisExtent`.

### 4.5 Exemple

```dart
GridView.builder(
  padding: const EdgeInsets.all(8),
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    mainAxisSpacing: 8,
    crossAxisSpacing: 8,
    childAspectRatio: 1,
  ),
  itemCount: photos.length,
  itemBuilder: (context, index) {
    return Image.network(photos[index].url, fit: BoxFit.cover);
  },
)
```



# 5. Comprendre les slivers (avancé)

`SingleChildScrollView`, `ListView` et `GridView` reposent tous sur le **moteur de rendu Sliver**.

* `SingleChildScrollView` : encapsule un `SliverToBoxAdapter`.
* `ListView` : utilise un `SliverList` (ou `SliverFixedExtentList`).
* `GridView` : utilise un `SliverGrid`.

Les slivers sont ensuite placés dans un `Viewport` géré par le moteur pour recycler et peindre uniquement la partie visible.



# 6. Critères de sélection

1. **Taille et homogénéité des données**

   * Petite page fixe : `SingleChildScrollView`
   * Longue liste uniforme : `ListView`
   * Contenu formant une grille : `GridView`

2. **Performance mémoire**

   * Besoin de recyclage : `ListView` ou `GridView`
   * Contenu limité : `SingleChildScrollView`

3. **Structure visuelle**

   * Axe unique : `ListView`
   * Deux dimensions : `GridView`
   * Libre : `SingleChildScrollView` + `Column`

4. **Interactions complexes**

   * En-têtes fixes, chargements progressifs, effets de parallaxe : envisager `CustomScrollView` et slivers.



# 7. Table de synthèse finale

| Caractéristique          | SingleChildScrollView                  | ListView                                 | GridView                           |
| ------------------------ | -------------------------------------- | ---------------------------------------- | ---------------------------------- |
| Nombre d’enfants direct  | 1                                      | Illimité (via builder ou list)           | Illimité (via builder ou list)     |
| Recyclage (lazy loading) | Non                                    | Oui                                      | Oui                                |
| Orientation par défaut   | Verticale                              | Verticale                                | Verticale                          |
| Structure visuelle       | Libre (sous-widget)                    | Linéaire                                 | Quadrillage                        |
| Idéal pour               | Formulaires, pages hétérogènes courtes | Listes longues homogènes                 | Galeries, mosaïques                |
| Paramètres clés          | `scrollDirection`, `physics`           | `itemBuilder`, `itemExtent`, `separated` | `gridDelegate`, `childAspectRatio` |
| Pièges fréquents         | Contenu trop long ⇒ mémoire            | Liste dans Column non contrainte         | Grille sans ratio adapté           |



# Conclusion

Choisir le widget de défilement adapté est crucial pour la performance et l’ergonomie de votre application Flutter.

* `SingleChildScrollView` simplifie les écrans courts hétérogènes.
* `ListView` excelle pour les listes longues et dynamiques.
* `GridView` est indispensable pour les interfaces en grille visuellement riches.

Maîtriser leurs différences et leurs options avancées (slivers, `itemExtent`, `gridDelegate`) vous permettra d’optimiser vos applications et d’éviter les pièges de performance.
