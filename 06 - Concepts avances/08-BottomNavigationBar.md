# <h1 id="exercice-bottom">Exercice – Application Flutter avec 3 onglets interactifs</h1>

## <h2 id="objectif">Objectifs pédagogiques</h2>

* Utiliser `BottomNavigationBar` pour naviguer entre 3 écrans
* Créer un **formulaire simple** avec champ texte et bouton
* Simuler des **messages** affichés dynamiquement
* Afficher des **options utilisateur** sur la dernière page

---

## <h2 id="1">1. Structure du projet</h2>

Fichier unique `main.dart` :

* Onglet 1 : **Formulaire (nom + bouton)**
* Onglet 2 : **Liste simulée de messages**
* Onglet 3 : **Réglages (Switch, Slider, etc.)**

---

## <h2 id="2">2. Code complet</h2>

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RootScreen(),
    );
  }
}

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    FormPage(),
    MessagePage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Application à Onglets')),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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

### Onglet 1 – `FormPage`

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

### Onglet 2 – `MessagePage`

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

### Onglet 3 – `SettingsPage`

```dart
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = false;
  double _volume = 0.5;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SwitchListTile(
          title: const Text('Mode sombre'),
          value: _isDarkMode,
          onChanged: (val) => setState(() => _isDarkMode = val),
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

## <h2 id="3">3. Résultat attendu</h2>

| Onglet         | Contenu                               |
| -------------- | ------------------------------------- |
| **Formulaire** | Saisie du nom et message personnalisé |
| **Messages**   | Liste d'exemples de notifications     |
| **Réglages**   | Switch (mode sombre), slider (volume) |


