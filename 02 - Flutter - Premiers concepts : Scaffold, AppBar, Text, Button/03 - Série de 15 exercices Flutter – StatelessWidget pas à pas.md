# Série de 15 exercices Flutter – StatelessWidget pas à pas


# <h1 id="toc">Table des matières</h1>

1. [Exercice 1 – Afficher un bouton rouge](#ex1)
2. [Exercice 2 – Afficher un bouton bleu](#ex2)
3. [Exercice 3 – Afficher deux boutons côte à côte](#ex3)
4. [Exercice 4 – Ajouter une barre d’application (AppBar)](#ex4)
5. [Exercice 5 – Bouton avec texte centré dans la page](#ex5)
6. [Exercice 6 – Utiliser un `ElevatedButton`](#ex6)
7. [Exercice 7 – Utiliser un widget `Text` stylisé](#ex7)
8. [Exercice 8 – Ajouter un `SizedBox` pour espacer](#ex8)
9. [Exercice 9 – Ajouter un `Column` avec deux éléments](#ex9)
10. [Exercice 10 – Utiliser un `Row` pour aligner deux éléments](#ex10)
11. [Exercice 11 – Afficher un `Radio` sans interaction](#ex11)
12. [Exercice 12 – Afficher un `Checkbox` sans interaction](#ex12)
13. [Exercice 13 – Afficher un `DropdownButton` (valeur fixe)](#ex13)
14. [Exercice 14 – Afficher une image locale ou réseau](#ex14)
15. [Exercice 15 – Créer une carte (`Card`) contenant un bouton](#ex15)
16. [Exercice 16 – Formulaire simple avec deux champs de texte](#ex16)
17. [Exercice 17 – Formulaire avec champs email et mot de passe](#ex17)
18. [Exercice 18 – Interface avec 3 `TextField` et une `DropdownButton`](#ex18)
19. [Exercice 19 – Interface avec `Checkbox` et `ElevatedButton`](#ex19)
20. [Exercice 20 – Formulaire complet sans logique (Stateless)](#ex20)



### 🔔 **Note importante**

> **Pour chaque exercice, vous devez uniquement remettre le fichier `main.dart` complet.**
> Assurez-vous que le code Dart est **exécutable tel quel** (copier-coller dans un projet Flutter suffit pour voir le résultat).
> Il n'est **pas nécessaire de créer d'autres fichiers ou de modifier pubspec.yaml**.




### <h2 id="ex1">Exercice 1 – Afficher un bouton rouge</h2>

Crée une application Flutter qui affiche un bouton rouge centré à l'écran.

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```




### <h2 id="c-ex1">Exercice 1 – Afficher un bouton rouge</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Bouton Rouge'),
          ),
        ),
      ),
    );
  }
}
```




<br/>


### <h2 id="ex2">Exercice 2 – Afficher un bouton bleu</h2>

Crée une application Flutter qui affiche un bouton bleu centré, sans texte.

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```





### <h2 id="c-ex2">Exercice 2 – Afficher un bouton bleu</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
```

<br/>


### <h2 id="ex3">Exercice 3 – Afficher deux boutons côte à côte</h2>

Affiche deux boutons côte à côte, l’un vert, l’autre orange.

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```





### <h2 id="c-ex3">Exercice 3 – Afficher deux boutons côte à côte</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("Bouton 1"),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text("Bouton 2"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```




<br/>


### <h2 id="ex4">Exercice 4 – Ajouter une barre d’application (AppBar)</h2>

Ajoute une `AppBar` avec le titre "Ma première app".

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```




### <h2 id="c-ex4">Exercice 4 – Ajouter une barre d’application (AppBar)</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Ma première app")),
        body: const Center(child: Text("Contenu")),
      ),
    );
  }
}
```



<br/>

### <h2 id="ex5">Exercice 5 – Bouton avec texte centré dans la page</h2>

Affiche un bouton sous un texte centré à l'écran.

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```


### <h2 id="ex5">Exercice 5 – Bouton avec texte centré dans la page</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Bonjour"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Clique ici"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

<br/>





### <h2 id="ex6">Exercice 6 – Utiliser un `ElevatedButton`</h2>

Utilise un `ElevatedButton` avec le texte "Clique ici".

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```

### <h2 id="c-ex6">Exercice 6 – Utiliser un `ElevatedButton`</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("Clique ici"),
          ),
        ),
      ),
    );
  }
}
```

<br/>

---

### <h2 id="ex7">Exercice 7 – Utiliser un widget `Text` stylisé</h2>

Affiche un texte centré avec taille de police 24 et couleur bleue.

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```

### <h2 id="c-ex7">Exercice 7 – Utiliser un widget `Text` stylisé</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            "Texte stylisé",
            style: TextStyle(
              fontSize: 24,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
```

<br/>

---

### <h2 id="ex8">Exercice 8 – Ajouter un `SizedBox` pour espacer</h2>

Affiche deux boutons verticaux avec un espace de 40 pixels entre eux.

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```

### <h2 id="c-ex8">Exercice 8 – Ajouter un `SizedBox` pour espacer</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text("Bouton 1"),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Bouton 2"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

<br/>

---

### <h2 id="ex9">Exercice 9 – Ajouter un `Column` avec deux éléments</h2>

Affiche un `Text` et un `ElevatedButton` empilés verticalement.

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```

### <h2 id="c-ex9">Exercice 9 – Ajouter un `Column` avec deux éléments</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Bienvenue"),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Continuer"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

<br/>

---

### <h2 id="ex10">Exercice 10 – Utiliser un `Row` pour aligner deux éléments</h2>

Affiche deux `Text` alignés horizontalement.

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```

### <h2 id="c-ex10">Exercice 10 – Utiliser un `Row` pour aligner deux éléments</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Gauche"),
              SizedBox(width: 20),
              Text("Droite"),
            ],
          ),
        ),
      ),
    );
  }
}
```



<br/>





### <h2 id="ex11">Exercice 11 – Afficher un `Radio` sans interaction</h2>

Affiche un bouton radio désactivé avec une étiquette à droite.

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```

### <h2 id="c-ex11">Exercice 11 – Afficher un `Radio` sans interaction</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Radio(
                value: 1,
                groupValue: 0,
                onChanged: null, // désactivé
              ),
              Text("Option 1"),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

### <h2 id="ex12">Exercice 12 – Afficher un `Checkbox` sans interaction</h2>

Affiche une case à cocher désactivée avec une étiquette.

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```

### <h2 id="c-ex12">Exercice 12 – Afficher un `Checkbox` sans interaction</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Checkbox(
                value: false,
                onChanged: null, // désactivé
              ),
              Text("J'accepte"),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

### <h2 id="ex13">Exercice 13 – Afficher un `DropdownButton` (valeur fixe)</h2>

Affiche une liste déroulante avec trois choix mais sans action à la sélection.

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```

### <h2 id="c-ex13">Exercice 13 – Afficher un `DropdownButton` (valeur fixe)</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: DropdownButton<String>(
            value: "Choix 1",
            onChanged: null, // désactivé
            items: const [
              DropdownMenuItem(value: "Choix 1", child: Text("Choix 1")),
              DropdownMenuItem(value: "Choix 2", child: Text("Choix 2")),
              DropdownMenuItem(value: "Choix 3", child: Text("Choix 3")),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

### <h2 id="ex14">Exercice 14 – Afficher une image locale ou réseau</h2>

Ajoute une image centrée (utilise un lien réseau pour simplifier).

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```

### <h2 id="c-ex14">Exercice 14 – Afficher une image locale ou réseau</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Image.network(
            "https://flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png",
            width: 200,
          ),
        ),
      ),
    );
  }
}
```

---

### <h2 id="ex15">Exercice 15 – Créer une carte (`Card`) contenant un bouton</h2>

Crée une `Card` avec un titre et un bouton à l’intérieur.

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```

### <h2 id="c-ex15">Exercice 15 – Créer une carte (`Card`) contenant un bouton</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Card(
            elevation: 4,
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Titre de la carte",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Clique ici"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

<br/>






### <h2 id="ex16">Exercice 16 – Formulaire simple avec deux champs de texte</h2>

Crée une interface contenant :

* Un champ pour le prénom
* Un champ pour le nom
* Un bouton "Soumettre"

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```

### <h2 id="c-ex16">Exercice 16 – Formulaire simple avec deux champs de texte</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextField(decoration: InputDecoration(labelText: 'Prénom')),
              const SizedBox(height: 16),
              const TextField(decoration: InputDecoration(labelText: 'Nom')),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Soumettre"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

### <h2 id="ex17">Exercice 17 – Formulaire avec champs email et mot de passe</h2>

Crée une interface de connexion contenant :

* Un champ `TextField` pour l'adresse courriel
* Un champ `TextField` pour le mot de passe
* Un bouton "Se connecter"

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```

### <h2 id="c-ex17">Exercice 17 – Formulaire avec champs email et mot de passe</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(labelText: 'Mot de passe'),
                obscureText: true,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Se connecter"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

### <h2 id="ex18">Exercice 18 – Interface avec 3 `TextField` et une `DropdownButton`</h2>

Crée un petit formulaire de profil avec :

* Champ prénom
* Champ nom
* Champ ville
* Une liste déroulante (pays au choix)
* Un bouton "Valider"

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```

### <h2 id="c-ex18">Exercice 18 – Interface avec 3 `TextField` et une `DropdownButton`</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextField(decoration: InputDecoration(labelText: 'Prénom')),
              const SizedBox(height: 12),
              const TextField(decoration: InputDecoration(labelText: 'Nom')),
              const SizedBox(height: 12),
              const TextField(decoration: InputDecoration(labelText: 'Ville')),
              const SizedBox(height: 12),
              DropdownButton<String>(
                value: 'Canada',
                onChanged: null, // désactivé pour StatelessWidget
                items: const [
                  DropdownMenuItem(value: 'Canada', child: Text('Canada')),
                  DropdownMenuItem(value: 'France', child: Text('France')),
                  DropdownMenuItem(value: 'Tunisie', child: Text('Tunisie')),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Valider"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

### <h2 id="ex19">Exercice 19 – Interface avec `Checkbox` et `ElevatedButton`</h2>

Crée une interface qui affiche :

* Un texte "Acceptez-vous les conditions ?"
* Une case à cocher (désactivée ici)
* Un bouton "Continuer"

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```

### <h2 id="c-ex19">Exercice 19 – Interface avec `Checkbox` et `ElevatedButton`</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: const [
                  Checkbox(value: false, onChanged: null),
                  Text("Acceptez-vous les conditions ?"),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Continuer"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

### <h2 id="ex20">Exercice 20 – Formulaire complet sans logique (Stateless)</h2>

Crée un formulaire visuellement complet avec :

* Titre centré
* Champ nom complet
* Champ courriel
* Mot de passe
* Confirmation de mot de passe
* Checkbox pour conditions
* Un bouton "Créer un compte"

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```

### <h2 id="c-ex20">Exercice 20 – Formulaire complet sans logique (Stateless)</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  "Créer un compte",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(height: 30),
              const TextField(decoration: InputDecoration(labelText: 'Nom complet')),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(labelText: 'Adresse courriel'),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(labelText: 'Mot de passe'),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(labelText: 'Confirmer le mot de passe'),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              Row(
                children: const [
                  Checkbox(value: false, onChanged: null),
                  Text("J'accepte les conditions"),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Créer un compte"),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
```

