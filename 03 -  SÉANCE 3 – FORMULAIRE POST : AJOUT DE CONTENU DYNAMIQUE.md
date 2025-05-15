## SÉANCE 3 – FORMULAIRE POST : AJOUT DE CONTENU DYNAMIQUE

---

### PRÉREQUIS

Avant de commencer, il faut :

* que la séance 2 soit terminée (liste de posts affichée dynamiquement),
* que l’API `/posts` supporte le POST (création d’un post).

---

## ÉTAPE 1 – CRÉER LE NOUVEL ÉCRAN `CreatePostScreen`

Créer un nouveau fichier dans `lib/screens/create_post_screen.dart`

Coller **exactement** ce code :

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
  bool _isSubmitting = false;

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();
    setState(() => _isSubmitting = true);

    final repo = ref.read(postsRepositoryProvider);
    try {
      await repo.createPost(title: _title, body: _body);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de la création : $e')),
      );
    }

    setState(() => _isSubmitting = false);
    if (mounted) {
      ref.invalidate(postsProvider); // recharger la liste
      Navigator.pop(context); // revenir à l’accueil
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Créer un Post')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Titre'),
                  maxLength: 80,
                  onSaved: (value) => _title = value!.trim(),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Le titre est requis';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Contenu'),
                  maxLines: 5,
                  maxLength: 500,
                  onSaved: (value) => _body = value!.trim(),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Le contenu est requis';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isSubmitting ? null : _submitForm,
                    child: _isSubmitting
                        ? SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
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

## ÉTAPE 2 – AJOUTER LA MÉTHODE `createPost` DANS LE REPOSITORY

Ouvrir le fichier : `lib/repositories/posts_repository.dart`

Ajouter la méthode suivante **à la fin de la classe `PostsRepository`** :

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

## ÉTAPE 3 – ENREGISTRER LA ROUTE `/create` DANS `main.dart`

Ouvrir `lib/main.dart`

1. Ajouter cette ligne dans les `import` :

```dart
import 'screens/create_post_screen.dart';
```

2. Ajouter cette ligne dans la map `routes` :

```dart
'/create': (context) => CreatePostScreen(),
```

Exemple complet :

```dart
routes: {
  '/': (context) => HomeScreen(),
  '/about': (context) => AboutScreen(),
  '/contact': (context) => ContactScreen(),
  '/create': (context) => CreatePostScreen(), // route ajoutée
},
```

---

## ÉTAPE 4 – AJOUTER UN BOUTON “+” DANS L’ACCUEIL

Ouvrir `lib/screens/home_screen.dart`

1. Remplacer le champ `floatingActionButton` actuel **par ce code** :

```dart
floatingActionButton: Column(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    FloatingActionButton(
      heroTag: 'create',
      onPressed: () => Navigator.pushNamed(context, '/create'),
      tooltip: 'Nouveau Post',
      child: Icon(Icons.add),
    ),
    SizedBox(height: 12),
    FloatingActionButton(
      heroTag: 'about',
      onPressed: () => Navigator.pushNamed(context, '/about'),
      tooltip: 'À propos',
      child: Icon(Icons.info_outline),
    ),
    SizedBox(height: 12),
    FloatingActionButton(
      heroTag: 'contact',
      onPressed: () => Navigator.pushNamed(context, '/contact'),
      tooltip: 'Contact',
      child: Icon(Icons.email),
    ),
  ],
),
```

---

## ÉTAPE 5 – EXÉCUTER L’APPLICATION ET TESTER

Dans le terminal :

```bash
flutter run
```

1. Cliquer sur l’icône “+” pour ouvrir le formulaire.
2. Remplir le titre et le contenu.
3. Cliquer sur “Publier”.
4. Vous revenez automatiquement à la page d’accueil.
5. Le nouveau post s’ajoute en haut de la liste.

---

## COMPORTEMENT ATTENDU

* Un formulaire s’ouvre avec deux champs obligatoires.
* Les erreurs s’affichent si les champs sont vides.
* Le bouton est désactivé pendant le chargement.
* Une fois le post soumis, le feed est mis à jour automatiquement.

---

## FIN DE LA SÉANCE 3

Tout ce qui suit est conforme au plan :

| Objectif du plan                       | Réalisé |
| -------------------------------------- | ------- |
| Formulaire validé localement           | Oui     |
| Requête HTTP POST envoyée via Dio      | Oui     |
| Ajout dynamique visible dès retour     | Oui     |
| Invalidated Provider avec Riverpod     | Oui     |
| Bouton + flottant déclenche navigation | Oui     |

