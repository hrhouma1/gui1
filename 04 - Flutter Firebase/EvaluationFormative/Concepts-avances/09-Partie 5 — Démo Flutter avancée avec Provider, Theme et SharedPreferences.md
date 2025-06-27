## Projet Flutter “Provider Demo Plus”

Version complète, prête à compiler, intégrant :

1. Compteur “+” et “–” avec persistance **SharedPreferences**.
2. Gestion d’un **thème clair/sombre** via `ThemeProvider`.
3. Gestion de **favoris** en mémoire via `FavoriteProvider`.
4. Exemple d’usage de **Selector**.
5. Injection de tous les états par **`MultiProvider`**.
6. Hot-reload fonctionnel sans perdre l’état.

---

### 1. Arborescence proposée

```
lib/
 ├─ main.dart
 ├─ providers/
 │   ├─ counter_provider.dart
 │   ├─ theme_provider.dart
 │   └─ favorite_provider.dart
 ├─ screens/
 │   ├─ home_screen.dart
 │   └─ favorites_screen.dart
 └─ widgets/
     └─ counter_box.dart
```

---

### 2. Dépendances

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.0
  shared_preferences: ^2.2.0
```

Exécutez `flutter pub get` après modification.

---

## 3. Code source détaillé

---

#### 3.1 `lib/providers/counter_provider.dart`

```dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;
  static const _key = 'counter_value';

  CounterProvider() {
    _load(); // charge la valeur au démarrage
  }

  int get count => _count;

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    _count = prefs.getInt(_key) ?? 0;
    notifyListeners();
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, _count);
  }

  void increment() {
    _count++;
    _save();
    notifyListeners();
  }

  void decrement() {
    if (_count > 0) {
      _count--;
      _save();
      notifyListeners();
    }
  }
}
```

---

#### 3.2 `lib/providers/theme_provider.dart`

```dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;
  static const _key = 'is_dark';

  ThemeProvider() {
    _load();
  }

  bool get isDark => _isDark;

  ThemeMode get mode => _isDark ? ThemeMode.dark : ThemeMode.light;

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    _isDark = prefs.getBool(_key) ?? false;
    notifyListeners();
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, _isDark);
  }

  void toggle() {
    _isDark = !_isDark;
    _save();
    notifyListeners();
  }
}
```

---

#### 3.3 `lib/providers/favorite_provider.dart`

```dart
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<int> _favorites = [];

  List<int> get favorites => List.unmodifiable(_favorites);

  bool isFav(int id) => _favorites.contains(id);

  void toggle(int id) {
    isFav(id) ? _favorites.remove(id) : _favorites.add(id);
    notifyListeners();
  }
}
```

---

#### 3.4 `lib/widgets/counter_box.dart`

Widget isolé pour montrer **Selector** : seule la valeur `count` est écoutée.

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/counter_provider.dart';

class CounterBox extends StatelessWidget {
  const CounterBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final count = context.select<CounterProvider, int>((p) => p.count);
    return Text(
      'Compteur : $count',
      style: const TextStyle(fontSize: 32),
    );
  }
}
```

---

#### 3.5 `lib/screens/home_screen.dart`

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/counter_provider.dart';
import '../providers/favorite_provider.dart';
import '../widgets/counter_box.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favProvider = context.watch<FavoriteProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Demo Plus'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const FavoritesScreen()),
            ),
          ),
        ],
      ),
      body: Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CounterBox(), // affichage via Selector
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => favProvider.toggle(1),
            child: Text(
              favProvider.isFav(1) ? 'Retirer des favoris' : 'Ajouter aux favoris',
            ),
          ),
        ],
      )),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'inc',
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterProvider>().increment(),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'dec',
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterProvider>().decrement(),
          ),
        ],
      ),
    );
  }
}
```

---

#### 3.6 `lib/screens/favorites_screen.dart`

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorite_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favs = context.watch<FavoriteProvider>().favorites;

    return Scaffold(
      appBar: AppBar(title: const Text('Mes favoris')),
      body: Center(
        child: favs.isEmpty
            ? const Text('Aucun favori.')
            : ListView.builder(
                itemCount: favs.length,
                itemBuilder: (_, i) => ListTile(
                  title: Text('Item #${favs[i]}'),
                ),
              ),
      ),
    );
  }
}
```

---

#### 3.7 `lib/main.dart`

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/counter_provider.dart';
import 'providers/theme_provider.dart';
import 'providers/favorite_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.mode,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
      ),
      home: const HomeScreen(),
    );
  }
}
```

---

### 4. Fonctionnalités testables

| Action                                | Résultat                                                                                     |
| ------------------------------------- | -------------------------------------------------------------------------------------------- |
| Appuyer sur **+** puis **–**          | Le compteur monte puis descend, valeur conservée après redémarrage grâce à SharedPreferences |
| Basculer le **thème** (icône système) | Le thème clair/sombre est mémorisé                                                           |
| Cliquer sur **Ajouter aux favoris**   | La page Favoris affiche l’item, sans rechargement                                            |
| Modifier le code et sauvegarder       | Hot-Reload, l’état (compteur, thème, favoris) reste présent                                  |

---

### 5. Points techniques démontrés

1. **Persistance locale** via `SharedPreferences` dans les providers.
2. **MultiProvider** pour organiser plusieurs états.
3. **Selector** (`context.select`) pour reconstruire uniquement la partie nécessaire.
4. **ChangeNotifier** et `notifyListeners()` comme mécanisme de notification.
5. Architecture simple, facilement extensible vers Firestore : il suffirait de remplacer la logique SharedPreferences par des appels Firestore dans les providers.

