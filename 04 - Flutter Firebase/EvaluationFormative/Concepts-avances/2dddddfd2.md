# Démos exhaustives : SharedPreferences dans Flutter

Chaque section comporte :

1. Un extrait de code autonome et directement exécutable (ou à copier tel quel).
2. Une explication technique concise.
3. Une série de **questions d’analyse** destinées à vérifier la compréhension des bases et des implications techniques.

---

## 1. Lecture / écriture de types simples (String, int, bool)

```dart
// main.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const CounterPage());
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late SharedPreferences prefs;
  int counter = 0;
  bool darkMode = false;

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt('counter') ?? 0;          // lecture
      darkMode = prefs.getBool('dark_mode') ?? false;  // lecture
    });
  }

  Future<void> _increment() async {
    setState(() => counter += 1);
    await prefs.setInt('counter', counter);            // écriture
  }

  Future<void> _toggleTheme(bool value) async {
    setState(() => darkMode = value);
    await prefs.setBool('dark_mode', darkMode);        // écriture
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? Colors.grey[900] : Colors.white,
      appBar: AppBar(title: const Text('SharedPrefs – Types simples')),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text('Compteur : $counter', style: const TextStyle(fontSize: 30)),
          Switch(value: darkMode, onChanged: _toggleTheme),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _increment,
            child: const Text('Incrémenter'),
          ),
        ]),
      ),
    );
  }
}
```

### Questions d’analyse

1. Pourquoi `SharedPreferences.getInstance()` est-il obligatoirement asynchrone ?
2. Quel comportement observe-t-on si la clé `'counter'` n’existe pas au premier lancement ?
3. Expliquer la différence d’usage entre `setInt()` et `getInt()` dans ce contexte.

---

## 2. Stocker et lire une `List<String>`

```dart
Future<void> saveFavoriteCities(List<String> cities) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('favorite_cities', cities);
}

Future<List<String>> loadFavoriteCities() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('favorite_cities') ?? <String>[];
}
```

### Questions d’analyse

* Quelle méthode équivalente n’existe pas pour `List<int>` et pour quelle raison ?
* Quelle valeur renvoie `getStringList` si la clé n’a jamais été créée ?

---

## 3. Sérialiser un objet complexe en JSON

```dart
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserSettings {
  final String username;
  final int fontSize;

  UserSettings({required this.username, required this.fontSize});

  Map<String, dynamic> toJson() => {
        'username': username,
        'fontSize': fontSize,
      };

  factory UserSettings.fromJson(Map<String, dynamic> json) => UserSettings(
        username: json['username'] as String,
        fontSize: json['fontSize'] as int,
      );
}

Future<void> saveSettings(UserSettings settings) async {
  final prefs = await SharedPreferences.getInstance();
  final jsonString = jsonEncode(settings.toJson());
  await prefs.setString('user_settings', jsonString);
}

Future<UserSettings?> loadSettings() async {
  final prefs = await SharedPreferences.getInstance();
  final jsonString = prefs.getString('user_settings');
  if (jsonString == null) return null;
  return UserSettings.fromJson(jsonDecode(jsonString));
}
```

### Questions d’analyse

1. Pourquoi la sérialisation en chaîne JSON est-elle nécessaire avant la sauvegarde ?
2. Quels problèmes pourraient survenir si l’objet était stocké sans sérialisation ?

---

## 4. Service Singleton pour centraliser l’accès

```dart
class PrefService {
  PrefService._internal();
  static final PrefService instance = PrefService._internal();

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  int get launchCount => _prefs.getInt('launch_count') ?? 0;

  Future<void> incrementLaunchCount() async {
    await _prefs.setInt('launch_count', launchCount + 1);
  }

  Future<void> clearAll() async => _prefs.clear();
}
```

### Exemple d’utilisation

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefService.instance.init();
  await PrefService.instance.incrementLaunchCount();
  runApp(const MyApp());
}
```

### Questions d’analyse

* Avantages d’un singleton dédié comparé à des appels répétés à `SharedPreferences.getInstance()` dans plusieurs classes ?
* Pourquoi `WidgetsFlutterBinding.ensureInitialized()` est-il appelé avant `runApp` dans ce scénario ?

---

## 5. Supprimer une clé et réinitialiser les préférences

```dart
Future<void> deleteUsername() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('username');
}

Future<void> resetApp() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear(); // supprime toutes les clés
}
```

### Questions d’analyse

1. Différence fonctionnelle entre `remove('key')` et `clear()` ?
2. Dans quel cas l’appel indiscriminé à `clear()` peut-il poser un risque en production ?

---

## 6. Lecture différée avec `FutureBuilder`

```dart
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  Future<String?> _getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _getUsername(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        final user = snapshot.data;
        return Text(user == null ? 'Invité' : 'Bonjour, $user');
      },
    );
  }
}
```

### Questions d’analyse

* Justifier l’utilisation de `FutureBuilder` dans cet écran de bienvenue.
* Quel affichage exact renvoie le widget si la clé `'username'` est absente dans la base de préférences ?

---

## 7. Exemple complet : thème sombre persistant

```dart
// settings_provider.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  bool _darkMode = false;
  bool get darkMode => _darkMode;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    _darkMode = prefs.getBool('dark_mode') ?? false;
    notifyListeners();
  }

  Future<void> toggleDarkMode() async {
    _darkMode = !_darkMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('dark_mode', _darkMode);
    notifyListeners();
  }
}
```

### Intégration dans `main.dart`

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settings = SettingsProvider();
  await settings.load();
  runApp(ChangeNotifierProvider.value(
    value: settings,
    child: const MyApp(),
  ));
}
```

### Widget consommateur

```dart
class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsProvider>();
    return Switch(
      value: settings.darkMode,
      onChanged: (_) => settings.toggleDarkMode(),
    );
  }
}
```

### Questions d’analyse

1. Pourquoi la méthode `load()` est-elle appelée avant `runApp` ?
2. Quel est le rôle exact de `ChangeNotifierProvider` dans ce flux ?
3. Quelle conséquence directe aurait l’omission de `notifyListeners()` dans `toggleDarkMode()` ?

---

## Exercice d’approfondissement

**Objectif :** implémenter un écran « Paramètres » capable de mémoriser trois éléments persistants :

* la langue de l’interface (`String`) ;
* un booléen « notifications activées » ;
* une liste de favoris (`List<String>`).

**Travail attendu :**

1. créer un service de persistance basé sur `SharedPreferences` ;
2. proposer une interface utilisateur réactive avec Provider ou Riverpod ;
3. démontrer, via logs ou tests unitaires, la bonne conservation des données après redémarrage de l’application.

Pour aller plus loin, prévoir une version chiffrée de la liste de favoris en utilisant `flutter_secure_storage`.
