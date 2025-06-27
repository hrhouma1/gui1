# Cours sur `Provider` en Flutter

---

## 1. Introduction

La gestion d'état est un sujet central dans Flutter. Dès que vous avez besoin de faire communiquer plusieurs widgets entre eux, ou de partager des données dans l'application, vous devez sortir de la logique locale à un widget et utiliser une méthode de gestion d'état globale. `Provider` est la méthode la plus recommandée pour cela, car elle est simple, performante et bien intégrée dans l'écosystème Flutter.

---

## 2. Les bases de Provider

`Provider` repose sur trois concepts clés :

* **L'injection** : on place un objet dans l'arbre de widgets via un `Provider`.
* **L'accès** : on accède à cet objet depuis n'importe quel widget enfant sans passer par les constructeurs.
* **La notification** : l'objet notifie les widgets abonnés quand ses données changent.

---

## 3. Pourquoi utiliser `Provider` ?

* Centraliser et partager un état entre différents widgets.
* Éviter de chaîner les données via des constructeurs.
* Avoir une logique réactive : les widgets se reconstruisent automatiquement en cas de changement.
* Gérer des objets complexes avec des cycles de vie (Firebase, DB, services).

---

## 4. Types de Provider

### 4.1 Provider (de base)

Expose un objet déjà construit :

```dart
Provider<MyService>(create: (_) => MyService())
```

### 4.2 ChangeNotifierProvider

Expose un objet qui étend `ChangeNotifier`. C'est le type le plus courant.

```dart
ChangeNotifierProvider(create: (_) => MyNotifier())
```

### 4.3 FutureProvider

Expose un `Future<T>` et donne le résultat quand il est disponible.

```dart
FutureProvider(create: (_) => fetchData(), initialData: null)
```

### 4.4 StreamProvider

Expose un `Stream<T>` et met à jour l'UI à chaque nouvel événement.

```dart
StreamProvider(create: (_) => firestore.stream(), initialData: [])
```

### 4.5 ProxyProvider

Combine plusieurs providers pour en créer un nouveau.

```dart
ProxyProvider<Auth, DatabaseService>(
  update: (_, auth, __) => DatabaseService(auth.userId),
)
```

### 4.6 MultiProvider

Pour combiner plusieurs providers au même endroit :

```dart
MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => A()),
    Provider(create: (_) => B()),
  ],
  child: MyApp(),
)
```

---

## 5. Créer un Provider complet

### 5.1 Le ChangeNotifier

```dart
class CounterProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
```

### 5.2 L'injection dans main.dart

```dart
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: MyApp(),
    ),
  );
}
```

### 5.3 L'accès dans les widgets

```dart
final compteur = context.watch<CounterProvider>().count;
context.read<CounterProvider>().increment();
```

Ou avec `Consumer` :

```dart
Consumer<CounterProvider>(
  builder: (_, provider, __) => Text('Valeur: ${provider.count}'),
)
```

---

## 6. Utiliser Provider avec Firebase (Firestore)

```dart
class FavoriteProvider extends ChangeNotifier {
  final List<String> _ids = [];
  final _firestore = FirebaseFirestore.instance;

  List<String> get ids => _ids;

  Future<void> toggle(String id) async {
    if (_ids.contains(id)) {
      _ids.remove(id);
    } else {
      _ids.add(id);
    }
    await _firestore.collection('favorites').doc('user1').set({
      'ids': _ids,
    });
    notifyListeners();
  }

  Stream<List<DocumentSnapshot>> get favoritesStream {
    if (_ids.isEmpty) return Stream.value([]);
    return _firestore.collection('recipes')
      .where(FieldPath.documentId, whereIn: _ids)
      .snapshots()
      .map((snap) => snap.docs);
  }
}
```

---

## 7. Table récapitulative des accès

| Méthode                 | Rebuild ?   | Description                                 |
| ----------------------- | ----------- | ------------------------------------------- |
| `context.watch<T>()`    | Oui         | Lit et écoute les changements               |
| `context.read<T>()`     | Non         | Lit sans écouter (actions)                  |
| `context.select<T,R>()` | Oui (sur R) | Écoute une partie spécifique                |
| `Consumer<T>()`         | Oui         | Widget qui reconstruit une partie seulement |

---

## 8. Bonnes pratiques

* Ne pas appeler `read()` ou `watch()` dans `initState` (utiliser `WidgetsBinding.instance.addPostFrameCallback`).
* Toujours nettoyer les contrôleurs dans `dispose()` dans les `ChangeNotifier`.
* Utiliser `Selector` pour observer une valeur précise et éviter des reconstructions inutiles.
* Grouper tous les providers dans `MultiProvider` dans `main.dart`.
* Gérer les erreurs de Future/Stream avec `snapshot.hasError`.

---

## 9. Comparaison Provider / setState

| Critère             | setState  | Provider |
| ------------------- | --------- | -------- |
| Portée              | Locale    | Globale  |
| Partage de données  | Difficile | Facile   |
| Architecture propre | Non       | Oui      |
| Maintenabilité      | Faible    | Forte    |

---

## 10. Cas pratiques avancés

* **Provider d'authentification** : expose un `User?`, gère login/logout.
* **Provider de panier** : expose une liste d'éléments, permet d'ajouter/retirer, calcule total.
* **Provider avec Firestore** : met à jour le backend et reconstruit l'interface via `Stream`.
* **Provider combiné (ProxyProvider)** : injecte des services qui dépendent d'autres.

---

## Conclusion

`Provider` est une brique indispensable pour développer des applications Flutter robustes. Il permet de centraliser la logique, réagir aux changements d'état, s'intégrer avec Firebase et améliorer la maintenabilité de vos projets. En maîtrisant les différents types de provider, leurs modes d'accès et les bonnes pratiques, vous êtes en mesure de créer des applications performantes et bien structurées.
