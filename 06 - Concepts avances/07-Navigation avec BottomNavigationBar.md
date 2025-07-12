# <h1 id="bottom-nav">Navigation avec `BottomNavigationBar`</h1>

## <h2 id="objectif">Objectifs</h2>

* Afficher une barre d’onglets en bas de l’écran
* Afficher une page différente selon l’onglet sélectionné
* Rester sur la même interface sans empiler de routes

---

## <h2 id="1">1. Code complet – Exemple avec 3 onglets</h2>

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
```

---

### `RootScreen` : conteneur principal avec `BottomNavigationBar`

```dart
class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    Page1(),
    Page2(),
    Page3(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Change d’onglet
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Application Onglets')),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Paramètres',
          ),
        ],
      ),
    );
  }
}
```

---

### `Page1`, `Page2`, `Page3` (interfaces simples)

```dart
class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Bienvenue sur la Page 1'),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Bienvenue sur la Page 2'),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Bienvenue sur la Page 3'),
    );
  }
}
```

---

## <h2 id="2">2. Résultat attendu</h2>

* Une **barre d’onglets** s’affiche en bas avec 3 boutons.
* Cliquer sur un onglet **change la page affichée**.
* Aucune pile de navigation (`push`, `pop`) : tout est géré par `IndexedStack`.

---

## <h2 id="3">3. Astuce pour garder l’état des pages</h2>

Si vous voulez que chaque page **conserve son état** (ex : champs de texte), utilisez `IndexedStack` :

```dart
body: IndexedStack(
  index: _selectedIndex,
  children: _pages,
),
```

