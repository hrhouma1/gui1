# **Comprendre l’organisation d’un projet Flutter**



## <h1 id="table-des-matieres">Table des matières</h1>

<ul>
  <li><a href="#1">1. Structure générale d’un projet Flutter</a></li>
  <li><a href="#2">2. Le dossier <code>lib/</code> : le cœur de l’application</a></li>
  <li><a href="#3">3. Le fichier <code>pubspec.yaml</code> : configuration et dépendances</a></li>
  <li><a href="#4">4. Le dossier <code>assets/</code> : images, polices, fichiers statiques</a></li>
  <li><a href="#5">5. Les autres dossiers et fichiers utiles</a></li>
  <li><a href="#6">6. Résumé visuel de l’architecture</a></li>
</ul>



## <h1 id="1">1. Structure générale d’un projet Flutter</h1>

Lorsque vous créez un projet Flutter avec la commande :

```bash
flutter create mon_projet
```

Voici les principaux éléments générés automatiquement :

```
mon_projet/
├── android/          # Code spécifique à Android
├── ios/              # Code spécifique à iOS
├── lib/              # Contient le code Dart de l'application
├── test/             # Contient les tests unitaires
├── web/              # (optionnel) pour les applications web
├── pubspec.yaml      # Fichier de configuration du projet
├── .dart_tool/       # Dossier interne généré automatiquement
├── build/            # Fichiers de build générés automatiquement
```

> Pour Flutter, **le code principal est toujours dans le dossier `lib/`**. C’est là que vous allez travailler quotidiennement.

---

## <h1 id="2">2. Le dossier <code>lib/</code> : le cœur de l’application</h1>

Le dossier `lib/` contient tout le code Dart. Par défaut, il contient :

```
lib/
└── main.dart       # Point d’entrée principal de l’application
```

### À retenir :

* `main.dart` contient une fonction `main()` qui lance l’application avec `runApp()`
* C’est ici que se trouvent vos widgets, pages, états, services, etc.

### Bonnes pratiques :

Organiser le code dans `lib/` en sous-dossiers :

```
lib/
├── main.dart
├── screens/          # Écrans de l'application (pages)
├── widgets/          # Composants personnalisés réutilisables
├── models/           # Données, classes
├── services/         # Logique métier ou appels API
```



## <h1 id="3">3. Le fichier <code>pubspec.yaml</code> : configuration et dépendances</h1>

Le fichier `pubspec.yaml` est **essentiel**. C’est lui qui déclare :

* Le **nom du projet**
* Sa **version**
* Les **packages externes** utilisés (comme `http`, `provider`, `flutter_lints`, etc.)
* Les **assets** (images, polices, etc.)

### Exemple :

```yaml
name: mon_projet
version: 1.0.0+1

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  provider: ^6.0.0

flutter:
  assets:
    - assets/images/
  fonts:
    - family: Roboto
      fonts:
        - asset: assets/fonts/Roboto-Regular.ttf
```

### Commandes utiles :

* `flutter pub get` : télécharge les dépendances
* `flutter pub upgrade` : met à jour les packages



## <h1 id="4">4. Le dossier <code>assets/</code> : fichiers statiques</h1>

Ce dossier n’est pas créé automatiquement. Vous pouvez le créer vous-même pour y stocker :

* Images (`.png`, `.jpg`, etc.)
* Polices (`.ttf`)
* Fichiers JSON ou autres données statiques

### Exemple d’arborescence :

```
assets/
├── images/
│   └── logo.png
├── fonts/
│   └── Roboto-Regular.ttf
├── data/
│   └── questions.json
```

N’oubliez pas de **déclarer tous les assets utilisés** dans `pubspec.yaml`.



## <h1 id="5">5. Autres dossiers et fichiers</h1>

| Élément                | Rôle                                                                |
| ---------------------- | ------------------------------------------------------------------- |
| `android/`             | Code natif Android (manifeste, configuration Gradle)                |
| `ios/`                 | Code natif iOS (Xcode, permissions, AppDelegate)                    |
| `web/`                 | Code spécifique pour le déploiement web (HTML, JS, favicon)         |
| `test/`                | Dossier pour écrire des tests unitaires en Dart                     |
| `.dart_tool/`          | Fichiers générés automatiquement par Flutter/Dart (ne pas modifier) |
| `.idea/` ou `.vscode/` | Paramètres de votre éditeur de code (ne pas versionner en général)  |


## <h1 id="6">6. Résumé visuel de l’architecture</h1>

```
mon_projet/
├── lib/
│   ├── main.dart
│   ├── screens/
│   ├── widgets/
│   ├── models/
│   └── services/
├── assets/
│   ├── images/
│   ├── fonts/
│   └── data/
├── pubspec.yaml
├── android/
├── ios/
├── test/
```



## <h1 id="conclusion">Conclusion</h1>

Comprendre l’organisation d’un projet Flutter est **indispensable** pour :

* Naviguer efficacement dans votre code
* Ajouter des ressources correctement
* Structurer une application maintenable et évolutive
* Collaborer avec d’autres développeurs

Ce socle nous permet de nous concentrer ensuite sur la logique métier, les interfaces, et la gestion des états.

