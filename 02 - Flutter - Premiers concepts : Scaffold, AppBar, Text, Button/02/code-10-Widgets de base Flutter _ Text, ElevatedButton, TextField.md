# Widgets de base Flutter : `Text`, `ElevatedButton`, `TextField`

---

## 1. Introduction

Flutter fournit des **widgets simples et puissants** pour construire des interfaces graphiques.
Ce document présente trois **éléments essentiels** :

* `Text` → afficher du texte
* `ElevatedButton` → créer un bouton cliquable
* `TextField` → permettre la saisie de texte

---

## 2. Widget `Text`

### Objectif :

Permet d’**afficher une chaîne de caractères** (titre, paragraphe, message, etc.).

### Syntaxe de base :

```dart
Text("Bienvenue")
```

### Exemple avec style :

```dart
Text(
  "Bienvenue",
  style: TextStyle(
    fontSize: 18,
    color: Colors.blue,
    fontWeight: FontWeight.bold,
  ),
)
```

### Paramètres utiles :

| Paramètre   | Description                                       |
| ----------- | ------------------------------------------------- |
| `style`     | Définit la police, taille, couleur, etc.          |
| `textAlign` | Aligne le texte : `center`, `left`, `right`, etc. |
| `overflow`  | Gère le débordement : `ellipsis`, `fade`, etc.    |
| `maxLines`  | Nombre maximum de lignes à afficher               |

### Exemple avec `textAlign` :

```dart
Text(
  "Centré",
  textAlign: TextAlign.center,
)
```

---

## 3. Widget `ElevatedButton`

### Objectif :

Créer un **bouton en relief**, cliquable, avec un texte ou une icône.

### Syntaxe de base :

```dart
ElevatedButton(
  onPressed: () => print("Bouton cliqué"),
  child: Text("Clique ici"),
)
```

### Explication :

* `onPressed` : fonction appelée quand l’utilisateur clique.
* `child` : contenu du bouton (souvent un `Text`).

### Exemple avec style personnalisé :

```dart
ElevatedButton(
  onPressed: () {},
  child: Text("Valider"),
  style: ElevatedButton.styleFrom(
    primary: Colors.green,
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    textStyle: TextStyle(fontSize: 16),
  ),
)
```

### Remarque :

Si `onPressed` est `null`, le bouton est **désactivé**.

---

## 4. Widget `TextField`

### Objectif :

Créer un **champ de saisie de texte**, en ligne simple, pour les formulaires, identifiants, etc.

### Syntaxe de base :

```dart
TextField(
  decoration: InputDecoration(labelText: "Nom"),
)
```

### Explication :

* `decoration` : permet d’ajouter un **label**, un indice (`hintText`), une icône, etc.

### Exemple avec icône et indice :

```dart
TextField(
  decoration: InputDecoration(
    labelText: "Nom",
    hintText: "Entrez votre nom complet",
    prefixIcon: Icon(Icons.person),
    border: OutlineInputBorder(),
  ),
)
```

---

### Paramètres utiles de `TextField` :

| Paramètre      | Description                                     |
| -------------- | ----------------------------------------------- |
| `controller`   | Permet de lire/modifier le texte saisi          |
| `obscureText`  | Cache le texte (pour les mots de passe)         |
| `keyboardType` | Définit le clavier (texte, email, nombre…)      |
| `maxLength`    | Nombre maximal de caractères                    |
| `onChanged`    | Fonction appelée à chaque modification du texte |

---

## 5. Exemple combiné : texte, champ et bouton

```dart
final nomController = TextEditingController();

Column(
  children: [
    Text("Entrez votre nom :"),
    TextField(
      controller: nomController,
      decoration: InputDecoration(labelText: "Nom"),
    ),
    SizedBox(height: 16),
    ElevatedButton(
      onPressed: () {
        print("Bonjour ${nomController.text}");
      },
      child: Text("Valider"),
    ),
  ],
)
```

---

## 6. En résumé

| Widget           | Utilité                              |
| ---------------- | ------------------------------------ |
| `Text`           | Afficher un texte simple             |
| `ElevatedButton` | Bouton cliquable avec action         |
| `TextField`      | Champ de saisie (formulaire, login…) |

