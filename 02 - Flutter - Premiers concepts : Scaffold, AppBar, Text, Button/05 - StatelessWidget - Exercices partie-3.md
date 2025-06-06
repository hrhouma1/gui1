
# <h2 id="flutter-widgets-summary">Résumé des widgets Flutter</h2>



Un **widget Flutter** peut être de deux types :

* **Stateful** (à état) : il peut changer dans le temps, par exemple lorsqu’un utilisateur interagit avec lui.
* **Stateless** (sans état) : il ne change jamais une fois créé.



### Stateless Widgets

Un widget stateless est **immuable**. Il ne peut pas être modifié après sa création.
Exemples de widgets stateless :

* `Icon`
* `IconButton`
* `Text`

Tous les widgets stateless dérivent de la classe `StatelessWidget`.

<br/>
<br/>
<br/>

# Stateful Widgets

Un widget stateful est **dynamique**. Il peut changer d’apparence ou de comportement à la suite d’interactions, de modifications internes ou d’événements externes.

Tous les widgets de ce type étendent la classe `StatefulWidget`.



### La fonction `setState(...)`

Quand on appelle `setState(...)` dans un `StatefulWidget` :

* Tout le code contenu dans la méthode `build(...)` est réexécuté
* Cela déclenche une **mise à jour visuelle** de l’interface




<br/>
<br/>
<br/>

# <h2 id="stateful-vs-stateless">Comparaison entre `StatefulWidget` et `StatelessWidget`</h2>

<table border="1" cellpadding="8" cellspacing="0">
  <thead>
    <tr>
      <th style="text-align:left;">Critère</th>
      <th style="text-align:left;">StatelessWidget</th>
      <th style="text-align:left;">StatefulWidget</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Définition</td>
      <td>Un widget qui ne change jamais après sa construction.</td>
      <td>Un widget qui peut changer dynamiquement en fonction d’un état interne.</td>
    </tr>
    <tr>
      <td>Classe de base</td>
      <td><code>StatelessWidget</code></td>
      <td><code>StatefulWidget</code></td>
    </tr>
    <tr>
      <td>Possède un état ?</td>
      <td>Non</td>
      <td>Oui (via un objet <code>State</code>)</td>
    </tr>
    <tr>
      <td>Interaction utilisateur</td>
      <td>Pas possible sans reconstruire manuellement</td>
      <td>Réagit aux événements (clics, scroll, etc.)</td>
    </tr>
    <tr>
      <td>Exemples courants</td>
      <td><code>Text</code>, <code>Icon</code>, <code>Container</code></td>
      <td><code>Checkbox</code>, <code>TextField</code>, <code>Form</code></td>
    </tr>
    <tr>
      <td>Réexécution de <code>build()</code></td>
      <td>Uniquement quand le widget parent se reconstruit</td>
      <td>À chaque appel de <code>setState(...)</code></td>
    </tr>
    <tr>
      <td>Performance</td>
      <td>Léger, rapide à construire</td>
      <td>Moins performant si mal géré</td>
    </tr>
    <tr>
      <td>Cas d’usage</td>
      <td>Affichage simple et statique</td>
      <td>Affichage interactif, dynamique, dépendant de données</td>
    </tr>
  </tbody>
</table>


<br/>
<br/>
<br/>

# <h2 id="c-etat3">Exercice 26 – Changer les couleurs de fond de manière aléatoire</h2>



### Objectif

* Générer des couleurs aléatoires en Flutter
* Modifier dynamiquement les couleurs de l’`AppBar` et du fond (`Scaffold`)
* Réagir à un clic sur une image pour déclencher ces changements



### Résultat attendu

* L’image est cliquable
* Chaque clic change la couleur de fond du haut (AppBar) et du corps (Scaffold)
* Les couleurs sont choisies aléatoirement à partir d’une liste prédéfinie



### Code Flutter complet

```dart
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MonApp(),
  ));
}

class MonApp extends StatefulWidget {
  const MonApp({super.key});

  @override
  State<MonApp> createState() => _MonAppState();
}

class _MonAppState extends State<MonApp> {
  // Générateur de nombres aléatoires
  final Random random = Random();

  // Indices initiaux
  int appBar = 0;
  int scaffold = 0;

  // Liste des couleurs disponibles
  final List<Color> colours = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.pink,
    Colors.orange,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colours[appBar], // Couleur de la AppBar
        centerTitle: true,
        title: const Text('Changer de couleur'),
      ),
      backgroundColor: colours[scaffold], // Couleur du fond
      body: MaterialButton(
        onPressed: () {
          setState(() {
            // Choisit aléatoirement une nouvelle couleur
            appBar = random.nextInt(colours.length);
            scaffold = random.nextInt(colours.length);
          });
        },
        child: Center(
          child: Image.asset('images/dash.png'),
        ),
      ),
    );
  }
}
```

---

### Explication

* `Random().nextInt(n)` donne un nombre entre 0 et `n-1`.
* `colours[index]` permet d’accéder à une couleur dans la liste.
* Chaque fois qu’on appuie sur le bouton (l’image), Flutter appelle `setState(...)`, ce qui provoque la reconstruction de l’interface avec de nouvelles couleurs.

---

### À tester

* Ajouter plus de couleurs dans la liste
* Ne changer que la couleur du fond (`backgroundColor`) sans toucher à `AppBar`
* Ajouter une logique pour éviter que la couleur reste identique deux fois de suite





<br/>
<br/>
<br/>

# <h2 id="c-etat4">Exercice 27 – Revenir à la couleur blanche après un clic</h2>



### Objectif

* Revenir à la couleur d’origine (ex. : `Colors.white`) quand on clique à nouveau
* Basculer dynamiquement entre deux états de couleur
* Introduire la logique booléenne `toggle` (bascule) avec `setState(...)`



### Résultat attendu

* L’image est toujours cliquable
* Premier clic : couleurs aléatoires pour `AppBar` et `Scaffold`
* Deuxième clic : tout revient à **blanc** (fond) et **noir** (barre du haut)
* Comportement en alternance



### Code Flutter complet

```dart
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MonApp(),
  ));
}

class MonApp extends StatefulWidget {
  const MonApp({super.key});

  @override
  State<MonApp> createState() => _MonAppState();
}

class _MonAppState extends State<MonApp> {
  final Random random = Random();

  // Liste de couleurs utilisées pour l'effet
  final List<Color> colours = [
    Colors.red,
    Colors.green,
    Colors.pink,
    Colors.orange,
    Colors.purple,
    Colors.teal,
  ];

  // Indices des couleurs actuelles
  int appBar = 0;
  int scaffold = 0;

  // Indique si on est en mode "couleur aléatoire" ou "réinitialisé"
  bool isRandom = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isRandom ? colours[appBar] : Colors.black,
        centerTitle: true,
        title: const Text("Changer couleur"),
      ),
      backgroundColor: isRandom ? colours[scaffold] : Colors.white,
      body: MaterialButton(
        onPressed: () {
          setState(() {
            // Alterne entre mode aléatoire et mode réinitialisé
            if (!isRandom) {
              appBar = random.nextInt(colours.length);
              scaffold = random.nextInt(colours.length);
              isRandom = true;
            } else {
              isRandom = false;
            }
          });
        },
        child: Center(
          child: Image.asset('images/dash.png'),
        ),
      ),
    );
  }
}
```



### Explication

* `isRandom` est une variable booléenne qui garde en mémoire si on est en mode aléatoire
* Si `isRandom` est `false`, un clic active des couleurs aléatoires
* Si `isRandom` est `true`, un clic ramène les couleurs par défaut (`Colors.white` et `Colors.black`)
* `setState(...)` déclenche à chaque fois la reconstruction de l’interface



### À expérimenter

* Remplacer le `MaterialButton` par un `GestureDetector`
* Modifier aussi la couleur du texte du `AppBar` (ex. `foregroundColor`)
* Ajouter une `Text` indiquant "mode actif" ou "mode réinitialisé"

<br/>
<br/>
<br/>


# <h2 id="c-etat5">Exercice 28 – Jouer un son et changer de couleur au clic</h2>



### Objectif

* Importer et utiliser la bibliothèque `audioplayers`
* Jouer un son différent à chaque clic sur une image
* Changer dynamiquement les couleurs de la `Scaffold` et de la `AppBar`



### 📁 Préparation des fichiers audio

Avant de commencer, vous devez :

1. Ajouter vos fichiers `.wav` dans un dossier `assets/sounds/`
2. Déclarer ces fichiers dans `pubspec.yaml` :

```yaml
flutter:
  assets:
    - assets/sounds/
```

3. Installer le package `audioplayers` (version stable) dans `pubspec.yaml` :

```yaml
dependencies:
  audioplayers: ^5.0.0
```



###  Résultat attendu

* Chaque fois que l’utilisateur appuie sur l’image :

  * Un son est joué (choisi aléatoirement)
  * Les couleurs de fond changent


### Code Flutter complet

```dart
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Random random = Random();

  // Liste des couleurs pour appBar et fond
  final List<Color> colours = [
    Colors.white,
    Colors.teal,
    Colors.black,
    Colors.pinkAccent,
    Colors.red,
    Colors.purple
  ];

  // Indices de couleur
  int appBar = 0;
  int scaffold = 0;

  // Liste des sons
  final List<String> sounds = [
    'SEU4_Kick_31.wav',
    'SEU4_Ride_08.wav',
    'SEU4_Snare_26.wav',
    'SEU4_Tom_07.wav',
  ];

  // Position actuelle du son
  int soundPosition = 0;

  // Initialisation du lecteur audio
  final AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: colours[appBar],
          centerTitle: true,
          title: IconButton(
            icon: const Icon(Icons.refresh, color: Colors.blueAccent),
            onPressed: () {
              // Change manuellement le son à jouer
              setState(() {
                soundPosition = random.nextInt(sounds.length);
              });
            },
          ),
        ),
        backgroundColor: colours[scaffold],
        body: MaterialButton(
          onPressed: () {
            setState(() {
              // Joue le son à la position actuelle
              player.play(AssetSource('sounds/${sounds[soundPosition]}'));

              // Met à jour les couleurs aléatoirement
              appBar = random.nextInt(colours.length);
              scaffold = random.nextInt(colours.length);

              // Prépare un autre son au hasard pour le prochain clic
              soundPosition = random.nextInt(sounds.length);
            });
          },
          child: Center(
            child: Image.asset('images/dash.png'),
          ),
        ),
      ),
    );
  }
}
```



###  Ce que vous apprenez

* Utilisation de `AudioPlayer` pour jouer des sons locaux
* Gestion d’un état dynamique (sons + couleurs)
* Bonne pratique : centraliser les fichiers audio dans un dossier dédié
* Réutilisation de `AssetSource` avec interpolation



### Extensions possibles

* Associer un son spécifique à une couleur
* Afficher le nom du son joué dans un `Text`
* Ajouter un bouton "Stop" pour arrêter le son



<br/>
<br/>
<br/>

# <h2 id="c-etat29">Exercice 29 – Jouer un son précis et changer de couleur</h2>


### Objectif

* Déclencher un son spécifique (ex. : kick)
* Afficher une image (Dash)
* Changer dynamiquement la couleur de la `Scaffold` et de la `AppBar` à chaque clic


### Code Flutter détaillé avec explications

```dart
import 'dart:math';                             // Pour générer des valeurs aléatoires
import 'package:flutter/material.dart';        // Widgets principaux Flutter
import 'package:audioplayers/audioplayers.dart'; // Pour jouer des sons

void main() {
  runApp(const MyApp());
}

// Widget principal avec état
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Random random = Random();              // Pour tirer des indices aléatoires

  // Déclaration d'une liste de couleurs
  final List<Color> colours = [
    Colors.white,
    Colors.teal,
    Colors.black,
    Colors.pinkAccent,
    Colors.red,
    Colors.purple
  ];

  // Index des couleurs utilisées dans le Scaffold et AppBar
  int appBar = 0;
  int scaffold = 0;

  // Déclaration du lecteur audio
  final AudioPlayer player = AudioPlayer();

  // Fichier son ciblé (fixe)
  final String kick = 'SEU4_Kick_31.wav';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,       // Supprime la bannière "debug"
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: colours[appBar],     // Couleur aléatoire de la AppBar
          centerTitle: true,
          title: const Text("Mon application son"),
        ),
        backgroundColor: colours[scaffold],     // Couleur aléatoire du fond
        body: MaterialButton(
          onPressed: () {
            setState(() {
              // Joue un son fixe (le fichier kick)
              player.play(AssetSource('sounds/$kick'));

              // Tire de nouvelles couleurs aléatoires pour le fond et l’appBar
              appBar = random.nextInt(colours.length);
              scaffold = random.nextInt(colours.length);
            });
          },
          child: Center(
            child: Image.asset(
              'images/dash.png',                // Affiche l’image de Dash
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
```



### Instructions pour que le projet fonctionne

1. **Créer un dossier de sons** :
   Placez le fichier `SEU4_Kick_31.wav` dans `assets/sounds/`.

2. **Modifier `pubspec.yaml`** pour inclure l’actif :

```yaml
flutter:
  assets:
    - assets/sounds/
```

3. **Ajouter `audioplayers` dans vos dépendances :**

```yaml
dependencies:
  audioplayers: ^5.0.0
```

4. **Relancer `flutter pub get`**

---

### Concepts abordés

| Élément              | Rôle pédagogique                                        |
| -------------------- | ------------------------------------------------------- |
| `StatefulWidget`     | Pour changer dynamiquement les couleurs et jouer un son |
| `setState()`         | Notifie Flutter de redessiner l’interface               |
| `AudioPlayer`        | Permet de lire un fichier son local                     |
| `AssetSource()`      | Cible un fichier son dans le dossier `assets`           |
| `Random().nextInt()` | Génère un entier entre 0 et N-1                         |
| `Image.asset()`      | Affiche une image stockée localement                    |



<br/>
<br/>
<br/>

# <h2 id="ex-sound-colors">Exercice – Changer les couleurs et jouer un son</h2>

#### Objectif :

Afficher une image au centre de l'écran, et à chaque fois qu'on clique dessus :

* changer aléatoirement la couleur de l'`AppBar` et du `Scaffold`,
* jouer un son `.wav` choisi au hasard parmi une liste de fichiers.

#### Étapes détaillées :

1. **Créer un projet Flutter.**
2. **Placer les sons `.wav` dans un dossier `assets/sounds`.**
3. **Placer une image `dash.png` dans `assets/images`.**
4. **Modifier `pubspec.yaml` :**

```yaml
flutter:
  assets:
    - assets/images/
    - assets/sounds/
```

5. **Ajouter le package audioplayers dans `pubspec.yaml` :**

```yaml
dependencies:
  audioplayers: ^4.1.0
```

---

### Code complet commenté :

```dart
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // Importer le package audio

void main() {
  runApp(const MyApp());
}

// Widget avec état
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Liste de couleurs possibles
  List<Color> colours = [
    Colors.white,
    Colors.teal,
    Colors.black,
    Colors.pinkAccent,
    Colors.red,
    Colors.purple,
  ];

  // Indices pour changer la couleur d'arrière-plan
  int appBar = 0;
  int scaffold = 0;

  // Initialiser l'objet Random
  Random random = Random();

  // Liste des fichiers audio à jouer
  final List<String> sounds = [
    'assets/sounds/SEU4_Kick_31.wav',
    'assets/sounds/SEU4_Ride_08.wav',
    'assets/sounds/SEU4_Snare_26.wav',
    'assets/sounds/SEU4_Tom_07.wav',
  ];

  // Position courante du son
  int soundPosition = 0;

  // Créer un objet player
  final AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Supprimer la bannière "debug"
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: colours[appBar], // Couleur AppBar dynamique
          centerTitle: true,
          title: const Text(''),
          actions: [
            IconButton(
              icon: const Icon(Icons.music_note),
              onPressed: () {
                // Sélectionne un son au hasard
                setState(() {
                  soundPosition = random.nextInt(sounds.length);
                });
              },
            )
          ],
        ),
        backgroundColor: colours[scaffold], // Couleur de fond dynamique
        body: Center(
          child: MaterialButton(
            onPressed: () async {
              setState(() {
                appBar = random.nextInt(colours.length);
                scaffold = random.nextInt(colours.length);
              });

              // Joue le son sélectionné
              await player.play(AssetSource(sounds[soundPosition]));
            },
            child: Image.asset(
              'assets/images/dash.png',
              width: 150,
              height: 150,
            ),
          ),
        ),
      ),
    );
  }
}
```

---

### Points pédagogiques :

* Utilisation d’un `StatefulWidget` pour réagir à un clic.
* Manipulation de `Random` pour créer de la variabilité.
* Introduction à la lecture audio locale avec `audioplayers`.
* Modification dynamique de l’interface avec `setState()`.



<br/>
<br/>
<br/>

# <h2 id="api-ex1">Exercice 1 – Afficher une liste d’utilisateurs GitHub</h2>

**Objectif pédagogique :** apprendre à utiliser Dio pour faire une requête HTTP GET, parser une réponse JSON, et afficher les données dans une `ListView`.



### Étape 1 – Ajouter le package Dio

Dans le fichier `pubspec.yaml` :

```yaml
dependencies:
  flutter:
    sdk: flutter
  dio: ^5.4.0
```

Puis exécute :

```bash
flutter pub get
```



### Étape 2 – Créer le fichier `main.dart`

Voici le code complet commenté :

```dart
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

// Application principale
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GitHubUsersPage(),
    );
  }
}

// Page qui affiche les utilisateurs
class GitHubUsersPage extends StatefulWidget {
  const GitHubUsersPage({super.key});

  @override
  State<GitHubUsersPage> createState() => _GitHubUsersPageState();
}

class _GitHubUsersPageState extends State<GitHubUsersPage> {
  List users = [];
  bool isLoading = true;

  // Fonction pour récupérer les utilisateurs
  Future<void> fetchUsers() async {
    try {
      var response = await Dio().get('https://api.github.com/users');
      setState(() {
        users = response.data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Erreur: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Utilisateurs GitHub'),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user['avatar_url']),
                  ),
                  title: Text(user['login']),
                  subtitle: Text(user['html_url']),
                );
              },
            ),
    );
  }
}
```



### Étape 3 – Explication rapide

* `Dio().get(...)` permet de faire une requête GET.
* L’URL utilisée retourne une liste d’utilisateurs publics de GitHub.
* Le widget `ListView.builder` affiche chaque utilisateur avec :

  * son **avatar**
  * son **login**
  * son **URL GitHub**



### Étape 4 – Vérification

Assure-toi d’avoir une connexion internet active et teste sur un émulateur ou appareil réel.


<br/>
<br/>
<br/>

# Étapes pour corriger l’erreur `Couldn't resolve the package 'dio'`

### <h2 id="etape1">Étape 1 – Ajouter correctement `dio` dans `pubspec.yaml`</h2>

Ouvre ton fichier `pubspec.yaml` et ajoute la ligne suivante **dans la section `dependencies:`** :

```yaml
dependencies:
  flutter:
    sdk: flutter
  dio: ^5.4.0
```

> ⚠️ Assure-toi qu’il n’y a **pas d’espace ou indentation incorrecte**. La clé `dependencies` doit être alignée avec `flutter:` et les packages doivent être indentés de **2 espaces**.


### <h2 id="etape2">Étape 2 – Installer le package</h2>

Dans le terminal (dans le dossier du projet), exécute cette commande :

```bash
flutter pub get
```

Tu devrais voir :

```
Resolving dependencies...
Got socket error trying to find package dio at https://pub.dev.
Downloading dio 5.4.0...
```


### <h2 id="etape3">Étape 3 – Redémarrer complètement l’application</h2>

Après l’installation :

* **Arrête** l’application s’il y a une erreur.
* Ferme le terminal ou l’émulateur si besoin.
* Relance l’application **complètement** avec :

```bash
flutter run
```

> Le hot reload ne suffit pas pour charger les nouveaux packages.



### <h2 id="etape4">Étape 4 – Vérifier que l’import est correct</h2>

Dans ton fichier `main.dart`, l’import doit être :

```dart
import 'package:dio/dio.dart';
```

Et la création de l’instance doit être :

```dart
var response = await Dio().get('https://api.github.com/users');
```



### <h2 id="etape5">Bonus – Supprimer le cache si ça ne marche toujours pas</h2>

Si le problème persiste malgré tout, tu peux forcer un nettoyage :

```bash
flutter clean
flutter pub get
flutter run
```





<br/>
<br/>
<br/>

# Exemple de code Flutter complet pour effectuer une recherche GitHub par nom d’utilisateur :

```dart
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() => runApp(const GitHubUserSearchApp());

class GitHubUserSearchApp extends StatelessWidget {
  const GitHubUserSearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recherche GitHub',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const GitHubUserSearchPage(),
    );
  }
}

class GitHubUserSearchPage extends StatefulWidget {
  const GitHubUserSearchPage({super.key});

  @override
  State<GitHubUserSearchPage> createState() => _GitHubUserSearchPageState();
}

class _GitHubUserSearchPageState extends State<GitHubUserSearchPage> {
  final TextEditingController _controller = TextEditingController();
  final Dio dio = Dio();
  Map<String, dynamic>? userData;
  String? error;

  Future<void> fetchUser(String username) async {
    setState(() {
      userData = null;
      error = null;
    });
    try {
      final response = await dio.get('https://api.github.com/users/$username');
      setState(() {
        userData = response.data;
      });
    } catch (e) {
      setState(() {
        error = 'Utilisateur introuvable';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recherche utilisateur GitHub'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Nom d’utilisateur GitHub',
                border: OutlineInputBorder(),
              ),
              onSubmitted: fetchUser,
            ),
            const SizedBox(height: 20),
            if (userData != null)
              Card(
                elevation: 5,
                child: ListTile(
                  leading: Image.network(userData!['avatar_url']),
                  title: Text(userData!['login']),
                  subtitle: Text(userData!['bio'] ?? 'Aucune bio'),
                ),
              ),
            if (error != null)
              Text(
                error!,
                style: const TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
```












<br/>
<br/>
<br/>

# <h2 id="api-ex2">Exercice – Recherche dynamique d'utilisateurs GitHub</h2>



###  Dépendance dans `pubspec.yaml`

```yaml
dependencies:
  flutter:
    sdk: flutter
  dio: ^5.4.0
```



### Code complet `main.dart`

```dart
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const GitHubSearchApp());
}

class GitHubSearchApp extends StatelessWidget {
  const GitHubSearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GitHubUserSearchLive(),
    );
  }
}

class GitHubUserSearchLive extends StatefulWidget {
  const GitHubUserSearchLive({super.key});

  @override
  State<GitHubUserSearchLive> createState() => _GitHubUserSearchLiveState();
}

class _GitHubUserSearchLiveState extends State<GitHubUserSearchLive> {
  final TextEditingController _controller = TextEditingController();
  final Dio dio = Dio();
  List users = [];
  bool isLoading = false;

  // Appelé à chaque modification du champ de texte
  Future<void> searchUsers(String query) async {
    if (query.isEmpty) {
      setState(() {
        users = [];
      });
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final response =
          await dio.get('https://api.github.com/search/users?q=$query');
      setState(() {
        users = response.data['items'];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        users = [];
        isLoading = false;
      });
      print("Erreur lors de la recherche : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recherche live GitHub"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onChanged: searchUsers, // appel dynamique
              decoration: InputDecoration(
                labelText: "Entrez un nom d'utilisateur",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            isLoading
                ? const CircularProgressIndicator()
                : Expanded(
                    child: ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(user['avatar_url']),
                            ),
                            title: Text(user['login']),
                            subtitle: Text(user['html_url']),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
```



###  Résumé pédagogique

| Concept            | Ce qu’on apprend                             |
| ------------------ | -------------------------------------------- |
| `onChanged`        | Déclenche une action à chaque frappe clavier |
| API GitHub Search  | Utilisation de `/search/users?q=...`         |
| `ListView.builder` | Affichage dynamique d’une liste              |
| `CircleAvatar`     | Affiche une image arrondie                   |
| `Dio` + JSON       | Gestion des requêtes HTTP + parsing JSON     |



<br/>
<br/>
<br/>

# Annexe 1 - createState()

### <h2 id="exp-createState"> Comprendre `createState() => _GitHubUserSearchLiveState()`</h2>

Lorsque tu crées un `StatefulWidget`, tu dois lui associer une **classe d’état**, c’est-à-dire une classe qui contient **les données variables** et **le comportement dynamique** de ton widget.



### <h3>1. Déclaration d’un `StatefulWidget`</h3>

```dart
class GitHubUserSearchLive extends StatefulWidget {
  const GitHubUserSearchLive({super.key});

  @override
  State<GitHubUserSearchLive> createState() => _GitHubUserSearchLiveState();
}
```


### <h3>2. Explication ligne par ligne</h3>

####  `class GitHubUserSearchLive extends StatefulWidget`

* Tu définis un **widget avec état**.
* Ce widget sera reconstruit dynamiquement lorsqu’on appelle `setState(...)`.



####  `createState() => _GitHubUserSearchLiveState();`

* Méthode obligatoire de `StatefulWidget`.
* **Son rôle :** retourner une instance de la classe d’état.
* `createState()` **retourne** un objet `_GitHubUserSearchLiveState`.


### <h3>3. Que signifie le type `State<GitHubUserSearchLive>` ?</h3>

```dart
class _GitHubUserSearchLiveState extends State<GitHubUserSearchLive>
```

#### Décomposons cela :

| Élément                       | Signification                                                   |
| ----------------------------- | --------------------------------------------------------------- |
| `State<GitHubUserSearchLive>` | Classe d’état spécifique au widget `GitHubUserSearchLive`       |
| `_GitHubUserSearchLiveState`  | Nom donné à cette classe d’état                                 |
| `extends State<...>`          | Cela dit que `_GitHubUserSearchLiveState` **hérite** de `State` |
| `<GitHubUserSearchLive>`      | Type du `StatefulWidget` auquel cet état est attaché            |



### <h3>4. Pourquoi un nom avec `_` devant ?</h3>

```dart
_GitHubUserSearchLiveState
```

* Le `_` en Dart signifie **privé à ce fichier**.
* On ne peut pas utiliser cette classe depuis un autre fichier `.dart`.



### <h3>5. Vue d’ensemble simplifiée</h3>

```dart
// Widget visible dans l’interface
class GitHubUserSearchLive extends StatefulWidget {
  @override
  State<GitHubUserSearchLive> createState() => _GitHubUserSearchLiveState();
}

// Logique interne, état dynamique
class _GitHubUserSearchLiveState extends State<GitHubUserSearchLive> {
  // Ici on met les données, la logique, les appels API, les setState...
}
```



###  Analogie simple

> Imagine un `StatefulWidget` comme un **télécommande** (`GitHubUserSearchLive`) et la classe `State` comme le **cerveau connecté** à cette télécommande (`_GitHubUserSearchLiveState`).
> Le cerveau fait les calculs et dit quand il faut changer l’écran.


![ChatGPT Image 1 juin 2025, 21_52_58](https://github.com/user-attachments/assets/c73c4a93-0bde-4790-a7cc-96123c1e0b15)



