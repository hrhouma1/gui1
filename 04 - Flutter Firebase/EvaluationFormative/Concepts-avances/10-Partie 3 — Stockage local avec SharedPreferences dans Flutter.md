# Utiliser **SharedPreferences** dans Flutter

Objectif : apprendre à stocker et récupérer des données simples (booléen, texte, nombre, liste) de façon persistante sur l’appareil.



## 1. Pourquoi SharedPreferences ?

| Besoin                                     | Solution adaptée  |
| ------------------------------------------ | ----------------- |
| Conserver un paramètre (thème sombre)      | SharedPreferences |
| Mémoriser un compteur, un booléen “vu”     | SharedPreferences |
| Stockage clé-valeur, léger, hors ligne     | SharedPreferences |
| Pas de structure complexe (pas de requête) | SharedPreferences |

Pour des données plus volumineuses ou structurées, on préférera SQLite, Hive ou Firestore. Mais pour des préférences simples, `SharedPreferences` est suffisant.


## 2. Installation

Dans `pubspec.yaml`, ajouter :

```yaml
dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^2.2.0
```

Puis :

```bash
flutter pub get
```

---

## 3. Principe de fonctionnement

1. Le package fournit une **instance unique** via `SharedPreferences.getInstance()`.
2. On lit ou écrit des valeurs avec des méthodes synchrones (`getInt`, `setInt`, etc.).
3. Les données sont sérialisées et stockées sous forme de fichier dans la mémoire de l’appareil (iOS : NSUserDefaults, Android : SharedPreferences).

Types pris en charge : `int`, `double`, `bool`, `String`, `List<String>`.

---

## 4. Exemple pas-à-pas : mémoriser un compteur

### 4.1 Structure du projet

```
lib/
 ├─ main.dart
 └─ counter_service.dart
```

### 4.2 Code de service : `counter_service.dart`

```dart
import 'package:shared_preferences/shared_preferences.dart';

class CounterService {
  static const _key = 'counter_value';

  /// Lecture asynchrone
  Future<int> getCounter() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_key) ?? 0; // 0 si non trouvé
  }

  /// Écriture asynchrone
  Future<void> setCounter(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, value);
  }
}
```

### 4.3 Application principale : `main.dart`

```dart
import 'package:flutter/material.dart';
import 'counter_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final _service = CounterService();
  int _counter = 0;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  Future<void> _loadCounter() async {
    final value = await _service.getCounter();
    setState(() {
      _counter = value;
      _loading = false;
    });
  }

  Future<void> _increment() async {
    final newValue = _counter + 1;
    await _service.setCounter(newValue);
    setState(() => _counter = newValue);
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Compteur persistant')),
      body: Center(
        child: Text(
          'Valeur : $_counter',
          style: const TextStyle(fontSize: 32),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

### 4.4 Résultat attendu

1. Lancer l’app, le compteur affiche la valeur sauvegardée (0 au premier lancement).
2. Cliquer sur « + », la valeur s’incrémente.
3. Fermer l’app puis la relancer : la même valeur réapparaît (persistée).

---

## 5. Lecture/écriture de différents types

```dart
final prefs = await SharedPreferences.getInstance();

// Booléen
await prefs.setBool('dark_mode', true);
bool dark = prefs.getBool('dark_mode') ?? false;

// Chaîne
await prefs.setString('username', 'Alice');
String name = prefs.getString('username') ?? '';

// Double
await prefs.setDouble('volume', 0.8);
double vol = prefs.getDouble('volume') ?? 1.0;

// Liste de chaînes
await prefs.setStringList('tags', ['flutter', 'dart']);
List<String> tags = prefs.getStringList('tags') ?? [];
```

---

## 6. Nettoyer ou réinitialiser

```dart
await prefs.remove('counter_value'); // Supprime une seule clé
await prefs.clear();                // Efface tout (à éviter en production)
```

---

## 7. Intégration avec `Provider` (facultatif)

Pour ne pas bloquer l’interface, on place la logique SharedPreferences dans un `ChangeNotifier`.

```dart
class CounterProvider extends ChangeNotifier {
  final _service = CounterService();
  int _count = 0;
  bool _ready = false;

  int get count => _count;
  bool get ready => _ready;

  CounterProvider() {
    _init();
  }

  Future<void> _init() async {
    _count = await _service.getCounter();
    _ready = true;
    notifyListeners();
  }

  Future<void> increment() async {
    _count++;
    await _service.setCounter(_count);
    notifyListeners();
  }
}
```

Injectez ce provider avec `ChangeNotifierProvider`. Les étudiants peuvent ainsi voir la combinaison SharedPreferences + Provider.

---

## 8. Erreurs courantes

| Problème                  | Cause                                                               | Solution                                          |
| ------------------------- | ------------------------------------------------------------------- | ------------------------------------------------- |
| `LateInitializationError` | On lit la valeur avant d’attendre `SharedPreferences.getInstance()` | Rendre la méthode `async` et attendre le résultat |
| Blocage UI long           | Appel synchrone à SharedPreferences dans `build`                    | Charger en `initState` puis mettre à jour l’état  |
| Valeur non mise à jour    | Oubli de `await` ou de `notifyListeners()` (si Provider)            | Vérifier les `await` et les notifications         |

---

## 9. Points clés à retenir

1. SharedPreferences stocke des **paires clé-valeur** simples, pas des objets complexes.
2. Les méthodes sont **asynchrones** : toujours utiliser `await`.
3. Pour l’UX, charger les préférences au démarrage (écran splash ou `initState`).
4. Pour des structures riches (objets, listes complexes), envisager un stockage JSON dans un fichier ou une base locale.
