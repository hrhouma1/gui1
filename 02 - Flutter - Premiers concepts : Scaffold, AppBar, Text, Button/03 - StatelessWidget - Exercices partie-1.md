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
// Importation du package Flutter de base
import 'package:flutter/material.dart';

// Point d'entrée de l'application
void main() {
  runApp(const MonApp()); // Lance l'application en affichant le widget MonApp
}

// Déclaration d'un widget sans état (StatelessWidget)
class MonApp extends StatelessWidget {
  const MonApp({super.key}); // Constructeur constant (optimisation Flutter)

  @override
  Widget build(BuildContext context) {
    // Retourne une MaterialApp, structure de base pour une app Flutter
    return MaterialApp(
      home: Scaffold( // Scaffold fournit une structure d'écran avec fond, barre, etc.
        body: Center( // Centre son enfant (ici : le bouton)
          child: ElevatedButton( // Création d'un bouton élevé (relief)
            onPressed: () {}, // Fonction appelée au clic (vide ici)
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, // Couleur de fond rouge
            ),
            child: const Text('Bouton Rouge'), // Texte à afficher sur le bouton
          ),
        ),
      ),
    );
  }
}
```



[Retour à la table de matière](#toc)

<br/>
<br/>
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
// Importation du package Flutter
import 'package:flutter/material.dart';

// Point d’entrée de l’application
void main() {
  runApp(const MonApp()); // Démarre l’application avec MonApp
}

// Déclaration du widget principal sans état
class MonApp extends StatelessWidget {
  const MonApp({super.key}); // Constructeur constant (transmet la clé au parent)

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold( // Structure de base de l'écran
        body: Center( // Centre le bouton dans l’écran
          child: ElevatedButton(
            onPressed: () {}, // Action vide pour le clic
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Bouton bleu
            ),
            child: const SizedBox.shrink(), // Aucun contenu visible (voir Annexe 2)
          ),
        ),
      ),
    );
  }
}
```






[Retour à la table de matière](#toc)

<br/>
<br/>
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
// Importation de la bibliothèque Flutter principale
import 'package:flutter/material.dart';

// Point d'entrée de l'application
void main() {
  runApp(const MonApp()); // Démarre l'application avec MonApp
}

// Widget principal de l'application, sans état (statique)
class MonApp extends StatelessWidget {
  const MonApp({super.key}); // Constructeur constant pour les performances

  @override
  Widget build(BuildContext context) {
    // Matérialisation de l'application avec MaterialApp
    return MaterialApp(
      home: Scaffold( // Scaffold = structure visuelle de base (fond, appbar, etc.)
        body: Center( // Centre les enfants à l'intérieur du corps de la page
          child: Row( // Organise les enfants horizontalement
            mainAxisAlignment: MainAxisAlignment.center, // Centre les éléments dans la rangée
            children: [
              ElevatedButton( // Premier bouton
                onPressed: () {}, // Pas d'action au clic
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Bouton vert
                ),
                child: const Text("Bouton 1"), // Texte du premier bouton
              ),
              const SizedBox(width: 20), // Espace horizontal entre les deux boutons
              ElevatedButton( // Deuxième bouton
                onPressed: () {}, // Pas d'action au clic
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Bouton orange
                ),
                child: const Text("Bouton 2"), // Texte du deuxième bouton
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```



[Retour à la table de matière](#toc)

<br/>
<br/>
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
// Importation du package de base pour Flutter
import 'package:flutter/material.dart';

// Fonction principale, point d'entrée de l'application
void main() {
  runApp(const MonApp()); // Lance le widget MonApp
}

// Définition d’un widget statique (sans état)
class MonApp extends StatelessWidget {
  const MonApp({super.key}); // Constructeur constant

  @override
  Widget build(BuildContext context) {
    // Application Flutter utilisant le style Material Design
    return MaterialApp(
      home: Scaffold( // Scaffold = structure visuelle avec appbar, body, etc.
        appBar: AppBar( // Ajout d'une barre d'application en haut de l'écran
          title: const Text("Ma première app"), // Titre de l'AppBar
        ),
        body: const Center( // Corps de la page centré
          child: Text("Contenu"), // Texte de base dans le corps
        ),
      ),
    );
  }
}
```




[Retour à la table de matière](#toc)

<br/>
<br/>
<br/>


### <h2 id="ex5">Exercice 5 – Bouton avec texte centré dans la page</h2>

Affiche un bouton sous un texte centré à l'écran.

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```

### <h2 id="c-ex5">Exercice 5 – Bouton avec texte centré dans la page</h2>

```dart
// Importation du package principal de Flutter
import 'package:flutter/material.dart';

// Fonction main – point d’entrée de l’application
void main() {
  runApp(const MonApp()); // Démarre l’application en affichant MonApp
}

// Déclaration d’un widget sans état (StatelessWidget)
class MonApp extends StatelessWidget {
  const MonApp({super.key}); // Constructeur constant pour les performances

  @override
  Widget build(BuildContext context) {
    // Création d’une MaterialApp (structure d'une app Flutter)
    return MaterialApp(
      home: Scaffold( // Scaffold fournit la structure de base de l’écran
        body: Center( // Centre son enfant verticalement et horizontalement
          child: Column( // Affiche les widgets enfants verticalement
            mainAxisAlignment: MainAxisAlignment.center, // Centre les éléments verticalement
            children: [
              const Text("Bonjour"), // Texte affiché en haut
              const SizedBox(height: 20), // Espace vertical entre le texte et le bouton
              ElevatedButton( // Bouton avec relief
                onPressed: () {}, // Action vide au clic
                child: const Text("Clique ici"), // Texte du bouton
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```


[Retour à la table de matière](#toc)

<br/>
<br/>
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
// Importation du package Flutter nécessaire
import 'package:flutter/material.dart';

// Fonction principale : point de départ de l'application
void main() {
  runApp(const MonApp()); // Lance le widget MonApp
}

// Déclaration d'un widget stateless (pas de données modifiables)
class MonApp extends StatelessWidget {
  const MonApp({super.key}); // Constructeur constant

  @override
  Widget build(BuildContext context) {
    // Application Flutter utilisant une structure Material Design
    return MaterialApp(
      home: Scaffold( // Scaffold structure l'écran avec body, appBar, etc.
        body: Center( // Centre l’enfant dans la zone visible
          child: ElevatedButton( // Bouton avec effet d’élévation (ombre)
            onPressed: () {}, // Action vide lors de l’appui
            child: const Text("Clique ici"), // Texte affiché sur le bouton
          ),
        ),
      ),
    );
  }
}
```


[Retour à la table de matière](#toc)

<br/>
<br/>
<br/>

### <h2 id="ex7">Exercice 7 – Utiliser un widget `Text` stylisé</h2>

Affiche un texte centré avec taille de police 24 et couleur bleue.

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```

### <h2 id="c-ex7">Exercice 7 – Utiliser un widget `Text` stylisé</h2>

```dart
// Importation de la bibliothèque Flutter principale
import 'package:flutter/material.dart';

// Point d’entrée principal de l'application
void main() {
  runApp(const MonApp()); // Lance le widget MonApp
}

// Widget principal sans état (stateless)
class MonApp extends StatelessWidget {
  const MonApp({super.key}); // Constructeur constant

  @override
  Widget build(BuildContext context) {
    // Définition de l'application avec MaterialApp
    return MaterialApp(
      home: Scaffold( // Structure de base avec appBar, body, etc.
        body: Center( // Centre le texte dans l’écran
          child: Text(
            "Texte stylisé", // Contenu du texte affiché
            style: TextStyle(
              fontSize: 24, // Taille de police : 24
              color: Colors.blue, // Couleur du texte : bleu
            ),
          ),
        ),
      ),
    );
  }
}
```


[Retour à la table de matière](#toc)

<br/>
<br/>
<br/>


### <h2 id="ex8">Exercice 8 – Ajouter un `SizedBox` pour espacer</h2>

Affiche deux boutons verticaux avec un espace de 40 pixels entre eux.

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```

### <h2 id="c-ex8">Exercice 8 – Ajouter un `SizedBox` pour espacer</h2>

```dart
// Importation du package Flutter
import 'package:flutter/material.dart';

// Fonction principale, appelée au lancement de l'app
void main() {
  runApp(const MonApp()); // Affiche MonApp
}

// Déclaration d'un widget sans état
class MonApp extends StatelessWidget {
  const MonApp({super.key}); // Constructeur constant pour l'optimisation

  @override
  Widget build(BuildContext context) {
    // Définition de l'application avec un thème Material
    return MaterialApp(
      home: Scaffold( // Structure de l'écran : fond, corps, appbar...
        body: Center( // Centre les éléments dans l'écran
          child: Column( // Colonne verticale
            mainAxisAlignment: MainAxisAlignment.center, // Centre verticalement
            children: [
              ElevatedButton( // Premier bouton
                onPressed: () {}, // Aucun comportement défini
                child: const Text("Bouton 1"), // Texte du bouton
              ),
              const SizedBox(height: 40), // Espace vertical de 40 pixels
              ElevatedButton( // Deuxième bouton
                onPressed: () {}, // Aucun comportement défini
                child: const Text("Bouton 2"), // Texte du bouton
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```


[Retour à la table de matière](#toc)

<br/>
<br/>
<br/>

### <h2 id="ex9">Exercice 9 – Ajouter un `Column` avec deux éléments</h2>

Affiche un `Text` et un `ElevatedButton` empilés verticalement.

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```

### <h2 id="c-ex9">Exercice 9 – Ajouter un `Column` avec deux éléments</h2>

```dart
// Importation de la bibliothèque Flutter
import 'package:flutter/material.dart';

// Fonction principale appelée au lancement de l'application
void main() {
  runApp(const MonApp()); // Lance MonApp
}

// Définition du widget principal sans état
class MonApp extends StatelessWidget {
  const MonApp({super.key}); // Constructeur constant

  @override
  Widget build(BuildContext context) {
    // Structure de l'application Flutter
    return MaterialApp(
      home: Scaffold( // Fournit le squelette de base de l’écran
        body: Center( // Centre la colonne dans l’écran
          child: Column( // Organise les éléments verticalement
            mainAxisAlignment: MainAxisAlignment.center, // Centre la colonne sur l'axe vertical
            children: [
              const Text("Bienvenue"), // Texte affiché en haut de la colonne
              const SizedBox(height: 16), // Espace vertical de 16 pixels
              ElevatedButton( // Bouton sous le texte
                onPressed: () {}, // Action vide au clic
                child: const Text("Continuer"), // Texte affiché sur le bouton
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```


[Retour à la table de matière](#toc)

<br/>
<br/>
<br/>

### <h2 id="ex10">Exercice 10 – Utiliser un `Row` pour aligner deux éléments</h2>

Affiche deux `Text` alignés horizontalement.

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```

### <h2 id="c-ex10">Exercice 10 – Utiliser un `Row` pour aligner deux éléments</h2>

```dart
// Importation du package Flutter
import 'package:flutter/material.dart';

// Point d’entrée principal de l’application
void main() {
  runApp(const MonApp()); // Lance l’application via le widget MonApp
}

// Définition d’un widget sans état
class MonApp extends StatelessWidget {
  const MonApp({super.key}); // Constructeur constant (optimisation Flutter)

  @override
  Widget build(BuildContext context) {
    // Construction de l’application Material Design
    return MaterialApp(
      home: Scaffold( // Fournit la structure visuelle de l’application
        body: Center( // Centre les enfants dans l’écran
          child: Row( // Organisation des widgets horizontalement
            mainAxisAlignment: MainAxisAlignment.center, // Centre les textes sur l’axe horizontal
            children: const [
              Text("Gauche"), // Premier texte (à gauche)
              SizedBox(width: 20), // Espace horizontal de 20 pixels
              Text("Droite"), // Deuxième texte (à droite)
            ],
          ),
        ),
      ),
    );
  }
}
```


[Retour à la table de matière](#toc)

<br/>
<br/>
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
// Importation du package Flutter
import 'package:flutter/material.dart';

// Point d'entrée principal
void main() {
  runApp(const MonApp()); // Démarre le widget MonApp
}

// Définition du widget principal sans état
class MonApp extends StatelessWidget {
  const MonApp({super.key}); // Constructeur constant

  @override
  Widget build(BuildContext context) {
    // Structure de base de l'application
    return MaterialApp(
      home: Scaffold( // Squelette de la page avec corps
        body: Center( // Centre les enfants horizontalement et verticalement
          child: Row( // Affiche les éléments horizontalement
            mainAxisAlignment: MainAxisAlignment.center, // Centre les éléments dans la rangée
            children: const [
              Radio( // Bouton radio désactivé
                value: 1, // Valeur associée au bouton
                groupValue: 0, // Ne correspond pas à la valeur sélectionnée
                onChanged: null, // null = bouton désactivé (non interactif)
              ),
              Text("Option 1"), // Étiquette à droite du bouton radio
            ],
          ),
        ),
      ),
    );
  }
}
```


[Retour à la table de matière](#toc)

<br/>
<br/>
<br/>

### <h2 id="ex12">Exercice 12 – Afficher un `Checkbox` sans interaction</h2>

Affiche une case à cocher désactivée avec une étiquette.

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```

### <h2 id="c-ex12">Exercice 12 – Afficher un `Checkbox` sans interaction</h2>

```dart
// Importation du package Flutter
import 'package:flutter/material.dart';

// Fonction principale
void main() {
  runApp(const MonApp()); // Démarre le widget MonApp
}

// Widget principal sans état (StatelessWidget)
class MonApp extends StatelessWidget {
  const MonApp({super.key}); // Constructeur constant pour optimisation

  @override
  Widget build(BuildContext context) {
    // Application Flutter avec style Material
    return MaterialApp(
      home: Scaffold( // Structure de base de l’écran
        body: Center( // Centre les éléments dans l’écran
          child: Row( // Disposition horizontale des widgets
            mainAxisAlignment: MainAxisAlignment.center, // Centre les éléments dans la rangée
            children: const [
              Checkbox(
                value: false, // La case n’est pas cochée
                onChanged: null, // null signifie que la case est désactivée
              ),
              Text("J'accepte"), // Texte affiché à droite de la case
            ],
          ),
        ),
      ),
    );
  }
}
```


[Retour à la table de matière](#toc)

<br/>
<br/>
<br/>


### <h2 id="ex13">Exercice 13 – Afficher un `DropdownButton` (valeur fixe)</h2>

Affiche une liste déroulante avec trois choix mais sans action à la sélection.

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```

### <h2 id="c-ex13">Exercice 13 – Afficher un `DropdownButton` (valeur fixe)</h2>

```dart
// Importation du package Flutter
import 'package:flutter/material.dart';

// Fonction principale
void main() {
  runApp(const MonApp()); // Démarre l'application avec MonApp
}

// Définition d’un widget sans état
class MonApp extends StatelessWidget {
  const MonApp({super.key}); // Constructeur constant

  @override
  Widget build(BuildContext context) {
    // Application Flutter de type Material
    return MaterialApp(
      home: Scaffold( // Structure principale de la page
        body: Center( // Centre le contenu
          child: DropdownButton<String>( // Création d’une liste déroulante
            value: "Choix 1", // Valeur initialement sélectionnée
            onChanged: null, // Dropdown désactivé (non interactif)
            items: const [ // Liste des éléments disponibles
              DropdownMenuItem(
                value: "Choix 1",
                child: Text("Choix 1"),
              ),
              DropdownMenuItem(
                value: "Choix 2",
                child: Text("Choix 2"),
              ),
              DropdownMenuItem(
                value: "Choix 3",
                child: Text("Choix 3"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```


[Retour à la table de matière](#toc)

<br/>
<br/>
<br/>


### <h2 id="ex14">Exercice 14 – Afficher une image locale ou réseau</h2>

Ajoute une image centrée (utilise un lien réseau pour simplifier).

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```

### <h2 id="c-ex14">Exercice 14 – Afficher une image locale ou réseau</h2>

```dart
// Importation du package Flutter
import 'package:flutter/material.dart';

// Point d'entrée de l'application
void main() {
  runApp(const MonApp()); // Lance le widget principal MonApp
}

// Déclaration du widget sans état
class MonApp extends StatelessWidget {
  const MonApp({super.key}); // Constructeur constant

  @override
  Widget build(BuildContext context) {
    // Application de type Material
    return MaterialApp(
      home: Scaffold( // Squelette principal de l'écran
        body: Center( // Centre le contenu à l'écran
          child: Image.network( // Charge une image depuis Internet
            "https://flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png", // URL de l'image
            width: 200, // Largeur fixe de l’image
          ),
        ),
      ),
    );
  }
}
```


[Retour à la table de matière](#toc)

<br/>
<br/>
<br/>

### <h2 id="ex15">Exercice 15 – Créer une carte (`Card`) contenant un bouton</h2>

Crée une `Card` avec un titre et un bouton à l’intérieur.

```
/// Écrivez votre code ici :
/// --------------------------------------------------





/// --------------------------------------------------
```

### <h2 id="c-ex15">Exercice 15 – Créer une carte (`Card`) contenant un bouton</h2>

```dart
// Importation de la bibliothèque Flutter
import 'package:flutter/material.dart';

// Fonction principale
void main() {
  runApp(const MonApp()); // Lance le widget principal MonApp
}

// Définition du widget principal sans état
class MonApp extends StatelessWidget {
  const MonApp({super.key}); // Constructeur constant

  @override
  Widget build(BuildContext context) {
    // Application de type Material
    return MaterialApp(
      home: Scaffold( // Fournit la structure principale de l'écran
        body: Center( // Centre le contenu de la page
          child: Card( // Crée une carte visuelle (avec ombre et bords arrondis)
            elevation: 4, // Niveau d'élévation (ombre)
            margin: const EdgeInsets.all(16), // Marge autour de la carte
            child: Padding( // Ajoute du padding à l'intérieur de la carte
              padding: const EdgeInsets.all(20), // Marge intérieure de 20 pixels
              child: Column( // Organisation verticale des éléments dans la carte
                mainAxisSize: MainAxisSize.min, // Adapte la taille à son contenu
                children: [
                  const Text(
                    "Titre de la carte", // Titre affiché dans la carte
                    style: TextStyle(fontSize: 20), // Style du texte (taille 20)
                  ),
                  const SizedBox(height: 12), // Espace entre le texte et le bouton
                  ElevatedButton( // Bouton à l’intérieur de la carte
                    onPressed: () {}, // Action vide au clic
                    child: const Text("Clique ici"), // Texte du bouton
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


[Retour à la table de matière](#toc)

<br/>
<br/>
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
// Importation du package Flutter
import 'package:flutter/material.dart';

// Point d’entrée de l’application
void main() {
  runApp(const MonApp()); // Démarre l’application avec MonApp
}

// Déclaration du widget principal sans état
class MonApp extends StatelessWidget {
  const MonApp({super.key}); // Constructeur constant

  @override
  Widget build(BuildContext context) {
    // Définition d'une application Flutter avec Material Design
    return MaterialApp(
      home: Scaffold( // Structure de base de l’écran
        body: Padding( // Ajoute une marge intérieure autour du contenu
          padding: const EdgeInsets.all(24), // Padding global de 24 pixels
          child: Column( // Organisation verticale
            mainAxisAlignment: MainAxisAlignment.center, // Centre verticalement
            children: [
              const TextField( // Champ de texte pour le prénom
                decoration: InputDecoration(labelText: 'Prénom'), // Étiquette du champ
              ),
              const SizedBox(height: 16), // Espace vertical entre les champs
              const TextField( // Champ de texte pour le nom
                decoration: InputDecoration(labelText: 'Nom'), // Étiquette du champ
              ),
              const SizedBox(height: 24), // Espace avant le bouton
              ElevatedButton( // Bouton pour soumettre
                onPressed: () {}, // Action vide au clic
                child: const Text("Soumettre"), // Texte du bouton
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```


[Retour à la table de matière](#toc)

<br/>
<br/>
<br/>

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
// Importation du package Flutter
import 'package:flutter/material.dart';

// Fonction principale de l'application
void main() {
  runApp(const MonApp()); // Lance le widget principal MonApp
}

// Définition d’un widget stateless
class MonApp extends StatelessWidget {
  const MonApp({super.key}); // Constructeur constant

  @override
  Widget build(BuildContext context) {
    // Structure générale de l’application
    return MaterialApp(
      home: Scaffold( // Structure visuelle principale
        body: Padding( // Marge intérieure sur tout le corps
          padding: const EdgeInsets.all(24), // 24 pixels de padding
          child: Column( // Organisation verticale des champs et du bouton
            mainAxisAlignment: MainAxisAlignment.center, // Centre les éléments verticalement
            children: [
              const TextField( // Champ pour le courriel
                decoration: InputDecoration(labelText: 'Email'), // Étiquette du champ
                keyboardType: TextInputType.emailAddress, // Clavier adapté au courriel
              ),
              const SizedBox(height: 16), // Espace entre les champs
              const TextField( // Champ pour le mot de passe
                decoration: InputDecoration(labelText: 'Mot de passe'), // Étiquette du champ
                obscureText: true, // Masque le texte (mot de passe)
              ),
              const SizedBox(height: 24), // Espace avant le bouton
              ElevatedButton( // Bouton de connexion
                onPressed: () {}, // Action vide pour le moment
                child: const Text("Se connecter"), // Texte du bouton
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```


[Retour à la table de matière](#toc)

<br/>
<br/>
<br/>

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
// Importation de la bibliothèque Flutter
import 'package:flutter/material.dart';

// Point d’entrée principal
void main() {
  runApp(const MonApp()); // Lance le widget MonApp
}

// Widget principal sans état
class MonApp extends StatelessWidget {
  const MonApp({super.key}); // Constructeur constant

  @override
  Widget build(BuildContext context) {
    // Définition d'une application Flutter avec Material Design
    return MaterialApp(
      home: Scaffold( // Structure principale de l’écran
        body: Padding( // Marge autour du contenu
          padding: const EdgeInsets.all(24), // Padding de 24 pixels
          child: Column( // Organisation verticale
            mainAxisAlignment: MainAxisAlignment.center, // Centre les éléments verticalement
            children: [
              const TextField( // Champ pour le prénom
                decoration: InputDecoration(labelText: 'Prénom'),
              ),
              const SizedBox(height: 12), // Espace entre les champs
              const TextField( // Champ pour le nom
                decoration: InputDecoration(labelText: 'Nom'),
              ),
              const SizedBox(height: 12), // Espace entre les champs
              const TextField( // Champ pour la ville
                decoration: InputDecoration(labelText: 'Ville'),
              ),
              const SizedBox(height: 12), // Espace avant la liste déroulante
              DropdownButton<String>( // Liste déroulante
                value: 'Canada', // Valeur sélectionnée par défaut
                onChanged: null, // Dropdown désactivé (Stateless)
                items: const [ // Liste des options
                  DropdownMenuItem(value: 'Canada', child: Text('Canada')),
                  DropdownMenuItem(value: 'France', child: Text('France')),
                  DropdownMenuItem(value: 'Tunisie', child: Text('Tunisie')),
                ],
              ),
              const SizedBox(height: 20), // Espace avant le bouton
              ElevatedButton( // Bouton de validation
                onPressed: () {}, // Action vide
                child: const Text("Valider"), // Texte du bouton
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```


### Question:   Comment avoir un Dropdown menu actif ?

[Retour à la table de matière](#toc)

<br/>
<br/>
<br/>


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
// Importation du package Flutter
import 'package:flutter/material.dart';

// Point d’entrée de l’application
void main() {
  runApp(const MonApp()); // Démarre le widget principal
}

// Définition d’un widget stateless
class MonApp extends StatelessWidget {
  const MonApp({super.key}); // Constructeur constant

  @override
  Widget build(BuildContext context) {
    // Déclaration d’une application Material
    return MaterialApp(
      home: Scaffold( // Structure de base de l'écran
        body: Padding( // Marge intérieure autour du contenu
          padding: const EdgeInsets.all(24), // Padding global de 24 pixels
          child: Column( // Organisation verticale
            mainAxisAlignment: MainAxisAlignment.center, // Centre les éléments verticalement
            children: [
              Row( // Organisation horizontale du texte et de la case à cocher
                children: const [
                  Checkbox( // Case à cocher
                    value: false, // Non cochée
                    onChanged: null, // Désactivée (pas d’interaction)
                  ),
                  Text("Acceptez-vous les conditions ?"), // Texte à droite de la case
                ],
              ),
              const SizedBox(height: 20), // Espace vertical
              ElevatedButton( // Bouton pour continuer
                onPressed: () {}, // Action vide au clic
                child: const Text("Continuer"), // Texte du bouton
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```


[Retour à la table de matière](#toc)

<br/>
<br/>
<br/>


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
// Importation de la bibliothèque Flutter
import 'package:flutter/material.dart';

// Fonction principale – point d’entrée de l’application
void main() {
  runApp(const MonApp()); // Démarre l’application avec MonApp
}

// Déclaration du widget principal sans état
class MonApp extends StatelessWidget {
  const MonApp({super.key}); // Constructeur constant pour optimisation

  @override
  Widget build(BuildContext context) {
    // Application Flutter de type Material
    return MaterialApp(
      home: Scaffold( // Structure principale de l’écran
        body: SingleChildScrollView( // Permet le défilement si contenu trop grand
          padding: const EdgeInsets.all(24), // Marge intérieure autour du contenu
          child: Column( // Organisation verticale des champs
            crossAxisAlignment: CrossAxisAlignment.stretch, // Éléments prennent toute la largeur
            children: [
              const SizedBox(height: 40), // Espace initial en haut
              const Center( // Titre centré
                child: Text(
                  "Créer un compte", // Titre du formulaire
                  style: TextStyle(fontSize: 24), // Taille du texte
                ),
              ),
              const SizedBox(height: 30), // Espace après le titre
              const TextField( // Champ pour le nom complet
                decoration: InputDecoration(labelText: 'Nom complet'),
              ),
              const SizedBox(height: 16), // Espace vertical
              const TextField( // Champ pour l’email
                decoration: InputDecoration(labelText: 'Adresse courriel'),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              const TextField( // Champ pour le mot de passe
                decoration: InputDecoration(labelText: 'Mot de passe'),
                obscureText: true, // Texte masqué
              ),
              const SizedBox(height: 16),
              const TextField( // Champ pour confirmer le mot de passe
                decoration: InputDecoration(labelText: 'Confirmer le mot de passe'),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              Row( // Case à cocher + texte
                children: const [
                  Checkbox(value: false, onChanged: null), // Désactivée
                  Text("J'accepte les conditions"),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton( // Bouton de validation
                onPressed: () {}, // Action vide
                child: const Text("Créer un compte"),
              ),
              const SizedBox(height: 30), // Espace final
            ],
          ),
        ),
      ),
    );
  }
}
```





[Retour à la table de matière](#toc)

<br/>
<br/>
<br/>



### <h2 id="annexe-1">Annexe 1 – Utilisation de `super.key` dans les widgets Flutter</h2>

#### Description

Dans tous les widgets Flutter définis dans cette série d'exercices, vous trouverez la ligne suivante dans le constructeur :

```dart
const MonApp({super.key});
```

Cette syntaxe permet de transmettre la clé (`Key`) au constructeur de la classe parente (`StatelessWidget` ou `StatefulWidget`).

#### Objectif

La clé (`Key`) est utilisée par Flutter pour :

* Identifier de manière unique chaque widget dans l’arbre des widgets
* Optimiser les reconstructions d’interface (rebuild)
* Préserver l’état des widgets lorsqu’ils sont remplacés ou réordonnés

#### Syntaxe équivalente

L’instruction suivante :

```dart
const MonApp({super.key});
```

est équivalente à la version étendue :

```dart
const MonApp({Key? key}) : super(key: key);
```

La version abrégée est disponible depuis Dart 2.17.

#### Bonnes pratiques

* Même si un widget ne contient pas encore de logique d’état, il est recommandé d'inclure `super.key`.
* Cela garantit que le widget est correctement identifié et géré par Flutter, notamment dans des cas de navigation, d’animation, ou de listes dynamiques.


[Retour à la table de matière](#toc)

<br/>
<br/>
<br/>


### <h2 id="annexe-2">Annexe 2 – Comprendre l’utilisation de `SizedBox.shrink()`</h2>

#### Contexte

Dans l’Exercice 2, un bouton bleu est affiché **sans contenu textuel** :

```dart
child: const SizedBox.shrink(),
```

#### Fonctionnement

`sizedBox.shrink()` est un constructeur spécial qui crée un widget `SizedBox` **avec une largeur et une hauteur égales à zéro**.

```dart
SizedBox.shrink() // équivaut à SizedBox(width: 0, height: 0)
```

Ce widget **n’affiche rien du tout** mais reste structurellement valide dans l’interface.

#### Pourquoi l'utiliser ?

* Un `ElevatedButton` attend obligatoirement un `child`.
* Si aucun texte ou contenu ne doit apparaître dans le bouton, il faut quand même fournir un widget vide.
* `SizedBox.shrink()` est la **solution la plus légère et la plus idiomatique** pour cela.

#### Alternatives moins appropriées

| Alternative   | Problème potentiel                     |
| ------------- | -------------------------------------- |
| `Text('')`    | Peut occuper de l’espace vertical      |
| `Container()` | Plus coûteux en performances           |
| `null`        | Non autorisé (le paramètre est requis) |

#### En résumé

L'utilisation de `SizedBox.shrink()` est le moyen recommandé pour fournir un **contenu totalement vide et invisible**, tout en respectant les exigences de l’API Flutter.




[Retour à la table de matière](#toc)

<br/>
<br/>
<br/>



### <h2 id="annexe-3">Annexe 3 – Qu’est-ce qu’un `ElevatedButton` ?</h2>

#### Définition

Un `ElevatedButton` est un **bouton avec un relief (ombre)** intégré, utilisé pour signaler une **action principale** dans une interface Flutter. Il fait partie des widgets de base fournis par le framework Material Design.

#### Comportement

* Par défaut, il a un **fond coloré** (souvent bleu) et une **ombre portée**.
* Il réagit visuellement au survol (sur desktop), à l’appui, et à l’état désactivé.
* Il peut afficher un texte, une icône ou tout autre widget via son paramètre `child`.

#### Syntaxe minimale

```dart
ElevatedButton(
  onPressed: () {},
  child: Text("Clique ici"),
)
```

#### Paramètres importants

| Paramètre   | Description                                           |
| ----------- | ----------------------------------------------------- |
| `onPressed` | Fonction appelée lors du clic (si `null` → désactivé) |
| `child`     | Le contenu visuel du bouton (souvent un `Text`)       |
| `style`     | Permet de modifier l’apparence (couleur, forme...)    |

#### Bouton sans relief (pour comparaison)

Si vous voulez un **bouton sans relief**, vous pouvez utiliser par exemple :

```dart
TextButton(
  onPressed: () {},
  child: Text("Bouton plat"),
)
```

#### Comparaison des principaux types de boutons Flutter

| Widget           | Apparence par défaut         | Idéal pour...                        |
| ---------------- | ---------------------------- | ------------------------------------ |
| `ElevatedButton` | Fond coloré + ombre (relief) | Action principale                    |
| `TextButton`     | Texte sans fond ni ombre     | Actions secondaires ou discrètes     |
| `OutlinedButton` | Contour sans fond            | Actions alternatives ou neutres      |
| `IconButton`     | Icône seule, sans fond       | Barre d’actions ou icônes flottantes |

#### Exemple stylisé

```dart
ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.green,
    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
  child: Text("Valider"),
)
```





[Retour à la table de matière](#toc)

<br/>
<br/>
<br/>



### <h2 id="annexe-4">Annexe 4 – Notions fondamentales : `const`, `SizedBox`, `Column`, `Row`</h2>



#### 1. `const` – Déclaration constante

```dart
const Text("Bonjour");
```

##### Définition :

Le mot-clé `const` indique que le widget (ou la valeur) est **constante à la compilation**. Cela signifie que :

* Il ne changera jamais à l’exécution
* Flutter peut le **réutiliser en mémoire sans le recréer**
* Cela **améliore les performances**

##### Quand l’utiliser :

Utilisez `const` **dès que possible** pour tous les widgets immuables (qui ne dépendent d’aucune donnée dynamique).

##### Exemple :

```dart
const SizedBox(height: 20); // Bonne pratique
```

---

#### 2. `SizedBox` – Boîte avec dimension fixe

```dart
const SizedBox(height: 40)
```

##### Rôle :

Crée une **boîte vide** de taille déterminée. C’est le moyen standard en Flutter pour **ajouter de l’espace entre deux widgets**.

##### Paramètres :

* `height` : hauteur fixe
* `width` : largeur fixe

##### Utilisation typique :

Pour créer un espacement vertical ou horizontal entre deux éléments :

```dart
Column(
  children: [
    Text("Nom"),
    SizedBox(height: 16), // espace vertical
    Text("Prénom"),
  ],
)
```

##### Variante spéciale :

```dart
SizedBox.shrink(); // équivalent à SizedBox(width: 0, height: 0)
```

---

#### 3. `Column` – Organisation verticale

```dart
Column(
  children: [
    Text("Ligne 1"),
    Text("Ligne 2"),
  ],
)
```

##### Rôle :

Affiche les widgets **les uns sous les autres** (axe vertical).

##### Paramètres clés :

* `mainAxisAlignment` : aligne les enfants verticalement
* `crossAxisAlignment` : aligne les enfants horizontalement

##### Exemple :

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [ ... ],
)
```

---

#### 4. `Row` – Organisation horizontale

```dart
Row(
  children: [
    Text("Gauche"),
    Text("Droite"),
  ],
)
```

##### Rôle :

Affiche les widgets **les uns à côté des autres** (axe horizontal).

##### Paramètres clés :

* `mainAxisAlignment` : aligne les enfants horizontalement
* `crossAxisAlignment` : aligne les enfants verticalement

##### Exemple :

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [ ... ],
)
```

---

#### Résumé visuel :

| Widget     | Organisation | Axe principal   | Usage principal                   |
| ---------- | ------------ | --------------- | --------------------------------- |
| `Column`   | Verticale    | Haut ↕ Bas      | Empiler les widgets verticalement |
| `Row`      | Horizontale  | Gauche ↔ Droite | Aligner des widgets côte à côte   |
| `SizedBox` | Boîte vide   | Fixe            | Espacement entre widgets          |
| `const`    | Mot-clé Dart | Compilation     | Optimisation, performance         |




[Retour à la table de matière](#toc)

<br/>
<br/>
<br/>



### <h2 id="annexe-5">Annexe 5 – `TextField`, `obscureText`, `DropdownButton`</h2>

---

#### 1. `TextField` – Champ de saisie de texte

```dart
TextField(
  decoration: InputDecoration(labelText: 'Nom'),
)
```

##### Rôle :

Le widget `TextField` permet à l’utilisateur **de saisir du texte** dans une interface.

##### Principaux paramètres :

| Paramètre      | Rôle                                                     |
| -------------- | -------------------------------------------------------- |
| `decoration`   | Définit l’aspect visuel (ex : étiquette, icône, bordure) |
| `controller`   | Permet de récupérer ou modifier la valeur saisie         |
| `keyboardType` | Type de clavier affiché (email, nombre, etc.)            |
| `obscureText`  | Masque le texte saisi (voir ci-dessous)                  |
| `enabled`      | Active ou désactive le champ                             |

##### Exemple :

```dart
TextField(
  decoration: InputDecoration(labelText: 'Email'),
  keyboardType: TextInputType.emailAddress,
)
```

---

#### 2. `obscureText` – Masquer le texte (mot de passe)

```dart
TextField(
  decoration: InputDecoration(labelText: 'Mot de passe'),
  obscureText: true,
)
```

##### Rôle :

Ce paramètre est utilisé pour **masquer le contenu saisi** (remplacé par des points ou astérisques), comme pour les champs de mot de passe.

##### Valeurs possibles :

| Valeur               | Effet                            |
| -------------------- | -------------------------------- |
| `false` (par défaut) | Le texte est affiché normalement |
| `true`               | Le texte est masqué              |

##### Utilisation typique :

Recommandé pour tout champ contenant des informations sensibles.

---

#### 3. `DropdownButton` – Liste déroulante

```dart
DropdownButton<String>(
  value: 'France',
  onChanged: (value) {},
  items: [
    DropdownMenuItem(value: 'France', child: Text('France')),
    DropdownMenuItem(value: 'Canada', child: Text('Canada')),
  ],
)
```

##### Rôle :

Permet à l’utilisateur **de choisir une valeur parmi une liste de choix prédéfinis**.

##### Paramètres principaux :

| Paramètre      | Description                                               |
| -------------- | --------------------------------------------------------- |
| `value`        | Valeur actuellement sélectionnée                          |
| `items`        | Liste des options (`DropdownMenuItem`)                    |
| `onChanged`    | Fonction appelée lorsqu’un nouvel élément est sélectionné |
| `hint`         | Texte affiché lorsque rien n’est encore sélectionné       |
| `disabledHint` | Texte affiché si la sélection est désactivée              |

##### Variante désactivée (Stateless) :

```dart
DropdownButton<String>(
  value: 'Canada',
  onChanged: null, // désactivé
  items: [...],
)
```

---

#### Résumé des cas d’usage :

| Composant        | Utilisation principale                     |
| ---------------- | ------------------------------------------ |
| `TextField`      | Entrée de texte libre                      |
| `obscureText`    | Masquer le contenu du champ (mot de passe) |
| `DropdownButton` | Choix unique dans une liste fixe           |






[Retour à la table de matière](#toc)

<br/>
<br/>
<br/>





### <h2 id="annexe-6">Annexe 6 – `Scaffold`, `AppBar`, et `Navigator.push`</h2>



#### 1. `Scaffold` – Structure de base d’un écran Flutter

```dart
Scaffold(
  appBar: AppBar(title: Text("Titre")),
  body: Center(child: Text("Contenu")),
)
```

##### Rôle :

Le widget `Scaffold` fournit **la structure de base d’une page** Flutter conforme aux principes de Material Design. Il encapsule des éléments standards comme :

* La `AppBar` (barre du haut)
* Le `body` (contenu principal)
* Le `floatingActionButton` (bouton flottant)
* Les `Drawer`, `BottomNavigationBar`, `Snackbar`, etc.

##### Principaux paramètres :

| Paramètre              | Description                                         |
| ---------------------- | --------------------------------------------------- |
| `appBar`               | Barre supérieure (titre, actions, menu…)            |
| `body`                 | Zone centrale de la page                            |
| `floatingActionButton` | Bouton rond flottant (généralement en bas à droite) |
| `drawer`               | Menu latéral escamotable                            |
| `backgroundColor`      | Couleur de fond de l’écran                          |

##### Exemple complet :

```dart
Scaffold(
  appBar: AppBar(title: Text("Accueil")),
  body: Center(child: Text("Bienvenue")),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  ),
)
```

---

#### 2. `AppBar` – Barre d’application supérieure

```dart
AppBar(title: Text("Mon Application"))
```

##### Rôle :

La `AppBar` est une **barre horizontale située en haut de l’écran**, qui contient :

* Un titre
* Des actions (icônes, boutons)
* Éventuellement un menu (`Drawer`)
* Un retour automatique (flèche ←) lors de la navigation

##### Paramètres courants :

| Paramètre         | Description                                     |
| ----------------- | ----------------------------------------------- |
| `title`           | Widget affiché au centre (souvent `Text`)       |
| `actions`         | Liste d’icônes à droite de la barre             |
| `backgroundColor` | Couleur de fond                                 |
| `leading`         | Icône personnalisée à gauche (ex : bouton menu) |

##### Exemple avec actions :

```dart
AppBar(
  title: Text("Tableau de bord"),
  actions: [
    IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
    IconButton(onPressed: () {}, icon: Icon(Icons.logout)),
  ],
)
```

---

#### 3. `Navigator.push` – Navigation entre pages

##### Objectif :

Flutter utilise un système de **pile de navigation**.
Chaque fois que l’on appelle `Navigator.push`, on **empile une nouvelle page** sur l’écran courant.

##### Syntaxe de base :

```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => NouvellePage()),
);
```

##### Étapes :

1. Créer une nouvelle classe `StatelessWidget` ou `StatefulWidget` représentant la nouvelle page :

```dart
class NouvellePage extends StatelessWidget {
  const NouvellePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Deuxième page")),
      body: Center(child: Text("Contenu de la deuxième page")),
    );
  }
}
```

2. Naviguer vers cette page depuis un bouton :

```dart
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NouvellePage()),
    );
  },
  child: Text("Aller à la page suivante"),
)
```

##### Pour revenir à la page précédente :

```dart
Navigator.pop(context); // retire la page du haut de la pile
```

---

#### Résumé :

| Composant        | Rôle principal                                         |
| ---------------- | ------------------------------------------------------ |
| `Scaffold`       | Structure d’un écran (appbar, corps, boutons, menus…)  |
| `AppBar`         | Barre d’en-tête avec titre et actions                  |
| `Navigator.push` | Affiche une nouvelle page au-dessus de l’actuelle      |
| `Navigator.pop`  | Revient à la page précédente (retire la page courante) |




[Retour à la table de matière](#toc)

<br/>
<br/>
<br/>


### <h2 id="annexe-7">Annexe 7 – Icônes (`Icon`, `Icons`) et bouton flottant (`FloatingActionButton`)</h2>



#### 1. `Icon` – Widget pour afficher une icône

```dart
Icon(Icons.home)
```

##### Rôle :

Le widget `Icon` permet d’afficher une icône vectorielle prédéfinie dans l’interface Flutter.

##### Paramètres importants :

| Paramètre       | Description                                             |
| --------------- | ------------------------------------------------------- |
| `Icons.<nom>`   | Icône à afficher (provenant de la bibliothèque `Icons`) |
| `size`          | Taille de l’icône en pixels (ex. `size: 32`)            |
| `color`         | Couleur de l’icône                                      |
| `semanticLabel` | Étiquette d’accessibilité (lecteur d’écran)             |

##### Exemple :

```dart
Icon(
  Icons.email,
  size: 30,
  color: Colors.blue,
)
```

---

#### 2. `Icons` – Bibliothèque d’icônes prédéfinies

Le package `Icons` contient des **centaines d’icônes Material Design** prêtes à l’emploi.

##### Exemples fréquents :

```dart
Icons.add             // +
Icons.delete          // Poubelle
Icons.arrow_back      // ←
Icons.favorite        // Cœur
Icons.settings        // Roue dentée
Icons.search          // Loupe
Icons.check_circle    // Cercle avec coche
```

##### Utilisation :

Toujours combiné avec `Icon` ou un `IconButton`.

---

#### 3. `FloatingActionButton` – Bouton flottant rond

```dart
FloatingActionButton(
  onPressed: () {},
  child: Icon(Icons.add),
)
```

##### Rôle :

Affiche un **bouton rond flottant** en surimpression de la page, généralement situé en bas à droite de l’écran. Il sert à **déclencher une action principale** (ex : ajouter un élément, créer un contact, ouvrir un formulaire).

##### Paramètres essentiels :

| Paramètre         | Description                                          |
| ----------------- | ---------------------------------------------------- |
| `onPressed`       | Fonction appelée lorsqu'on appuie sur le bouton      |
| `child`           | Contenu du bouton (souvent une `Icon`)               |
| `tooltip`         | Infobulle affichée au survol (desktop/web)           |
| `backgroundColor` | Couleur du fond du bouton                            |
| `heroTag`         | Identifiant unique pour les animations de transition |

##### Exemple complet :

```dart
Scaffold(
  floatingActionButton: FloatingActionButton(
    onPressed: () {
      print("Ajout demandé");
    },
    child: Icon(Icons.add),
    tooltip: "Ajouter",
  ),
)
```

---

#### Résumé :

| Composant              | Rôle                                        |
| ---------------------- | ------------------------------------------- |
| `Icon`                 | Affiche une icône à l’écran                 |
| `Icons.<nom>`          | Bibliothèque d’icônes prédéfinies           |
| `FloatingActionButton` | Bouton rond flottant pour action principale |


[Retour à la table de matière](#toc)

<br/>
<br/>
<br/>







# Annexe 8 -  Version corrigée avec Dropdown actif

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
        body: const Padding(
          padding: EdgeInsets.all(24),
          child: MonFormulaire(),
        ),
      ),
    );
  }
}

// Widget avec état
class MonFormulaire extends StatefulWidget {
  const MonFormulaire({super.key});

  @override
  State<MonFormulaire> createState() => _MonFormulaireState();
}

class _MonFormulaireState extends State<MonFormulaire> {
  String paysSelectionne = 'Canada'; // Valeur par défaut

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TextField(
          decoration: InputDecoration(labelText: 'Prénom'),
        ),
        const SizedBox(height: 12),
        const TextField(
          decoration: InputDecoration(labelText: 'Nom'),
        ),
        const SizedBox(height: 12),
        const TextField(
          decoration: InputDecoration(labelText: 'Ville'),
        ),
        const SizedBox(height: 12),
        DropdownButton<String>(
          value: paysSelectionne,
          onChanged: (String? nouvelleValeur) {
            setState(() {
              paysSelectionne = nouvelleValeur!;
            });
          },
          items: const [
            DropdownMenuItem(value: 'Canada', child: Text('Canada')),
            DropdownMenuItem(value: 'France', child: Text('France')),
            DropdownMenuItem(value: 'Tunisie', child: Text('Tunisie')),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Par exemple, afficher le pays choisi
            print('Pays sélectionné : $paysSelectionne');
          },
          child: const Text("Valider"),
        ),
      ],
    );
  }
}
```



### Explication 

* **Pourquoi `StatefulWidget` ?**

  * Car `DropdownButton` a besoin d’un état pour gérer la sélection dynamique.

* **Pourquoi `setState()` ?**

  * Pour mettre à jour la variable `paysSelectionne` et redessiner l’interface avec la nouvelle valeur.

* **Pourquoi extraire le formulaire dans `MonFormulaire` ?**

  * Pour isoler la gestion de l’état du formulaire dans une classe dédiée, proprement.


