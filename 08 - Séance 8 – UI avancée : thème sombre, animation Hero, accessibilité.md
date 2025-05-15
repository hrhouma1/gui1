## Séance 8 – UI avancée : thème sombre, animation Hero, accessibilité



## ÉTAPE 1 – Ajouter le support du thème sombre

### 1.1 Modifier `main.dart`

Ouvrir `lib/main.dart` et modifier la configuration du `MaterialApp` :

```dart
return MaterialApp(
  title: 'Application Flutter',
  theme: ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    brightness: Brightness.light,
  ),
  darkTheme: ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
    brightness: Brightness.dark,
  ),
  themeMode: ThemeMode.system, // Utilise les préférences système
  initialRoute: '/',
  routes: {
    '/': (context) => HomeScreen(),
    '/about': (context) => AboutScreen(),
    '/contact': (context) => ContactScreen(),
    '/create': (context) => AuthGuard(child: CreatePostScreen()),
    '/login': (context) => LoginScreen(),
    '/register': (context) => RegisterScreen(),
  },
);
```

---

## ÉTAPE 2 – Ajouter une animation Hero pour les titres de posts

### 2.1 Modifier `PostCard`

Ouvrir `lib/presentation/widgets/post_card.dart` :

Remplacer `Text(post.title)` par :

```dart
Hero(
  tag: 'post-title-${post.id}',
  child: Material(
    color: Colors.transparent,
    child: Text(
      post.title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  ),
),
```

### 2.2 Créer un écran `PostDetailsScreen` pour afficher un seul post

Créer `lib/presentation/screens/post_details_screen.dart` :

```dart
import 'package:flutter/material.dart';
import '../../domain/entities/post.dart';

class PostDetailsScreen extends StatelessWidget {
  final Post post;

  const PostDetailsScreen({required this.post, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Détails')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'post-title-${post.id}',
              child: Material(
                color: Colors.transparent,
                child: Text(
                  post.title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(post.body, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
```

### 2.3 Ajouter un `InkWell` dans `PostCard` pour déclencher l’animation

Dans `PostCard`, entourer le `Card` par :

```dart
GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PostDetailsScreen(post: post),
      ),
    );
  },
  child: Card(
    ...
  ),
),
```

---

## ÉTAPE 3 – Ajouter un `Semantics` label pour l’accessibilité

Dans `PostCard`, entourer la `Card` par :

```dart
Semantics(
  label: 'Carte du post : ${post.title}',
  child: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PostDetailsScreen(post: post),
        ),
      );
    },
    child: Card(
      ...
    ),
  ),
),
```

---

## ÉTAPE 4 – Tester le thème sombre et l’accessibilité

1. Activer le **thème sombre** sur l’émulateur ou dans les paramètres du navigateur.
2. Relancer l’application → les couleurs s’ajustent automatiquement.
3. Sur mobile physique ou émulateur Android/iOS : activer **TalkBack** ou **VoiceOver**.
4. Naviguer sur les `PostCard` → les lecteurs d’écran lisent “Carte du post : ...”.

---

## Résultat attendu

| Fonctionnalité                        | Statut |
| ------------------------------------- | ------ |
| Thème sombre automatique              | Oui    |
| Animation Hero entre liste et détails | Oui    |
| Accessibilité avec `Semantics`        | Oui    |
| Architecture propre respectée         | Oui    |


