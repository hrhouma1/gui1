# <h1 id="tp-donnees-onglets">TP – Partager des données entre onglets avec `BottomNavigationBar`</h1>

## <h2 id="objectif">Objectifs pédagogiques</h2>

* Naviguer entre onglets sans `push()`/`pop()`
* Partager une variable (`nom`) entre plusieurs interfaces
* Utiliser un `TextEditingController` dans l’onglet Formulaire
* Réutiliser les données saisies dans un autre onglet

---

## <h2 id="1">1. Résultat attendu</h2>

| Onglet            | Fonction                               |
| ----------------- | -------------------------------------- |
| **1. Formulaire** | Saisir un nom                          |
| **2. Résumé**     | Affiche "Bonjour, {nom}"               |
| **3. Réglages**   | Ajuste un niveau de volume (optionnel) |

---

## <h2 id="2">2. Code complet `main.dart`</h2>

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

## <h2 id="3">3. Widget racine `RootScreen` avec état partagé</h2>

```dart
class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;
  String _nomUtilisateur = '';
  double _volume = 0.5;

  void _changerNom(String nouveauNom) {
    setState(() {
      _nomUtilisateur = nouveauNom;
    });
  }

  void _changerVolume(double nouveauVolume) {
    setState(() {
      _volume = nouveauVolume;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      FormPage(
        nom: _nomUtilisateur,
        onNomChange: _changerNom,
      ),
      ResumePage(nom: _nomUtilisateur),
      SettingsPage(
        volume: _volume,
        onVolumeChange: _changerVolume,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('TP – Données partagées')),
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Formulaire'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Résumé'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Réglages'),
        ],
      ),
    );
  }
}
```

---

## <h2 id="4">4. Page Formulaire – `FormPage`</h2>

```dart
class FormPage extends StatefulWidget {
  final String nom;
  final ValueChanged<String> onNomChange;

  const FormPage({super.key, required this.nom, required this.onNomChange});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.nom);
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
            onPressed: () {
              widget.onNomChange(_controller.text);
              FocusScope.of(context).unfocus(); // cacher le clavier
            },
            child: const Text('Enregistrer'),
          ),
        ],
      ),
    );
  }
}
```

---

## <h2 id="5">5. Page Résumé – `ResumePage`</h2>

```dart
class ResumePage extends StatelessWidget {
  final String nom;

  const ResumePage({super.key, required this.nom});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        nom.isEmpty ? 'Aucun nom saisi' : 'Bonjour, $nom !',
        style: const TextStyle(fontSize: 22),
      ),
    );
  }
}
```

---

## <h2 id="6">6. Page Réglages – `SettingsPage`</h2>

```dart
class SettingsPage extends StatelessWidget {
  final double volume;
  final ValueChanged<double> onVolumeChange;

  const SettingsPage({
    super.key,
    required this.volume,
    required this.onVolumeChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text('Volume : ${((volume) * 100).round()} %'),
          Slider(
            value: volume,
            min: 0,
            max: 1,
            onChanged: onVolumeChange,
          ),
        ],
      ),
    );
  }
}
```

---

## <h2 id="7">7. Résumé du TP</h2>

| Élément                         | Fonction                                       |
| ------------------------------- | ---------------------------------------------- |
| `BottomNavigationBar`           | Change d’interface sans push/pop               |
| `setState`                      | Actualise les données partagées                |
| `onNomChange`, `onVolumeChange` | Fonctions callback passées aux sous-widgets    |
| `IndexedStack`                  | Garde les écrans actifs sans rebuild permanent |


