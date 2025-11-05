# Exercice Pratique : Opérateurs Null Safety en Dart

## Instructions

Vous allez analyser **5 codes** utilisant différents opérateurs Dart.

**Votre mission pour CHAQUE code** :

1. **Expliquer** : Que fait ce code ? Ligne par ligne
2. **Interpréter** : Que signifie chaque symbole spécial (`?.`, `!`, `??`, `??=`) ?
3. **Critiquer** : Ce code est-il bon ou mauvais ? Pourquoi ?
4. **Améliorer** : Proposez une version améliorée si nécessaire



## CODE 1 : Affichage du nombre de recettes

```dart
class RecipeCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('recipes').snapshots(),
      builder: (context, snapshot) {
        final count = snapshot.data?.docs.length ?? 0;
        
        return Text(
          'Nombre de recettes: $count',
          style: TextStyle(fontSize: 24),
        );
      },
    );
  }
}
```

### Votre analyse :

**1. Que fait ce code ?**
```
Écrivez votre explication ici...




```

**2. Que signifient les symboles ?**
- `?.` dans `snapshot.data?.docs.length` signifie : _______________
- `??` dans `?? 0` signifie : _______________

**3. Critique : Ce code est-il bon ou mauvais ?**
```
Votre critique ici...



```

**4. Proposition d'amélioration**
```dart
// Écrivez votre version améliorée ici




```

---

## CODE 2 : Affichage d'une recette

```dart
Widget buildRecipeCard(DocumentSnapshot recipe) {
  final data = recipe.data() as Map<String, dynamic>;
  
  return Card(
    child: Column(
      children: [
        Text(data['name']!),
        Text('Temps: ${data['time']!} min'),
        Text('Calories: ${data['calories']!}'),
      ],
    ),
  );
}
```

### Votre analyse :

**1. Que fait ce code ?**
```
Écrivez votre explication ici...




```

**2. Que signifient les symboles ?**
- `!` dans `data['name']!` signifie : _______________
- Pourquoi y a-t-il `!` après chaque accès aux données ?

**3. Critique : Ce code est-il bon ou mauvais ?**
```
Votre critique ici...
Identifiez au moins 2 problèmes potentiels...




```

**4. Proposition d'amélioration**
```dart
// Écrivez votre version améliorée ici






```

---

## CODE 3 : Gestion du profil utilisateur

```dart
class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String? userName;
  int? userAge;
  
  @override
  void initState() {
    super.initState();
    loadUserData();
  }
  
  void loadUserData() async {
    final doc = await FirebaseFirestore.instance
      .collection('users')
      .doc('user123')
      .get();
    
    final data = doc.data();
    
    setState(() {
      userName ??= data?['name'];
      userAge ??= data?['age'];
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Nom: ${userName ?? "Chargement..."}'),
        Text('Age: ${userAge ?? 0} ans'),
      ],
    );
  }
}
```

### Votre analyse :

**1. Que fait ce code ?**
```
Écrivez votre explication ici...





```

**2. Que signifient les symboles ?**
- `String?` et `int?` signifient : _______________
- `??=` dans `userName ??= data?['name']` signifie : _______________
- `data?['name']` (avec `?`) signifie : _______________
- `??` dans `userName ?? "Chargement..."` signifie : _______________

**3. Critique : Ce code est-il bon ou mauvais ?**
```
Votre critique ici...
Y a-t-il une logique étrange avec ??= ?




```

**4. Proposition d'amélioration**
```dart
// Écrivez votre version améliorée ici







```

---

## CODE 4 : Liste de favoris

```dart
class FavoritesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
        .collection('favorites')
        .snapshots(),
      builder: (context, snapshot) {
        final favorites = snapshot.data!.docs;
        
        if (favorites.isEmpty) {
          return Text('Aucun favori');
        }
        
        return ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            final recipe = favorites[index].data() as Map<String, dynamic>;
            return ListTile(
              title: Text(recipe['name']!),
              subtitle: Text(recipe['description'] ?? 'Pas de description'),
            );
          },
        );
      },
    );
  }
}
```

### Votre analyse :

**1. Que fait ce code ?**
```
Écrivez votre explication ici...




```

**2. Que signifient les symboles ?**
- `!` dans `snapshot.data!.docs` signifie : _______________
- `!` dans `recipe['name']!` signifie : _______________
- `??` dans `recipe['description'] ?? 'Pas de description'` signifie : _______________

**3. Critique : Quel est le GROS problème de ce code ?**
```
Indice: Regardez la première ligne du builder...





```

**4. Proposition d'amélioration**
```dart
// Écrivez votre version améliorée ici








```

---

## CODE 5 : Détails d'une recette

```dart
class RecipeDetails extends StatelessWidget {
  final DocumentSnapshot recipe;
  
  @override
  Widget build(BuildContext context) {
    final data = recipe.data() as Map<String, dynamic>?;
    
    final name = data?['name'] as String?;
    final time = data?['time'] as int?;
    final image = data?['imageUrl'] as String?;
    
    return Column(
      children: [
        if (image != null) 
          Image.network(image)
        else 
          Icon(Icons.restaurant),
          
        Text(name ?? 'Recette sans nom'),
        Text('Temps: ${time ?? 0} minutes'),
      ],
    );
  }
}
```

### Votre analyse :

**1. Que fait ce code ?**
```
Écrivez votre explication ici...




```

**2. Que signifient les symboles ?**
- `Map<String, dynamic>?` (avec `?` à la fin) signifie : _______________
- `data?['name']` signifie : _______________
- `as String?` signifie : _______________
- `??` dans `name ?? 'Recette sans nom'` signifie : _______________
- `if (image != null)` vs `image?.length` : quelle différence ?

**3. Critique : Ce code est-il bon ?**
```
Analysez les points forts et faibles...





```

**4. Proposition d'amélioration (si nécessaire)**
```dart
// Si vous pensez que le code est déjà bon, expliquez pourquoi
// Sinon, proposez une amélioration






```


