# Composants Flutter : Définition et Ajout

## 1. Qu’est-ce qu’un composant Flutter ?

En Flutter, **tout est un composant**, et on les appelle des **widgets**.

> Un widget est une **classe Dart** qui représente **une unité de l’interface utilisateur**.
> Cela peut être **un texte, un bouton, une image, un formulaire, une page entière**, etc.

---

## 2. Exemples de widgets courants

| Widget           | Rôle                                                   |
| ---------------- | ------------------------------------------------------ |
| `Text`           | Affiche une chaîne de caractères (texte simple)        |
| `ElevatedButton` | Affiche un bouton en relief                            |
| `TextField`      | Affiche un champ dans lequel l’utilisateur peut écrire |
| `Checkbox`       | Affiche une case à cocher                              |
| `Image`          | Affiche une image depuis un fichier ou une URL         |
| `Container`      | Boîte de mise en page, peut contenir d’autres widgets  |
| `Column` / `Row` | Organise des widgets en colonne ou en ligne            |
| `ListView`       | Liste défilante verticale                              |
| `Scaffold`       | Structure de base d’une page (appbar, body, etc.)      |

---

## 3. Les types de widgets

Flutter propose deux grandes catégories de widgets :

### 3.1. `StatelessWidget`

Un widget **qui ne change jamais** une fois affiché.

Exemple :

```dart
class MonTitre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Bonjour !");
  }
}
```

### 3.2. `StatefulWidget`

Un widget **qui peut changer** selon les actions de l’utilisateur ou des données.

Exemple :

```dart
class MonBouton extends StatefulWidget {
  @override
  _MonBoutonState createState() => _MonBoutonState();
}

class _MonBoutonState extends State<MonBouton> {
  String message = "Appuie !";

  void changerMessage() {
    setState(() {
      message = "Tu as cliqué !";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(message),
        ElevatedButton(onPressed: changerMessage, child: Text("Clique")),
      ],
    );
  }
}
```

---

## 4. Comment ajouter un widget dans une application Flutter

Voici un exemple simple pour **intégrer un widget Text et un bouton dans une app Flutter** :

```dart
class MaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ma page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bonjour le monde", style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("Bouton cliqué !");
              },
              child: Text("Appuyer"),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## 5. Arborescence et imbrication des widgets

Chaque widget peut **contenir d’autres widgets** : on parle d’**arborescence**.

Exemple de structure logique :

```dart
Scaffold
└── AppBar
└── Body → Center
           └── Column
               ├── Text
               └── ElevatedButton
```

---

## 6. Astuce : les widgets ne font qu’UNE chose

En Flutter :

> Chaque widget a **un seul rôle** : afficher quelque chose, organiser, réagir...

Cela permet de :

* **composer des interfaces complexes** avec de petits blocs simples
* **réutiliser facilement** des éléments
* **tester** chaque composant individuellement

---

## 7. Ressources supplémentaires

* Documentation officielle : [flutter.dev/widgets](https://flutter.dev/widgets)
* Répertoire complet : [Flutter Widget Catalog](https://docs.flutter.dev/development/ui/widgets)

---

## 8. En résumé

| Terme clé       | Définition rapide                                      |
| --------------- | ------------------------------------------------------ |
| Widget          | Élément d’interface (texte, bouton, etc.)              |
| StatelessWidget | Ne change jamais                                       |
| StatefulWidget  | Peut changer dynamiquement                             |
| Scaffold        | Structure de base d’une page                           |
| Arborescence    | Les widgets sont **imbriqués** les uns dans les autres |

---

## Retour à la [Table des matières – Cours Flutter](#tb)

