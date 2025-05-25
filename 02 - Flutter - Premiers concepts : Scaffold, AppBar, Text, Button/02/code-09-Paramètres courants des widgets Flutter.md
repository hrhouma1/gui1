# Paramètres courants des widgets Flutter

## 1. Introduction

Chaque **widget Flutter** possède des **paramètres (propriétés)** qui permettent de **personnaliser son apparence et son comportement**.

Dans cette fiche, on étudie les paramètres les plus fréquemment utilisés, en expliquant :

* à quoi ils servent,
* dans quels widgets on les retrouve,
* et comment les utiliser avec des **exemples simples**.

---

## 2. Paramètre `child`

### Définition :

Le paramètre `child` sert à **insérer un widget à l’intérieur d’un autre widget**.

### Utilisé avec :

* `Container`
* `ElevatedButton`
* `Center`
* `Padding`, etc.

### Exemple :

```dart
Center(
  child: Text("Centré !"),
)
```

---

## 3. Paramètre `style`

### Définition :

Définit le **style visuel** du contenu (souvent du texte).

### Utilisé avec :

* `Text` (`style: TextStyle(...)`)
* `ElevatedButton.styleFrom(...)`
* `Container` (via `decoration`), etc.

### Exemple avec `Text` :

```dart
Text(
  "Bonjour",
  style: TextStyle(
    fontSize: 24,
    color: Colors.red,
    fontWeight: FontWeight.bold,
  ),
)
```

### Exemple avec un bouton :

```dart
ElevatedButton(
  onPressed: () {},
  child: Text("Clique"),
  style: ElevatedButton.styleFrom(
    primary: Colors.blue,
    padding: EdgeInsets.all(16),
  ),
)
```

---

## 4. Paramètre `onPressed`

### Définition :

Définit **l’action à exécuter** quand on clique sur un bouton.

### Utilisé avec :

* `ElevatedButton`
* `TextButton`
* `IconButton`
* `FloatingActionButton`, etc.

### Exemple :

```dart
ElevatedButton(
  onPressed: () {
    print("Bouton cliqué !");
  },
  child: Text("Cliquez"),
)
```

Si `onPressed` vaut `null`, le bouton est **désactivé**.

---

## 5. Paramètre `controller`

### Définition :

Permet de **contrôler un champ de saisie** (`TextField`) ou de récupérer sa valeur.

### Utilisé avec :

* `TextField`
* `TextFormField`

### Exemple :

```dart
final monControleur = TextEditingController();

TextField(
  controller: monControleur,
)

ElevatedButton(
  onPressed: () {
    print(monControleur.text); // Récupère ce que l'utilisateur a écrit
  },
  child: Text("Valider"),
)
```

---

## 6. Paramètres `value` et `groupValue`

### Définition :

Utilisés pour gérer l’**état des cases à cocher** et des **boutons radio**.

| Paramètre    | Description                                     |
| ------------ | ----------------------------------------------- |
| `value`      | La valeur de ce widget Checkbox/Radio           |
| `groupValue` | La valeur du groupe auquel ce bouton appartient |

---

### Exemple avec `Checkbox` :

```dart
bool estCoche = false;

Checkbox(
  value: estCoche,
  onChanged: (bool? valeur) {
    setState(() {
      estCoche = valeur!;
    });
  },
)
```

---

### Exemple avec `Radio` :

```dart
String genre = "homme";

Radio(
  value: "femme",
  groupValue: genre,
  onChanged: (String? valeur) {
    setState(() {
      genre = valeur!;
    });
  },
)
```

---

## 7. Autres paramètres fréquents

| Paramètre    | Utilité                                 | Exemple                                                   |
| ------------ | --------------------------------------- | --------------------------------------------------------- |
| `padding`    | Espace intérieur                        | `Padding(padding: EdgeInsets.all(8), child: ...)`         |
| `margin`     | Espace extérieur (via `Container`)      | `Container(margin: EdgeInsets.all(8))`                    |
| `color`      | Couleur de fond (si disponible)         | `Container(color: Colors.grey)`                           |
| `alignment`  | Alignement interne                      | `Align(alignment: Alignment.centerRight)`                 |
| `decoration` | Ajout de bordures, arrondis, etc.       | `Container(decoration: BoxDecoration(...))`               |
| `enabled`    | Activer/désactiver un champ ou bouton   | `TextField(enabled: false)`                               |
| `hintText`   | Texte indicatif dans un champ de saisie | `TextField(decoration: InputDecoration(hintText: "Nom"))` |

---

## 8. Exemple global avec plusieurs paramètres

```dart
final monCtrl = TextEditingController();

Scaffold(
  appBar: AppBar(title: Text("Formulaire simple")),
  body: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        TextField(
          controller: monCtrl,
          decoration: InputDecoration(
            labelText: "Entrez votre nom",
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            print("Bonjour ${monCtrl.text}");
          },
          child: Text("Valider"),
          style: ElevatedButton.styleFrom(primary: Colors.green),
        ),
      ],
    ),
  ),
)
```

---

## 9. En résumé

| Paramètre    | Rôle                                       |
| ------------ | ------------------------------------------ |
| `child`      | Contenu du widget                          |
| `style`      | Style visuel (texte, bouton, etc.)         |
| `onPressed`  | Action à faire lors d’un clic              |
| `controller` | Lire/écrire le contenu d’un champ de texte |
| `value`      | Valeur actuelle (Checkbox, Radio, Switch)  |
| `groupValue` | Valeur de groupe (pour Radio)              |
| `decoration` | Personnalisation avancée de mise en page   |

