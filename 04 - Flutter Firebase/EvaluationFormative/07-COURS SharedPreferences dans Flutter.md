# <h1 id="sharedprefs-flutter">Cours Flutter – SharedPreferences (Persistance locale)</h1>

---

## <h2 id="objectif">Objectifs pédagogiques</h2>

À la fin de ce cours, vous serez capable de :

* Comprendre ce qu’est `SharedPreferences` dans Flutter.
* Lire, écrire et supprimer des données locales persistantes (String, int, bool, List).
* Gérer l’état persistant d’une application (ex. thème, préférences utilisateur).
* Intégrer `SharedPreferences` dans une architecture propre (Service Singleton, Provider).
* Comprendre les bonnes pratiques et les limites de ce mécanisme.

---

## <h2 id="intro">1. Introduction à SharedPreferences</h2>

**Définition** :
`SharedPreferences` est un plugin Flutter permettant de stocker des **paires clé-valeur** de façon **persistante** sur l’appareil de l’utilisateur.

**Cas d’usage typiques** :

* Se souvenir du nom d’utilisateur
* Mémoriser le thème sélectionné
* Sauvegarder un compteur ou des options de configuration

---

## <h2 id="types-supportes">2. Types supportés</h2>

| Type Dart      | Méthode d’écriture        | Méthode de lecture   |
| -------------- | ------------------------- | -------------------- |
| `String`       | `setString(key, value)`   | `getString(key)`     |
| `int`          | `setInt(key, value)`      | `getInt(key)`        |
| `double`       | `setDouble(key, value)`   | `getDouble(key)`     |
| `bool`         | `setBool(key, value)`     | `getBool(key)`       |
| `List<String>` | `setStringList(key, val)` | `getStringList(key)` |

---

## <h2 id="install">3. Installation du package</h2>

Ajoutez la dépendance dans `pubspec.yaml` :

```yaml
dependencies:
  shared_preferences: ^2.2.2
```

Puis exécutez :

```
flutter pub get
```

---

## <h2 id="init">4. Initialisation de SharedPreferences</h2>

L’instance est asynchrone. On l’obtient ainsi :

```dart
final prefs = await SharedPreferences.getInstance();
```

---

## <h2 id="exemple-simples">5. Lecture et écriture simples</h2>

### Exemple complet :

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('counter', 42);
  final value = prefs.getInt('counter') ?? 0;
  print('Valeur lue : $value');
}
```

---

## <h2 id="stateful-demo">6. Démo dans un StatefulWidget</h2>

```dart
class CounterPage extends StatefulWidget {
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late SharedPreferences prefs;
  int counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  Future<void> _loadCounter() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt('counter') ?? 0;
    });
  }

  Future<void> _increment() async {
    setState(() => counter++);
    await prefs.setInt('counter', counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Compteur')),
      body: Center(child: Text('Valeur : $counter')),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

---

## <h2 id="list-string">7. Stocker une List<String></h2>

```dart
await prefs.setStringList('fruits', ['pomme', 'banane', 'fraise']);
final fruits = prefs.getStringList('fruits') ?? [];
```

---

## <h2 id="json">8. Sérialisation JSON</h2>

Pour stocker un objet, il faut **le convertir en chaîne JSON** :

```dart
final jsonString = jsonEncode({'nom': 'Ali', 'age': 30});
await prefs.setString('user', jsonString);
```

Puis pour lire :

```dart
final jsonString = prefs.getString('user');
final user = jsonDecode(jsonString!);
```

---

## <h2 id="delete">9. Suppression de données</h2>

```dart
await prefs.remove('counter'); // Supprime une seule clé
await prefs.clear();           // Supprime toutes les clés
```

---

## <h2 id="futurebuilder">10. Accès différé avec FutureBuilder</h2>

```dart
Future<String?> getUsername() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('username');
}

@override
Widget build(BuildContext context) {
  return FutureBuilder<String?>(
    future: getUsername(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return CircularProgressIndicator();
      return Text('Bienvenue ${snapshot.data}');
    },
  );
}
```

---

## <h2 id="service">11. Centraliser dans un Service Singleton</h2>

```dart
class PrefsService {
  static final PrefsService instance = PrefsService._internal();
  late SharedPreferences _prefs;

  PrefsService._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  int get launchCount => _prefs.getInt('launch') ?? 0;

  Future<void> incrementLaunch() async {
    await _prefs.setInt('launch', launchCount + 1);
  }
}
```

Appel depuis `main.dart` :

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsService.instance.init();
  runApp(const MyApp());
}
```

---

## <h2 id="avec-provider">12. Avec Provider – Thème sombre</h2>

### Classe SettingsProvider

```dart
class SettingsProvider with ChangeNotifier {
  bool _dark = false;

  bool get isDark => _dark;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    _dark = prefs.getBool('dark') ?? false;
    notifyListeners();
  }

  Future<void> toggle() async {
    _dark = !_dark;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('dark', _dark);
    notifyListeners();
  }
}
```

---

## <h2 id="bonnes-pratiques">13. Bonnes pratiques</h2>

* Toujours utiliser `await SharedPreferences.getInstance()` dans `initState()` ou avant `runApp`.
* Ne pas stocker des objets Dart directement, toujours passer par JSON.
* Éviter d'utiliser `SharedPreferences` pour des données sensibles (voir `flutter_secure_storage`).
* Utiliser un service unique pour centraliser l'accès et éviter les répétitions.

---

## <h2 id="conclusion">14. Conclusion</h2>

`SharedPreferences` est une solution légère et efficace pour la persistance de données simples dans Flutter. En la combinant avec des architectures propres (Provider, services), on peut créer des applications robustes, performantes et maintenables.
