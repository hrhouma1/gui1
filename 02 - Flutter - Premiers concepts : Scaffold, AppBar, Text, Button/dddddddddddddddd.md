
# Exercice 1

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff000000),
        centerTitle: true,
        title: const Text(
          "My Dashatar App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Image.asset('images/dashatar.png'), // Assurez-vous que ce chemin est correct
      ),
    );
  }
}
```

### Explications :

* `MaterialApp` est l'application racine.
* `Scaffold` fournit la structure de base avec `AppBar` et `body`.
* `AppBar` est une barre supérieure avec un fond noir (`0xff000000`).
* `Image.asset` permet de charger une image locale (ici `images/dashatar.png`).

### ⚠️ N'oubliez pas :

1. D’ajouter l’image dans le dossier `assets/images/` (ou `images/` selon votre structure).
2. De déclarer le chemin dans le fichier `pubspec.yaml` :

```yaml
flutter:
  assets:
    - images/dashatar.png
```


<br/>
<br/>
<br/>

# Exercice 2 - Code Flutter – Application "Coffee Time"



*Ceci est un exemple Flutter complet utilisant une image en provenance d'Unsplash via `Image.network` :*



###  Code Flutter – Application "Coffee Time"

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: CoffeeApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: const Text(
          "My coffee app",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
          ),
        ),
      ),
      body: const Center(
        child: Image.network(
          'https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=800&q=80',
        ),
      ),
    );
  }
}
```

---

### 🖼️ Remarques :

* **Image Unsplash** : L’URL d’image utilisée ici montre une tasse de café. Vous pouvez la remplacer par n'importe quelle autre image Unsplash adaptée à votre thème.
* **`debugShowCheckedModeBanner: false`** : Supprime la bannière rouge "Debug" dans le coin supérieur droit.
* **`AppBar` blanche avec texte noir** : Design clair et élégant.





<br/>
<br/>
<br/>

# Exercice 3 - Code Flutter – Application  Flutter avec **un fond noir** (`backgroundColor: Colors.black`) et une image centrée depuis Unsplash :



###  Code Flutter – Fond noir et image réseau

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: CoffeeApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // 👈 Fond noir
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0.0,
        title: const Text(
          "My coffee app",
          style: TextStyle(
            color: Colors.white, // 👈 Titre en blanc
            fontSize: 30.0,
          ),
        ),
      ),
      body: const Center(
        child: Image.network(
          'https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=800&q=80',
        ),
      ),
    );
  }
}
```

---

### 📝 Explication des changements :

* `backgroundColor: Colors.black` dans le `Scaffold` : fond d'écran noir pour toute l'application.
* `AppBar` aussi noir, avec texte en **blanc** (`color: Colors.white`) pour rester lisible.
* L’image reste centrée, sans cadre ni bordure blanche.




<br/>
<br/>
<br/>

# <h2 id="c-ex4">Exercice 4 – Image locale sur fond noir avec AppBar personnalisée</h2>

Cet exercice vous apprend à :

* afficher une image locale (`Image.asset`)
* personnaliser la couleur du fond (`Scaffold`)
* modifier la couleur de la barre d’app (AppBar)
* utiliser la classe `StatelessWidget` correctement


### Objectif

Créer une application Flutter avec :

* une `AppBar` noire
* un fond noir (`Colors.black`)
* une image centrée provenant des ressources locales (`images/dash.png`)


###  Concepts introduits

| Notion              | Description                                            |
| ------------------- | ------------------------------------------------------ |
| `StatelessWidget`   | Composant sans état, qui ne change pas à l’exécution   |
| `Scaffold`          | Structure visuelle de l’app (barre, fond, contenu)     |
| `backgroundColor`   | Définir la couleur de fond d’un `Scaffold` ou `AppBar` |
| `Image.asset`       | Afficher une image locale dans le dossier `assets/`    |
| `Color(0xff000000)` | Couleur noire hexadécimale avec transparence opaque    |


### Code complet

```dart
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black, // Fond noir
        appBar: AppBar(
          backgroundColor: const Color(0xff000000), // AppBar noire
          centerTitle: true,
          title: const Text("My Dashatar App"),
        ),
        body: const Center(
          child: Image.asset('images/dash.png'), // Assurez-vous que l'image existe
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}
```

---

### 📁 N'oubliez pas de modifier `pubspec.yaml`

```yaml
flutter:
  assets:
    - images/dash.png
```



###  Question bonus

Comment transformer ce `StatelessWidget` en `StatefulWidget` si vous voulez, par exemple, changer l’image au clic ?

#### ==> Regardez l'annexe 1






<br/>
<br/>
<br/>



# <h2 id="c-ex5">Exercice 5 – Conteneur coloré avec image locale dans une colonne</h2>

Dans cet exercice, vous apprendrez à :

* utiliser la **classe `Container`** pour contrôler la taille, la couleur et le contenu
* structurer plusieurs widgets verticalement avec `Column`
* afficher une image locale dans un conteneur de taille fixe



### Objectif pédagogique

Créer une application Flutter avec :

* une `AppBar` centrée et personnalisée
* un corps contenant une `Column`
* un premier élément de la colonne : un `Container` de **100x100 pixels**, **jaune**, contenant une image locale (`images/dash.png`)


### Concepts introduits

| Notion           | Description                                                                  |
| ---------------- | ---------------------------------------------------------------------------- |
| `Container`      | Permet de définir une boîte avec hauteur, largeur, couleur, marges, padding… |
| `height`/`width` | Dimensions fixes du conteneur                                                |
| `color`          | Couleur d’arrière-plan                                                       |
| `Column`         | Affiche les éléments de haut en bas (axe vertical)                           |
| `children`       | Liste des widgets enfants dans un conteneur multiple                         |
| `Image.asset`    | Affiche une image stockée localement dans le dossier `assets`                |


###  Code complet de l’exercice

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dashatar app"),
      ),
      body: Column(
        children: [
          Container(
            height: 100.0,
            width: 100.0,
            color: Colors.yellow,
            child: Image.asset(
              'images/dash.png',
            ),
          ),
        ],
      ),
    );
  }
}
```

---

### Fichier `pubspec.yaml`

Vérifiez que vous avez bien déclaré l'image :

```yaml
flutter:
  assets:
    - images/dash.png
```








<br/>
<br/>
<br/>





# <h2 id="c-ex6">Exercice 6 – Afficher plusieurs conteneurs colorés avec image locale</h2>

Dans cet exercice, vous allez :

* empiler plusieurs conteneurs colorés verticalement dans une `Column`
* fixer taille, couleur, et contenu (`Image.asset`) dans chacun
* organiser les éléments de manière répétée pour entraîner la structure Flutter


###  Objectif

Créer une application avec une `AppBar` bleue et **3 `Container` colorés** :

* chacun de **100 x 100 px**
* avec une image locale au centre (`dash.png`)
* disposés verticalement grâce à `Column`



### Code source complet commenté

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar en haut de l'application
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dashatar app"),
      ),

      // Corps de l'application contenant une colonne verticale
      body: Column(
        children: [
          // Premier conteneur jaune avec image
          Container(
            height: 100.0,
            width: 100.0,
            color: Colors.yellow,
            child: Image.asset('images/dash.png'),
          ),

          // Deuxième conteneur brun
          Container(
            height: 100.0,
            width: 100.0,
            color: Colors.brown,
            child: Image.asset('images/dash.png'),
          ),

          // Troisième conteneur rouge
          Container(
            height: 100.0,
            width: 100.0,
            color: Colors.red,
            child: Image.asset('images/dash.png'),
          ),
        ],
      ),
    );
  }
}
```



### 📁 pubspec.yaml (rappel)

Assurez-vous que l’image est bien déclarée :

```yaml
flutter:
  assets:
    - images/dash.png
```



###  Concepts consolidés

| Élément         | Rôle                                |
| --------------- | ----------------------------------- |
| `Container`     | Boîte avec taille/couleur fixe      |
| `Column`        | Organisation verticale              |
| `Image.asset()` | Image depuis les fichiers locaux    |
| `AppBar`        | Bandeau d’en-tête avec titre centré |
























### <h2 id="c-ex7">Exercice 7 – Aligner une colonne au centre verticalement avec `MainAxisAlignment`</h2>

Cet exercice vous apprend à :

* contrôler l’alignement vertical du contenu dans une `Column`
* manipuler la propriété `mainAxisAlignment`
* combiner alignement et widgets visuels (`Container`, `Image.asset`)

---

### 🎯 Objectif

Créer une interface où :

* les conteneurs sont affichés verticalement dans une `Column`
* l’ensemble de la `Column` est **centré verticalement** au milieu de l’écran

---

### ✅ Code complet commenté

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barre supérieure avec titre centré
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dashatar app"),
      ),

      // Colonne centrée verticalement
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centrage vertical
        children: [
          // Conteneur jaune
          Container(
            height: 100.0,
            width: 100.0,
            color: Colors.yellow,
            child: Image.asset('images/dash.png'),
          ),

          // Conteneur teal
          Container(
            height: 100.0,
            width: 100.0,
            color: Colors.teal,
            child: Image.asset('images/dash.png'),
          ),

          // Conteneur brun
          Container(
            height: 100.0,
            width: 100.0,
            color: Colors.brown,
            child: Image.asset('images/dash.png'),
          ),

          // Conteneur rouge
          Container(
            height: 100.0,
            width: 100.0,
            color: Colors.red,
            child: Image.asset('images/dash.png'),
          ),
        ],
      ),
    );
  }
}
```

---

### 📘 Notion importante

* `mainAxisAlignment: MainAxisAlignment.center` :

  * Dans une `Column`, cela signifie **centrer verticalement** tous les enfants.
  * Très utile pour équilibrer l’espace vertical dans des écrans vides.

---

Souhaitez-vous explorer maintenant :

* `CrossAxisAlignment` pour l’alignement horizontal ?
* une `Row` avec `mainAxisAlignment: spaceBetween` pour l'exercice 8 ?






















### <h2 id="c-ex8">Exercice 8 – Tester les types d'alignement vertical dans une `Column`</h2>

Dans cet exercice, vous allez :

* expérimenter différents types d’alignement avec la propriété `mainAxisAlignment`
* observer comment l’espace est distribué entre les widgets enfants d'une `Column`
* comprendre l’impact visuel de `start`, `center`, `spaceAround`, `spaceEvenly`, `spaceBetween`

---

### 🎯 Objectif

Créer une application avec :

* 4 `Container` colorés de 100x100 px contenant la même image
* test visuel de **différentes valeurs de `MainAxisAlignment`**

---

### ✅ Code de base pour expérimenter

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dashatar app"),
      ),
      body: Column(
        // ⇩ Vous pouvez tester ici : .start, .center, .spaceAround, .spaceEvenly, .spaceBetween
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          buildColoredContainer(Colors.yellow),
          buildColoredContainer(Colors.teal),
          buildColoredContainer(Colors.brown),
          buildColoredContainer(Colors.red),
        ],
      ),
    );
  }

  // Méthode réutilisable pour générer un container coloré
  Widget buildColoredContainer(Color color) {
    return Container(
      height: 100.0,
      width: 100.0,
      color: color,
      child: Image.asset('images/dash.png'),
    );
  }
}
```

---

### 🧪 Valeurs à tester pour `mainAxisAlignment`

| Valeur                           | Effet                                                              |
| -------------------------------- | ------------------------------------------------------------------ |
| `MainAxisAlignment.start`        | Les éléments sont alignés en haut                                  |
| `MainAxisAlignment.center`       | Les éléments sont groupés au centre                                |
| `MainAxisAlignment.end`          | Les éléments sont alignés en bas                                   |
| `MainAxisAlignment.spaceAround`  | Espaces égaux autour de chaque élément                             |
| `MainAxisAlignment.spaceEvenly`  | Espaces strictement égaux entre tous les éléments **et aux bords** |
| `MainAxisAlignment.spaceBetween` | Espace uniquement entre les éléments (pas de marge au début/fin)   |

---

### ✅ Test proposé

Modifiez simplement cette ligne :

```dart
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
```

et remplacez-la par les autres valeurs pour observer leur impact.

Souhaitez-vous que je vous prépare un exemple **avec boutons pour changer dynamiquement l’alignement** ?






















### <h2 id="c-ex9">Exercice 9 – Tester `crossAxisAlignment` dans une `Column`</h2>

Dans cet exercice, vous allez :

* comprendre la différence entre l’axe principal (`mainAxisAlignment`) et l’axe secondaire (`crossAxisAlignment`)
* tester les différentes options de `CrossAxisAlignment` : `start`, `center`, `end`, `stretch`

---

### 🎯 Objectif

Afficher une colonne avec plusieurs `Container` colorés contenant une image :

* disposer les conteneurs verticalement avec `MainAxisAlignment.spaceAround`
* tester l’effet de **`CrossAxisAlignment.center`** puis **`end`**, **`start`**, et **`stretch`**

---

### ✅ Code de démonstration complet

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dashatar app"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center, // à tester

        children: [
          buildContainer(Colors.yellow),
          buildContainer(Colors.teal, width: 300), // pour tester l’effet
          buildContainer(Colors.brown),
          buildContainer(Colors.red),
        ],
      ),
    );
  }

  // Génère un Container personnalisable
  Widget buildContainer(Color color, {double width = 100}) {
    return Container(
      height: 100,
      width: width,
      color: color,
      child: Image.asset('images/dash.png'),
    );
  }
}
```

---

### 🔁 Instructions de test

Modifiez la ligne :

```dart
crossAxisAlignment: CrossAxisAlignment.center,
```

et testez les valeurs suivantes :

| Valeur    | Effet visuel                                                                                 |
| --------- | -------------------------------------------------------------------------------------------- |
| `start`   | Alignement à gauche (début de la ligne)                                                      |
| `center`  | Alignement au centre horizontal                                                              |
| `end`     | Alignement à droite                                                                          |
| `stretch` | Étire les conteneurs pour prendre toute la largeur disponible (nécessite `width` non défini) |

---

### 💡 Remarque

* Si vous utilisez `CrossAxisAlignment.stretch`, supprimez `width` dans le `Container` pour que l’effet soit visible :

```dart
Widget buildContainer(Color color) {
  return Container(
    height: 100,
    color: color, // pas de width ici
    child: Image.asset('images/dash.png'),
  );
}
```

---

Souhaitez-vous un **exercice 10** avec une `Row` et les mêmes alignements mais en horizontal ?




















Très bien. Voici une version **pédagogique détaillée**, où chaque instruction est clairement expliquée pour l'étudiant avec ce qu’il doit faire ligne par ligne.

---

### <h2 id="c-ex9">Exercice 9 – Comprendre et tester `CrossAxisAlignment`</h2>

Dans cet exercice, vous allez **modifier une application Flutter existante** pour observer l'effet de `CrossAxisAlignment` dans une `Column`.

---

### 🎯 Objectif pédagogique

* Comprendre comment les widgets sont alignés horizontalement dans une `Column`
* Apprendre à utiliser :
  `CrossAxisAlignment.start`,
  `CrossAxisAlignment.center`,
  `CrossAxisAlignment.end`,
  `CrossAxisAlignment.stretch`

---

### 🧱 Étapes détaillées

#### 1. Commencez avec ce code de base :

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dashatar app"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        // LIGNE À MODIFIER ICI (étape suivante)
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          buildContainer(Colors.yellow),
          buildContainer(Colors.teal, width: 300),
          buildContainer(Colors.brown),
          buildContainer(Colors.red),
        ],
      ),
    );
  }

  Widget buildContainer(Color color, {double width = 100}) {
    return Container(
      height: 100,
      width: width,
      color: color,
      child: Image.asset('images/dash.png'),
    );
  }
}
```

---

### 🔧 Étapes à suivre pour tester les alignements

#### ✅ Étape 1 – Tester l’alignement au **centre**

1. **Localisez** cette ligne :

```dart
crossAxisAlignment: CrossAxisAlignment.center,
```

2. Elle signifie que **tous les conteneurs seront centrés horizontalement**.

---

#### ✅ Étape 2 – Aligner à **gauche (début)**

1. **Remplacez la ligne** par :

```dart
crossAxisAlignment: CrossAxisAlignment.start,
```

2. **Observez** que les conteneurs sont maintenant collés à gauche de l'écran.

---

#### ✅ Étape 3 – Aligner à **droite (fin)**

1. **Remplacez la ligne** par :

```dart
crossAxisAlignment: CrossAxisAlignment.end,
```

2. **Observez** que tous les conteneurs sont déplacés vers la droite.

---

#### ✅ Étape 4 – Étendre sur toute la largeur (stretch)

1. **Remplacez la ligne** par :

```dart
crossAxisAlignment: CrossAxisAlignment.stretch,
```

2. **Modifiez aussi la fonction** `buildContainer` pour **supprimer la largeur** :

```dart
Widget buildContainer(Color color) {
  return Container(
    height: 100,
    color: color,
    child: Image.asset('images/dash.png'),
  );
}
```

3. **Résultat attendu :** chaque conteneur s'étire **sur toute la largeur** de l'écran.

---

### 🧠 À retenir

| Alignement | Résultat                                                        |
| ---------- | --------------------------------------------------------------- |
| `start`    | Widgets alignés à gauche                                        |
| `center`   | Widgets alignés au centre (par défaut dans une `Row`)           |
| `end`      | Widgets alignés à droite                                        |
| `stretch`  | Widgets étirés horizontalement pour remplir l’espace disponible |

---

Souhaitez-vous un **exercice 10** dans le même style mais avec une `Row` et `mainAxisAlignment` horizontal ?




















Parfait. Voici l’exercice 10 rédigé dans le même style pédagogique, ligne par ligne, pour explorer l’**alignement horizontal** avec une `Row` en Flutter.

---

### <h2 id="c-ex10">Exercice 10 – Comprendre `mainAxisAlignment` avec une `Row`</h2>

Dans cet exercice, vous allez :

* remplacer une `Column` par une `Row`
* tester différentes valeurs de `mainAxisAlignment` pour comprendre **comment les éléments se répartissent horizontalement**
* manipuler les propriétés pas à pas avec des instructions précises

---

### 🎯 Objectif pédagogique

* Maîtriser l’alignement des widgets **sur l’axe horizontal** avec une `Row`
* Comprendre le rôle de :

  * `MainAxisAlignment.start`
  * `MainAxisAlignment.center`
  * `MainAxisAlignment.end`
  * `MainAxisAlignment.spaceAround`
  * `MainAxisAlignment.spaceBetween`
  * `MainAxisAlignment.spaceEvenly`

---

### ✅ Code de départ

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dashatar app"),
      ),
      body: Row(
        // LIGNE À MODIFIER POUR TESTER LES ALIGNEMENTS
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          buildBox(Colors.yellow),
          buildBox(Colors.teal),
          buildBox(Colors.brown),
          buildBox(Colors.red),
        ],
      ),
    );
  }

  Widget buildBox(Color color) {
    return Container(
      height: 100,
      width: 100,
      margin: const EdgeInsets.all(4),
      color: color,
      child: Image.asset('images/dash.png'),
    );
  }
}
```

---

### 🔧 Étapes de test : `mainAxisAlignment`

---

#### ✅ Étape 1 – Centrer horizontalement

```dart
mainAxisAlignment: MainAxisAlignment.center,
```

Les conteneurs sont centrés **au milieu de l’écran**, regroupés.

---

#### ✅ Étape 2 – Aligner à gauche (début de ligne)

```dart
mainAxisAlignment: MainAxisAlignment.start,
```

Les conteneurs commencent **au tout début de la ligne (gauche)**.

---

#### ✅ Étape 3 – Aligner à droite (fin de ligne)

```dart
mainAxisAlignment: MainAxisAlignment.end,
```

Les conteneurs se collent **au bord droit** de l’écran.

---

#### ✅ Étape 4 – Espacement autour (`spaceAround`)

```dart
mainAxisAlignment: MainAxisAlignment.spaceAround,
```

Espace **égal autour** de chaque conteneur (y compris au bord de l’écran).

---

#### ✅ Étape 5 – Espacement égal entre (`spaceEvenly`)

```dart
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
```

Espace **strictement égal partout**, y compris entre le bord gauche et le premier widget.

---

#### ✅ Étape 6 – Espacement uniquement **entre** (`spaceBetween`)

```dart
mainAxisAlignment: MainAxisAlignment.spaceBetween,
```

Espace seulement **entre les widgets**, rien au bord gauche ni droit.

---

### 🧠 Résumé

| Valeur         | Résultat                                    |
| -------------- | ------------------------------------------- |
| `start`        | Tous les widgets à gauche                   |
| `center`       | Widgets centrés                             |
| `end`          | Tous les widgets à droite                   |
| `spaceAround`  | Espace autour de chaque widget              |
| `spaceEvenly`  | Espace strictement égal partout             |
| `spaceBetween` | Espacement uniquement **entre** les widgets |

---

Souhaitez-vous enchaîner avec un exercice 11 sur `CrossAxisAlignment` dans une `Row` (alignement vertical cette fois) ?
















Très bien. Voici **l’exercice 11** réécrit **sans emojis**, avec **plus de détails pédagogiques**, **commentaires ligne par ligne**, et une structure claire pour guider pas à pas l’étudiant.

---

### <h2 id="c-ex11">Exercice 11 – Tester `CrossAxisAlignment` dans une `Row`</h2>

---

### Objectif de l’exercice

Apprendre à aligner verticalement les widgets dans une `Row` à l’aide de la propriété `crossAxisAlignment`.

Vous allez tester trois alignements possibles :

* `CrossAxisAlignment.start` → aligne les éléments **en haut**
* `CrossAxisAlignment.center` → aligne les éléments **au centre verticalement**
* `CrossAxisAlignment.end` → aligne les éléments **en bas**

Vous utiliserez des `Container` de hauteurs différentes pour bien visualiser l'effet.

---

### Instructions pas à pas

---

#### Étape 1 – Copier le code suivant

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, // Supprime la bannière de débogage
    home: MyApp(), // Définit MyApp comme point d'entrée
  ));
}
```

---

#### Étape 2 – Créer la classe MyApp

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Crée une barre d'application (AppBar) avec un titre centré
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dashatar app"),
      ),

      // Le corps de l'application est une ligne horizontale (Row)
      body: Row(
        // Aligne les widgets horizontalement avec un espacement autour
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        // À modifier pour tester : start, center, end
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // Premier conteneur : hauteur de 100
          buildBox(color: Colors.yellow, height: 100),

          // Deuxième conteneur : hauteur de 200
          buildBox(color: Colors.teal, height: 200),

          // Troisième conteneur : hauteur de 100
          buildBox(color: Colors.brown, height: 100),

          // Quatrième conteneur : hauteur de 100
          buildBox(color: Colors.red, height: 100),
        ],
      ),
    );
  }

  // Fonction utilitaire pour générer un conteneur coloré avec une image
  Widget buildBox({required Color color, double height = 100}) {
    return Container(
      height: height, // Hauteur du conteneur
      width: 100,     // Largeur fixe
      color: color,   // Couleur de fond
      child: Image.asset('images/dash.png'), // Image locale à afficher
    );
  }
}
```

---

### Étape 3 – Modifier la ligne d’alignement vertical

Recherchez cette ligne dans le code :

```dart
crossAxisAlignment: CrossAxisAlignment.start,
```

Et testez les valeurs suivantes :

---

#### a) Aligner les éléments en haut

```dart
crossAxisAlignment: CrossAxisAlignment.start,
```

Effet visuel :
Tous les conteneurs sont alignés en haut, en fonction de la hauteur du plus grand élément.

---

#### b) Aligner les éléments au centre vertical

```dart
crossAxisAlignment: CrossAxisAlignment.center,
```

Effet visuel :
Les conteneurs sont centrés verticalement dans la ligne, quel que soit leur hauteur.

---

#### c) Aligner les éléments en bas

```dart
crossAxisAlignment: CrossAxisAlignment.end,
```

Effet visuel :
Tous les widgets sont alignés en bas de la `Row`, ce qui est visible surtout lorsque les hauteurs diffèrent.

---

### À savoir

| Propriété                   | Effet                                           |
| --------------------------- | ----------------------------------------------- |
| `CrossAxisAlignment.start`  | Aligne tous les widgets au **haut** de la ligne |
| `CrossAxisAlignment.center` | Aligne tous les widgets au **centre vertical**  |
| `CrossAxisAlignment.end`    | Aligne tous les widgets au **bas** de la ligne  |

---

### Astuce pédagogique

Pour bien voir les effets :

* **conservez une différence de hauteur** entre au moins deux conteneurs
* utilisez un fond blanc pour bien visualiser l’alignement
* activez le **Hot Reload** pour tester rapidement chaque changement

---

Souhaitez-vous que l’exercice 12 introduise :

* `Expanded` dans une `Row`
* ou une `Row` + `Column` combinées pour faire une grille ?











Parfait. Voici l'exercice 12 détaillé, basé sur l'image que vous avez fournie, avec l'utilisation de `CrossAxisAlignment.stretch` dans une `Row`. Le but est de **remplir verticalement l’espace disponible** pour chaque élément de la ligne.

---

### <h2 id="c-ex12">Exercice 12 – Étirement vertical avec `CrossAxisAlignment.stretch`</h2>

---

### Objectif pédagogique

Cet exercice vous montre comment :

* utiliser `CrossAxisAlignment.stretch` dans une `Row`
* faire **étirer chaque `Container` verticalement** pour qu’il remplisse tout l’espace disponible
* utiliser `Expanded` pour forcer chaque widget à prendre également de la largeur

---

### Étapes à suivre

---

#### 1. Copier le squelette du projet

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
```

---

#### 2. Créer la classe `MyApp`

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barre d'application avec un titre centré
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dashatar app"),
      ),

      // Ligne horizontale (Row) avec alignement vertical par étirement
      body: Row(
        // Espace horizontalement les enfants avec marge égale
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        // Étire chaque enfant verticalement pour remplir le Row
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          // Chaque élément est un Expanded pour occuper une portion équitable de la largeur
          Expanded(child: buildStretchedBox(color: Colors.yellow)),
          Expanded(child: buildStretchedBox(color: Colors.teal)),
          Expanded(child: buildStretchedBox(color: Colors.brown)),
          Expanded(child: buildStretchedBox(color: Colors.red)),
        ],
      ),
    );
  }

  // Widget utilitaire qui crée une boîte colorée contenant une image
  Widget buildStretchedBox({required Color color}) {
    return Container(
      color: color,
      child: Center(
        child: Image.asset('images/dash.png'), // L'image est centrée dans le container
      ),
    );
  }
}
```

---

### Explication ligne par ligne

| Élément                                          | Rôle                                                               |
| ------------------------------------------------ | ------------------------------------------------------------------ |
| `crossAxisAlignment: CrossAxisAlignment.stretch` | Étire chaque enfant verticalement à la hauteur maximale disponible |
| `Expanded(...)`                                  | Force chaque conteneur à occuper la même **largeur** dans la `Row` |
| `Container(...)`                                 | Crée une boîte colorée, sans hauteur explicite                     |
| `Center(...)`                                    | Centre l’image horizontalement et verticalement                    |
| `Image.asset(...)`                               | Affiche une image locale dans chaque boîte                         |

---

### Résultat attendu

* L’écran est divisé en **4 colonnes verticales égales**
* Chaque colonne est **pleine hauteur**
* L’image est centrée dans chaque boîte

---

### Remarque importante

Si vous n’utilisez **pas `Expanded`**, les boîtes ne s'étireront pas automatiquement en largeur.
Si vous utilisez `stretch` sans `Expanded`, l’effet ne sera **visible que verticalement**, mais les boîtes seront étroites.

---

Souhaitez-vous que l’exercice 13 combine `Row` et `Column` pour créer une **grille 2x2** ?







Voici un **exercice pédagogique complet** basé sur votre dernière capture d'écran, qui introduit l'utilisation combinée de `ListView` et `Column` pour **créer une interface défilable avec des éléments en grille verticale**.

---

### <h2 id="c-ex13">Exercice 13 – Liste verticale avec `ListView` contenant une `Column`</h2>

---

### Objectif pédagogique

Dans cet exercice, vous allez :

* apprendre à insérer une `Column` dans un `ListView` pour rendre son contenu défilable
* contrôler la taille, la couleur, et le contenu des `Container`
* maîtriser l’alignement horizontal avec `CrossAxisAlignment`
* afficher une suite verticale d’images dans des blocs colorés

---

### Résultat attendu

L'application affiche une **liste verticale de conteneurs colorés** (100x100 px), chacun contenant une image locale (`dash.png`).
L'utilisateur peut **faire défiler verticalement** la liste si le contenu dépasse la hauteur de l'écran.

---

### Étapes à suivre

---

#### 1. Copier le squelette du programme

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
```

---

#### 2. Créer la classe principale `MyApp`

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barre supérieure avec un titre
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dashatar app"),
      ),

      // Le corps contient une vue défilable
      body: ListView(
        children: [
          // Une colonne contenant plusieurs conteneurs
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Alignement horizontal à gauche

            children: [
              // Conteneurs colorés avec image
              buildColorBox(color: Colors.yellow),
              buildColorBox(color: Colors.teal),
              buildColorBox(color: Colors.brown),
              buildColorBox(color: Colors.red),
              buildColorBox(color: Colors.yellow),
              buildColorBox(color: Colors.teal),
              buildColorBox(color: Colors.brown),
              buildColorBox(color: Colors.red),
            ],
          ),
        ],
      ),
    );
  }

  // Méthode utilitaire pour créer un conteneur coloré avec une image
  Widget buildColorBox({required Color color}) {
    return Container(
      height: 100,
      width: 100,
      color: color,
      child: Image.asset('images/dash.png'),
    );
  }
}
```

---

### Explication pédagogique ligne par ligne

| Élément                                        | Fonction pédagogique                                                                     |
| ---------------------------------------------- | ---------------------------------------------------------------------------------------- |
| `ListView(...)`                                | Permet de faire défiler le contenu verticalement                                         |
| `Column(...)`                                  | Permet d'empiler des widgets verticalement                                               |
| `crossAxisAlignment: CrossAxisAlignment.start` | Aligne chaque `Container` à gauche dans la `Column`                                      |
| `Container(height: 100, width: 100)`           | Crée une boîte carrée avec une couleur définie                                           |
| `Image.asset(...)`                             | Affiche une image depuis le dossier `images/` déclaré dans `pubspec.yaml`                |
| `buildColorBox(...)`                           | Rend le code plus lisible et réutilisable en générant chaque bloc coloré automatiquement |

---

### Remarques techniques

* Vous devez avoir un fichier image valide dans `images/dash.png`.
* N'oubliez pas de le déclarer dans `pubspec.yaml` :

```yaml
flutter:
  assets:
    - images/dash.png
```

---

### À tester

1. Essayez de remplacer `CrossAxisAlignment.start` par :

   * `CrossAxisAlignment.center`
   * `CrossAxisAlignment.end`

2. Essayez de rendre chaque `Container` plus large pour voir l’effet visuel.

---

Souhaitez-vous un exercice 14 avec **grille (`GridView`)** ou **des boutons interactifs** ?




















Parfait. Voici maintenant **l’exercice 14**, pédagogique, clair et progressif, pour introduire la **grille (`GridView`)** — une disposition très courante dans les interfaces utilisateurs modernes.

---

### <h2 id="c-ex14">Exercice 14 – Afficher une grille d’éléments avec `GridView.count`</h2>

---

### Objectif pédagogique

Dans cet exercice, vous allez :

* découvrir le widget `GridView` pour créer des interfaces **en colonnes et lignes**
* maîtriser `GridView.count` pour afficher des conteneurs en **grille fixe (nombre de colonnes connu)**
* organiser des images dans un affichage structuré et responsive

---

### Résultat attendu

L'application affiche **une grille de blocs carrés (100x100)** contenant une image (`dash.png`), avec 2 colonnes.
Le contenu est **défilable verticalement** si la hauteur dépasse l'écran.

---

### Étapes à suivre

---

#### 1. Code complet à copier dans `main.dart`

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
```

---

#### 2. Classe `MyApp` avec une grille

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barre d'application
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dashatar Grid"),
      ),

      // Grille de widgets
      body: GridView.count(
        crossAxisCount: 2, // Nombre de colonnes
        crossAxisSpacing: 10, // Espace horizontal entre colonnes
        mainAxisSpacing: 10,  // Espace vertical entre lignes
        padding: const EdgeInsets.all(10), // Marge intérieure

        children: [
          buildGridItem(color: Colors.yellow),
          buildGridItem(color: Colors.teal),
          buildGridItem(color: Colors.brown),
          buildGridItem(color: Colors.red),
          buildGridItem(color: Colors.orange),
          buildGridItem(color: Colors.blue),
          buildGridItem(color: Colors.green),
          buildGridItem(color: Colors.pink),
        ],
      ),
    );
  }

  // Boîte colorée contenant une image
  Widget buildGridItem({required Color color}) {
    return Container(
      height: 100,
      width: 100,
      color: color,
      child: Center(
        child: Image.asset('images/dash.png'),
      ),
    );
  }
}
```

---

### 🧠 Explication pédagogique

| Élément Flutter                        | Rôle pédagogique                                |
| -------------------------------------- | ----------------------------------------------- |
| `GridView.count(...)`                  | Crée une grille avec un nombre fixe de colonnes |
| `crossAxisCount: 2`                    | Définit 2 colonnes fixes                        |
| `mainAxisSpacing` / `crossAxisSpacing` | Ajoutent des espaces entre les cases            |
| `Container(...)`                       | Crée une case colorée carrée                    |
| `Image.asset(...)`                     | Affiche une image locale centrée dans la case   |

---

### Fichier `pubspec.yaml`

Vérifiez que l’image est bien déclarée :

```yaml
flutter:
  assets:
    - images/dash.png
```

---

### À tester

1. Changez `crossAxisCount: 2` en `3` ou `4` pour voir l’effet sur la grille.
2. Changez `mainAxisSpacing` et `crossAxisSpacing` pour agrandir l’espace entre les blocs.
3. Remplacez l’image par un `Text` pour voir l’adaptabilité de la grille.

---

Souhaitez-vous que l’exercice 15 introduise :

* une **grille dynamique à partir d’une liste d’objets** ?
* ou un **événement au clic sur chaque bloc** (`GestureDetector`) ?
















Voici un exercice complet, structuré et pédagogique, basé sur votre capture, permettant de créer une **liste déroulante horizontale** d’images avec `ListView`.

---

### <h2 id="c-ex15">Exercice 15 – Liste horizontale avec `ListView` et images défilantes</h2>

---

### Objectif pédagogique

Dans cet exercice, vous apprendrez à :

* utiliser `ListView` avec un défilement **horizontal**
* insérer une `Row` à l’intérieur d’un `ListView`
* afficher une série de `Container` contenant une image locale
* ajuster les tailles, couleurs, et l’alignement dans l’axe secondaire

---

### Résultat attendu

L’interface affiche **une ligne d’éléments colorés contenant une image**, et l’utilisateur peut **faire défiler horizontalement** avec son doigt.

---

### Étapes à suivre

---

#### 1. Code complet à copier dans `main.dart`

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
```

---

#### 2. Classe `MyApp`

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barre supérieure avec titre centré
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dashatar app"),
      ),

      // Liste défilable horizontalement
      body: ListView(
        scrollDirection: Axis.horizontal, // ⚠️ Défilement horizontal

        children: [
          // Une ligne contenant plusieurs conteneurs
          Row(
            crossAxisAlignment: CrossAxisAlignment.start, // Alignement vertical des conteneurs

            children: [
              buildBox(color: Colors.yellow),
              buildBox(color: Colors.brown),
              buildBox(color: Colors.red),
              buildBox(color: Colors.black12),
              buildBox(color: Colors.orange),
            ],
          ),
        ],
      ),
    );
  }

  // Fonction pour créer une boîte colorée avec image
  Widget buildBox({required Color color}) {
    return Container(
      height: 100,
      width: 100,
      margin: const EdgeInsets.all(8),
      color: color,
      child: Center(
        child: Image.asset('images/dash.png'),
      ),
    );
  }
}
```

---

### Explication pédagogique

| Élément Flutter                                | Rôle pédagogique                                    |
| ---------------------------------------------- | --------------------------------------------------- |
| `ListView(scrollDirection: Axis.horizontal)`   | Permet de faire défiler horizontalement             |
| `Row(...)`                                     | Contient plusieurs éléments alignés horizontalement |
| `crossAxisAlignment: CrossAxisAlignment.start` | Aligne les widgets en haut de la ligne              |
| `Container(...)`                               | Définit la taille, la couleur, et le contenu        |
| `margin: EdgeInsets.all(8)`                    | Crée de l’espace autour de chaque élément           |
| `Image.asset(...)`                             | Affiche une image à partir des fichiers locaux      |

---

### Rappel : Déclarer l’image dans `pubspec.yaml`

```yaml
flutter:
  assets:
    - images/dash.png
```

---

### Prolongement possible

1. Remplacez `Row(...)` par une simple **liste directe de widgets** dans `ListView` :

```dart
body: ListView(
  scrollDirection: Axis.horizontal,
  children: [
    buildBox(color: Colors.yellow),
    buildBox(color: Colors.brown),
    buildBox(color: Colors.red),
    ...
  ],
)
```

2. Ajoutez un `GestureDetector` autour de chaque `Container` pour détecter les clics.

---

Souhaitez-vous que l’exercice 16 ajoute une **liste dynamique à partir d’un tableau** (ex: `List<Color>` ou `List<Map>`) ?











Voici un exercice complet et structuré pour reproduire exactement l’interface que vous montrez dans votre capture : **une `ListView` verticale dans un `Container`**, contenant plusieurs `Container` colorés avec une image locale centrée.

---

### <h2 id="c-ex16">Exercice 16 – Liste verticale dans un `Container` avec `ListView`</h2>

---

### Objectif pédagogique

Dans cet exercice, vous allez :

* apprendre à insérer une `ListView` verticale dans un `Container`
* répéter des `Container` avec taille et couleur fixe
* insérer des images locales à l’intérieur des blocs
* comprendre pourquoi `ListView` permet de défiler même s’il est dans un `Container`

---

### Résultat attendu

Une application Flutter avec :

* une **barre de titre**
* une **liste verticale colorée**
* chaque bloc de 100x100 contient une image (`dash.png`)
* **défilement fluide vertical** si la liste est plus grande que l'écran

---

### Étapes détaillées

---

#### 1. Départ – Code de base

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
```

---

#### 2. Classe principale

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar avec titre centré
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dashatar app"),
      ),

      // Le corps est un container contenant une liste verticale
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical, // Définit le défilement vers le bas

          children: [
            buildColorBox(color: Colors.yellow),
            buildColorBox(color: Colors.teal),
            buildColorBox(color: Colors.brown),
            buildColorBox(color: Colors.red),
            buildColorBox(color: Colors.yellow),
            buildColorBox(color: Colors.teal),
            buildColorBox(color: Colors.brown),
            buildColorBox(color: Colors.red),
          ],
        ),
      ),
    );
  }

  // Boîte réutilisable avec couleur et image au centre
  Widget buildColorBox({required Color color}) {
    return Container(
      height: 100,
      width: 100,
      color: color,
      child: Center(
        child: Image.asset('images/dash.png'),
      ),
    );
  }
}
```

---

### Fichier `pubspec.yaml`

Ajoutez ou vérifiez la déclaration suivante :

```yaml
flutter:
  assets:
    - images/dash.png
```

---

### À tester pour aller plus loin

1. Essayez de **remplacer** `Container(child: ListView(...))` par `ListView(...)` directement — le résultat est le même ici.
2. Ajoutez **plus d’éléments** pour voir le comportement de défilement.
3. Ajoutez une `Text` sous chaque image avec un titre (`Text('Dashatar')`).

---

Souhaitez-vous que l’exercice 17 introduise :

* **une `ListView.builder` dynamique** ?
* ou bien un **système de clic sur chaque élément (`GestureDetector`)** ?












Très bien. Voici un **exercice structuré, pédagogique et progressif** basé sur votre dernière capture. L’objectif est d’apprendre à utiliser **`SingleChildScrollView` avec `scrollDirection: Axis.horizontal`**, et de tester deux structures différentes : **`Column`** et **`Row`**, pour bien comprendre le comportement du défilement.

---

### <h2 id="c-ex17">Exercice 17 – Tester `Row` vs `Column` dans un `SingleChildScrollView` horizontal</h2>

---

### Objectif pédagogique

Dans cet exercice, vous allez :

* utiliser `SingleChildScrollView` pour activer le **défilement horizontal**
* tester deux structures :

  * une `Column` insérée dans une `SingleChildScrollView` horizontale (exemple **incorrect ou non intuitif**)
  * une `Row` insérée dans une `SingleChildScrollView` horizontale (**solution correcte**)
* observer la différence entre une **direction de défilement** et une **structure de disposition**

---

### ✅ Étape 1 – Structure avec `Column` dans un défilement horizontal

#### A. Code à tester :

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dashatar app"),
      ),

      // Test 1 – Scroll horizontal avec une Column
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column( // Erreur de logique pédagogique : Column ne s'étend pas horizontalement

          children: [
            buildBox(Colors.yellow),
            buildBox(Colors.teal),
            buildBox(Colors.brown),
            buildBox(Colors.red),
          ],
        ),
      ),
    );
  }

  Widget buildBox(Color color) {
    return Container(
      height: 100,
      width: 100,
      color: color,
      margin: const EdgeInsets.all(6),
      child: Center(child: Image.asset('images/dash.png')),
    );
  }
}
```

#### B. À observer :

* Le **défilement horizontal est activé**, mais la **`Column` s’affiche verticalement**.
* L'effet **ne correspond pas au `scrollDirection` demandé**.

---

### ✅ Étape 2 – Corriger avec `Row`

#### A. Remplacez simplement cette ligne :

```dart
child: Column(
```

par :

```dart
child: Row(
```

---

#### B. Résultat attendu :

* Les conteneurs sont maintenant disposés **horizontalement**.
* Le **défilement fonctionne correctement dans l’axe horizontal**.

---

### 📘 Comparatif pédagogique

| Structure utilisée | Résultat dans `Axis.horizontal`                                      |
| ------------------ | -------------------------------------------------------------------- |
| `Column(...)`      | Affiche verticalement malgré le scroll horizontal                    |
| ✅ `Row(...)`       | Comportement correct : éléments affichés en ligne, scroll horizontal |

---

### 🔁 À faire par l'étudiant

1. **Tester les deux versions** l'une après l'autre.
2. Comprendre que :

   * **`scrollDirection` concerne le scroll du conteneur**
   * **`Row` ou `Column` gère la disposition des enfants**

---

Souhaitez-vous que l’exercice 18 introduise :

* `ListView.builder` horizontal dynamique ?
* ou bien `Wrap` pour gérer automatiquement les débordements ?










Voici un **exercice pédagogique complet** pour illustrer l’utilisation des widgets **`Wrap`** et **`Stack`** en Flutter, tel qu'on le voit dans votre capture. Nous commencerons ici avec `Wrap`.

---

### <h2 id="c-ex18">Exercice 18 – Créer une grille adaptative avec le widget `Wrap`</h2>

---

### Objectif pédagogique

* Comprendre le fonctionnement du widget `Wrap`
* Construire une interface **réactive** (responsive) où les éléments passent automatiquement à la ligne suivante
* Afficher des conteneurs colorés contenant une image
* Apprendre à organiser dynamiquement sans `GridView`

---

### 🧱 Résultat attendu

Une grille fluide :

* Les conteneurs s'affichent **en ligne tant qu’il y a de l’espace horizontal**
* Lorsque la largeur est dépassée, **les conteneurs passent à la ligne suivante**
* Chaque conteneur affiche une image (`dash.png`) centrée

---

### ✅ Code complet

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barre de titre
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dashatar app"),
      ),

      // Corps utilisant Wrap pour organiser dynamiquement les éléments
      body: Wrap(
        spacing: 8, // espace horizontal entre les conteneurs
        runSpacing: 8, // espace vertical entre les lignes

        children: [
          buildBox(Colors.yellow),
          buildBox(Colors.teal),
          buildBox(Colors.brown),
          buildBox(Colors.red),
          buildBox(Colors.yellow),
          buildBox(Colors.teal),
          buildBox(Colors.brown),
          buildBox(Colors.red),
        ],
      ),
    );
  }

  // Boîte colorée avec une image centrée
  Widget buildBox(Color color) {
    return Container(
      height: 100,
      width: 100,
      color: color,
      child: Center(
        child: Image.asset('images/dash.png'),
      ),
    );
  }
}
```

---

### 📘 Explication pédagogique

| Élément                              | Fonction                                                                           |
| ------------------------------------ | ---------------------------------------------------------------------------------- |
| `Wrap`                               | Organise automatiquement les enfants en ligne, passe à la ligne suivante si besoin |
| `spacing`                            | Définit l’espace entre les éléments sur la ligne                                   |
| `runSpacing`                         | Définit l’espace entre les lignes (quand les éléments passent à la ligne suivante) |
| `Container(height: 100, width: 100)` | Crée une case carrée colorée                                                       |
| `Image.asset(...)`                   | Affiche l’image centrée dans la boîte                                              |

---

### ✅ À tester par l’étudiant

1. Réduisez la taille de la fenêtre ou simulez un écran plus étroit.
2. Observez comment les éléments s’adaptent automatiquement en passant à la ligne.
3. Modifiez `spacing` et `runSpacing` pour voir l’impact sur l’organisation.

---

### 📦 pubspec.yaml

Vérifiez que vous avez déclaré votre image :

```yaml
flutter:
  assets:
    - images/dash.png
```

---

Souhaitez-vous que l’exercice **19** introduise le widget **`Stack`** pour superposer des éléments (ex. une image avec une icône ou du texte par-dessus) ?










Parfait. Voici un **exercice pédagogique complet** pour découvrir le widget **`Stack`**, très utile en Flutter lorsqu’on souhaite **superposer plusieurs widgets** (ex : texte par-dessus une image, icône flottante, etc.).

---

### <h2 id="c-ex19">Exercice 19 – Superposer des widgets avec `Stack`</h2>

---

### Objectif pédagogique

Dans cet exercice, vous allez :

* utiliser le widget `Stack` pour **superposer** des éléments
* placer une **image en arrière-plan**
* ajouter un **texte** ou une **icône** positionné manuellement par-dessus
* comprendre le rôle des widgets `Positioned`, `Align` et `Center` dans une pile (`Stack`)

---

### 🎯 Résultat attendu

L’application affiche :

* une boîte colorée (ou une image)
* par-dessus, un **texte** ou **icône** en **position contrôlée** (ex: coin inférieur droit, centre, etc.)

---

### ✅ Code Flutter complet

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Stack Demo"),
      ),

      // Stack pour superposer plusieurs widgets
      body: Center(
        child: Stack(
          alignment: Alignment.center, // Centre les enfants par défaut

          children: [
            // Image de fond ou boîte colorée
            Container(
              height: 200,
              width: 200,
              color: Colors.teal,
              child: Image.asset(
                'images/dash.png',
                fit: BoxFit.cover,
              ),
            ),

            // Texte superposé en haut à gauche
            const Positioned(
              top: 10,
              left: 10,
              child: Text(
                'Dashatar',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            // Icône superposée en bas à droite
            const Positioned(
              bottom: 10,
              right: 10,
              child: Icon(
                Icons.favorite,
                color: Colors.redAccent,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

### 🧠 Explication pédagogique

| Widget / Propriété     | Rôle pédagogique                                                          |
| ---------------------- | ------------------------------------------------------------------------- |
| `Stack`                | Permet de superposer des widgets (comme des calques)                      |
| `Positioned(...)`      | Permet de placer un widget à un endroit précis (top, right, bottom, left) |
| `Container` ou `Image` | Élément de fond (peut être une couleur, une image, un cadre...)           |
| `Center` ou `Align`    | Centre un élément dans le `Stack` sans `Positioned`                       |
| `Icons.favorite`       | Affiche une icône par-dessus l’image                                      |

---

### À faire tester par l’étudiant

1. **Changer les valeurs de `top`, `left`, `bottom`, `right`** pour observer les déplacements.
2. **Remplacer `Text` par une autre image ou une `Button`** pour tester des éléments interactifs superposés.
3. **Changer `Alignment.center` par `Alignment.topRight` dans le `Stack`** pour modifier l’alignement global par défaut.

---

Souhaitez-vous que l’exercice **20** combine `Stack` + `GestureDetector` pour rendre un **élément superposé cliquable** ?













Voici un **exercice pédagogique complet** basé sur votre capture : il introduit le comportement fondamental du widget **`Stack`**, avec deux `Container` superposés sans positionnement explicite. On observe comment le `Stack` **empile les widgets du bas vers le haut**, et comment **les éléments se centrent par défaut si non positionnés**.

---

### <h2 id="c-ex20">Exercice 20 – Superposition simple avec `Stack` (sans `Positioned`)</h2>

---

### Objectif pédagogique

Dans cet exercice, vous allez :

* apprendre à utiliser `Stack` pour superposer plusieurs widgets
* observer l’ordre de superposition implicite
* comprendre comment `Stack` empile ses enfants **par défaut** dans le coin **supérieur gauche**
* utiliser différents `Container` colorés pour rendre la superposition bien visible

---

### Résultat attendu

* Un **grand carré jaune** en fond
* Un **petit carré teal** superposé en haut à gauche, **sans utiliser `Positioned`**
* Visualisation claire de la pile (le dernier élément est dessiné au-dessus du précédent)

---

### ✅ Code Flutter complet

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barre supérieure
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dashatar app"),
      ),

      // Corps principal
      body: Stack(
        children: [
          // Premier widget : le fond
          Container(
            height: 100,
            width: 100,
            color: Colors.yellow,
          ),

          // Deuxième widget : au-dessus du précédent
          Container(
            height: 50,
            width: 50,
            color: Colors.teal,
          ),
        ],
      ),
    );
  }
}
```

---

### Explication pédagogique

| Widget / Propriété         | Fonction pédagogique                                            |
| -------------------------- | --------------------------------------------------------------- |
| `Stack(...)`               | Empile les enfants les uns sur les autres (comme des calques)   |
| Ordre des `children`       | Le premier est au fond, le dernier est au-dessus                |
| Pas de `Positioned(...)`   | Les widgets sont tous placés **en haut à gauche**               |
| `Container(height, width)` | Définit la taille et la couleur pour bien voir la superposition |

---

### À faire tester par l’étudiant

1. **Inversez l’ordre des `Container`** et observez le résultat : le jaune sera au-dessus du teal.
2. Essayez d’ajouter un troisième `Container` plus petit (ex : rouge, 25×25).
3. Ajoutez `alignment: Alignment.center` dans le `Stack` pour centrer les éléments par défaut :

```dart
body: Stack(
  alignment: Alignment.center,
  children: [...],
),
```

---

Souhaitez-vous un **exercice 21** où les widgets superposés **sont positionnés manuellement** avec `Positioned` ? Ou un exemple où on **détecte les clics** sur les couches avec `GestureDetector` ?













Parfait, poursuivons l’apprentissage du widget `Stack` avec **différents alignements prédéfinis** grâce à la propriété `alignment`. Voici un exercice détaillé permettant de **tester tous les cas classiques de `Alignment`**.

---

### <h2 id="c-ex21">Exercice 21 – Tester tous les `Alignment` dans un `Stack`</h2>

---

### Objectif pédagogique

* Comprendre la propriété `alignment:` dans un `Stack`
* Visualiser les **différents emplacements** que permet `Alignment` : haut, bas, centre, coins…
* Apprendre à contrôler la **position par défaut** d’un widget superposé sans `Positioned`

---

### Résultat attendu

L’application affiche une grande boîte (fond jaune), et une plus petite boîte (teal) superposée à un **emplacement contrôlé par `alignment:`**.

---

### ✅ Code de base (à modifier pour chaque test)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Stack Alignment Test"),
      ),

      // Stack avec alignement à tester
      body: Stack(
        alignment: Alignment.topCenter, // <== À modifier ici

        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.yellow,
          ),
          Container(
            height: 50,
            width: 50,
            color: Colors.teal,
          ),
        ],
      ),
    );
  }
}
```

---

### 🔁 À tester : remplacez `Alignment.topCenter` par les valeurs suivantes :

| Alignement Flutter       | Résultat attendu                |
| ------------------------ | ------------------------------- |
| `Alignment.topLeft`      | Coin supérieur gauche           |
| `Alignment.topCenter`    | Centré en haut *(déjà utilisé)* |
| `Alignment.topRight`     | Coin supérieur droit            |
| `Alignment.centerLeft`   | Centré verticalement à gauche   |
| `Alignment.center`       | Exactement au centre du `Stack` |
| `Alignment.centerRight`  | Centré verticalement à droite   |
| `Alignment.bottomLeft`   | Coin inférieur gauche           |
| `Alignment.bottomCenter` | Centré en bas                   |
| `Alignment.bottomRight`  | Coin inférieur droit            |

---

### 🧠 Explication pédagogique

* `Stack` superpose ses enfants, mais le **positionnement par défaut dépend de `alignment:`**
* Pas besoin de `Positioned` ici : on garde une structure légère et directe
* L’ordre des enfants **détermine l’ordre des calques** : le premier est en fond, les suivants au-dessus

---

### 🔧 Exemple pratique :

```dart
alignment: Alignment.bottomRight,
```

* Cela place le conteneur teal dans le **coin inférieur droit** du conteneur jaune.

---

### À expérimenter

1. Ajoutez un troisième `Container` plus petit (`Colors.red`, `25x25`) pour visualiser 3 couches superposées.
2. Essayez un `Alignment` personnalisé :

```dart
alignment: const Alignment(0.5, -0.5),
```

Cela permet un positionnement **précis** basé sur les coordonnées (-1.0 à 1.0).

---

Souhaitez-vous que l’exercice 22 introduise :

* l’utilisation de `Positioned(...)`
* ou la combinaison `Stack` + `GestureDetector` (clic sur un élément superposé) ?









Voici maintenant l’**exercice 22** dédié au widget `Positioned`, que vous êtes en train d’explorer dans votre capture. Cet exercice vous montre comment **positionner précisément** des éléments superposés dans un `Stack`.

---

### <h2 id="c-ex22">Exercice 22 – Positionner précisément des widgets avec `Positioned` dans un `Stack`</h2>

---

### 🎯 Objectif pédagogique

* Apprendre à utiliser le widget `Positioned` dans un `Stack`
* Maîtriser les propriétés `top`, `left`, `right`, `bottom` pour **placer un widget manuellement**
* Visualiser comment `Positioned` **remplace `alignment:`** pour un positionnement précis

---

### ✅ Résultat attendu

* Un grand carré jaune placé en fond (100×100)
* Un petit carré teal (50×50) **placé à 10 px du bord gauche** et **20 px du haut**

---

### ✅ Code Flutter complet

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Stack with Positioned"),
      ),

      body: Stack(
        children: [
          // Élément de fond
          Container(
            height: 100,
            width: 100,
            color: Colors.yellow,
          ),

          // Élément superposé avec position manuelle
          Positioned(
            left: 10.0,
            top: 20.0,
            child: Container(
              height: 50,
              width: 50,
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }
}
```

---

### 📘 Explication pédagogique

| Élément                 | Fonction                                                                           |
| ----------------------- | ---------------------------------------------------------------------------------- |
| `Stack(...)`            | Conteneur empilé permettant la superposition                                       |
| `Positioned(...)`       | Permet de positionner **exactement** un widget dans le `Stack`                     |
| `left: 10`, `top: 20`   | Positionne le coin supérieur gauche du widget teal à 10px à gauche et 20px du haut |
| `child: Container(...)` | Élément visuel (ici un carré teal)                                                 |

---

### 🧪 À tester par l’étudiant

1. **Ajoutez `right:` ou `bottom:`** pour placer le carré dans un autre coin :

   ```dart
   Positioned(
     right: 10,
     bottom: 10,
     ...
   )
   ```

2. Supprimez les valeurs `top` et `left` — l’élément ne s’affichera pas car `Positioned` **nécessite au moins une contrainte**.

3. **Ajoutez plusieurs `Positioned` avec des couleurs différentes** pour construire une interface multi-éléments.

---

Souhaitez-vous que **l’exercice 23** :

* introduise `Stack + GestureDetector` pour déclencher une action au clic ?
* ou montre comment faire **un badge de notification** avec `Positioned` et un `Text` ?









Parfait. Voici **l’exercice 23**, conçu de façon **très pédagogique et accessible**, même pour des étudiants débutants (*"nuls"*) en Flutter. L’objectif est de comprendre comment **rendre un widget cliquable dans un `Stack`** avec `GestureDetector`.

---

### <h2 id="c-ex23">Exercice 23 – Rendre un widget cliquable avec `GestureDetector` dans un `Stack`</h2>

---

### 🎯 Objectif pédagogique

* Comprendre comment rendre un élément **interactif** avec `GestureDetector`
* Réagir à un **clic (tap)** sur un widget superposé
* Afficher un **message dans la console (`print()`)**
* Introduire doucement la notion de **gestion d’événements**

---

### 🧱 Résultat attendu

L’application affiche :

* un grand carré jaune (100x100)
* un petit carré teal superposé (50x50)
* lorsque l’utilisateur **tape sur le carré teal**, un message s’affiche dans la console.

---

### 🧠 Concepts abordés

| Notion            | Explication simple                              |
| ----------------- | ----------------------------------------------- |
| `Stack`           | Superposer plusieurs widgets                    |
| `Positioned`      | Placer manuellement un widget dans le `Stack`   |
| `GestureDetector` | Rendre un widget **réactif au toucher**         |
| `onTap`           | Action déclenchée **lors d’un clic**            |
| `print(...)`      | Affiche un message dans la **console de debug** |

---

### ✅ Code Flutter prêt à tester

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Interaction avec Stack"),
      ),

      body: Stack(
        children: [
          // 1. Fond jaune
          Container(
            height: 100,
            width: 100,
            color: Colors.yellow,
          ),

          // 2. Boîte cliquable (teal)
          Positioned(
            left: 10,
            top: 10,

            // ⚠️ Ce widget réagit au clic
            child: GestureDetector(
              onTap: () {
                // Action : afficher un message dans la console
                print("Carré cliqué !");
              },

              child: Container(
                height: 50,
                width: 50,
                color: Colors.teal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

---

### 🔎 Étape par étape

1. On crée un `Stack` pour empiler deux carrés
2. Le **carré du dessus** est placé avec `Positioned`
3. On **entoure** ce carré avec un `GestureDetector`
4. On écrit ce qui se passe quand on tape dessus : `print("Carré cliqué !");`

---

### 💡 Pour bien comprendre

> Le `GestureDetector` est **invisible** mais il **capte les interactions**.
> On peut l’utiliser pour :
>
> * détecter un clic (`onTap`)
> * détecter un glissement (`onPan`)
> * détecter un appui long (`onLongPress`) — *à voir plus tard*

---

### ✅ À faire par l’étudiant

* Modifier le texte dans `print(...)`
* Remplacer la `Container` par une `Image.asset(...)`
* Ajouter une autre boîte dans un autre coin avec un autre message (`"Autre clic"`)

---

Souhaitez-vous que l’**exercice 24** ajoute :

* un **badge de notification** avec `Positioned` et un nombre ?
* ou une **animation simple** au clic (par ex : changer la couleur) ?












Parfait, commençons une **nouvelle série pédagogique sur les "States" (états)** en Flutter. Voici le **premier exercice**, totalement inspiré de votre capture.

---

### <h2 id="c-etat1">Exercice 24 – Compteur d’images avec `setState()`</h2>

---

### 🎯 Objectif pédagogique

* Comprendre la notion **d’état modifiable** (stateful)
* Utiliser un widget **`StatefulWidget`**
* Mettre à jour dynamiquement l’interface avec `setState(...)`
* Réagir à un clic (`onPressed`) pour modifier un compteur

---

### ✅ Résultat attendu

* Une image (Dash)
* Un nombre affiché dans la `AppBar`
* À chaque clic sur l’image, le compteur **augmente de 1**

---

### ✅ Code Flutter complet

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MonApp(),
  ));
}

// Widget avec état modifiable
class MonApp extends StatefulWidget {
  const MonApp({super.key});

  @override
  State<MonApp> createState() => _MonAppState();
}

class _MonAppState extends State<MonApp> {
  int count = 0; // 🔢 Variable d’état

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('$count'), // 🟦 Affiche la valeur actuelle
      ),

      // Le corps est un bouton qui contient une image
      body: MaterialButton(
        onPressed: () {
          // ⚠️ Changement d’état
          setState(() {
            count++; // ✅ Incrémentation
          });
        },
        child: Image.asset('images/dash.png'),
      ),
    );
  }
}
```

---

### 🧠 Explication ultra débutant

| Élément                     | Rôle                                                                            |
| --------------------------- | ------------------------------------------------------------------------------- |
| `StatefulWidget`            | Un widget qui **change avec le temps**                                          |
| `int count = 0`             | Valeur de départ du compteur                                                    |
| `setState(() { count++; })` | Cette fonction dit à Flutter : **« l’état a changé, mets l’interface à jour »** |
| `Text('$count')`            | Affiche le nombre dans la barre bleue                                           |
| `MaterialButton`            | Rend l’image **cliquable**                                                      |

---

### 🧪 À tester par l’étudiant

* Changer `count++` par `count = count + 5` : que se passe-t-il ?
* Remplacer `Text('$count')` par :

  ```dart
  Text('Vous avez cliqué $count fois')
  ```
* Remplacer l’image par un `Icon(Icons.favorite)` (au lieu de `Image.asset`)

---

### 📦 pubspec.yaml (si image)

Vérifiez bien que vous avez déclaré votre image :

```yaml
flutter:
  assets:
    - images/dash.png
```

---

Souhaitez-vous que **l’exercice suivant (25)** introduise :

* le **changement de couleur** selon la valeur du compteur ?
* ou un **reset automatique** après 10 clics ?













Très bien. Voici la version sans emojis et toujours aussi pédagogique.

---

### <h2 id="c-etat1">Exercice 24 – Compteur d’images avec `setState()`</h2>

---

### Objectif pédagogique

Cet exercice a pour but de :

* Comprendre ce qu’est un état dynamique dans une interface utilisateur
* Apprendre à utiliser un `StatefulWidget`
* Mettre à jour l’écran grâce à `setState(...)`
* Réagir à un appui sur une image pour modifier une variable (`count`)

---

### Résultat attendu

* Une image affichée au centre de l’écran
* Un nombre affiché dans la barre supérieure (AppBar)
* Chaque fois que l’on clique sur l’image, ce nombre augmente de 1

---

### Code Flutter complet

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MonApp(),
  ));
}

// Un widget à état (StatefulWidget) car il va changer dynamiquement
class MonApp extends StatefulWidget {
  const MonApp({super.key});

  @override
  State<MonApp> createState() => _MonAppState();
}

class _MonAppState extends State<MonApp> {
  int count = 0; // Variable d’état initialisée à 0

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('$count'), // Le compteur s’affiche ici
      ),
      body: MaterialButton(
        onPressed: () {
          // Cette fonction est appelée à chaque clic
          setState(() {
            count = count + 1; // On augmente la valeur
          });
        },
        child: Image.asset('images/dash.png'),
      ),
    );
  }
}
```

---

### Explication pas à pas

1. `StatefulWidget` est utilisé car la valeur `count` va changer.
2. `count = 0` signifie que l’on commence avec 0.
3. Lorsqu’on appuie sur le bouton, la fonction `onPressed` est appelée.
4. `setState(...)` informe Flutter qu’il faut reconstruire l’écran avec les nouvelles valeurs.
5. Le texte affiché dans `AppBar` est directement relié à la variable `count`.

---

### Ce que l’étudiant peut essayer

1. Remplacer `count = count + 1` par `count = count + 10`
2. Modifier la barre de titre comme suit :

   ```dart
   title: Text('Nombre de clics : $count')
   ```
3. Remplacer l’image par une icône :

   ```dart
   child: Icon(Icons.access_alarm, size: 100),
   ```

---

### Vérification des ressources

Si vous utilisez une image locale, n’oubliez pas de la déclarer dans `pubspec.yaml` :

```yaml
flutter:
  assets:
    - images/dash.png
```

---

Souhaitez-vous que **l’exercice 25** montre comment changer la **couleur de fond ou du texte selon la valeur du compteur** ?
Ou qu’il réinitialise automatiquement le compteur à 0 dès qu’on atteint une certaine valeur (ex : 10) ?












Très bien. Voici l'exercice 25 qui introduit la **réinitialisation automatique du compteur à 0** lorsqu'une certaine limite est atteinte.

---

### <h2 id="c-etat2">Exercice 25 – Réinitialisation automatique du compteur</h2>

---

### Objectif

* Appliquer une logique conditionnelle dans `setState`
* Réinitialiser une variable lorsque sa valeur atteint un seuil (ici 10)
* Observer l’effet immédiat d’un changement d’état dans l’interface

---

### Résultat attendu

* Une image cliquable
* Un compteur affiché dans l’`AppBar`
* À chaque clic, le compteur augmente de 1
* Lorsqu’il atteint 10, il retourne automatiquement à 0

---

### Code Flutter complet

```dart
import 'package:flutter/material.dart';

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
  int count = 0; // Variable d’état

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Compteur : $count'),
      ),
      body: MaterialButton(
        onPressed: () {
          setState(() {
            count++;
            // Si on atteint 10, on remet à zéro
            if (count == 10) {
              count = 0;
            }
          });
        },
        child: Image.asset('images/dash.png'),
      ),
    );
  }
}
```

---

### Étapes importantes

1. `count++` augmente la valeur à chaque clic
2. La condition `if (count == 10)` vérifie si on atteint la limite
3. `count = 0` réinitialise la variable
4. Grâce à `setState`, l’affichage est mis à jour instantanément

---

### À tester

* Remplacer `10` par une autre limite, comme `5` ou `20`
* Afficher un message dans la console au moment de la réinitialisation :

  ```dart
  if (count == 10) {
    print('Limite atteinte, remise à zéro');
    count = 0;
  }
  ```
* Remplacer `Image.asset` par une icône ou un autre widget visuel

---

Souhaitez-vous que l’exercice suivant introduise **un compteur inverse** (qui part de 10 et descend à 0) ou une **changement de couleur selon la valeur** ?



























































































<br/>

# Références: 


![image](https://github.com/user-attachments/assets/681d71e1-efad-4450-b68e-afabeb345062)
