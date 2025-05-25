# Comprendre les composants, les Widgets et les Événements Graphiques avec Flutter

<br/>

# Table des matières – Flutter

* [1. Introduction et Rappel sur Flutter](#1-introduction-et-rappel-sur-flutter)
* [2. Le point d’entrée : fonction main() et runApp()](#2-le-point-dentrée--fonction-main-et-runapp)
* [3. Création de la première fenêtre (Scaffold)](#3-création-de-la-première-fenêtre-scaffold)
* [4. Exemple complet : Affichage d’un texte et d’un bouton](#4-exemple-complet--affichage-dun-texte-et-dun-bouton)
* [5. Composants Flutter : Définition et Ajout](#5-composants-flutter--définition-et-ajout)
* [6. Paramètres courants des widgets Flutter](#6-paramètres-courants-des-widgets-flutter)
* [7. Widget `Text`](#7-widget-text)
* [8. Widget `ElevatedButton`](#8-widget-elevatedbutton)
* [9. Widget `TextField` (Saisie utilisateur)](#9-widget-textfield-saisie-utilisateur)
* [10. Widget `Radio`](#10-widget-radio)
* [11. Widget `Checkbox`](#11-widget-checkbox)
* [12. Widget `DropdownButton`](#12-widget-dropdownbutton)
* [13. Variables d’état dans Flutter](#13-variables-détat-dans-flutter)
* [14. Changer dynamiquement un affichage avec `setState()`](#14-changer-dynamiquement-un-affichage-avec-setstate)
* [15. Événements : clics, saisies, interactions](#15-événements--clics-saisies-interactions)
* [16. Conclusion](#16-conclusion)
* [17. ⚙ Préparation de l’environnement Flutter](#17--préparation-de-lenvironnement-flutter)

<br/>

---

# 1. Introduction et Rappel sur Flutter

**Flutter** est un framework développé par Google qui permet de créer des applications graphiques (mobile, web, desktop) avec une seule base de code en Dart.

Il fonctionne par une **composition de widgets**, chaque élément visible étant un widget.

[Revenir à la Table des matières – Flutter](#table-des-matières--flutter)

<br/>

# 2. Le point d’entrée : fonction main() et runApp()

```dart
void main() {
  runApp(MonApp());
}
```

* `main()` est la première fonction appelée.
* `runApp()` démarre l’application Flutter et construit l’interface.

[Revenir à la Table des matières – Flutter](#table-des-matières--flutter)

<br/>

# 3. Création de la première fenêtre (Scaffold)

```dart
class MonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Ma première fenêtre")),
        body: Center(child: Text("Bonjour !")),
      ),
    );
  }
}
```

* `MaterialApp` : base de l’application.
* `Scaffold` : structure visuelle (barre du haut, corps, bouton flottant, etc.).

[Revenir à la Table des matières – Flutter](#table-des-matières--flutter)

<br/>

# 4. Exemple complet : Affichage d’un texte et d’un bouton

```dart
class PageAccueil extends StatefulWidget {
  @override
  _PageAccueilState createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil> {
  String message = "Bonjour le monde";

  void changerMessage() {
    setState(() {
      message = "Tu as cliqué sur le bouton !";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Accueil")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message, style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: changerMessage,
              child: Text("Changer le message"),
            ),
          ],
        ),
      ),
    );
  }
}
```

[Revenir à la Table des matières – Flutter](#table-des-matières--flutter)

<br/>

# 5. Composants Flutter : Définition et Ajout

Un **composant Flutter** est appelé **widget**. Tout ce qui est affiché est un widget.

Exemples :

* Texte (`Text`)
* Bouton (`ElevatedButton`)
* Champ de saisie (`TextField`)
* Case à cocher (`Checkbox`)

Chaque widget est une **classe Dart**.

[Revenir à la Table des matières – Flutter](#table-des-matières--flutter)

<br/>

# 6. Paramètres courants des widgets Flutter

* `child` : le contenu du widget
* `style` : style du texte
* `onPressed` : action à exécuter (boutons)
* `controller` : pour contrôler les saisies
* `value` / `groupValue` : pour `Checkbox` et `Radio`

Exemple :

```dart
ElevatedButton(
  onPressed: () {},
  child: Text("Appuyer"),
  style: ElevatedButton.styleFrom(primary: Colors.blue),
)
```

[Revenir à la Table des matières – Flutter](#table-des-matières--flutter)

<br/>

# 7. Widget `Text`

```dart
Text(
  "Bienvenue",
  style: TextStyle(fontSize: 18, color: Colors.blue),
)
```

Permet d’afficher un texte simple.

[Revenir à la Table des matières – Flutter](#table-des-matières--flutter)

<br/>

# 8. Widget `ElevatedButton`

```dart
ElevatedButton(
  onPressed: () => print("Bouton cliqué"),
  child: Text("Clique ici"),
)
```

Bouton cliquable avec texte.

[Revenir à la Table des matières – Flutter](#table-des-matières--flutter)

<br/>

# 9. Widget `TextField` (Saisie utilisateur)

```dart
TextField(
  decoration: InputDecoration(labelText: "Nom"),
)
```

Champ de saisie mono-ligne.

[Revenir à la Table des matières – Flutter](#table-des-matières--flutter)

<br/>

# 10. Widget `Radio`

```dart
Radio(
  value: 1,
  groupValue: selectedValue,
  onChanged: (value) {
    setState(() {
      selectedValue = value;
    });
  },
)
```

Boutons à choix unique.

[Revenir à la Table des matières – Flutter](#table-des-matières--flutter)

<br/>

# 11. Widget `Checkbox`

```dart
Checkbox(
  value: isChecked,
  onChanged: (value) {
    setState(() {
      isChecked = value!;
    });
  },
)
```

Case à cocher.

[Revenir à la Table des matières – Flutter](#table-des-matières--flutter)

<br/>

# 12. Widget `DropdownButton`

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

Menu déroulant.

[Revenir à la Table des matières – Flutter](#table-des-matières--flutter)

<br/>

# 13. Variables d’état dans Flutter

Flutter n’utilise pas `StringVar` ou `IntVar` comme Tkinter.

Il utilise des **variables Dart classiques**, qu’on met à jour dans un `StatefulWidget`.

Exemple :

```dart
String nom = "";

TextField(
  onChanged: (value) {
    setState(() {
      nom = value;
    });
  },
)
```

[Revenir à la Table des matières – Flutter](#table-des-matières--flutter)

<br/>

# 14. Changer dynamiquement un affichage avec `setState()`

```dart
String texte = "Bienvenue";

setState(() {
  texte = "Texte mis à jour";
});
```

Flutter redessine l’écran quand `setState()` est appelé.

[Revenir à la Table des matières – Flutter](#table-des-matières--flutter)

<br/>

# 15. Événements : clics, saisies, interactions

| Action                   | Méthode associée |
| ------------------------ | ---------------- |
| Appui bouton             | `onPressed:`     |
| Modification champ texte | `onChanged:`     |
| Clic long                | `onLongPress:`   |
| Focus                    | `FocusNode()`    |

Exemple :

```dart
TextField(
  onChanged: (val) => print("Vous avez tapé : $val"),
)
```

[Revenir à la Table des matières – Flutter](#table-des-matières--flutter)

<br/>

# 16. Conclusion

Avec Flutter, on peut :

* Créer des interfaces modernes multiplateformes
* Organiser ses widgets en arborescence
* Réagir aux événements
* Mettre à jour dynamiquement l’interface avec `setState()`

[Revenir à la Table des matières – Flutter](#table-des-matières--flutter)

<br/>

# 17. ⚙ Préparation de l’environnement Flutter

### Étapes pour démarrer :

```bash
# 1. Télécharger le SDK Flutter
# 2. Ajouter flutter/bin au PATH
# 3. Vérifier avec :
flutter doctor
```

### Créer un projet :

```bash
flutter create mon_projet
cd mon_projet
flutter run
```

### Ouvrir dans VS Code :

* Installer les extensions **Flutter** et **Dart**
* Cliquer sur `F5` pour lancer l'app

[Revenir à la Table des matières – Flutter](#table-des-matières--flutter)


