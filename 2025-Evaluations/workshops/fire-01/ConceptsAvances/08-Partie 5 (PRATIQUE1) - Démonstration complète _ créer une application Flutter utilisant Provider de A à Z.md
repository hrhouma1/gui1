# Démonstration complète : créer une **application Flutter** utilisant **Provider** de A à Z

Le projet affiche un compteur au centre de l’écran, un bouton « + » pour l’incrémenter et prouve que l’état est géré par Provider (aucun `setState` dans l’UI).

---

## 1. Pré-requis

| Outil            | Version recommandée                             |
| ---------------- | ----------------------------------------------- |
| Flutter SDK      | 3.x (stable)                                    |
| IDE              | VS Code ou Android Studio                       |
| Extension IDE    | « Flutter » et « Dart »                         |
| Appareil de test | Émulateur ou appareil physique en mode débogage |

---

## 2. Création du projet

```bash
flutter create provider_demo
cd provider_demo
```

---

## 3. Ajouter la dépendance Provider

Dans `pubspec.yaml`, sous `dependencies:` :

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.0
```

Puis téléchargez les paquets :

```bash
flutter pub get
```

---

## 4. Arborescence minimale

```
lib/
 ├─ main.dart
 ├─ providers/
 │   └─ counter_provider.dart
 └─ screens/
     └─ home_screen.dart
```

Créez les dossiers `providers` et `screens`.

---

## 5. Écriture du code

### 5.1 `lib/providers/counter_provider.dart`

```dart
import 'package:flutter/material.dart';

/// Tableau blanc : contient la donnée et “crie” quand elle change
class CounterProvider extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;          // modifie la donnée
    notifyListeners(); // avertit les widgets qui écoutent
  }
}
```

---

### 5.2 `lib/screens/home_screen.dart`

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/counter_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Récupère la valeur actuelle et écoute les mises à jour
    final counter = context.watch<CounterProvider>().count;

    return Scaffold(
      appBar: AppBar(title: const Text('Demo Provider')),
      body: Center(
        child: Text(
          'Compteur : $counter',
          style: const TextStyle(fontSize: 32),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        // Utilise read() pour appeler la méthode (sans écouter)
        onPressed: () => context.read<CounterProvider>().increment(),
      ),
    );
  }
}
```

---

### 5.3 `lib/main.dart`

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/counter_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    // Fournit le CounterProvider à toute l’application
    ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomeScreen(),
    );
  }
}
```

---

## 6. Lancer l’application

```bash
flutter run
```

* Appuyez sur le bouton **➕** : le texte « Compteur : X » s’incrémente.
* Aucune méthode `setState` n’est utilisée ; `CounterProvider` gère l’état global.

---

## 7. Vérifier le Hot Reload

1. Laissez l’app tourner en **mode Debug**.
2. Ouvrez `counter_provider.dart` et changez l’incrément de `1` à `2` :

```dart
void increment() {
  _count = _count + 2;
  notifyListeners();
}
```

3. Sauvegardez (`Ctrl + S` ou `Cmd + S`).
4. L’IDE effectue un **Hot Reload** ; l’application se met à jour instantanément.
   Les clics sur le bouton incrémentent désormais de 2 et la valeur du compteur **n’a pas été réinitialisée**.

---

## 8. Explications rapides

| Élément                            | Rôle                                                                                         |
| ---------------------------------- | -------------------------------------------------------------------------------------------- |
| `CounterProvider`                  | Stocke la valeur, contient `increment()`, appelle `notifyListeners()` quand la valeur change |
| `ChangeNotifierProvider`           | Place `CounterProvider` en haut de l’arbre des widgets                                       |
| `context.watch<CounterProvider>()` | Lit la valeur **et** se reconstruit à chaque changement                                      |
| `context.read<CounterProvider>()`  | Accède au même objet **sans** écouter (utile dans un `onPressed`)                            |

---

## 9. Extensions possibles

1. **Ajouter un bouton « – »** dans le même provider (`decrement()`).
2. **Sauvegarder** la valeur du compteur dans **SharedPreferences** ou **Firestore**.
3. Remplacer `ChangeNotifierProvider` par **`MultiProvider`** si vous avez plusieurs états (ex. favori, thème, authentification).
4. Utiliser **`Selector`** pour n’écouter qu’une partie de l’objet si celui-ci devient gros.

---

### Résultat

Vous avez créé une application Flutter complète, avec Provider, qui :

* Fournit un état global (`CounterProvider`)
* Le modifie sans `setState`
* Met à jour l’interface automatiquement et instantanément (Hot Reload)

