## Démo 1 : Afficher un message et le modifier avec un bouton

### Objectif :

* Comprendre la structure d'un projet Flutter
* Découvrir `main()`, `runApp()`, `StatefulWidget`, `setState()`
* Utiliser un `Text`, un `ElevatedButton`, et une `Column`



# 1 - Étape 1 – Créer le projet

Dans ton terminal :

```bash
flutter create mon_premier_app
cd mon_premier_app
flutter run
CTL + C
```



# 2 - Étape 2 – Ouvrir le projet dans VS Code

1. Ouvre Visual Studio Code
2. Clique sur `File > Open Folder`
3. Sélectionne le dossier `mon_premier_app`



# 3 - Étape 3 – Remplacer le contenu de `lib/main.dart`

Efface le contenu existant et copie-colle ce code :

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Démo Flutter',
      home: const PageAccueil(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PageAccueil extends StatefulWidget {
  const PageAccueil({super.key});

  @override
  State<PageAccueil> createState() => _PageAccueilState();
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
      appBar: AppBar(title: const Text('Exemple pédagogique')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: changerMessage,
              child: const Text('Changer le message'),
            ),
          ],
        ),
      ),
    );
  }
}
```



# 4 - Étape 4 – Lancer l’application

Dans le terminal de VS Code :

```bash
flutter run
```

Ou clique sur `Run > Start Debugging` (`F5`).

---

## Résultat attendu :

* L’application affiche "Bonjour le monde"
* Quand on clique sur le bouton, le texte devient "Tu as cliqué sur le bouton !"



# 5 - Étape 5 – Explication 

| Élément          | Rôle                                        |
| ---------------- | ------------------------------------------- |
| `main()`         | Point d’entrée du programme                 |
| `runApp()`       | Lance l’interface Flutter                   |
| `MaterialApp`    | Conteneur de l’application                  |
| `Scaffold`       | Structure standard : AppBar + body          |
| `StatefulWidget` | Permet de modifier dynamiquement le contenu |
| `setState()`     | Déclenche une mise à jour de l’interface    |

