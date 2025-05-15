# Séance 2 – Appel HTTP GET avec Dio, gestion d’état Riverpod, affichage dynamique d’une liste

> Cette suite part du projet obtenu à la fin de la séance 1 (`my_app`).
> Objectif : récupérer des « posts » depuis l’API REST fournie et les afficher dans l’application.



### Étape 1 – Ajouter les dépendances nécessaires

Dans le terminal, à la racine du projet :

```bash
flutter pub add dio
flutter pub add flutter_riverpod
flutter pub add freezed_annotation
flutter pub add json_annotation
flutter pub add intl
```

Ajouter ensuite les dépendances de génération dans **`dev_dependencies`** du fichier `pubspec.yaml` :

```yaml
dev_dependencies:
  build_runner: any
  freezed: any
  json_serializable: any
```

Enregistrer le fichier `pubspec.yaml`, puis exécuter :

```bash
flutter pub get
```

---

### Étape 2 – Préparer Freezed / génération de code

Créer un fichier `build.yaml` à la racine :

```yaml
targets:
  $default:
    builders:
      freezed:
        options:
          when: false
```

---

### Étape 3 – Modifier `lib/main.dart` pour activer Riverpod

Ouvrir `lib/main.dart` et remplacer **entièrement** son contenu par :

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/home_screen.dart';
import 'screens/about_screen.dart';
import 'screens/contact_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Application Flutter',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/about': (context) => AboutScreen(),
        '/contact': (context) => ContactScreen(),
      },
    );
  }
}
```

---

### Étape 4 – Créer le modèle `Post`

Créer le dossier `lib/models/` puis le fichier `post.dart` :

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required int id,
    required String title,
    required String body,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
```

Générer le code associé :

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

### Étape 5 – Créer le dépôt et le provider Riverpod

Créer `lib/repositories/posts_repository.dart` :

```dart
import 'package:dio/dio.dart';
import '../models/post.dart';

class PostsRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://example.com')); // Remplacer par l’URL réelle

  Future<List<Post>> fetchPosts() async {
    final response = await _dio.get('/posts');
    final data = response.data as List<dynamic>;
    return data.map((json) => Post.fromJson(json)).toList();
  }
}
```

Créer `lib/providers/posts_provider.dart` :

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/post.dart';
import '../repositories/posts_repository.dart';

final postsRepositoryProvider = Provider((ref) => PostsRepository());

final postsProvider = FutureProvider<List<Post>>((ref) async {
  final repo = ref.read(postsRepositoryProvider);
  return repo.fetchPosts();
});
```

---

### Étape 6 – Créer un widget d’affichage d’un post

Créer `lib/widgets/post_card.dart` :

```dart
import 'package:flutter/material.dart';
import '../models/post.dart';

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

### Étape 7 – Mettre à jour `screens/home_screen.dart`

Remplacer **tout** le contenu de `home_screen.dart` par :

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/posts_provider.dart';
import '../widgets/post_card.dart';
import '../widgets/app_button.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(postsProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Accueil')),
      body: postsAsync.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Erreur : $err')),
        data: (posts) => RefreshIndicator(
          onRefresh: () async {
            ref.refresh(postsProvider);
          },
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (_, index) => PostCard(post: posts[index]),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppButton(label: 'À propos', routeName: '/about'),
          SizedBox(height: 10),
          AppButton(label: 'Contact', routeName: '/contact'),
        ],
      ),
    );
  }
}
```

---

### Étape 8 – Relancer l’application

Dans le terminal :

```bash
flutter run
```

Ou, pour Chrome :

```bash
flutter run -d chrome
```

---

### Résultat attendu

* Un indicateur de chargement s’affiche pendant la requête réseau.
* La liste des posts apparaît sous forme de cartes.
* Glisser vers le bas déclenche un rafraîchissement (pull-to-refresh).
* Les boutons “À propos” et “Contact” dans le coin inférieur droit ouvrent toujours les pages correspondantes.


La séance 2 est maintenant terminée.
La prochaine étape (séance 3) ajoutera un **formulaire POST** permettant de créer un nouveau post et de rafraîchir automatiquement la liste.
