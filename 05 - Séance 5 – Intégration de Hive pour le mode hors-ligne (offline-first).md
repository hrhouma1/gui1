## Séance 5 – Intégration de Hive pour le mode hors-ligne (offline-first)

> Objectif : permettre à l'application de fonctionner même sans connexion Internet.
> Hive sera utilisé pour **enregistrer localement les posts**. En mode avion, l’application lira les données en cache. En ligne, elle synchronise automatiquement.

---

## ÉTAPE 1 – Ajouter les dépendances nécessaires à Hive

Dans le terminal, à la racine du projet, exécuter :

```bash
flutter pub add hive
flutter pub add hive_flutter
flutter pub add path_provider
flutter pub add hive_generator
flutter pub add freezed_annotation
flutter pub add json_annotation
```

Ajouter dans `dev_dependencies` :

```yaml
dev_dependencies:
  build_runner: any
  hive_generator: any
```

Ensuite :

```bash
flutter pub get
```

---

## ÉTAPE 2 – Initialiser Hive dans le `main.dart`

Ouvrir `lib/main.dart` et **remplacer** le `main()` par :

```dart
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocDir = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocDir.path);
  await Hive.openBox('postsBox');

  runApp(ProviderScope(child: MyApp()));
}
```

---

## ÉTAPE 3 – Créer un adapter Hive pour le modèle `Post`

Créer un nouveau fichier `lib/domain/entities/post_hive.dart` :

```dart
import 'package:hive/hive.dart';

part 'post_hive.g.dart';

@HiveType(typeId: 0)
class PostHive extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String body;

  PostHive({required this.id, required this.title, required this.body});
}
```

Générer l’adapter avec :

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## ÉTAPE 4 – Ajouter une classe de conversion `Post` ↔ `PostHive`

Créer un fichier `lib/core/mappers/post_mapper.dart` :

```dart
import '../../domain/entities/post.dart';
import '../../domain/entities/post_hive.dart';

extension PostMapper on Post {
  PostHive toHiveModel() {
    return PostHive(id: id, title: title, body: body);
  }
}

extension PostHiveMapper on PostHive {
  Post toDomainModel() {
    return Post(id: id, title: title, body: body);
  }
}
```

---

## ÉTAPE 5 – Adapter `PostsApi` pour stocker dans Hive après chaque GET

Ouvrir `lib/data/datasources/posts_api.dart` et modifier la méthode `getPosts` :

```dart
import 'package:hive/hive.dart';
import '../../domain/entities/post_hive.dart';
import '../../core/mappers/post_mapper.dart';

Future<List<Post>> getPosts() async {
  final response = await _dio.get('/posts');
  final data = response.data as List<dynamic>;
  final posts = data.map((e) => Post(id: e['id'], title: e['title'], body: e['body'])).toList();

  final box = Hive.box('postsBox');
  await box.clear(); // remplacer complètement le cache
  for (final post in posts) {
    box.add(post.toHiveModel());
  }

  return posts;
}
```

---

## ÉTAPE 6 – Lire depuis Hive en cas de déconnexion

Toujours dans `posts_api.dart`, modifier la méthode :

```dart
Future<List<Post>> getPosts() async {
  try {
    final response = await _dio.get('/posts');
    final data = response.data as List<dynamic>;
    final posts = data.map((e) => Post(id: e['id'], title: e['title'], body: e['body'])).toList();

    final box = Hive.box('postsBox');
    await box.clear();
    for (final post in posts) {
      box.add(post.toHiveModel());
    }

    return posts;
  } catch (e) {
    final box = Hive.box('postsBox');
    final cachedPosts = box.values.cast<PostHive>().toList();
    return cachedPosts.map((e) => e.toDomainModel()).toList();
  }
}
```

---

## ÉTAPE 7 – Ajouter une icône de statut de connexion (facultatif)

Dans `home_screen.dart`, dans `AppBar`, ajouter :

```dart
appBar: AppBar(
  title: Text('Accueil'),
  actions: [
    Icon(Icons.wifi), // à remplacer plus tard par un vrai indicateur
  ],
),
```

---

## ÉTAPE 8 – Tester le mode hors ligne

1. Lancer l’app avec Internet.
2. Attendre que les données s’affichent.
3. Activer le mode avion.
4. Relancer l’app → les posts doivent apparaître depuis Hive.
5. Remettre Internet, faire un pull-to-refresh → les données se rechargent depuis l’API.

---

## Résultat attendu

| Fonctionnalité                | Comportement attendu                      |
| ----------------------------- | ----------------------------------------- |
| Chargement des posts en ligne | Appelle l’API `/posts`, stocke localement |
| Chargement en mode avion      | Lit le contenu du cache Hive              |
| Remise en ligne               | Actualise et remplace le cache local      |
| Aucun crash hors-ligne        | Tous les appels sont try/catch            |

