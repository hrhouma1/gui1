# Widget `DropdownButton` – Menu déroulant en Flutter

---

## 1. Introduction

Le widget `DropdownButton` permet d’afficher une **liste déroulante** avec plusieurs choix possibles.
L’utilisateur peut en sélectionner **un seul**.

Ce widget est très utilisé dans les **formulaires**, **filtres**, ou interfaces où il faut choisir une valeur dans une liste définie.

---

## 2. Structure de base

```dart
DropdownButton<String>(
  value: selectedValue,
  onChanged: (value) {
    setState(() {
      selectedValue = value!;
    });
  },
  items: ["Rouge", "Vert", "Bleu"].map((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList(),
)
```

---

## 3. Explication des paramètres

| Paramètre   | Description                                                   |
| ----------- | ------------------------------------------------------------- |
| `value`     | La valeur **actuellement sélectionnée**                       |
| `onChanged` | Fonction appelée **lorsqu’un nouvel élément est sélectionné** |
| `items`     | La **liste des choix** (widgets de type `DropdownMenuItem`)   |

---

### Exemple minimal fonctionnel :

```dart
String selectedColor = "Rouge";

DropdownButton<String>(
  value: selectedColor,
  onChanged: (value) {
    setState(() {
      selectedColor = value!;
    });
  },
  items: ["Rouge", "Vert", "Bleu"].map((String color) {
    return DropdownMenuItem<String>(
      value: color,
      child: Text(color),
    );
  }).toList(),
)
```

---

## 4. Exemple intégré avec affichage du choix

```dart
class ChoixCouleur extends StatefulWidget {
  @override
  _ChoixCouleurState createState() => _ChoixCouleurState();
}

class _ChoixCouleurState extends State<ChoixCouleur> {
  String selectedColor = "Rouge";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<String>(
          value: selectedColor,
          onChanged: (value) {
            setState(() {
              selectedColor = value!;
            });
          },
          items: ["Rouge", "Vert", "Bleu"].map((String color) {
            return DropdownMenuItem<String>(
              value: color,
              child: Text(color),
            );
          }).toList(),
        ),
        SizedBox(height: 20),
        Text("Couleur choisie : $selectedColor"),
      ],
    );
  }
}
```

---

## 5. Personnalisation du `DropdownButton`

| Élément         | Description                                       |
| --------------- | ------------------------------------------------- |
| `hint`          | Texte affiché si aucune valeur n’est sélectionnée |
| `icon`          | Icône personnalisée à droite                      |
| `dropdownColor` | Couleur de fond du menu déroulant                 |
| `isExpanded`    | Prend toute la largeur disponible (`true/false`)  |

### Exemple avec options personnalisées :

```dart
DropdownButton<String>(
  value: selectedColor,
  isExpanded: true,
  icon: Icon(Icons.arrow_drop_down_circle),
  dropdownColor: Colors.lightBlue[50],
  items: ["Rouge", "Vert", "Bleu"].map((String color) {
    return DropdownMenuItem<String>(
      value: color,
      child: Text(color),
    );
  }).toList(),
  onChanged: (value) {
    setState(() {
      selectedColor = value!;
    });
  },
)
```

---

## 6. Cas fréquent : aucune valeur sélectionnée par défaut

Dans ce cas, on peut afficher un `hint` et vérifier que `value` est `null`.

```dart
String? selectedFruit;

DropdownButton<String>(
  hint: Text("Choisir un fruit"),
  value: selectedFruit,
  items: ["Pomme", "Banane", "Fraise"].map((String fruit) {
    return DropdownMenuItem<String>(
      value: fruit,
      child: Text(fruit),
    );
  }).toList(),
  onChanged: (value) {
    setState(() {
      selectedFruit = value!;
    });
  },
)
```

---

## 7. Résumé

| Élément            | Rôle                                        |
| ------------------ | ------------------------------------------- |
| `DropdownButton`   | Menu déroulant Flutter                      |
| `DropdownMenuItem` | Représente chaque option dans la liste      |
| `value`            | Valeur actuellement sélectionnée            |
| `onChanged`        | Fonction déclenchée lors d’un nouveau choix |

---

## 8. Exercice pratique

### Exercice – Sélecteur de langue

Crée une interface Flutter avec :

* Une liste déroulante pour choisir une langue : "Français", "Anglais", "Espagnol"
* Affiche le message :
  → "Langue sélectionnée : Français" (ou autre)

Indications :

* Utilise `DropdownButton<String>`
* Ajoute un `Text` en dessous pour afficher la sélection

---

## Revenir à la [Table des matières – Flutter](#tb)

