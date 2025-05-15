## Séance 4 – Architecture propre + tests unitaires

> Objectif : découper le code en 3 couches (données, logique métier, interface utilisateur) pour faciliter la maintenance, le test, et la réutilisation.
> À la fin de cette séance, le projet est organisé selon l’architecture dite **“Clean Architecture”**, avec des tests unitaires fonctionnels pour les cas d’usage.

---

## ÉTAPE 1 – Réorganiser l’arborescence du projet

Créer la structure suivante dans `lib/` :

```
lib/
├── main.dart
├── core/                       # Logique transversale (types, erreurs, helpers)
│   └── exceptions.dart
├── domain/                    # Contrats, modèles abstraits, cas d’usage
│   ├── entities/
│   │   └── post.dart
│   ├── repositories/
│   │   └── posts_repository.dart
│   └── usecases/
│       └── fetch_posts.dart
├── data/                      # Implémentation concrète
│   ├── datasources/
│   │   └── posts_api.dart
│   └── repositories/
│       └── posts_repository_impl.dart
├── application/              # Coordination entre data et UI
│   └── posts_provider.dart
├── presentation/             # Interface utilisateur
│   ├── screens/
│   │   ├── home_screen.dart
│   │   ├── about_screen.dart
│   │   ├── contact_screen.dart
│   │   └── create_post_screen.dart
│   └── widgets/
│       ├── app_button.dart
│       └── post_card.dart
```

Déplacer tous les fichiers correspondants dans ces nouveaux dossiers (sans modifier le code pour l’instant).
Ensuite, adapter les chemins d’import dans chaque fichier (`import '../widgets/...';` devient `import '../../presentation/widgets/...';` etc.)

---

## ÉTAPE 2 – Définir l’entité `Post`

Créer le fichier `lib/domain/entities/post.dart` :

```dart
class Post {
  final int id;
  final String title;
  final String body;

  Post({
    required this.id,
    required this.title,
    required this.body,
  });
}
```

---

## ÉTAPE 3 – Créer un contrat d’interface pour `PostsRepository`

Créer `lib/domain/repositories/posts_repository.dart` :

```dart
import '../entities/post.dart';

abstract class PostsRepository {
  Future<List<Post>> fetchPosts();
  Future<void> createPost({required String title, required String body});
}
```

---

## ÉTAPE 4 – Créer le `UseCase` pour récupérer les posts

Créer `lib/domain/usecases/fetch_posts.dart` :

```dart
import '../entities/post.dart';
import '../repositories/posts_repository.dart';

class FetchPosts {
  final PostsRepository repository;

  FetchPosts(this.repository);

  Future<List<Post>> call() async {
    return await repository.fetchPosts();
  }
}
```

---

## ÉTAPE 5 – Créer l’implémentation `PostsApi`

Créer `lib/data/datasources/posts_api.dart` :

```dart
import 'package:dio/dio.dart';
import '../../domain/entities/post.dart';

class PostsApi {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://example.com')); // à adapter

  Future<List<Post>> getPosts() async {
    final response = await _dio.get('/posts');
    final data = response.data as List<dynamic>;
    return data.map((e) => Post(id: e['id'], title: e['title'], body: e['body'])).toList();
  }

  Future<void> addPost({required String title, required String body}) async {
    await _dio.post('/posts', data: {'title': title, 'body': body});
  }
}
```

---

## ÉTAPE 6 – Implémenter le repository

Créer `lib/data/repositories/posts_repository_impl.dart` :

```dart
import '../../domain/entities/post.dart';
import '../../domain/repositories/posts_repository.dart';
import '../datasources/posts_api.dart';

class PostsRepositoryImpl implements PostsRepository {
  final PostsApi api;

  PostsRepositoryImpl(this.api);

  @override
  Future<List<Post>> fetchPosts() => api.getPosts();

  @override
  Future<void> createPost({required String title, required String body}) =>
      api.addPost(title: title, body: body);
}
```

---

## ÉTAPE 7 – Adapter le provider Riverpod

Créer `lib/application/posts_provider.dart` :

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/entities/post.dart';
import '../domain/usecases/fetch_posts.dart';
import '../data/datasources/posts_api.dart';
import '../data/repositories/posts_repository_impl.dart';

final postsApiProvider = Provider((ref) => PostsApi());

final postsRepositoryProvider = Provider((ref) {
  final api = ref.read(postsApiProvider);
  return PostsRepositoryImpl(api);
});

final fetchPostsUsecaseProvider = Provider((ref) {
  final repo = ref.read(postsRepositoryProvider);
  return FetchPosts(repo);
});

final postsProvider = FutureProvider<List<Post>>((ref) async {
  final fetchPosts = ref.read(fetchPostsUsecaseProvider);
  return fetchPosts();
});
```

---

## ÉTAPE 8 – Adapter les widgets à la nouvelle entité

Exemple pour `presentation/widgets/post_card.dart` :

```dart
import 'package:flutter/material.dart';
import '../../domain/entities/post.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({required this.post, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(post.body),
          ],
        ),
      ),
    );
  }
}
```

---

## ÉTAPE 9 – Créer un test unitaire du cas d’usage

Créer un dossier `test/domain/usecases/` puis le fichier `fetch_posts_test.dart`

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/domain/entities/post.dart';
import 'package:my_app/domain/usecases/fetch_posts.dart';
import 'package:my_app/domain/repositories/posts_repository.dart';

class FakePostsRepository implements PostsRepository {
  @override
  Future<List<Post>> fetchPosts() async {
    return [
      Post(id: 1, title: 'Test', body: 'Ceci est un test'),
    ];
  }

  @override
  Future<void> createPost({required String title, required String body}) async {
    // Ne fait rien
  }
}

void main() {
  test('fetchPosts retourne une liste de posts', () async {
    final repo = FakePostsRepository();
    final usecase = FetchPosts(repo);

    final result = await usecase();

    expect(result, isA<List<Post>>());
    expect(result.length, 1);
    expect(result.first.title, 'Test');
  });
}
```

---

## ÉTAPE 10 – Lancer les tests

Dans le terminal, exécuter :

```bash
flutter test
```

Résultat attendu : le test passe sans erreur.

---

## Résultat de la séance

| Objectif du plan                                 | Réalisé |
| ------------------------------------------------ | ------- |
| Architecture clean avec 3 couches                | Oui     |
| Utilisation de cas d’usage (usecase)             | Oui     |
| Séparation interface / logique métier / data     | Oui     |
| Provider Riverpod adapté à la nouvelle structure | Oui     |
| Test unitaire d’un cas d’usage                   | Oui     |


