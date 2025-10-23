# Comprendre et maîtriser **Provider** dans Flutter



## 1. Contexte : pourquoi une gestion d’état ?

* **Flutter reconstruit** l’interface à chaque `setState()`.
* Lorsque l’application grossit, propager des données via les constructeurs devient complexe (“prop drilling”).
* **Provider** est la solution officielle (paquet maintenu par la communauté Flutter) : simple, légère, s’intègre au moteur de rendu sans sur-couche natif.



## 2. Principe fondamental de Provider

1. **Fournir** (provide) un objet d’état dans l’arbre de widgets.
2. **Consommer** cet objet plus bas sans passer explicitement par les constructeurs.
3. **Notifier** les consommateurs quand l’état change pour qu’ils se reconstruisent.

### 2.1 Les trois rôles clés

| Rôle         | Widget / Fonction                                                                          | Mission                      |
| ------------ | ------------------------------------------------------------------------------------------ | ---------------------------- |
| Fournisseur  | `Provider`, `ChangeNotifierProvider`, `FutureProvider`, `StreamProvider`, `ProxyProvider`… | Place la donnée dans l’arbre |
| Consommateur | `Consumer`, `Selector`, `context.watch()`, `context.read()`                                | Lit et écoute l’état         |
| Notificateur | Méthode interne (ex. `notifyListeners()` dans `ChangeNotifier`)                            | Déclenche la reconstruction  |



## 3. `ChangeNotifier` : base de l’état mutable

### 3.1 Définition

`ChangeNotifier` est une classe du SDK Dart ; elle contient :

* Une liste d’auditeurs.
* La méthode `notifyListeners()` pour prévenir les auditeurs.

### 3.2 Exemple minimal

```dart
class CounterProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();   // avertit les widgets qui « watch » ce provider
  }
}
```



## 4. Types de Provider les plus courants

| Provider                                           | Utilisation                                           | Particularité                                 |
| -------------------------------------------------- | ----------------------------------------------------- | --------------------------------------------- |
| `Provider<T>`                                      | Expose un objet **immuable** ou déjà instancié        | Aucun cycle de vie géré                       |
| `ChangeNotifierProvider<T extends ChangeNotifier>` | Expose un objet **mutable** avec `notifyListeners()`  | Gère la création et la destruction            |
| `FutureProvider<T>`                                | Expose le résultat d’un `Future<T>`                   | Donne accès à `AsyncValue<T>`                 |
| `StreamProvider<T>`                                | Expose un flux `Stream<T>`                            | Met à jour automatiquement à chaque événement |
| `ProxyProvider<A,B>`                               | Combine deux providers pour produire une autre valeur | Idéal pour dépendance croisée                 |
| `MultiProvider`                                    | Grouper plusieurs providers                           | Lisibilité de l’arbre                         |



## 5. Mise en place pas-à-pas

### 5.1 Installation

Dans `pubspec.yaml` :

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.0
```

### 5.2 Injection globale (root)

```dart
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        StreamProvider<int>(
          create: (_) => Stream.periodic(const Duration(seconds: 1), (i) => i),
          initialData: 0,
        ),
      ],
      child: const MyApp(),
    ),
  );
}
```



## 6. Consommation de l’état

### 6.1 `Consumer<T>`

```dart
Consumer<CounterProvider>(
  builder: (context, counter, child) {
    return Text('Valeur : ${counter.count}');
  },
)
```

* Se reconstruit **uniquement** quand `CounterProvider` appelle `notifyListeners()`.
* Paramètre `child` facultatif : partie immuable non reconstruite.

### 6.2 Context helpers

| Méthode                                       | Effet                                                      |
| --------------------------------------------- | ---------------------------------------------------------- |
| `context.watch<T>()`                          | Récupère et **écoute** l’objet ; reconstruit au changement |
| `context.read<T>()`                           | Récupère sans écouter ; pas de reconstruction              |
| `context.select<T,R>(R Function(T) selector)` | Écoute **uniquement** la partie sélectionnée de `T`        |

Exemple :

```dart
var compteur = context.watch<CounterProvider>().count;
```

## 7. Statut asynchrone : `FutureProvider` et `StreamProvider`

### 7.1 `FutureProvider`

```dart
FutureProvider<User>(
  create: (_) async => fetchUser(),
  initialData: User.empty(),
)
```

Dans le widget :

```dart
final user = context.watch<AsyncValue<User>>();
return user.when(
  data: (u) => Text(u.name),
  loading: () => const CircularProgressIndicator(),
  error: (e, _) => Text('Erreur: $e'),
);
```

### 7.2 `StreamProvider`

```dart
StreamProvider<List<Post>>(
  create: (_) => FirebaseFirestore.instance
      .collection('posts')
      .snapshots()
      .map((snap) => snap.docs.map(Post.fromDoc).toList()),
  initialData: const [],
)
```



## 8. Composition avancée : `ProxyProvider`

### 8.1 Problème

Vous disposez de `AuthProvider` (utilisateur) et souhaitez exposer un `DatabaseService` dépendant de l’ID utilisateur.

### 8.2 Solution

```dart
ProxyProvider<AuthProvider, DatabaseService>(
  update: (_, auth, db) => DatabaseService(uid: auth.userId),
)
```


## 9. Meilleures pratiques et pièges

| Bonne pratique                                              | Explication                                  |
| ----------------------------------------------------------- | -------------------------------------------- |
| Garder le provider **au plus haut** niveau nécessaire       | Évite de recréer l’état à chaque navigation  |
| **Ne pas** appeler des méthodes mutantes depuis `build`     | Risque de boucle de rendu                    |
| Factoriser les parties statiques dans `child` de `Consumer` | Réduit le nombre de reconstructions          |
| Utiliser `Selector` pour une **écoute fine**                | Améliore les performances sur de gros objets |
| Fermer les contrôleurs (`dispose`) dans un `ChangeNotifier` | Libère mémoire et sockets                    |



## 10. Différence Provider vs setState

| Critère                       | `setState`                    | Provider                        |
| ----------------------------- | ----------------------------- | ------------------------------- |
| Portée de l’état              | Limité au widget              | Partagé dans l’arbre            |
| Persistant après navigation ? | Non                           | Oui (si placé assez haut)       |
| Couplage                      | Fort (prop drilling)          | Faible (injection)              |
| Notif. fine-grain             | Non, redessine tout le widget | Oui, via `Consumer`, `Selector` |



## 11. Exemple complet

### 11.1 Provider

```dart
class TodoProvider extends ChangeNotifier {
  final List<String> _todos = [];

  List<String> get todos => List.unmodifiable(_todos);

  void add(String task) {
    _todos.add(task);
    notifyListeners();
  }

  void remove(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }
}
```

### 11.2 Injection

```dart
ChangeNotifierProvider(create: (_) => TodoProvider())
```

### 11.3 Vue

```dart
class TodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Mes tâches')),
      body: Column(
        children: [
          Expanded(
            child: Consumer<TodoProvider>(
              builder: (_, provider, __) => ListView.builder(
                itemCount: provider.todos.length,
                itemBuilder: (_, i) => ListTile(
                  title: Text(provider.todos[i]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => provider.remove(i),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(child: TextField(controller: controller)),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      context.read<TodoProvider>().add(controller.text);
                      controller.clear();
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
```



## 12. Tableau récapitulatif des classes Provider principales

| Classe                      | Donnée exposée                      | Notifie via                               | Cas d’usage                        |
| --------------------------- | ----------------------------------- | ----------------------------------------- | ---------------------------------- |
| `Provider<T>`               | Objet immuable, service, repository | Aucun (l’objet gère lui-même ses streams) | Logger, configuration, thème       |
| `ChangeNotifierProvider<T>` | Objet mutable                       | `notifyListeners()`                       | Compteur, panier, favoris          |
| `FutureProvider<T>`         | Résultat futur                      | Résolution du `Future`                    | Chargement unique (profil, config) |
| `StreamProvider<T>`         | Flux continu                        | Nouvel événement du `Stream`              | Notifications, feed live           |
| `ProxyProvider<A,B>`        | Objet B dépendant de A              | `update`                                  | BDD dépendante d’un token d’auth   |
| `MultiProvider`             | Liste                               | —                                         | Orchestration lisible              |

---

## Conclusion

Provider est un mécanisme de gestion d’état :

1. **Simple** : surcouche légère autour de l’injection de dépendances.
2. **Flexible** : synchronisation d’objets immuables, mutables, futurs ou flux.
3. **Performant** : reconstruit uniquement les widgets qui en ont besoin.

Maîtriser `ChangeNotifierProvider`, `Consumer`, `context.watch()` et les variantes asynchrones (`FutureProvider`, `StreamProvider`) constitue la base d’une architecture Flutter propre, testable et évolutive.
