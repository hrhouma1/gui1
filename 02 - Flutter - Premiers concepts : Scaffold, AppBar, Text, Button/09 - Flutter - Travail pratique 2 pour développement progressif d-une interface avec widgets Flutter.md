

# **Série d’Exercices Progressifs Flutter**

<h1 id="table-des-matieres">Table des matières</h1>
<ul>
  <li><a href="#exercice-1">Exercice 1 – Affichage simple (Text)</a></li>
  <li><a href="#exercice-2">Exercice 2 – Bouton pour quitter (Navigator.pop)</a></li>
  <li><a href="#exercice-3">Exercice 3 – Champ de saisie (TextField) et affichage</a></li>
  <li><a href="#exercice-4">Exercice 4 – Mise en page simple avec plusieurs champs</a></li>
  <li><a href="#exercice-5">Exercice 5 – Boutons radio (Radio)</a></li>
  <li><a href="#exercice-6">Exercice 6 – Cases à cocher (Checkbox)</a></li>
  <li><a href="#exercice-7">Exercice 7 – Liste déroulante (DropdownButton)</a></li>
  <li><a href="#exercice-8">Exercice 8 – Menu de sélection (PopupMenuButton)</a></li>
  <li><a href="#exercice-9">Exercice 9 – Mise en page avec Row et Column</a></li>
  <li><a href="#exercice-10">Exercice 10 – Détection clavier</a></li>
  <li><a href="#exercice-11">Exercice 11 – Détection des gestes (toucher, glisser)</a></li>
  <li><a href="#exercice-12">Exercice 12 – Mini-projet 1 : Formulaire Complet</a></li>
  <li><a href="#exercice-13">Exercice 13 – Mini-projet 2 : Saisie et calcul simple</a></li>
  <li><a href="#exercice-14">Exercice 14 – Mini-projet 3 : Changement dynamique de couleur</a></li>
  <li><a href="#exercice-15">Exercice 15 – Projet Final : Application Panier d’Achat</a></li>
</ul>

<h1 id="table-des-matieres-des">Table des matières des corrections</h1>
<ul>
  <li><a href="#correction-exercice-1">Correction Exercice 1 – Affichage simple (Text)</a></li>
  <li><a href="#correction-exercice-2">Correction Exercice 2 – Bouton pour quitter (Navigator.pop)</a></li>
  <li><a href="#correction-exercice-3">Correction Exercice 3 – Champ de saisie (TextField) et affichage</a></li>
  <li><a href="#correction-exercice-4">Correction Exercice 4 – Mise en page simple avec plusieurs champs</a></li>
  <li><a href="#correction-exercice-5">Correction Exercice 5 – Boutons radio (Radio)</a></li>
  <li><a href="#correction-exercice-6">Correction Exercice 6 – Cases à cocher (Checkbox)</a></li>
  <li><a href="#correction-exercice-7">Correction Exercice 7 – Liste déroulante (DropdownButton)</a></li>
  <li><a href="#correction-exercice-8">Correction Exercice 8 – Menu de sélection (PopupMenuButton)</a></li>
  <li><a href="#correction-exercice-9">Correction Exercice 9 – Mise en page avec Row et Column</a></li>
  <li><a href="#correction-exercice-10">Correction Exercice 10 – Détection clavier</a></li>
  <li><a href="#correction-exercice-11">Correction Exercice 11 – Détection des gestes (toucher, glisser)</a></li>
  <li><a href="#correction-exercice-12">Correction Exercice 12 – Mini-projet 1 : Formulaire Complet</a></li>
  <li><a href="#correction-exercice-13">Correction Exercice 13 – Mini-projet 2 : Saisie et calcul simple</a></li>
  <li><a href="#correction-exercice-14">Correction Exercice 14 – Mini-projet 3 : Changement dynamique de couleur</a></li>
  <li><a href="#correction-exercice-15">Correction Exercice 15 – Projet Final : Application Panier d’Achat</a></li>
</ul>

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>



<h1 id="exercice-1">Exercice 1 – Affichage simple (Text)</h1>

**Objectif** : Créer une application Flutter affichant un simple texte centré.

* Afficher le message : **"Bienvenue dans Flutter !"**
* Le texte doit être centré à l’écran.
* Utiliser une police avec une taille de 24.

**Instructions** :
– Utilisez un `Text` widget
– Centrez le texte avec `Center`
– Utilisez `TextStyle(fontSize: 24)`

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>











<h1 id="exercice-2">Exercice 2 – Bouton pour quitter (Navigator.pop)</h1>

**Objectif** : Ajouter un bouton qui permet de **quitter l’écran courant** et revenir en arrière.

* Créer une interface avec un bouton intitulé **"Retour"**
* Lorsque l’on clique sur le bouton, l’écran est fermé (retour à l’écran précédent)
* Le bouton doit être centré et visible

**Instructions** :
– Utilisez un `ElevatedButton`
– Utilisez `Navigator.pop(context)` dans l’action du bouton
– Centrez le bouton avec un `Center` ou `Column + MainAxisAlignment.center`

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>




<h1 id="exercice-3">Exercice 3 – Champ de saisie (TextField) et affichage</h1>

**Objectif** : Lire une saisie utilisateur et l’afficher dans la console.

* Créer un champ de saisie (`TextField`) centré dans la page
* Ajouter un bouton **"Valider"**
* Lorsque l’utilisateur clique sur **Valider**, le texte saisi est affiché dans la console (avec `print()`)

**Instructions** :
– Utilisez un `TextEditingController` pour récupérer le contenu du champ
– Ajoutez un `TextField`, un `ElevatedButton` et une logique simple dans l’action du bouton
– Structurez l’interface avec une `Column` centrée dans un `Center`

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>





<h1 id="exercice-4">Exercice 4 – Mise en page simple avec plusieurs champs</h1>

**Objectif** : Afficher plusieurs champs d'information dans une mise en page verticale.

* Ajouter trois étiquettes suivies de champs de saisie :

  * **"Nom :"**
  * **"Prénom :"**
  * **"Âge :"**
* Utiliser une structure propre avec des `Padding` et une `Column`
* Ajouter un bouton **"Envoyer"** qui affiche toutes les saisies dans la console

**Instructions** :
– Utilisez trois `TextField` contrôlés par des `TextEditingController`
– Organisez les éléments avec des widgets `Column` et `SizedBox` pour l'espacement
– Affichez les résultats avec `print()` dans l'action du bouton

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>




<h1 id="exercice-5">Exercice 5 – Boutons radio (Radio)</h1>

**Objectif** : Choisir une option unique parmi plusieurs propositions.

* Afficher la question : **"Quel est votre genre ?"**
* Proposer trois options avec des boutons radio :

  * Homme
  * Femme
  * Autre
* Ajouter un bouton **"Valider"**
* Afficher dans la console l’option sélectionnée après validation

**Instructions** :
– Utilisez le widget `RadioListTile` pour associer un libellé et une valeur
– Utilisez une variable de type `String?` pour stocker la sélection
– Gérez la sélection avec `setState()` dans le `onChanged`
– Affichez le résultat avec `print()` dans le `onPressed` du bouton

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>




<h1 id="exercice-6">Exercice 6 – Cases à cocher (Checkbox)</h1>

**Objectif** : Permettre à l’utilisateur de cocher plusieurs options indépendantes.

* Afficher la consigne : **"Quels langages connaissez-vous ?"**
* Proposer trois options avec des cases à cocher :

  * Python
  * JavaScript
  * Dart
* Ajouter un bouton **"Afficher"**
* Lorsqu’on clique, afficher dans la console la liste des langages sélectionnés

**Instructions** :
– Utilisez un widget `CheckboxListTile` par case
– Utilisez une variable booléenne pour chaque case (`bool`)
– Mettez à jour chaque case avec `setState()` dans le `onChanged`
– Dans le `onPressed` du bouton, utilisez `print()` pour afficher les choix sélectionnés

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>





<h1 id="exercice-7">Exercice 7 – Liste déroulante (DropdownButton)</h1>

**Objectif** : Sélectionner une seule option à partir d’une liste déroulante.

* Afficher un texte **"Choisissez votre fruit préféré :"**
* Proposer une liste déroulante contenant :

  * Pomme
  * Banane
  * Cerise
  * Orange
* Lorsqu’un fruit est sélectionné, afficher son nom sous la liste

**Instructions** :
– Utilisez un `DropdownButton<String>`
– Créez une variable `selectedFruit` de type `String?`
– Dans `onChanged`, utilisez `setState()` pour mettre à jour la sélection
– Utilisez un `Text()` pour afficher la valeur sélectionnée

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>



<h1 id="exercice-8">Exercice 8 – Menu de sélection (PopupMenuButton)</h1>

**Objectif** : Sélectionner une option à partir d’un menu contextuel.

* Ajouter un bouton avec l’icône `more_vert`
* Lorsqu’on clique dessus, afficher un menu contenant :

  * Paramètres
  * Profil
  * Déconnexion
* Afficher dans la console l’option sélectionnée

**Instructions** :
– Utilisez `PopupMenuButton<String>`
– Définissez les valeurs avec `PopupMenuItem(value: ..., child: Text(...))`
– Gérez l’action avec `onSelected` et `print(...)`

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>



<h1 id="exercice-9">Exercice 9 – Mise en page avec Row et Column</h1>

**Objectif** : Disposer les éléments horizontalement et verticalement.

* Créer un formulaire simple avec deux lignes :

  * Ligne 1 : Label **"Nom :"** + champ de texte
  * Ligne 2 : Label **"Âge :"** + champ de texte
* Ajouter un bouton centré en dessous

**Instructions** :
– Utilisez `Row()` pour chaque ligne
– Placez les lignes dans une `Column()`
– Ajoutez de l’espacement avec `SizedBox(height: ...)` ou `Padding`
– Centrez le bouton avec `Center(child: ElevatedButton(...))`

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>



<h1 id="exercice-10">Exercice 10 – Détection clavier</h1>

**Objectif** : Afficher dans la console la touche tapée au clavier.

* Créer une zone de saisie
* Lorsqu’on tape, afficher chaque caractère saisi dans la console

**Instructions** :
– Utilisez un `TextField` avec l’événement `onChanged`
– Dans le callback, utilisez `print(...)` pour chaque mise à jour
– Affichez `key` ou `value` selon la méthode choisie

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>



<h1 id="exercice-11">Exercice 11 – Détection des gestes (toucher, glisser)</h1>

**Objectif** : Réagir aux interactions tactiles.

* Créer un carré coloré
* Lorsque l’utilisateur :

  * Appuie sur le carré → afficher "Appui détecté"
  * Glisse dessus → afficher "Glissement détecté"

**Instructions** :
– Entourez le carré avec `GestureDetector`
– Utilisez `onTap` et `onPanUpdate`
– Affichez des messages dans la console (`print()`)

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>



<h1 id="exercice-12">Exercice 12 – Mini-projet 1 : Formulaire Complet</h1>

**Objectif** : Créer un formulaire combinant plusieurs widgets.

* Nom, Prénom (TextField)
* Genre (Radio : Homme, Femme, Autre)
* Langages connus (Checkbox : Python, Dart, JavaScript)
* Bouton **"Envoyer"**
* Afficher toutes les informations saisies dans la console

**Instructions** :
– Utilisez `TextEditingController` pour les champs
– Stockez les choix dans des variables
– Regroupez les éléments avec `Column()`
– Utilisez `setState()` pour actualiser les sélections
– Le bouton "Envoyer" affiche toutes les données avec `print()`

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>



<h1 id="exercice-13">Exercice 13 – Mini-projet 2 : Saisie et calcul simple</h1>

**Objectif** : Effectuer une addition à partir de deux entrées utilisateur.

* Deux champs `TextField` pour entrer des nombres
* Un bouton **"Additionner"**
* Afficher la somme dans un `Text()`

**Instructions** :
– Utilisez deux `TextEditingController`
– Convertissez les valeurs avec `int.tryParse(...)`
– Calculez la somme et affichez-la avec `setState()`
– Gérer les erreurs de saisie (texte non numérique)

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>



<h1 id="exercice-14">Exercice 14 – Mini-projet 3 : Changement dynamique de couleur</h1>

**Objectif** : Modifier la couleur d’un conteneur selon le choix de l’utilisateur.

* Créer un `DropdownButton` contenant des couleurs :

  * Bleu
  * Vert
  * Jaune
  * Rouge
* Un carré qui change de couleur selon la sélection

**Instructions** :
– Définir un `Map<String, Color>` pour associer texte et couleur
– Utiliser `setState()` pour appliquer le changement
– Affichez la couleur choisie sous forme de nom (`Text()`) et visuellement (`Container()`)

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>



<h1 id="exercice-15">Exercice 15 – Projet Final : Application Panier d’Achat</h1>

**Objectif** : Créer une interface de type panier avec calcul dynamique.

* Liste déroulante de produits :

  * Pain : 2.5
  * Lait : 1.8
  * Oeufs : 3.2
* Champ de quantité
* Bouton **"Ajouter au panier"**
* Liste des articles sélectionnés + total
* Bouton **"Payer"** → Afficher confirmation

**Instructions** :
– Utilisez une `DropdownButton` pour les produits
– Associez un prix à chaque produit (Map)
– Affichez chaque ajout dans une `ListView.builder` ou `Column`
– Calculez et affichez le total
– Le bouton **"Payer"** affiche les détails dans la console

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>









<h1 id="correction-exercice-1">Correction Exercice 1 – Affichage simple (Text)</h1>

### Correction

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
      title: 'Exercice 1',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Exercice 1'),
        ),
        body: const Center(
          child: Text(
            'Bienvenue dans Flutter !',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
```

### Ce qu’on a ajouté dans cet exercice :

1. Une structure de base `MaterialApp` et `Scaffold`.
2. Un `Text` centré au milieu de l’écran.
3. Un style appliqué avec `TextStyle(fontSize: 24)` pour une taille lisible.

### Énoncé de l’exercice :

Créer une application Flutter simple affichant un texte **"Bienvenue dans Flutter !"** centré à l’écran.
Utiliser une taille de police suffisante pour rendre le message visible (par exemple 24).

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>





<h1 id="correction-exercice-2">Correction Exercice 2 – Bouton pour quitter (Navigator.pop)</h1>

### Correction

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
      title: 'Exercice 2',
      home: const PremierePage(),
    );
  }
}

class PremierePage extends StatelessWidget {
  const PremierePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Première Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Aller à la page suivante'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondePage()),
            );
          },
        ),
      ),
    );
  }
}

class SecondePage extends StatelessWidget {
  const SecondePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seconde Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Quitter (Retour)'),
        ),
      ),
    );
  }
}
```

### Ce qu’on a ajouté dans cet exercice :

1. Deux pages (`PremierePage` et `SecondePage`) pour démontrer la navigation.
2. Un bouton sur la première page pour **naviguer** vers une seconde page.
3. Un bouton sur la seconde page qui **quitte cette page** en utilisant `Navigator.pop(context)`.
4. Utilisation de `MaterialPageRoute` pour la transition.

### Énoncé de l’exercice :

Créer une application avec **deux écrans** :

* Le premier affiche un bouton **"Aller à la page suivante"**.
* Le second affiche un bouton **"Quitter (Retour)"** qui ramène à l’écran précédent en utilisant `Navigator.pop`.

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>



<h1 id="correction-exercice-3">Correction Exercice 3 – Champ de saisie (TextField) et affichage</h1>

### Correction

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
      title: 'Exercice 3',
      home: const ChampSaisiePage(),
    );
  }
}

class ChampSaisiePage extends StatefulWidget {
  const ChampSaisiePage({super.key});

  @override
  State<ChampSaisiePage> createState() => _ChampSaisiePageState();
}

class _ChampSaisiePageState extends State<ChampSaisiePage> {
  final TextEditingController _controller = TextEditingController();
  String _message = '';

  void _afficherTexte() {
    setState(() {
      _message = _controller.text;
    });
    print('Texte saisi : $_message');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saisie utilisateur')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Entrez un texte :',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Votre texte ici',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _afficherTexte,
              child: const Text('Valider'),
            ),
            const SizedBox(height: 20),
            Text(
              _message.isNotEmpty ? 'Vous avez saisi : $_message' : '',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Ce qu’on a ajouté dans cet exercice :

1. Un champ de texte (`TextField`) avec un contrôleur (`TextEditingController`).
2. Un bouton "Valider" qui déclenche la lecture du texte saisi.
3. L’affichage dynamique du contenu saisi sous le bouton.
4. Un affichage également dans la console avec `print()`.

### Énoncé de l’exercice :

Créer une interface contenant :

* Un champ de saisie (`TextField`)
* Un bouton "Valider"
* Lorsque l’utilisateur clique sur le bouton, le texte saisi doit être affiché **dans la console** et **dans un message visible à l’écran**.

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>







<h1 id="correction-exercice-4">Correction Exercice 4 – Mise en page simple avec plusieurs champs</h1>

### Correction

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
      title: 'Exercice 4',
      home: const FormulaireSimplePage(),
    );
  }
}

class FormulaireSimplePage extends StatelessWidget {
  const FormulaireSimplePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nomController = TextEditingController();
    final TextEditingController prenomController = TextEditingController();
    final TextEditingController ageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Formulaire simple')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Nom :", style: TextStyle(fontSize: 16)),
            TextField(controller: nomController),
            const SizedBox(height: 15),
            const Text("Prénom :", style: TextStyle(fontSize: 16)),
            TextField(controller: prenomController),
            const SizedBox(height: 15),
            const Text("Âge :", style: TextStyle(fontSize: 16)),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("Nom : ${nomController.text}");
                print("Prénom : ${prenomController.text}");
                print("Âge : ${ageController.text}");
              },
              child: const Text('Afficher les informations'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Ce qu’on a ajouté dans cet exercice :

1. Trois champs de texte (`TextField`) : un pour le nom, un pour le prénom, un pour l’âge.
2. Des libellés (`Text`) clairs pour chaque champ.
3. Une mise en page propre et espacée avec des `SizedBox`.
4. Un bouton qui affiche les valeurs saisies dans la console.

### Énoncé de l’exercice :

Créer une interface composée de :

* Trois champs `TextField` pour : Nom, Prénom et Âge
* Un bouton **"Afficher les informations"**
* Quand on clique sur le bouton, les trois valeurs saisies doivent être affichées **dans la console**.

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>



<h1 id="correction-exercice-5">Correction Exercice 5 – Boutons radio (Radio)</h1>

### Correction

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
      title: 'Exercice 5',
      home: const ChoixGenrePage(),
    );
  }
}

class ChoixGenrePage extends StatefulWidget {
  const ChoixGenrePage({super.key});

  @override
  State<ChoixGenrePage> createState() => _ChoixGenrePageState();
}

class _ChoixGenrePageState extends State<ChoixGenrePage> {
  String? _genreSelectionne;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choix du genre')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Sélectionnez un genre :", style: TextStyle(fontSize: 16)),
            RadioListTile<String>(
              title: const Text("Homme"),
              value: "Homme",
              groupValue: _genreSelectionne,
              onChanged: (value) {
                setState(() {
                  _genreSelectionne = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text("Femme"),
              value: "Femme",
              groupValue: _genreSelectionne,
              onChanged: (value) {
                setState(() {
                  _genreSelectionne = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text("Autre"),
              value: "Autre",
              groupValue: _genreSelectionne,
              onChanged: (value) {
                setState(() {
                  _genreSelectionne = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_genreSelectionne != null) {
                  print("Genre sélectionné : $_genreSelectionne");
                } else {
                  print("Aucun genre sélectionné.");
                }
              },
              child: const Text("Valider"),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Ce qu’on a ajouté dans cet exercice :

1. Trois boutons radio (`RadioListTile`) liés à une variable `String`.
2. Une interface claire avec libellé pour chaque option : Homme, Femme, Autre.
3. Un bouton "Valider" qui affiche la valeur choisie dans la console.
4. Un `setState()` pour mettre à jour dynamiquement le genre sélectionné.

### Énoncé de l’exercice :

Créer une interface avec **trois boutons radio** :

* "Homme", "Femme", "Autre"
  Ajouter un bouton **"Valider"** qui affiche dans la console le genre actuellement sélectionné.

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>





<h1 id="correction-exercice-6">Correction Exercice 6 – Cases à cocher (Checkbox)</h1>

### Correction

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
      title: 'Exercice 6',
      home: LangagesCheckboxPage(),
    );
  }
}

class LangagesCheckboxPage extends StatefulWidget {
  const LangagesCheckboxPage({super.key});

  @override
  State<LangagesCheckboxPage> createState() => _LangagesCheckboxPageState();
}

class _LangagesCheckboxPageState extends State<LangagesCheckboxPage> {
  bool _python = false;
  bool _javascript = false;
  bool _cpp = false;

  void _afficherLangages() {
    print("Langages sélectionnés :");
    if (_python) print("- Python");
    if (_javascript) print("- JavaScript");
    if (_cpp) print("- C++");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Langages à cocher')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CheckboxListTile(
              title: const Text('Python'),
              value: _python,
              onChanged: (val) {
                setState(() => _python = val!);
              },
            ),
            CheckboxListTile(
              title: const Text('JavaScript'),
              value: _javascript,
              onChanged: (val) {
                setState(() => _javascript = val!);
              },
            ),
            CheckboxListTile(
              title: const Text('C++'),
              value: _cpp,
              onChanged: (val) {
                setState(() => _cpp = val!);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _afficherLangages,
              child: const Text('Afficher'),
            )
          ],
        ),
      ),
    );
  }
}
```

### Ce qu’on a ajouté dans cet exercice :

1. Trois cases à cocher (`CheckboxListTile`) pour **Python**, **JavaScript**, et **C++**.
2. Une gestion d’état locale avec trois variables booléennes.
3. Un bouton "Afficher" qui imprime dans la console les cases actuellement cochées.
4. Une interface intuitive avec mise en page verticale et espacement.

### Énoncé de l’exercice :

Créer une interface avec trois **cases à cocher** :

* "Python", "JavaScript", "C++"
  Ajouter un bouton **"Afficher"** qui affiche dans la console tous les langages sélectionnés par l’utilisateur.

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>



<h1 id="correction-exercice-7">Correction Exercice 7 – Liste déroulante (DropdownButton)</h1>

### Correction

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
      title: 'Exercice 7',
      home: FruitsDropdownPage(),
    );
  }
}

class FruitsDropdownPage extends StatefulWidget {
  const FruitsDropdownPage({super.key});

  @override
  State<FruitsDropdownPage> createState() => _FruitsDropdownPageState();
}

class _FruitsDropdownPageState extends State<FruitsDropdownPage> {
  final List<String> _fruits = ["Pomme", "Banane", "Cerise", "Orange"];
  String? _fruitSelectionne;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Liste déroulante")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            DropdownButton<String>(
              hint: const Text("Choisissez un fruit"),
              value: _fruitSelectionne,
              onChanged: (String? valeur) {
                setState(() {
                  _fruitSelectionne = valeur;
                });
              },
              items: _fruits.map((fruit) {
                return DropdownMenuItem<String>(
                  value: fruit,
                  child: Text(fruit),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Text(
              _fruitSelectionne == null
                  ? "Aucun fruit sélectionné"
                  : "Fruit sélectionné : $_fruitSelectionne",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Ce qu’on a ajouté dans cet exercice :

1. Une liste de fruits à afficher dans un `DropdownButton`.
2. Une variable `_fruitSelectionne` pour stocker le choix actuel.
3. Un message dynamique sous la liste déroulante pour afficher la sélection.
4. La méthode `.map()` pour transformer la liste de chaînes en `DropdownMenuItem`.

### Énoncé de l’exercice :

Créer une interface avec une **liste déroulante** contenant les éléments suivants :
"**Pomme**", "**Banane**", "**Cerise**", "**Orange**"
Afficher sous la liste un message dynamique indiquant **le fruit sélectionné**.

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>



<h1 id="correction-exercice-8">Correction Exercice 8 – Menu de sélection (PopupMenuButton)</h1>

### Correction

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
      title: 'Exercice 8',
      home: MenuSelectionPage(),
    );
  }
}

class MenuSelectionPage extends StatefulWidget {
  const MenuSelectionPage({super.key});

  @override
  State<MenuSelectionPage> createState() => _MenuSelectionPageState();
}

class _MenuSelectionPageState extends State<MenuSelectionPage> {
  String _choix = "Aucune sélection";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu de sélection"),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String valeur) {
              setState(() {
                _choix = "Vous avez choisi : $valeur";
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Option 1',
                child: Text('Option 1'),
              ),
              const PopupMenuItem<String>(
                value: 'Option 2',
                child: Text('Option 2'),
              ),
              const PopupMenuItem<String>(
                value: 'Option 3',
                child: Text('Option 3'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Text(
          _choix,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
```

### Ce qu’on a ajouté dans cet exercice :

1. Un `PopupMenuButton` dans l'`AppBar`, avec trois options.
2. Une fonction `onSelected` pour réagir à la sélection.
3. Une variable `_choix` qui affiche dynamiquement la sélection dans le `body`.

### Énoncé de l’exercice :

Créer une interface avec un **menu de sélection** intégré à la barre d'application.
Ce menu doit contenir **trois options**.
Lorsqu’un utilisateur choisit une option, un **texte s’affiche au centre de l’écran** indiquant ce choix.

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>




















<h1 id="correction-exercice-9">Correction Exercice 9 – Mise en page avec Row et Column</h1>

### Correction

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
      title: 'Exercice 9',
      home: MiseEnPagePage(),
    );
  }
}

class MiseEnPagePage extends StatelessWidget {
  const MiseEnPagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mise en page avec Row et Column")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Informations personnelles", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              children: const [
                Text("Nom : "),
                SizedBox(width: 10),
                Expanded(child: TextField()),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Text("Prénom : "),
                SizedBox(width: 10),
                Expanded(child: TextField()),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Text("Âge : "),
                SizedBox(width: 10),
                Expanded(child: TextField()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
```

### Ce qu’on a ajouté dans cet exercice :

1. Trois `Row` pour aligner un `Text` et un `TextField` côte à côte.
2. Une `Column` qui empile les `Row` verticalement.
3. Des espacements (`SizedBox`) pour rendre l’interface plus lisible.
4. Un `Padding` pour ne pas coller le contenu aux bords de l’écran.

### Énoncé de l’exercice :

Créer une interface de type formulaire utilisant `Row` et `Column`.
Chaque ligne doit comporter un label (Nom, Prénom, Âge) suivi d’un champ de saisie.
L’ensemble doit être espacé et lisible.

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>



<h1 id="correction-exercice-10">Correction Exercice 10 – Détection clavier</h1>

### Correction

```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Exercice 10',
      home: ClavierPage(),
    );
  }
}

class ClavierPage extends StatefulWidget {
  const ClavierPage({super.key});

  @override
  State<ClavierPage> createState() => _ClavierPageState();
}

class _ClavierPageState extends State<ClavierPage> {
  String _toucheAppuyee = '';

  final FocusNode _focusNode = FocusNode();

  void _gererTouche(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      setState(() {
        _toucheAppuyee = event.logicalKey.keyLabel;
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Détection clavier")),
      body: Center(
        child: RawKeyboardListener(
          focusNode: _focusNode,
          autofocus: true,
          onKey: _gererTouche,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Appuyez sur une touche :"),
              const SizedBox(height: 20),
              Text(
                _toucheAppuyee.isEmpty ? "(Aucune)" : "Touche : $_toucheAppuyee",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

### Ce qu’on a ajouté dans cet exercice :

1. Utilisation de `RawKeyboardListener` pour écouter les événements clavier.
2. Un `FocusNode` pour s'assurer que le composant reçoit le focus.
3. La touche appuyée est affichée dynamiquement à l’écran.
4. L'événement est intercepté et mis à jour via `setState()`.

### Énoncé de l’exercice :

Créer une interface capable de détecter et afficher la dernière touche du clavier pressée.
L'affichage doit être mis à jour dynamiquement à chaque frappe.

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>










<h1 id="correction-exercice-11">Correction Exercice 11 – Détection des gestes (toucher, glisser)</h1>

### Correction

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
      title: 'Exercice 11',
      home: GestesPage(),
    );
  }
}

class GestesPage extends StatefulWidget {
  const GestesPage({super.key});

  @override
  State<GestesPage> createState() => _GestesPageState();
}

class _GestesPageState extends State<GestesPage> {
  String _message = "Aucune interaction détectée";

  void _onTap() {
    setState(() {
      _message = "Appui détecté (onTap)";
    });
  }

  void _onDoubleTap() {
    setState(() {
      _message = "Double appui détecté (onDoubleTap)";
    });
  }

  void _onLongPress() {
    setState(() {
      _message = "Appui long détecté (onLongPress)";
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _message = "Glissement : dx=${details.delta.dx.toStringAsFixed(1)}, dy=${details.delta.dy.toStringAsFixed(1)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Détection des gestes")),
      body: GestureDetector(
        onTap: _onTap,
        onDoubleTap: _onDoubleTap,
        onLongPress: _onLongPress,
        onPanUpdate: _onPanUpdate,
        child: Container(
          color: Colors.grey[200],
          child: Center(
            child: Text(
              _message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
```

### Ce qu’on a ajouté dans cet exercice :

1. Utilisation de `GestureDetector` pour détecter plusieurs types de gestes.
2. Gestion des événements : `onTap`, `onDoubleTap`, `onLongPress` et `onPanUpdate`.
3. Affichage en temps réel de l’action détectée dans l’interface.

### Énoncé de l’exercice :

Créer une interface capable de réagir aux interactions suivantes :

* Appui simple
* Double appui
* Appui long
* Glissement (horizontal/vertical)

Afficher dynamiquement un message à chaque interaction.

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>



<h1 id="correction-exercice-12">Correction Exercice 12 – Mini-projet 1 : Formulaire Complet</h1>

### Correction

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
      title: 'Formulaire Complet',
      home: FormulairePage(),
    );
  }
}

class FormulairePage extends StatefulWidget {
  const FormulairePage({super.key});

  @override
  State<FormulairePage> createState() => _FormulairePageState();
}

class _FormulairePageState extends State<FormulairePage> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  String _genre = "Homme";
  bool _python = false;
  bool _java = false;
  bool _javascript = false;

  void _envoyer() {
    print("Nom : ${_nomController.text}");
    print("Prénom : ${_prenomController.text}");
    print("Genre : $_genre");
    print("Langages connus :");
    if (_python) print("- Python");
    if (_java) print("- Java");
    if (_javascript) print("- JavaScript");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Formulaire Complet")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomController,
              decoration: const InputDecoration(labelText: "Nom"),
            ),
            TextField(
              controller: _prenomController,
              decoration: const InputDecoration(labelText: "Prénom"),
            ),
            const SizedBox(height: 16),
            const Text("Genre :"),
            ListTile(
              title: const Text("Homme"),
              leading: Radio<String>(
                value: "Homme",
                groupValue: _genre,
                onChanged: (value) => setState(() => _genre = value!),
              ),
            ),
            ListTile(
              title: const Text("Femme"),
              leading: Radio<String>(
                value: "Femme",
                groupValue: _genre,
                onChanged: (value) => setState(() => _genre = value!),
              ),
            ),
            ListTile(
              title: const Text("Autre"),
              leading: Radio<String>(
                value: "Autre",
                groupValue: _genre,
                onChanged: (value) => setState(() => _genre = value!),
              ),
            ),
            const SizedBox(height: 16),
            const Text("Langages connus :"),
            CheckboxListTile(
              title: const Text("Python"),
              value: _python,
              onChanged: (val) => setState(() => _python = val!),
            ),
            CheckboxListTile(
              title: const Text("Java"),
              value: _java,
              onChanged: (val) => setState(() => _java = val!),
            ),
            CheckboxListTile(
              title: const Text("JavaScript"),
              value: _javascript,
              onChanged: (val) => setState(() => _javascript = val!),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _envoyer,
              child: const Text("Envoyer"),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Ce qu’on a ajouté dans cet exercice :

1. Deux champs de saisie (`TextField`) pour le nom et le prénom.
2. Trois boutons radio pour le choix du genre.
3. Trois cases à cocher (`CheckboxListTile`) pour les langages de programmation.
4. Un bouton "Envoyer" qui affiche toutes les données saisies dans la console.

### Énoncé de l’exercice :

Créer une interface complète avec les composants suivants :

* `TextField` pour le nom et le prénom
* `Radio` pour le genre (Homme, Femme, Autre)
* `Checkbox` pour les langages connus (Python, Java, JavaScript)
* Un bouton "Envoyer" qui affiche tous les champs dans la console

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>

























<h1 id="correction-exercice-13">Correction Exercice 13 – Mini-projet 2 : Saisie et calcul simple</h1>

### Correction

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
      title: 'Addition Simple',
      home: CalculPage(),
    );
  }
}

class CalculPage extends StatefulWidget {
  const CalculPage({super.key});

  @override
  State<CalculPage> createState() => _CalculPageState();
}

class _CalculPageState extends State<CalculPage> {
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  String _resultat = "";

  void _additionner() {
    try {
      final a = int.parse(_aController.text);
      final b = int.parse(_bController.text);
      final somme = a + b;
      setState(() {
        _resultat = "Résultat : $somme";
      });
    } catch (e) {
      setState(() {
        _resultat = "Veuillez entrer deux entiers valides.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Addition Simple")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _aController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Entier 1"),
            ),
            TextField(
              controller: _bController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Entier 2"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _additionner,
              child: const Text("Additionner"),
            ),
            const SizedBox(height: 16),
            Text(
              _resultat,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Ce qu’on a ajouté dans cet exercice :

1. Deux champs `TextField` pour saisir des entiers.
2. Un bouton "Additionner" qui lit les deux champs, calcule la somme et l’affiche.
3. Une gestion des erreurs (try/catch) pour les entrées invalides.
4. Un `Text` dynamique qui affiche le résultat ou un message d’erreur.

### Énoncé de l’exercice :

Créer une interface Flutter contenant :

* Deux champs pour entrer deux entiers
* Un bouton "Additionner" qui affiche la somme des deux nombres dans un `Text` sous le bouton
* Une gestion d’erreur si l’utilisateur entre autre chose qu’un entier

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>











<h1 id="correction-exercice-14">Correction Exercice 14 – Mini-projet 3 : Changement dynamique de couleur</h1>

### Correction

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
      title: 'Changement de couleur',
      home: CouleurPage(),
    );
  }
}

class CouleurPage extends StatefulWidget {
  const CouleurPage({super.key});

  @override
  State<CouleurPage> createState() => _CouleurPageState();
}

class _CouleurPageState extends State<CouleurPage> {
  final List<String> _couleursDisponibles = ['Bleu', 'Vert', 'Jaune', 'Rose'];
  final Map<String, Color> _couleursMap = {
    'Bleu': Colors.lightBlue,
    'Vert': Colors.lightGreen,
    'Jaune': Colors.yellow,
    'Rose': Colors.pinkAccent,
  };

  String? _couleurActuelle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _couleursMap[_couleurActuelle],
      appBar: AppBar(title: const Text("Changer la couleur")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              hint: const Text("Choisir une couleur"),
              value: _couleurActuelle,
              items: _couleursDisponibles.map((String couleur) {
                return DropdownMenuItem<String>(
                  value: couleur,
                  child: Text(couleur),
                );
              }).toList(),
              onChanged: (String? nouvelleCouleur) {
                setState(() {
                  _couleurActuelle = nouvelleCouleur;
                });
              },
            ),
            const SizedBox(height: 20),
            if (_couleurActuelle != null)
              Text(
                "Couleur actuelle : $_couleurActuelle",
                style: const TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}
```

### Ce qu’on a ajouté dans cet exercice :

1. Un `DropdownButton` permettant de choisir une couleur.
2. Une carte (`Map`) associant les noms de couleurs à des `Color` Flutter.
3. Une mise à jour du fond (`backgroundColor`) en fonction de la couleur sélectionnée.
4. Un affichage dynamique du nom de la couleur choisie.

### Énoncé de l’exercice :

Créer une interface Flutter avec :

* Un menu déroulant listant plusieurs couleurs (Bleu, Vert, Jaune, Rose)
* Lorsque l’utilisateur sélectionne une couleur, la couleur de fond de la fenêtre change
* Un `Text` affiche dynamiquement la couleur sélectionnée

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>







































<h1 id="correction-exercice-14">Correction Exercice 14 – Mini-projet 3 : Changement dynamique de couleur</h1>

### Correction

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
      title: 'Changement de couleur',
      home: CouleurPage(),
    );
  }
}

class CouleurPage extends StatefulWidget {
  const CouleurPage({super.key});

  @override
  State<CouleurPage> createState() => _CouleurPageState();
}

class _CouleurPageState extends State<CouleurPage> {
  final List<String> _couleursDisponibles = ['Bleu', 'Vert', 'Jaune', 'Rose'];
  final Map<String, Color> _couleursMap = {
    'Bleu': Colors.lightBlue,
    'Vert': Colors.lightGreen,
    'Jaune': Colors.yellow,
    'Rose': Colors.pinkAccent,
  };

  String? _couleurActuelle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _couleursMap[_couleurActuelle],
      appBar: AppBar(title: const Text("Changer la couleur")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              hint: const Text("Choisir une couleur"),
              value: _couleurActuelle,
              items: _couleursDisponibles.map((String couleur) {
                return DropdownMenuItem<String>(
                  value: couleur,
                  child: Text(couleur),
                );
              }).toList(),
              onChanged: (String? nouvelleCouleur) {
                setState(() {
                  _couleurActuelle = nouvelleCouleur;
                });
              },
            ),
            const SizedBox(height: 20),
            if (_couleurActuelle != null)
              Text(
                "Couleur actuelle : $_couleurActuelle",
                style: const TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}
```

### Ce qu’on a ajouté dans cet exercice :

1. Un `DropdownButton` permettant de choisir une couleur.
2. Une carte (`Map`) associant les noms de couleurs à des `Color` Flutter.
3. Une mise à jour du fond (`backgroundColor`) en fonction de la couleur sélectionnée.
4. Un affichage dynamique du nom de la couleur choisie.

### Énoncé de l’exercice :

Créer une interface Flutter avec :

* Un menu déroulant listant plusieurs couleurs (Bleu, Vert, Jaune, Rose)
* Lorsque l’utilisateur sélectionne une couleur, la couleur de fond de la fenêtre change
* Un `Text` affiche dynamiquement la couleur sélectionnée

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>





<h1 id="correction-exercice-15">Correction Exercice 15 – Projet Final : Application Panier d’Achat</h1>

### Correction

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
      title: 'Caisse Flutter',
      home: PanierPage(),
    );
  }
}

class PanierPage extends StatefulWidget {
  const PanierPage({super.key});

  @override
  State<PanierPage> createState() => _PanierPageState();
}

class _PanierPageState extends State<PanierPage> {
  final List<String> _produits = ['Pain', 'Lait', 'Œufs'];
  final Map<String, double> _prix = {
    'Pain': 2.5,
    'Lait': 1.8,
    'Œufs': 3.2,
  };

  String? _produitSélectionné;
  final TextEditingController _ctrlQuantité = TextEditingController();
  double _total = 0;
  final List<String> _panier = [];

  void _ajouterAuPanier() {
    final produit = _produitSélectionné;
    final quantitéText = _ctrlQuantité.text;

    if (produit != null && quantitéText.isNotEmpty) {
      final quantité = int.tryParse(quantitéText);
      if (quantité != null && quantité > 0) {
        final prix = _prix[produit]! * quantité;
        setState(() {
          _total += prix;
          _panier.add('$produit x$quantité = ${prix.toStringAsFixed(2)} \$');
        });
        _ctrlQuantité.clear();
      }
    }
  }

  void _payer() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Confirmation de paiement"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._panier.map((item) => Text(item)).toList(),
            const SizedBox(height: 10),
            Text('Total payé : ${_total.toStringAsFixed(2)} \$'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _panier.clear();
                _total = 0;
              });
            },
            child: const Text('OK'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Caisse enregistreuse")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButton<String>(
              hint: const Text("Sélectionner un produit"),
              value: _produitSélectionné,
              items: _produits.map((produit) {
                return DropdownMenuItem(
                  value: produit,
                  child: Text(produit),
                );
              }).toList(),
              onChanged: (val) {
                setState(() => _produitSélectionné = val);
              },
            ),
            TextField(
              controller: _ctrlQuantité,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Quantité"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _ajouterAuPanier,
              child: const Text("Ajouter au panier"),
            ),
            ElevatedButton(
              onPressed: _payer,
              child: const Text("Payer"),
            ),
            const SizedBox(height: 20),
            Text("Total : ${_total.toStringAsFixed(2)} \$", style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
```

### Ce qu’on a ajouté dans cet exercice :

1. Un `DropdownButton` pour sélectionner un produit.
2. Un `TextField` pour saisir une quantité.
3. Un bouton "Ajouter au panier" qui met à jour un total.
4. Une fenêtre modale (`AlertDialog`) qui affiche le récapitulatif du panier et du total payé.
5. Un affichage dynamique du total cumulé dans l’interface.

### Énoncé de l’exercice :

Créer une interface Flutter simulant une **caisse enregistreuse** :

* Un menu déroulant avec des produits (Pain, Lait, Œufs)
* Une zone de saisie pour entrer une quantité
* Un bouton "Ajouter au panier" qui calcule le total cumulé
* Un bouton "Payer" qui affiche un récapitulatif dans une boîte de dialogue
* Un affichage dynamique du montant total


<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>

