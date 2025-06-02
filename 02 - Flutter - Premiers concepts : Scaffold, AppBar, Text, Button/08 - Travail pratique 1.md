# Travail pratique 1 pour initiation aux interfaces graphiques Flutter

## Table des matières

* [1. Préparation de l’environnement](#1-préparation-de-lenvironnement)

  * [a) Créer un dossier pour le projet](#a-créer-un-dossier-pour-le-projet)
  * [b) Créer le projet Flutter](#b-créer-le-projet-flutter)
  * [c) Lancer l’application Flutter](#c-lancer-lapplication-flutter)
* [2. Structure recommandée du projet](#2-structure-recommandée-du-projet)
* [3. Contenu de base de `main.dart`](#3-contenu-de-base-de-maindart)
* [4. Utilisation avec Visual Studio Code](#4-utilisation-avec-visual-studio-code)
* [5. Remarques](#5-remarques)

<br/>
<br/>



# 1. Préparation de l’environnement

* *Flutter utilise un SDK dédié, que vous devez avoir installé au préalable (voir documentation officielle : flutter.dev).*
* *Les commandes suivantes sont valables dans n’importe quel terminal (PowerShell, Terminal macOS, Terminal Linux, ou terminal intégré de VS Code).*

<br/>

## a) Créer un dossier pour le projet

```bash
mkdir projet_flutter
cd projet_flutter
```

<br/>

## b) Créer le projet Flutter

```bash
flutter create mon_app
cd mon_app
```

Cette commande :

* Crée tous les fichiers nécessaires à un projet Flutter
* Initialise automatiquement les dépendances
* Configure Android, iOS, web et desktop (selon votre OS)

<br/>

## c) Lancer l’application Flutter

* Pour lancer l'application sur un terminal classique :

```bash
flutter run
```

* Pour exécuter via un éditeur (VS Code par exemple), vous pouvez utiliser `F5` (Start Debugging).

> **Remarque** : Si vous avez un émulateur ou un appareil branché, Flutter détectera automatiquement la cible.

[Revenir à la Table des matières](#table-des-matières)

<br/>
<br/>



# 2. Structure recommandée du projet

```
mon_app/
│
├── android/                # Code Android natif (automatique)
├── ios/                    # Code iOS natif (automatique)
├── lib/
│   └── main.dart           # Fichier principal de l'application
├── test/                   # Tests unitaires
├── pubspec.yaml            # Fichier de configuration des dépendances
└── README.md               # Description du projet
```

> Tous vos fichiers **Flutter/Dart** seront créés dans le dossier `lib/`.

[Revenir à la Table des matières](#table-des-matières)

<br/>
<br/>



# 3. Contenu de base de `main.dart`

Voici un exemple simple d’interface graphique Flutter avec un champ de saisie et un bouton :

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
      title: 'TP 1 – Flutter',
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
  final TextEditingController _controllerNom = TextEditingController();

  void direBonjour() {
    final nom = _controllerNom.text.trim();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Bienvenue"),
        content: Text("Bonjour, $nom !"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ma première app Flutter")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Entrez votre nom :", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            TextField(
              controller: _controllerNom,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: direBonjour,
              child: const Text("Dire Bonjour"),
            ),
          ],
        ),
      ),
    );
  }
}
```

Ce programme :

* Affiche une zone de texte
* Attend que l’utilisateur saisisse son nom
* Affiche un message personnalisé dans une boîte de dialogue

[Revenir à la Table des matières](#table-des-matières)

<br/>
<br/>



# 4. Utilisation avec Visual Studio Code

1. Ouvrir le projet dans VS Code :

```bash
code .
```

2. S’assurer que les extensions suivantes sont installées :

   * **Flutter**
   * **Dart**

3. Ouvrir le fichier `lib/main.dart`

4. Lancer l’application :

   * Soit avec le bouton `▶ Run` en haut
   * Soit avec `F5`

5. Pour choisir un appareil cible (simulateur ou téléphone réel), cliquer en bas à droite de VS Code (section `No Device` ou nom de l’émulateur).

6. Si plusieurs appareils sont détectés, vous pouvez les lister avec :

```bash
flutter devices
```

[Revenir à la Table des matières](#table-des-matières)

<br/>
<br/>



# 5. Remarques

* Flutter gère le hot-reload : chaque modification du code est reflétée instantanément dans l’interface.
* L’exemple du TP peut évoluer avec de nombreux widgets supplémentaires (`DropdownButton`, `Checkbox`, `Form`, etc.).
* Vous pouvez organiser le code dans plusieurs fichiers pour plus de clarté (`lib/screens/`, `lib/widgets/`, etc.).
* Les messages d'erreur sont souvent très explicites et vous guident dans la résolution.

[Revenir à la Table des matières](#table-des-matières)

<br/>
<br/>
