## Séance 6 – Authentification avec JWT : inscription, connexion, stockage sécurisé du token

> Objectif : permettre à l’utilisateur de s’inscrire, de se connecter, et de rester authentifié.
> Le token JWT sera stocké localement via `flutter_secure_storage`. Ce token sera envoyé dans tous les appels HTTP via un intercepteur Dio.

---

## ÉTAPE 1 – Ajouter les dépendances nécessaires

Dans le terminal :

```bash
flutter pub add flutter_secure_storage
```

---

## ÉTAPE 2 – Créer le modèle `User` (simple, uniquement côté client)

Créer `lib/domain/entities/user.dart` :

```dart
class User {
  final String email;
  final String token;

  User({required this.email, required this.token});
}
```

---

## ÉTAPE 3 – Créer la couche de stockage sécurisé

Créer `lib/core/services/secure_storage_service.dart` :

```dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final _storage = const FlutterSecureStorage();

  Future<void> writeToken(String token) async {
    await _storage.write(key: 'auth_token', value: token);
  }

  Future<String?> readToken() async {
    return await _storage.read(key: 'auth_token');
  }

  Future<void> clearToken() async {
    await _storage.delete(key: 'auth_token');
  }
}
```

---

## ÉTAPE 4 – Adapter Dio pour attacher automatiquement le JWT

Créer `lib/core/interceptors/auth_interceptor.dart` :

```dart
import 'package:dio/dio.dart';
import '../services/secure_storage_service.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorageService storage;

  AuthInterceptor(this.storage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await storage.readToken();

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return handler.next(options);
  }
}
```

---

## ÉTAPE 5 – Modifier l’initialisation de Dio pour inclure l’intercepteur

Dans `lib/data/datasources/posts_api.dart`, remplacer la ligne Dio :

```dart
final Dio _dio = Dio(BaseOptions(baseUrl: 'https://example.com'));
```

par :

```dart
import '../../core/services/secure_storage_service.dart';
import '../../core/interceptors/auth_interceptor.dart';

final _dio = Dio(BaseOptions(baseUrl: 'https://example.com'))
  ..interceptors.add(AuthInterceptor(SecureStorageService()));
```

---

## ÉTAPE 6 – Créer le service `AuthApi`

Créer `lib/data/datasources/auth_api.dart` :

```dart
import 'package:dio/dio.dart';
import '../../core/services/secure_storage_service.dart';

class AuthApi {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://example.com'));
  final _storage = SecureStorageService();

  Future<void> register({required String email, required String password}) async {
    final res = await _dio.post('/auth/register', data: {
      'email': email,
      'password': password,
    });

    final token = res.data['token'];
    await _storage.writeToken(token);
  }

  Future<void> login({required String email, required String password}) async {
    final res = await _dio.post('/auth/login', data: {
      'email': email,
      'password': password,
    });

    final token = res.data['token'];
    await _storage.writeToken(token);
  }

  Future<void> logout() async {
    await _storage.clearToken();
  }
}
```

---

## ÉTAPE 7 – Créer les écrans `RegisterScreen` et `LoginScreen`

### A. Créer `lib/presentation/screens/register_screen.dart`

```dart
import 'package:flutter/material.dart';
import '../../data/datasources/auth_api.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _loading = false;

  final _authApi = AuthApi();

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    setState(() => _loading = true);

    try {
      await _authApi.register(email: _email, password: _password);
      Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erreur: $e')));
    }

    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Créer un compte')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (val) => _email = val!.trim(),
                validator: (val) => val == null || val.isEmpty ? 'Requis' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Mot de passe'),
                obscureText: true,
                onSaved: (val) => _password = val!,
                validator: (val) => val == null || val.length < 6 ? 'Min 6 caractères' : null,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _loading ? null : _submit,
                child: _loading
                    ? CircularProgressIndicator()
                    : Text('S’inscrire'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

### B. Créer `lib/presentation/screens/login_screen.dart`

Copier le code de `RegisterScreen` et adapter l’appel :

```dart
await _authApi.login(email: _email, password: _password);
```

Changer les textes `Créer un compte` → `Connexion`, etc.

---

## ÉTAPE 8 – Ajouter les routes `/login` et `/register` dans `main.dart`

Dans `lib/main.dart` :

```dart
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/register_screen.dart';

routes: {
  '/login': (context) => LoginScreen(),
  '/register': (context) => RegisterScreen(),
}
```

---

## ÉTAPE 9 – Ajouter un menu Auth dans `home_screen.dart`

Dans le `AppBar`, ajouter :

```dart
actions: [
  IconButton(
    onPressed: () => Navigator.pushNamed(context, '/login'),
    icon: Icon(Icons.login),
    tooltip: 'Connexion',
  ),
  IconButton(
    onPressed: () => Navigator.pushNamed(context, '/register'),
    icon: Icon(Icons.person_add),
    tooltip: 'Inscription',
  ),
],
```

---

## ÉTAPE 10 – Tester

1. Lancer `flutter run`.
2. Cliquer sur “Connexion” → saisir email/mot de passe.
3. Le token est stocké.
4. Accéder aux routes API sécurisées fonctionne.
5. Relancer l’app → toujours connecté grâce au token stocké.

---

## Résultat de la séance

| Fonctionnalité                           | Statut |
| ---------------------------------------- | ------ |
| Formulaire d’inscription fonctionnel     | Oui    |
| Formulaire de connexion fonctionnel      | Oui    |
| Stockage sécurisé du token JWT           | Oui    |
| Attachement automatique dans Dio headers | Oui    |
| Navigation conditionnelle possible       | Oui    |


