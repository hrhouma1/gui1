# Widgets de mise en page avancée : `Expanded`, `Flexible`, `Stack`, `Wrap`

---

## 1. Introduction

Dans Flutter, certains widgets permettent d'**organiser finement l’espace**, **adapter les éléments à l’écran**, ou **gérer des positions complexes**.

Cette fiche présente les widgets de layout suivants :

* `Expanded`
* `Flexible`
* `Stack`
* `Wrap`

---

## 2. Widget `Expanded`

### Objectif :

Permet à un widget enfant de **prendre tout l’espace disponible** sur l’axe principal (dans un `Row`, `Column`, etc.).

### Exemple :

```dart
Row(
  children: [
    Expanded(child: Container(color: Colors.red, height: 50)),
    Expanded(child: Container(color: Colors.green, height: 50)),
  ],
)
```

Chaque conteneur prend **50 % de la largeur** totale, car ils sont dans un `Row` avec deux `Expanded`.

---

### Avec `flex` :

```dart
Row(
  children: [
    Expanded(flex: 1, child: Container(color: Colors.red, height: 50)),
    Expanded(flex: 2, child: Container(color: Colors.green, height: 50)),
  ],
)
```

Le rouge prend **1/3**, le vert **2/3** de l’espace disponible.

---

## 3. Widget `Flexible`

### Objectif :

Semblable à `Expanded`, mais **moins contraignant** : il peut prendre l’espace **si disponible**, mais ne force pas à s'étirer.

### Exemple :

```dart
Row(
  children: [
    Flexible(
      child: Container(
        color: Colors.blue,
        height: 50,
        width: 100,
      ),
    ),
    Text("Autre widget"),
  ],
)
```

Le conteneur prend **jusqu'à 100 pixels**, mais peut se rétrécir si besoin.
Avec `Expanded`, ce comportement ne serait pas possible.

---

## 4. Comparatif `Expanded` vs `Flexible`

| Caractéristique             | `Expanded`               | `Flexible`                            |
| --------------------------- | ------------------------ | ------------------------------------- |
| Étire toujours              | Oui                      | Non (s’adapte mais n’impose rien)     |
| Gère le débordement         | Non (risque de overflow) | Oui (plus tolérant à l’espace limité) |
| Personnalisable avec `flex` | Oui                      | Oui                                   |

---

## 5. Widget `Stack`

### Objectif :

Permet de **superposer des widgets**, comme des calques (image de fond, texte par-dessus, etc.).

### Exemple simple :

```dart
Stack(
  children: [
    Container(width: 100, height: 100, color: Colors.blue),
    Positioned(
      top: 10,
      left: 10,
      child: Icon(Icons.star, color: Colors.white),
    ),
  ],
)
```

---

### Propriétés utiles :

| Propriété    | Description                                 |
| ------------ | ------------------------------------------- |
| `Positioned` | Permet de positionner précisément un enfant |
| `alignment`  | Aligne les enfants non positionnés          |
| `fit`        | Détermine comment le Stack s’adapte         |

---

### Exemple avec image + texte :

```dart
Stack(
  children: [
    Image.asset("assets/image.jpg"),
    Positioned(
      bottom: 10,
      right: 10,
      child: Text("Titre", style: TextStyle(color: Colors.white)),
    ),
  ],
)
```

---

## 6. Widget `Wrap`

### Objectif :

Affiche les éléments **à la suite**, et les **passe à la ligne automatiquement** si l’espace est insuffisant (comme `flex-wrap` en CSS).

### Exemple :

```dart
Wrap(
  spacing: 10,
  runSpacing: 10,
  children: List.generate(10, (index) {
    return Chip(label: Text("Item $index"));
  }),
)
```

---

### Propriétés utiles :

| Propriété    | Description                               |
| ------------ | ----------------------------------------- |
| `spacing`    | Espace **horizontal** entre les éléments  |
| `runSpacing` | Espace **vertical** entre les lignes      |
| `direction`  | Sens du Wrap : `horizontal` ou `vertical` |
| `alignment`  | Alignement des enfants sur la ligne       |

---

## 7. Bonnes pratiques

| Utiliser si...                                      | Widget recommandé |
| --------------------------------------------------- | ----------------- |
| Répartition dynamique dans un `Row` ou `Column`     | `Expanded`        |
| Répartition souple mais contrôlée                   | `Flexible`        |
| Positionnement libre ou effet de superposition      | `Stack`           |
| Liste dynamique qui s’adapte à la taille de l’écran | `Wrap`            |

---

## 8. Exemple global avec les quatre

```dart
Column(
  children: [
    Wrap(
      spacing: 8,
      children: ["A", "B", "C", "D", "E"]
          .map((e) => Chip(label: Text(e)))
          .toList(),
    ),
    SizedBox(height: 20),
    Row(
      children: [
        Expanded(child: Container(color: Colors.red, height: 30)),
        Flexible(child: Container(color: Colors.green, height: 30, width: 80)),
      ],
    ),
    SizedBox(height: 20),
    Stack(
      children: [
        Container(width: 100, height: 100, color: Colors.blue),
        Positioned(
          top: 10,
          right: 10,
          child: Icon(Icons.star, color: Colors.white),
        ),
      ],
    ),
  ],
)
```

---

## 9. Résumé

| Widget     | Rôle                                                       |
| ---------- | ---------------------------------------------------------- |
| `Expanded` | Étire un enfant pour qu’il prenne tout l’espace disponible |
| `Flexible` | Similaire, mais plus souple et sans forcer la taille       |
| `Stack`    | Superposition libre d’éléments (ex. image + icône)         |
| `Wrap`     | Organisation automatique en plusieurs lignes/colonnes      |


