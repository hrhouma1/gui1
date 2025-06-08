<h1 id="dio-exemple-2">Application Flutter – Liste de pays avec Dio</h1>

### Objectif :

Afficher une liste de pays avec leur nom et leur drapeau, en utilisant Dio.

---

## Étape 1 – Dépendance

Dans le fichier `pubspec.yaml` :

```yaml
dependencies:
  flutter:
    sdk: flutter
  dio: ^5.4.0
```

---

## Étape 2 – Code complet de l'application

```dart
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liste de pays',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const CountriesPage(),
    );
  }
}

class CountriesPage extends StatefulWidget {
  const CountriesPage({super.key});

  @override
  State<CountriesPage> createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  final Dio _dio = Dio();
  List<dynamic> _countries = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    fetchCountries();
  }

  Future<void> fetchCountries() async {
    const url = 'https://restcountries.com/v3.1/all';

    try {
      final response = await _dio.get(url);
      setState(() {
        _countries = response.data;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Erreur lors de la récupération des pays.';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Pays')),
        body: Center(child: Text(_error!)),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Liste des pays')),
      body: ListView.builder(
        itemCount: _countries.length,
        itemBuilder: (context, index) {
          final country = _countries[index];
          final name = country['name']['common'] ?? 'Sans nom';
          final flagUrl = country['flags']['png'];

          return ListTile(
            leading: Image.network(flagUrl, width: 40),
            title: Text(name),
          );
        },
      ),
    );
  }
}
```

---

## Résultat attendu

* L'application affiche une **liste des pays** du monde avec leur **nom** et leur **drapeau**.
* Les données proviennent de l’API `https://restcountries.com/v3.1/all`.

