# Organisation d’une interface avec `Column`, `Row`, et les Layouts Flutter

## 1. Introduction

En Flutter, l’interface est composée en **imbriquant des widgets** les uns dans les autres.
Les **layouts** (mises en page) sont des **widgets spéciaux** qui organisent **l’emplacement** des autres widgets à l’écran.

---

## 2. Le widget `Column`

### Définition :

Un `Column` est un widget qui **empile ses enfants verticalement** (du haut vers le bas).

### Exemple simple :

```dart
Column(
  children: [
    Text("Ligne 1"),
    Text("Ligne 2"),
    ElevatedButton(onPressed: () {}, child: Text("Bouton")),
  ],
)
```

Cela affichera :

```
Ligne 1
Ligne 2
[Bouton]
```

---

### Propriétés importantes :

| Propriété            | Description                                                                     |
| -------------------- | ------------------------------------------------------------------------------- |
| `children`           | Liste des widgets enfants                                                       |
| `mainAxisAlignment`  | Aligne les enfants sur l’axe **principal** (vertical)                           |
| `crossAxisAlignment` | Aligne les enfants sur l’axe **secondaire** (horizontal)                        |
| `mainAxisSize`       | Détermine si la colonne prend toute la hauteur ou seulement ce qu’elle contient |

---

### Exemple avec `mainAxisAlignment` :

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text("Centré verticalement"),
    Text("autre texte"),
  ],
)
```

---

### Exemple avec `crossAxisAlignment` :

```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text("Aligné à gauche"),
    Text("Toujours à gauche"),
  ],
)
```

---

## 3. Le widget `Row`

### Définition :

Un `Row` place ses enfants **horizontalement** (de gauche à droite).

### Exemple :

```dart
Row(
  children: [
    Icon(Icons.star),
    Text("Étoile"),
    Icon(Icons.favorite),
  ],
)
```

Affiche sur une seule ligne :

```
★ Étoile ❤
```

---

### Propriétés importantes de `Row` (identiques à `Column` mais sur l’axe horizontal) :

| Propriété            | Description                            |
| -------------------- | -------------------------------------- |
| `mainAxisAlignment`  | Aligne les enfants **horizontalement** |
| `crossAxisAlignment` | Aligne les enfants **verticalement**   |
| `mainAxisSize`       | Largeur du Row (max ou min)            |

---

### Exemple avec `MainAxisAlignment.spaceEvenly` :

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Icon(Icons.home),
    Icon(Icons.settings),
    Icon(Icons.person),
  ],
)
```

Les icônes seront réparties **équitablement** sur la ligne.

---

## 4. Combiner `Column` et `Row`

Tu peux **imbriquer** des `Row` dans des `Column`, ou l’inverse.

### Exemple :

```dart
Column(
  children: [
    Text("Titre"),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.add),
        Text("Ajouter"),
      ],
    ),
  ],
)
```

---

## 5. Widgets utiles pour les layouts

| Widget      | Rôle                                                         |
| ----------- | ------------------------------------------------------------ |
| `Container` | Boîte de base avec marge, bordure, couleur, etc.             |
| `SizedBox`  | Espace vide fixe entre deux éléments                         |
| `Padding`   | Ajoute de l’espace **à l’intérieur** d’un widget             |
| `Margin`    | (via `Container`) : espace **autour** d’un widget            |
| `Align`     | Permet d’aligner un widget à gauche, droite, etc.            |
| `Expanded`  | Fait en sorte qu’un widget prenne **tout l’espace possible** |
| `Flexible`  | Comme `Expanded`, mais plus souple                           |
| `Spacer`    | Crée de l’espace **vide extensible** entre widgets           |

---

## 6. Exemple complet avec `Column`, `Row`, `SizedBox`, `Padding` :

```dart
Scaffold(
  appBar: AppBar(title: Text("Exemple de layout")),
  body: Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Bienvenue", style: TextStyle(fontSize: 24)),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Option 1")),
            ElevatedButton(onPressed: () {}, child: Text("Option 2")),
          ],
        ),
      ],
    ),
  ),
)
```

---

## 7. Visualisation ASCII

```
[Barre AppBar]
--------------------------
|     Bienvenue          | ← Text
|                        |
| [Option 1]   [Option 2]| ← Row avec 2 boutons espacés
--------------------------
```

---

## 8. Bonnes pratiques

* Utiliser `Column` pour **empiler verticalement** (textes, champs, boutons…).
* Utiliser `Row` pour **organiser horizontalement** (icônes, labels, boutons…).
* Toujours penser à :

  * Espacer (`SizedBox`, `Padding`)
  * Aligner (`mainAxisAlignment`, `crossAxisAlignment`)
  * Adapter à l’écran (`Expanded`, `Flexible`)

---

## 9. Aller plus loin

* `Stack` pour superposer des widgets (comme une image + du texte par-dessus)
* `Wrap` pour aller à la ligne automatiquement
* `LayoutBuilder` pour des interfaces **réactives à la taille de l’écran**

---

## 10. Résumé

| Widget     | Organisation                  | Exemple d’usage                       |
| ---------- | ----------------------------- | ------------------------------------- |
| `Column`   | Verticale (haut → bas)        | Formulaires, listes de texte, menus   |
| `Row`      | Horizontale (gauche → droite) | Boutons côte à côte, étiquettes       |
| `SizedBox` | Espace fixe                   | Séparer des widgets                   |
| `Expanded` | Étire un widget               | Adapter un bouton ou texte à l’espace |
| `Padding`  | Ajoute de l’espace            | Encadrer un widget proprement         |

