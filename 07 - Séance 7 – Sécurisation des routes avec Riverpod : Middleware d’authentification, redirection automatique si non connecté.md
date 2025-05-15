## Séance 7 – Sécurisation des routes avec Riverpod : Middleware d’authentification, redirection automatique si non connecté

> Objectif : empêcher l’accès aux routes sensibles si l’utilisateur n’est pas connecté.
> Utilisation d’un **guard avec Riverpod** pour vérifier le token JWT au démarrage de l’app et à chaque tentative de navigation.

---

## ÉTAPE 1 – Créer un `AuthStateProvider` avec Riverpod

Créer le fichier : `lib/application/auth_provider.dart`

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/services/secure_storage_service.dart';

final secureStorageProvider = Provider((ref) => SecureStorageService());

final authStatusProvider = FutureProvider<bool>((ref) async {
  final storage = ref.read(secureStorageProvider);
  final token = await storage.readToken();
  return token != null && token.isNotEmpty;
});
```

---

## ÉTAPE 2 – Créer un widget `AuthGuard` pour protéger une route

Créer le fichier : `lib/presentation/widgets/auth_guard.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/auth_provider.dart';

class AuthGuard extends ConsumerWidget {
  final Widget child;

  const AuthGuard({required this.child, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authStatusProvider);

    return auth.when(
      data: (isLoggedIn) {
        if (isLoggedIn) {
          return child;
        } else {
          Future.microtask(() {
            Navigator.pushReplacementNamed(context, '/login');
          });
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
      loading: () => Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => Scaffold(
        body: Center(child: Text('Erreur de vérification de session')),
      ),
    );
  }
}
```

---

## ÉTAPE 3 – Protéger la route `/create` (formulaire de création de post)

Ouvrir `lib/main.dart`, et remplacer cette route :

```dart
'/create': (context) => CreatePostScreen(),
```

par :

```dart
'/create': (context) => AuthGuard(child: CreatePostScreen()),
```

---

## ÉTAPE 4 – Afficher l’état de connexion dans la page d’accueil

Ouvrir `lib/presentation/screens/home_screen.dart`
Dans le `AppBar`, remplacer :

```dart
actions: [...]
```

par :

```dart
actions: [
  Consumer(
    builder: (context, ref, _) {
      final auth = ref.watch(authStatusProvider);

      return auth.when(
        data: (isLoggedIn) => isLoggedIn
            ? IconButton(
                onPressed: () async {
                  await ref.read(secureStorageProvider).clearToken();
                  ref.invalidate(authStatusProvider);
                },
                icon: Icon(Icons.logout),
                tooltip: 'Se déconnecter',
              )
            : IconButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                icon: Icon(Icons.login),
                tooltip: 'Se connecter',
              ),
        loading: () => SizedBox.shrink(),
        error: (_, __) => Icon(Icons.error),
      );
    },
  ),
]
```

---

## ÉTAPE 5 – Ajouter une redirection automatique au démarrage (optionnel)

Si vous souhaitez **rediriger automatiquement vers `/login`** si le token est absent dès l’écran d’accueil, vous pouvez entourer `HomeScreen` dans la route `/` avec `AuthGuard` :

```dart
'/': (context) => AuthGuard(child: HomeScreen()),
```

Sinon, on considère que la page d’accueil est publique, et on protège uniquement certaines pages (ex : `/create`, `/premium`).

---

## ÉTAPE 6 – Afficher des boutons conditionnels

Toujours dans `home_screen.dart`, pour masquer certains boutons selon la connexion :

```dart
floatingActionButton: Consumer(
  builder: (context, ref, _) {
    final auth = ref.watch(authStatusProvider);

    return auth.when(
      data: (isLoggedIn) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (isLoggedIn)
            FloatingActionButton(
              heroTag: 'create',
              onPressed: () => Navigator.pushNamed(context, '/create'),
              child: Icon(Icons.add),
              tooltip: 'Nouveau Post',
            ),
          SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'about',
            onPressed: () => Navigator.pushNamed(context, '/about'),
            child: Icon(Icons.info_outline),
          ),
          SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'contact',
            onPressed: () => Navigator.pushNamed(context, '/contact'),
            child: Icon(Icons.email),
          ),
        ],
      ),
      loading: () => SizedBox.shrink(),
      error: (_, __) => SizedBox.shrink(),
    );
  },
),
```

---

## ÉTAPE 7 – Tester le système de sécurité

1. Lancer `flutter run`.
2. Se déconnecter via le bouton logout (dans AppBar).
3. Cliquer sur “+” → redirection automatique vers `/login`.
4. Se reconnecter → créer un post fonctionne à nouveau.

---

## Résultat attendu

| Fonctionnalité                                      | Statut |
| --------------------------------------------------- | ------ |
| Protection de la route `/create` par un guard       | Oui    |
| Redirection automatique vers `/login` si déconnecté | Oui    |
| Affichage conditionnel de boutons selon session     | Oui    |
| Déconnexion et réinitialisation du token            | Oui    |
| State global géré par Riverpod                      | Oui    |


