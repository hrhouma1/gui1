<h1 id="app-dio-base">Application Flutter de base avec Dio</h1>

### Objectif :

Afficher une liste d'utilisateurs récupérés via une requête HTTP `GET`.

---

## Étape 1 – Ajouter Dio au projet

Dans `pubspec.yaml`, ajoute :

```yaml
dependencies:
  flutter:
    sdk: flutter
  dio: ^5.4.0  # ou la dernière version
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
      title: 'Dio Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const UsersPage(),
    );
  }
}

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final Dio _dio = Dio();
  List<dynamic> _users = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    const url = 'https://jsonplaceholder.typicode.com/users';

    try {
      final response = await _dio.get(url);
      setState(() {
        _users = response.data;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Erreur lors de la récupération des données.';
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
        appBar: AppBar(title: const Text('Utilisateurs')),
        body: Center(child: Text(_error!)),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Utilisateurs')),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];
          return ListTile(
            leading: CircleAvatar(child: Text(user['name'][0])),
            title: Text(user['name']),
            subtitle: Text(user['email']),
          );
        },
      ),
    );
  }
}
```

---

## Résultat attendu

* L'application affiche un `CircularProgressIndicator` au chargement.
* Ensuite, elle montre une **liste d’utilisateurs** avec leur nom et leur email.
* Si l’API échoue, un message d’erreur s’affiche.

