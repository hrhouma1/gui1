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




<br/>

# Exercice formatif 1 - Projet Flutter – Chargement d'utilisateurs via une API avec Dio



###  **Question d’investigation 1**

> *Inverstiguez le code ci-bas !*
> Cherchez le document questions partie 1

###  **Question d’investigation 2**

> Dans le code ci-dessus, la méthode `fetchUsers()` est appelée dans `initState()`, ce qui signifie que les données sont chargées dès le démarrage de la page.
>
> **Que se passerait-il si vous appeliez `fetchUsers()` depuis `build()` à la place ?**
>
> * Faites un test.
> * Observez le comportement de l’interface.
> * Expliquez **pourquoi** ce comportement se produit.
> * Quelle est la différence fondamentale entre `initState()` et `build()` dans la gestion des appels asynchrones ?
> * Bonus : explorez comment éviter plusieurs appels inutiles si jamais un fetch était lancé dans `build()`.



## Commandes de base Flutter

```bash
flutter --version
flutter doctor
flutter create demodio1
cd demodio1
flutter pub get
flutter pub add dio:5.4.0
flutter analyze
flutter test
flutter run
````



## 0. Pipeline de l'application Flutter

Qui appelle qui ?

```dart
main() 
  ==> MyApp() 
    ==> UsersPage() 
      ==> Crée un état _UsersPageState() 
        ==> Appelle fetchUsers() dans initState()
```

### Organigramme des appels

| Classe            | Méthode / Rôle                                          |
| ----------------- | ------------------------------------------------------- |
| `main()`          | Point d'entrée de l'application                         |
| `MyApp`           | Définit le `MaterialApp` et la `home`                   |
| `UsersPage`       | Widget principal de l'écran utilisateurs                |
| `_UsersPageState` | Gère l'état, initialise l'appel API avec `fetchUsers()` |
| `fetchUsers()`    | Méthode qui appelle l’API avec Dio                      |



## 1. Le mot-clé `dynamic`

```dart
List<dynamic> _users = [];
```

* `dynamic` est un type flexible en Dart.
* Cela signifie que chaque élément de la liste peut être de n’importe quel type.
* Ici, on s’attend à recevoir des objets JSON (typiquement des `Map<String, dynamic>`).



## 2. Explication de `initState()`

```dart
@override
void initState() {
  super.initState();
  fetchUsers();
}
```

* `initState()` est une méthode de cycle de vie de `StatefulWidget`.
* Elle est appelée **une seule fois** au moment de la création de l'état.
* `super.initState()` appelle l’implémentation parent.
* `fetchUsers()` est lancé immédiatement après pour charger les données dès le démarrage.



## 3. Définition de `fetchUsers()`

```dart
Future<void> fetchUsers() async {
  ...
}
```

* `Future<void>` signifie que cette fonction est **asynchrone** et **ne retourne rien**.
* Elle permet d’effectuer un appel réseau sans bloquer l’interface.
* Le mot-clé `async` autorise l’usage de `await` à l’intérieur.



## 4. Appel de l'API avec Dio

```dart
final response = await _dio.get(url);
```

* `await` attend la réponse de l’appel HTTP (non bloquant).
* `_dio` est une instance du client HTTP Dio.
* `get(url)` déclenche une requête GET vers l’URL fournie.



## 5. Construction de l’interface utilisateur

```dart
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
```

### Explication détaillée

* `Scaffold` est un conteneur de base pour les écrans.
* `AppBar` : Barre de titre avec le nom « Utilisateurs ».
* `ListView.builder` :

  * Construit une liste paresseusement (optimisée pour les grandes listes).
  * `itemCount` : nombre d’éléments à afficher.
  * `itemBuilder` : génère un `ListTile` pour chaque utilisateur.
* `ListTile` :

  * `leading` : un avatar circulaire avec la première lettre du nom.
  * `title` : le nom de l’utilisateur.
  * `subtitle` : son email.



> Ce document peut être utilisé comme support pédagogique pour comprendre une petite application Flutter qui consomme une API avec `Dio`, tout en respectant la gestion des états et la construction dynamique d’interface.






<br/>

# Correction exercice formatif 1


Voici une **explication pédagogique complète** de ce projet Flutter utilisant la bibliothèque **Dio** pour effectuer un appel API. Chaque partie est commentée comme le ferait un enseignant pour bien guider ses étudiants débutants.

---

<h1 id="flutter-pipeline-dio">0. Pipeline de lancement de l'application Flutter</h1>

### Objectif :

Comprendre qui appelle quoi dans le code, et dans quel ordre les composants s'enchaînent.

---

```dart
main() 
   ↓
MyApp()  // point d’entrée principal de l’interface
   ↓
UsersPage()  // écran affiché dans `home:`
   ↓
_UsersPageState()  // état associé à UsersPage
   ↓
initState()  // méthode appelée automatiquement dès l’affichage
   ↓
fetchUsers()  // lance l'appel API avec Dio
```

---

### Organigramme des classes et méthodes

```
MyApp (StatelessWidget)
│
├── build() → MaterialApp
│            └── home: UsersPage()

UsersPage (StatefulWidget)
│
└── createState() → _UsersPageState

_UsersPageState (State<UsersPage>)
│
├── initState() → fetchUsers()
│
├── fetchUsers() → appel Dio
│
└── build() → Scaffold contenant :
             - AppBar
             - ListView.builder()
```

---

<h1 id="dynamic-keyword">1. Le terme `dynamic`</h1>

```dart
List<dynamic> _users = [];
```

* `dynamic` est un type Dart qui accepte **n’importe quelle valeur**.
* Ici, `response.data` contient une **liste d’objets JSON**.
* Comme ces objets n’ont pas encore de type défini, on les stocke dans une liste dynamique.
* Plus tard, on pourrait créer une classe `User` pour mieux typer les données.

---

<h1 id="initstate-explained">2. La méthode `initState()`</h1>

```dart
@override
void initState() {
  super.initState();
  fetchUsers();
}
```

* `initState()` est une méthode spéciale de `State<T>` appelée **une seule fois** au moment où l'état est inséré dans l’arbre des widgets.
* Elle sert à **initialiser les données**, **démarrer des appels API**, ou **préparer des contrôleurs**.
* `super.initState()` appelle la méthode parente (obligatoire).
* Ensuite, on appelle `fetchUsers()` pour charger les données depuis l’API.

---

<h1 id="future-async">3. La méthode `fetchUsers()` avec `Future<void>`</h1>

```dart
Future<void> fetchUsers() async {
  ...
}
```

* La méthode retourne un `Future<void>` : cela signifie qu’elle **effectue une opération asynchrone** (comme une requête HTTP), mais **ne retourne pas de valeur**.
* Le mot-clé `async` permet d’utiliser `await` à l’intérieur.
* L’utilisation de `await` suspend l’exécution jusqu’à ce que le résultat de la requête soit disponible, **sans bloquer l'interface**.

---

<h1 id="await-dio-get">4. Requête avec `Dio`</h1>

```dart
final response = await _dio.get(url);
```

* `_dio.get(url)` envoie une requête `HTTP GET` à l’URL fournie.
* `await` signifie qu’on attend le résultat **avant de continuer l’exécution**.
* Le résultat (`response`) contient :

  * `response.data` → les données récupérées (ici, des utilisateurs)
  * `response.statusCode` → le code HTTP (200, 404, etc.)

---

<h1 id="build-scaffold-listview">5. Construction de la vue avec `Scaffold` et `ListView.builder`</h1>

```dart
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
```

#### Décomposons cela :

* `Scaffold` : le **conteneur principal** pour une page Flutter.

  * `appBar` : barre supérieure avec un titre.
  * `body` : le contenu principal (ici, une liste).

* `ListView.builder` : construit une liste **dynamique et performante**.

  * `itemCount` : nombre d’éléments dans `_users`.
  * `itemBuilder` : fonction appelée pour **chaque élément**.

    * `user = _users[index]` → récupère l’utilisateur à la position `index`.
    * `ListTile` : un élément d’interface standard dans Flutter :

      * `leading` → un avatar circulaire avec la première lettre du nom.
      * `title` → le nom complet.
      * `subtitle` → l’email.

