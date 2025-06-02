# Liste des exercices – Partie 2 : États fondamentaux


<h1 id="liste-exercices">Liste des exercices – Partie 2 : États fondamentaux</h1>
<ol>
  <li><a href="#ex1">Exercice 1 – Afficher un compteur statique</a></li>
  <li><a href="#ex2">Exercice 2 – Créer un bouton sans action</a></li>
  <li><a href="#ex3">Exercice 3 – Créer un bouton qui change le texte</a></li>
  <li><a href="#ex4">Exercice 4 – Incrémenter un compteur</a></li>
  <li><a href="#ex5">Exercice 5 – Bouton Réinitialiser</a></li>
  <li><a href="#ex6">Exercice 6 – Afficher “Bonjour” ou “Bonsoir”</a></li>
  <li><a href="#ex7">Exercice 7 – Afficher une couleur différente</a></li>
  <li><a href="#ex8">Exercice 8 – Case à cocher simple</a></li>
  <li><a href="#ex9">Exercice 9 – Affichage conditionnel</a></li>
  <li><a href="#ex10">Exercice 10 – Sélecteur avec `DropdownButton`</a></li>
</ol>

<h1 id="corrections">Corrections des exercices</h1>
<ol>
  <li><a href="#c-ex1">Correction Exercice 1</a></li>
  <li><a href="#c-ex2">Correction Exercice 2</a></li>
  <li><a href="#c-ex3">Correction Exercice 3</a></li>
  <li><a href="#c-ex4">Correction Exercice 4</a></li>
  <li><a href="#c-ex5">Correction Exercice 5</a></li>
  <li><a href="#c-ex6">Correction Exercice 6</a></li>
  <li><a href="#c-ex7">Correction Exercice 7</a></li>
  <li><a href="#c-ex8">Correction Exercice 8</a></li>
  <li><a href="#c-ex9">Correction Exercice 9</a></li>
  <li><a href="#c-ex10">Correction Exercice 10</a></li>
</ol>

<a href="#liste-exercices">Retour à la liste des exercices</a>

<br/>




### <h2 id="ex1">🟢 Exercice 1 – Afficher un compteur statique</h2>

> Objectif : comprendre `Text()` dans un widget sans état.

* Afficher simplement le texte : `Compteur : 0` (rien ne change).



<a href="#liste-exercices">Retour à la liste des exercices</a>

<br/>
<br/>




### <h2 id="ex2">🟢 Exercice 2 – Créer un bouton sans action</h2>

> Objectif : découvrir `ElevatedButton` et `StatelessWidget`.

* Afficher un bouton `"Clique ici"` qui ne fait rien.
* Pas d'état, pas de `setState()`.


<a href="#liste-exercices">Retour à la liste des exercices</a>

<br/>
<br/>




### <h2 id="ex3">🟢 Exercice 3 – Créer un bouton qui change le texte</h2>

> Objectif : introduire `StatefulWidget` et `setState()`.

* Au clic, le bouton affiche `"Merci !"`.
* Le texte ne revient pas en arrière.

<a href="#liste-exercices">Retour à la liste des exercices</a>

<br/>
<br/>




### <h2 id="ex4">🟢 Exercice 4 – Incrémenter un compteur</h2>

> Objectif : découvrir une **variable entière** dans l’état.

* Afficher `Compteur : 0` puis `Compteur : 1`, `2`, `3` à chaque clic.


<a href="#liste-exercices">Retour à la liste des exercices</a>

<br/>
<br/>



### <h2 id="ex5">🟢 Exercice 5 – Bouton Réinitialiser</h2>

> Objectif : gérer **plusieurs actions avec `setState()`**.

* Bouton 1 : Incrémenter le compteur.
* Bouton 2 : Réinitialiser à zéro.


<a href="#liste-exercices">Retour à la liste des exercices</a>

<br/>
<br/>


### <h2 id="ex6">🟢 Exercice 6 – Afficher “Bonjour” ou “Bonsoir”</h2>

> Objectif : changer **un texte affiché** via un bouton.

* Texte affiché : `"Bonjour"` (par défaut)
* Bouton : `"Changer"` → passe à `"Bonsoir"` puis alterne.

<a href="#liste-exercices">Retour à la liste des exercices</a>

<br/>
<br/>



### <h2 id="ex7">🟢 Exercice 7 – Afficher une couleur différente</h2>

> Objectif : utiliser `Container` avec `setState()`.

* Un carré coloré (bleu).
* Bouton : `"Changer la couleur"` → passe au rouge, puis bleu, etc.

<a href="#liste-exercices">Retour à la liste des exercices</a>

<br/>
<br/>




### <h2 id="ex8">🟢 Exercice 8 – Case à cocher simple</h2>

> Objectif : découvrir `Checkbox` avec `setState()`.

* Afficher une case cochable : `"J'accepte les conditions"`.
* Elle change dynamiquement quand on clique.

<a href="#liste-exercices">Retour à la liste des exercices</a>

<br/>
<br/>



### <h2 id="ex9">🟢 Exercice 9 – Affichage conditionnel</h2>

> Objectif : introduire une **condition d’affichage**.

* Bouton : `"Afficher le message"`
* Si cliqué : afficher `"Bienvenue"`
* Sinon : rien.

<a href="#liste-exercices">Retour à la liste des exercices</a>

<br/>
<br/>



### <h2 id="ex10">🟢 Exercice 10 – Sélecteur avec `DropdownButton`</h2>

> Objectif : introduire un `DropdownButton` contrôlé par `setState()`.

* Liste déroulante : `"Rouge"`, `"Vert"`, `"Bleu"`.
* Afficher la couleur choisie sous forme de texte.

<a href="#liste-exercices">Retour à la liste des exercices</a

<br/>
<br/>

>



# Correction


## <h2 id="c-ex1">🟢 Exercice 1 – Afficher un compteur statique</h2>

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
            'Compteur : 0', // Texte fixe, aucun état
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
```

<a href="#liste-exercices">Retour à la liste des exercices</a>

<br/>
<br/>



## <h2 id="c-ex2">🟢 Exercice 2 – Créer un bouton sans action</h2>

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
            onPressed: () {}, // Aucune action
            child: Text('Clique ici'),
          ),
        ),
      ),
    );
  }
}
```

<a href="#liste-exercices">Retour à la liste des exercices</a>

<br/>
<br/>



## <h2 id="c-ex3">🟢 Exercice 3 – Bouton qui change le texte</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChangerTexte(),
    );
  }
}

class ChangerTexte extends StatefulWidget {
  const ChangerTexte({super.key});

  @override
  State<ChangerTexte> createState() => _ChangerTexteState();
}

class _ChangerTexteState extends State<ChangerTexte> {
  String texte = 'Clique ici';

  void changerTexte() {
    setState(() {
      texte = 'Merci !';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: changerTexte,
          child: Text(texte),
        ),
      ),
    );
  }
}
```

<a href="#liste-exercices">Retour à la liste des exercices</a>

<br/>
<br/>



## <h2 id="c-ex4">🟢 Exercice 4 – Incrémenter un compteur</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CompteurPage(),
    );
  }
}

class CompteurPage extends StatefulWidget {
  const CompteurPage({super.key});

  @override
  State<CompteurPage> createState() => _CompteurPageState();
}

class _CompteurPageState extends State<CompteurPage> {
  int compteur = 0;

  void incrementer() {
    setState(() {
      compteur++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: incrementer,
          child: Text('Compteur : $compteur'),
        ),
      ),
    );
  }
}
```

<a href="#liste-exercices">Retour à la liste des exercices</a>

<br/>
<br/>



## <h2 id="c-ex5">🟢 Exercice 5 – Bouton Réinitialiser</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CompteurResetPage(),
    );
  }
}

class CompteurResetPage extends StatefulWidget {
  const CompteurResetPage({super.key});

  @override
  State<CompteurResetPage> createState() => _CompteurResetPageState();
}

class _CompteurResetPageState extends State<CompteurResetPage> {
  int compteur = 0;

  void incrementer() {
    setState(() {
      compteur++;
    });
  }

  void reinitialiser() {
    setState(() {
      compteur = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Compteur + Réinitialisation")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Compteur : $compteur', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: incrementer,
              child: const Text('Incrémenter'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: reinitialiser,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Réinitialiser'),
            ),
          ],
        ),
      ),
    );
  }
}
```

<a href="#liste-exercices">Retour à la liste des exercices</a>

<br/>
<br/>




## <h2 id="c-ex6">🟢 Exercice 6 – Afficher “Bonjour” ou “Bonsoir”</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BonjourBonsoir(),
    );
  }
}

class BonjourBonsoir extends StatefulWidget {
  const BonjourBonsoir({super.key});

  @override
  State<BonjourBonsoir> createState() => _BonjourBonsoirState();
}

class _BonjourBonsoirState extends State<BonjourBonsoir> {
  String texte = 'Bonjour';

  void changer() {
    setState(() {
      texte = (texte == 'Bonjour') ? 'Bonsoir' : 'Bonjour';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(texte, style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: changer,
              child: const Text('Changer'),
            ),
          ],
        ),
      ),
    );
  }
}
```

<a href="#liste-exercices">Retour à la liste des exercices</a>

<br/>
<br/>



## <h2 id="c-ex7">🟢 Exercice 7 – Afficher une couleur différente</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChangerCouleur(),
    );
  }
}

class ChangerCouleur extends StatefulWidget {
  const ChangerCouleur({super.key});

  @override
  State<ChangerCouleur> createState() => _ChangerCouleurState();
}

class _ChangerCouleurState extends State<ChangerCouleur> {
  bool estBleu = true;

  void changer() {
    setState(() {
      estBleu = !estBleu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Changer de couleur")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              color: estBleu ? Colors.blue : Colors.red,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: changer,
              child: const Text('Changer la couleur'),
            ),
          ],
        ),
      ),
    );
  }
}
```

<a href="#liste-exercices">Retour à la liste des exercices</a>

<br/>
<br/>



## <h2 id="c-ex8">🟢 Exercice 8 – Case à cocher simple</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CaseCochee(),
    );
  }
}

class CaseCochee extends StatefulWidget {
  const CaseCochee({super.key});

  @override
  State<CaseCochee> createState() => _CaseCocheeState();
}

class _CaseCocheeState extends State<CaseCochee> {
  bool accepte = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkbox simple')),
      body: Center(
        child: CheckboxListTile(
          title: const Text("J'accepte les conditions"),
          value: accepte,
          onChanged: (valeur) {
            setState(() {
              accepte = valeur!;
            });
          },
        ),
      ),
    );
  }
}
```

<a href="#liste-exercices">Retour à la liste des exercices</a>

<br/>
<br/>



## <h2 id="c-ex9">🟢 Exercice 9 – Affichage conditionnel</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MessageConditionnel(),
    );
  }
}

class MessageConditionnel extends StatefulWidget {
  const MessageConditionnel({super.key});

  @override
  State<MessageConditionnel> createState() => _MessageConditionnelState();
}

class _MessageConditionnelState extends State<MessageConditionnel> {
  bool afficher = false;

  void afficherMessage() {
    setState(() {
      afficher = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Affichage conditionnel")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (afficher)
              const Text("Bienvenue !", style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: afficherMessage,
              child: const Text("Afficher le message"),
            ),
          ],
        ),
      ),
    );
  }
}
```

<a href="#liste-exercices">Retour à la liste des exercices</a>

<br/>
<br/>



## <h2 id="c-ex10">🟢 Exercice 10 – Menu déroulant (Dropdown)</h2>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChoisirCouleur(),
    );
  }
}

class ChoisirCouleur extends StatefulWidget {
  const ChoisirCouleur({super.key});

  @override
  State<ChoisirCouleur> createState() => _ChoisirCouleurState();
}

class _ChoisirCouleurState extends State<ChoisirCouleur> {
  String? selection = 'Rouge';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dropdown simple")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: selection,
              items: ['Rouge', 'Vert', 'Bleu']
                  .map((couleur) => DropdownMenuItem(
                        value: couleur,
                        child: Text(couleur),
                      ))
                  .toList(),
              onChanged: (valeur) {
                setState(() {
                  selection = valeur;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Vous avez choisi : $selection',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
```

<a href="#liste-exercices">Retour à la liste des exercices</a>

<br/>
<br/>







