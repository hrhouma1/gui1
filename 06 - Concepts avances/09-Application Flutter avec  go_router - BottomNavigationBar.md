# <h1 id="go-router-bottom">Application Flutter avec `go_router` + `BottomNavigationBar`</h1>

## <h2 id="objectif">Objectifs pédagogiques</h2>

* Apprendre à configurer `go_router`
* Naviguer entre plusieurs pages (onglets) via `ShellRoute`
* Garder les URL propres (`/form`, `/messages`, `/settings`)
* Afficher une `BottomNavigationBar` persistante

---

## <h2 id="1">1. Dépendance à ajouter</h2>

Dans le fichier `pubspec.yaml` :

```yaml
dependencies:
  flutter:
    sdk: flutter
  go_router: ^14.1.1
```

Ensuite :

```bash
flutter pub get
```

---

## <h2 id="2">2. Code complet avec `go_router` et `ShellRoute`</h2>

```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const MyApp());

final GoRouter _router = GoRouter(
  initialLocation: '/form',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return RootScaffold(child: child);
      },
      routes: [
        GoRoute(
          path: '/form',
          builder: (context, state) => const FormPage(),
        ),
        GoRoute(
          path: '/messages',
          builder: (context, state) => const MessagePage(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsPage(),
        ),
      ],
    ),
  ],
);
```

---

### `MyApp` avec `MaterialApp.router`

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'App Onglets + go_router',
      routerConfig: _router,
    );
  }
}
```

---

### `RootScaffold` avec `BottomNavigationBar`

```dart
class RootScaffold extends StatelessWidget {
  final Widget child;
  const RootScaffold({super.key, required this.child});

  static final tabs = [
    '/form',
    '/messages',
    '/settings',
  ];

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    int currentIndex = tabs.indexWhere((path) => location.startsWith(path));
    if (currentIndex == -1) currentIndex = 0;

    return Scaffold(
      appBar: AppBar(title: const Text('App go_router')),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => context.go(tabs[index]),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Formulaire',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Réglages',
          ),
        ],
      ),
    );
  }
}
```

---

## <h2 id="3">3. Contenu des trois pages</h2>

### `FormPage` – Page de formulaire simple

```dart
class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _controller = TextEditingController();
  String _greeting = '';

  void _submit() {
    setState(() {
      _greeting = 'Bonjour, ${_controller.text} !';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(labelText: 'Votre nom'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: _submit,
            child: const Text('Valider'),
          ),
          const SizedBox(height: 20),
          Text(_greeting, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
```

---

### `MessagePage` – Affichage de messages

```dart
class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  final List<String> _messages = const [
    'Bienvenue dans l\'application !',
    'Votre compte a été mis à jour.',
    'Nouveau message de l\'administrateur.',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: _messages.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.notifications),
          title: Text(_messages[index]),
        );
      },
    );
  }
}
```

---

### `SettingsPage` – Page de réglages

```dart
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  double _volume = 0.3;

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
        const SizedBox(height: 10),
        Text('Volume : ${(_volume * 100).round()} %'),
        Slider(
          value: _volume,
          min: 0,
          max: 1,
          onChanged: (val) => setState(() => _volume = val),
        ),
      ],
    );
  }
}
```

---

## <h2 id="4">4. Résultat attendu</h2>

* Barre de navigation en bas avec 3 onglets
* URL qui change : `/form`, `/messages`, `/settings`
* Comportement fluide et propre avec `go_router` + `ShellRoute`


