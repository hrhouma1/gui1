## Séance 3 – Formulaire “Créer un Post”, envoi HTTP POST, rafraîchissement automatique du feed

> Cette séance continue le projet `my_app` obtenu à la fin de la séance 2 (liste dynamique des posts).



### Étape 1 – Ajouter la route et l’écran “CreatePost”

#### 1.1 Créer le fichier `lib/screens/create_post_screen.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/posts_provider.dart';

class CreatePostScreen extends ConsumerStatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends ConsumerState<CreatePostScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _body = '';
  bool _saving = false;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    setState(() => _saving = true);

    final repo = ref.read(postsRepositoryProvider);
    await repo.createPost(title: _title, body: _body);

    setState(() => _saving = false);
    if (mounted) Navigator.pop(context);            // Retour à l’accueil
    ref.invalidate(postsProvider);                 // Force un rafraîchissement
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nouveau post')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Titre'),
                  maxLength: 80,
                  onSaved: (v) => _title = v!.trim(),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Titre requis' : null,
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Contenu'),
                  maxLines: 5,
                  maxLength: 500,
                  onSaved: (v) => _body = v!.trim(),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Contenu requis' : null,
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _saving ? null : _submit,
                    child: _saving
                        ? SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(strokeWidth: 2))
                        : Text('Publier'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

---

### Étape 2 – Étendre le dépôt `PostsRepository`

Ouvrir `lib/repositories/posts_repository.dart` et **ajouter** :

```dart
  Future<void> createPost({required String title, required String body}) async {
    await _dio.post(
      '/posts',
      data: {
        'title': title,
        'body': body,
      },
    );
  }
```

---

### Étape 3 – Enregistrer la nouvelle route dans `main.dart`

Dans `lib/main.dart`, modifier la section `routes` :

```dart
import 'screens/create_post_screen.dart';      // ajouter cette ligne

// ...

routes: {
  '/': (context) => HomeScreen(),
  '/about': (context) => AboutScreen(),
  '/contact': (context) => ContactScreen(),
  '/create': (context) => CreatePostScreen(),  // nouvelle route
},
```

---

### Étape 4 – Ajouter un bouton “+” dans `home_screen.dart`

Remplacer la partie `floatingActionButton` par :

```dart
floatingActionButton: Column(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    FloatingActionButton(
      heroTag: 'add',
      onPressed: () => Navigator.pushNamed(context, '/create'),
      child: Icon(Icons.add),
      tooltip: 'Nouveau post',
    ),
    SizedBox(height: 12),
    FloatingActionButton(
      heroTag: 'about',
      onPressed: () => Navigator.pushNamed(context, '/about'),
      child: Icon(Icons.info_outline),
      tooltip: 'À propos',
    ),
    SizedBox(height: 12),
    FloatingActionButton(
      heroTag: 'contact',
      onPressed: () => Navigator.pushNamed(context, '/contact'),
      child: Icon(Icons.email),
      tooltip: 'Contact',
    ),
  ],
),
```

---

### Étape 5 – Exécuter l’application et tester

```bash
flutter run
```

1. Cliquer sur le bouton “+” (icône d’ajout).
2. Remplir le formulaire (titre + contenu) puis “Publier”.
3. L’application revient à l’écran d’accueil.
4. La liste se rafraîchit et le nouveau post apparaît en haut.

---

### Comportement attendu

* Les champs vides génèrent un message d’erreur.
* Le bouton est désactivé et un loader s’affiche pendant l’envoi réseau.
* Après validation, le `postsProvider` est invalidé ; Riverpod re-charge la liste.

La fonctionnalité **Formulaire & POST** est désormais complète, conformément au plan.
La séance 4 introduira **l’architecture propre (couches data/domain/UI) et les tests unitaires**.
