# <h1 id="tp-go-router-provider">TP – Partage de données entre pages avec `go_router` + `Provider`</h1>

## <h2 id="objectif">Objectifs</h2>

* Utiliser `Provider` pour stocker et partager une variable (ex : nom de l’utilisateur)
* Modifier cette variable depuis `/form`
* L'afficher dynamiquement dans `/messages`
* Maintenir une structure avec `go_router` + `ShellRoute` + `BottomNavigationBar`

---

## <h2 id="1">1. Dépendances à ajouter</h2>

Dans `pubspec.yaml` :

```yaml
dependencies:
  flutter:
    sdk: flutter
  go_router: ^14.1.1
  provider: ^6.1.2
```

Puis :

```bash
flutter pub get
```

---

## <h2 id="2">2. Créer un `UserProvider`</h2>

```dart
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _name = '';

  String get name => _name;

  void updateName(String newName) {
    _name = newName;
    notifyListeners(); // prévient les widgets qui écoutent
  }
}
```

---

## <h2 id="3">3. Structure du projet</h2>

### `main.dart` – configuration `Provider` + `go_router`

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'user_provider.dart'; // ← classe ci-dessus

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: const MyApp(),
    ),
  );
}
```

---

### `MyApp` + `go_router` + `ShellRoute`

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      initialLocation: '/form',
      routes: [
        ShellRoute(
          builder: (context, state, child) => RootScaffold(child: child),
          routes: [
            GoRoute(path: '/form', builder: (_, __) => const FormPage()),
            GoRoute(path: '/messages', builder: (_, __) => const MessagePage()),
            GoRoute(path: '/settings', builder: (_, __) => const SettingsPage()),
          ],
        ),
      ],
    );

    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'App TP',
    );
  }
}
```

---

## <h2 id="4">4. Interface avec `BottomNavigationBar`</h2>

```dart
class RootScaffold extends StatelessWidget {
  final Widget child;
  const RootScaffold({super.key, required this.child});

  static const tabs = ['/form', '/messages', '/settings'];

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    int currentIndex = tabs.indexWhere((t) => location.startsWith(t));
    if (currentIndex == -1) currentIndex = 0;

    return Scaffold(
      appBar: AppBar(title: const Text('TP Navigation & Provider')),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => context.go(tabs[i]),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Formulaire'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Réglages'),
        ],
      ),
    );
  }
}
```

---

## <h2 id="5">5. Page 1 – Saisie du nom</h2>

```dart
class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _controller = TextEditingController();

  void _validerNom() {
    final userProvider = context.read<UserProvider>();
    userProvider.updateName(_controller.text);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Nom enregistré')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(labelText: 'Entrez votre nom'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: _validerNom,
            child: const Text('Enregistrer'),
          ),
        ],
      ),
    );
  }
}
```

---

## <h2 id="6">6. Page 2 – Affichage dynamique</h2>

```dart
class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final name = context.watch<UserProvider>().name;

    return Center(
      child: Text(
        name.isEmpty
            ? 'Aucun nom enregistré'
            : 'Bonjour, $name ! Voici vos messages.',
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
```

---

## <h2 id="7">7. Page 3 – Réglages (bonus)</h2>

```dart
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SwitchListTile(
          title: const Text('Mode sombre'),
          value: _darkMode,
          onChanged: (val) => setState(() => _darkMode = val),
        ),
      ],
    );
  }
}
```

---

## <h2 id="8">8. Résultat attendu</h2>

| Page        | Fonction                                                  |
| ----------- | --------------------------------------------------------- |
| `/form`     | L’utilisateur saisit son **nom**                          |
| `/messages` | Le nom est **réaffiché dynamiquement** grâce à `Provider` |
| `/settings` | Une page bonus avec switch                                |


<br/>
<br/>

# Exercice 1 :


- Faites une version avec validation du formulaire (vide interdit).
- Réalisez un export GitHub complet prêt à cloner avec ce projet.

