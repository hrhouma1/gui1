# Exercice Flutter : Consommation d’une API avec FutureBuilder et Dio

## Objectifs pédagogiques

À l’issue de cet exercice, l’étudiant sera capable de :

* Comprendre et utiliser le widget `FutureBuilder` pour gérer des données asynchrones.
* Consommer une API publique REST avec le package `Dio`.
* Modéliser une réponse JSON dans une classe Dart.
* Afficher dynamiquement une liste d’objets à l’aide de `ListView.builder`.

---

## Enoncé

Vous êtes chargé de développer une application Flutter simple qui récupère une liste d'utilisateurs à partir d’une API distante, puis les affiche à l'écran de manière dynamique à l'aide du widget `FutureBuilder`.

### Contexte

Vous utiliserez l'API publique suivante :

```
https://jsonplaceholder.typicode.com/users
```

Elle retourne un tableau JSON contenant 10 objets utilisateurs. Chaque utilisateur contient des champs comme `id`, `name`, `email`, `address`, etc.

---

## Contraintes

1. Vous devez utiliser le package `dio` pour effectuer la requête HTTP GET.
2. Vous devez modéliser les données de l’API dans une classe Dart nommée `User`.
3. Vous devez afficher dans une liste scrollable les informations suivantes :

   * Le nom de l’utilisateur (`name`)
   * L’adresse courriel (`email`)
4. L’appel à l’API doit être encapsulé dans une fonction asynchrone distincte.
5. Vous devez utiliser le widget `FutureBuilder` pour gérer l’appel réseau et reconstruire l’interface dynamiquement.

---

## Consignes techniques

* Le projet Flutter doit contenir au minimum les fichiers suivants :

  * `main.dart` : point d’entrée principal
  * `user.dart` : modèle de données
  * `api_service.dart` : appel à l’API via Dio

* L’affichage doit utiliser `ListView.builder` pour rendre les utilisateurs.

* L’application doit gérer les différents états de la future :

  * En attente (`ConnectionState.waiting`) → affichage d’un indicateur de chargement (`CircularProgressIndicator`)
  * En cas d’erreur → message d’erreur visible à l’écran
  * En cas de succès → affichage de la liste

* Le code doit être fonctionnel, lisible, et bien structuré.

---

## Étapes recommandées

### 1. Création du projet

```bash
flutter create users_app
cd users_app
```

### 2. Ajout de la dépendance dans `pubspec.yaml`

```yaml
dependencies:
  flutter:
    sdk: flutter
  dio: ^5.4.0
```

### 3. Fichier `user.dart`

```dart
class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
    );
  }
}
```

### 4. Fichier `api_service.dart`

```dart
import 'package:dio/dio.dart';
import 'user.dart';

Future<List<User>> fetchUsers() async {
  final response = await Dio().get('https://jsonplaceholder.typicode.com/users');

  if (response.statusCode == 200) {
    List<dynamic> data = response.data;
    return data.map((json) => User.fromJson(json)).toList();
  } else {
    throw Exception('Erreur lors du chargement des utilisateurs');
  }
}
```

### 5. Fichier `main.dart`

```dart
import 'package:flutter/material.dart';
import 'user.dart';
import 'api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liste des utilisateurs',
      home: UsersPage(),
    );
  }
}

class UsersPage extends StatelessWidget {
  final Future<List<User>> usersFuture = fetchUsers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Utilisateurs')),
      body: FutureBuilder<List<User>>(
        future: usersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucun utilisateur trouvé'));
          } else {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                );
              },
            );
          }
        },
      ),
    );
  }
}
```



## Livrable attendu

* Le projet complet sous forme de dossier compressé `.zip`
* L’application doit être exécutable immédiatement avec `flutter run`
* Tous les fichiers nécessaires doivent être inclus (`main.dart`, `user.dart`, `api_service.dart`, `pubspec.yaml`)
* Le nom du projet doit être : `users_app`

