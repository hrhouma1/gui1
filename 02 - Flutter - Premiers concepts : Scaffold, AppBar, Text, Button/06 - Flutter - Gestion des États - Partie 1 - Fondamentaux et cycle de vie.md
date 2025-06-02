# Flutter - Gestion des États - Partie 1 - Fondamentaux et cycle de vie

*Cours – Comprendre les États (*State*) et la gestion des états dans Flutter*

<h1 id="table-des-matieres">Table des matières</h1>
<ul>
  <li><a href="#1">1. Qu’est-ce que le State dans Flutter ?</a></li>
  <li><a href="#2">2. StatelessWidget vs StatefulWidget</a></li>
  <li><a href="#3">3. Cycle de vie d’un `StatefulWidget`</a></li>
  <li><a href="#4">4. Pourquoi utiliser `setState()` ?</a></li>
  <li><a href="#5">5. Bonnes pratiques</a></li>
  <li><a href="#6">6. Notions avancées à connaître</a></li>
  <li><a href="#7">7. Exercice pratique</a></li>
  <li><a href="#correction-exercice-state">8. Correction Exercice – Bouton compteur et réinitialisation</a></li>
</ul>

<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>



## Objectif

Comprendre les **fondements de la gestion d'état dans Flutter**, savoir **quand et comment utiliser `setState()`**, les **différences entre widgets avec et sans état**, et les notions avancées à connaître pour évoluer dans un projet Flutter professionnel.



## <h1 id="1">1. Qu’est-ce que le *State* dans Flutter ?</h1>

Flutter est un **framework déclaratif** :

> L’interface utilisateur dépend de l’état (les données).

**Définition** : Le *state* (ou état) représente **les données qui changent** au cours de la vie d’un widget et qui **doivent provoquer une mise à jour visuelle** quand elles changent.

Exemples :

* Un compteur qui s’incrémente
* Une case cochée/décochée
* Un champ de formulaire rempli
* Un thème clair/sombre activé


<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>


## <h1 id="2">2. StatelessWidget vs StatefulWidget</h1>

### `StatelessWidget` : Pas d’état interne modifiable

```dart
class MonWidgetStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Je suis immuable");
  }
}
```

Utilisé pour les éléments **fixes**, dont le contenu **ne change pas après le build**.



### `StatefulWidget` : Possède un état interne modifiable

```dart
class MonWidgetStateful extends StatefulWidget {
  @override
  _MonWidgetStatefulState createState() => _MonWidgetStatefulState();
}

class _MonWidgetStatefulState extends State<MonWidgetStateful> {
  int compteur = 0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          compteur++;
        });
      },
      child: Text("Compteur : $compteur"),
    );
  }
}
```

**`setState()`** indique que l'état a changé et que Flutter doit **redessiner** l’interface.


<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>

## <h1 id="3">3. Cycle de vie d’un `StatefulWidget`</h1>

| Méthode       | Rôle                                                            |
| ------------- | --------------------------------------------------------------- |
| `initState()` | Appelé une seule fois, au début, pour initialiser l’état.       |
| `build()`     | Appelé **chaque fois** qu’on fait `setState()`                  |
| `dispose()`   | Appelé à la suppression du widget, pour libérer les ressources. |

> Important : **Ne jamais faire de logique asynchrone directement dans `build()`**.


<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>

## <h1 id="4">4. Pourquoi utiliser `setState()` ?</h1>

C’est la **méthode clé pour notifier Flutter** qu’un changement d’état nécessite de **rebâtir l’interface**.

```dart
setState(() {
  valeur++;
});
```

➡️ Cela **reconstruit uniquement le widget courant**, pas toute l’application.


<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>

## <h1 id="5">5. Bonnes pratiques</h1>

* ✅ **Utiliser `StatelessWidget` tant que possible** (plus léger)
* ✅ Limiter le code dans `build()` au strict nécessaire
* ✅ Regrouper la logique métier hors des widgets si possible
* ❌ Ne pas faire de traitement long dans `setState()`
* ❌ Ne jamais appeler `setState()` après `dispose()`



<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>

## <h1 id="6">6. Notions avancées à connaître</h1>

###  `InheritedWidget` / `InheritedModel`

* Propagent des états **sans passer manuellement via les constructeurs**
* Base des systèmes comme `Provider` ou `Riverpod`

###  `Provider`, `Riverpod`, `Bloc`, `GetX`, `MobX`

* Bibliothèques de gestion d’état **plus évoluées**
* Permettent de **séparer clairement l’interface et la logique métier**

> Ces outils sont utiles dès que l’état devient **partagé entre plusieurs widgets** ou **persistant**.


<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>

## <h1 id="7">7. Exercice pratique </h1>

> Créer un bouton qui affiche un nombre, et à chaque clic, le nombre augmente.
> ➕ Ensuite, ajouter un second bouton "Réinitialiser".


<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>




<h1 id="correction-exercice-state">8. Correction Exercice – Bouton compteur et réinitialisation</h1>

**Rappel de l'objectif de l'exercice** :
Mettre en œuvre un `StatefulWidget` avec gestion d’état via `setState()`.

* Un bouton "Incrémenter" augmente un compteur.
* Un bouton "Réinitialiser" remet le compteur à zéro.

###  Code complet

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
      title: 'Exercice State',
      home: const PageCompteur(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PageCompteur extends StatefulWidget {
  const PageCompteur({super.key});

  @override
  State<PageCompteur> createState() => _PageCompteurState();
}

class _PageCompteurState extends State<PageCompteur> {
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
      appBar: AppBar(
        title: const Text('Compteur avec état'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Valeur actuelle : $compteur',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: incrementer,
              child: const Text('Incrémenter'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: reinitialiser,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Réinitialiser'),
            ),
          ],
        ),
      ),
    );
  }
}
```



###  Ce que ce code met en pratique :

| Élément Flutter                 | Description                                  |
| ------------------------------- | -------------------------------------------- |
| `StatefulWidget`                | Permet de modifier dynamiquement l’interface |
| `setState()`                    | Notifie Flutter d’un changement d’état       |
| Deux boutons (`ElevatedButton`) | Un pour incrémenter, un pour réinitialiser   |
| `Text` dynamique                | Affiche la valeur de la variable `compteur`  |

---

### 💡 Variante possible (bonus) :

Ajouter un `SnackBar` pour afficher "Compteur réinitialisé !" après un clic sur le bouton rouge :

```dart
ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(content: Text('Compteur réinitialisé !')),
);
```



<br/>
<a href="#table-des-matieres">Retour à la table des matières</a>
<br/>
<br/>




# Annexe 1 - Conventions de nommages



## Si votre widget s'appelle :

```dart
class A extends StatefulWidget
```

### Alors **la classe d’état associée** doit s’appeler :

```dart
class _AState extends State<A>
```



| Élément            | Signification                                                       |
| ------------------ | ------------------------------------------------------------------- |
| `A`                | Le nom de votre widget avec état (`StatefulWidget`)                 |
| `_AState`          | Nom de la classe d’état, **privée** (`_`) et associée au widget `A` |
| `extends State<A>` | Le lien logique : cette classe est **l’état du widget `A`**         |



### Exemple complet minimal

```dart
import 'package:flutter/material.dart';

class A extends StatefulWidget {
  @override
  _AState createState() => _AState();
}

class _AState extends State<A> {
  int compteur = 0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          compteur++;
        });
      },
      child: Text('Compteur : $compteur'),
    );
  }
}
```


###  À retenir

* `A` est le widget public.
* `_AState` est sa classe d’état, **privée** (préfixée par `_`), comme recommandé en Dart.
* `State<A>` indique que cette classe d’état **est liée au widget A**.



### À Essayer 


##  Programme Flutter minimal complet avec `main()`

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
          child: A(), // On utilise ici notre widget avec état
        ),
      ),
    );
  }
}

class A extends StatefulWidget {
  @override
  _AState createState() => _AState();
}

class _AState extends State<A> {
  int compteur = 0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          compteur++;
        });
      },
      child: Text('Compteur : $compteur'),
    );
  }
}
```



###  Résumé de la structure

| Élément      | Description                                                           |
| ------------ | --------------------------------------------------------------------- |
| `main()`     | Point d’entrée du programme. Lance l’application Flutter.             |
| `MonApp`     | Le widget racine de type `StatelessWidget`.                           |
| `A`          | Un widget personnalisé **avec état** (compteur qui augmente au clic). |
| `_AState`    | La classe qui **gère l’état du widget A**.                            |
| `setState()` | Utilisé pour notifier Flutter qu’on doit **rafraîchir l’interface**.  |


<br/>
<br/>


# Annexe 2 - Convention de nommage Flutter pour `StatefulWidget`

### Convention

Si votre widget s'appelle :

```dart
class MonWidgetStateful extends StatefulWidget
```

Alors votre classe d’état (la logique interne liée à ce widget) doit s’appeler :

```dart
class _MonWidgetStatefulState extends State<MonWidgetStateful>
```



##  Pourquoi suivre cette convention ?

| Élément                                                                           | But                                                                                                                  |
| --------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
|  Reprise du nom du widget (`MonWidgetStateful`) dans le nom de la classe d’état | Cela **associe visuellement les deux classes**, ce qui est très utile quand il y en a plusieurs dans un même fichier |
|  Ajout de `State` à la fin                                                      | Permet d’identifier facilement la classe **qui gère l’état**                                                         |
|  Le `_` au début du nom d’état                                                  | Rend la classe **privée** au fichier courant (bonne pratique Dart)                                                   |



##  Exemples concrets

| Widget (`StatefulWidget`) | Classe d'état associée                                           |
| ------------------------- | ---------------------------------------------------------------- |
| `class CompteurWidget`    | `class _CompteurWidgetState extends State<CompteurWidget>`       |
| `class LoginForm`         | `class _LoginFormState extends State<LoginForm>`                 |
| `class MonWidgetStateful` | `class _MonWidgetStatefulState extends State<MonWidgetStateful>` |


## ❗ Est-ce obligatoire ?

Non. Dart et Flutter **ne vous obligent pas** à suivre ce nommage, mais :

* Si vous changez le nom du widget, vous devez aussi le changer dans la classe `State<...>` ;
* Si vous cassez cette convention, votre code sera **moins lisible** pour les autres développeurs (ou vous-même plus tard).


##  À retenir

* Ce sont **des conventions de nommage** (comme `camelCase`, `snake_case` ou `PascalCase`) ;
* Elles **n’ont pas de valeur technique stricte**, mais permettent de garder un code **cohérent, lisible et maintenable** ;
* Elles aident à **travailler efficacement en équipe** et à **comprendre rapidement la structure du code**.




<br/>
<br/>



# Annexe 3 - **Mots réservés dans ce code Dart**

Ce sont les **mots-clés du langage Dart**. Ils ne peuvent **pas être utilisés comme noms de classes ou de variables**.

| Mot-clé Dart                      | Rôle                                                       |
| --------------------------------- | ---------------------------------------------------------- |
| `class`                           | Déclare une nouvelle classe                                |
| `extends`                         | Indique l’héritage (hérite d’une autre classe)             |
| `@override`                       | Annotation qui indique qu’on redéfinit une méthode héritée |
| `int`                             | Type de donnée pour un entier                              |
| `return` (sous-entendu avec `=>`) | Utilisé dans les fonctions pour retourner une valeur       |

⚠️ **`setState()`** et **`build()`** ne sont **pas des mots réservés**, ce sont des **méthodes héritées** de classes Flutter.


### ✍️ **Non réservés (identifiants personnalisés)**

Ce sont les **noms que VOUS créez**. Ils peuvent être changés (tant qu’ils respectent les règles de nommage Dart).

| Élément Dart                 | Rôle                               | Est modifiable ?                                                |
| ---------------------------- | ---------------------------------- | --------------------------------------------------------------- |
| `MonWidgetStateful`          | Nom de votre widget                | ✅ Oui                                                           |
| `_MonWidgetStatefulState`    | Nom de la classe d’état            | ✅ Oui                                                           |
| `compteur`                   | Variable de compteur               | ✅ Oui                                                           |
| `createState`                | Méthode obligatoire à surcharger   | ❌ Non (doit exister, mais nom non réservé)                      |
| `build`                      | Méthode appelée automatiquement    | ❌ Non (doit exister, mais nom non réservé)                      |
| `context`                    | Paramètre représentant le contexte | ✅ Oui (techniquement) mais conventionnellement utilisé tel quel |
| `onPressed`, `child`, `Text` | Propriétés de widgets Flutter      | ❌ Non (provenant des classes Flutter)                           |



##  À retenir

* Les mots **réservés** (comme `class`, `extends`, `int`, `return`) font partie du **langage Dart**.
* Les autres noms (`MonWidgetStateful`, `compteur`, etc.) sont **des noms créés par le programmeur**, mais certains doivent suivre des **conventions Flutter** (`createState()`, `build()`).
* Les noms comme `build()` ou `createState()` **ne sont pas réservés** par Dart, **mais attendus par Flutter**. Si vous ne les écrivez pas correctement, l’application ne fonctionnera pas.



<br/>
<br/>

# Annexe 4  - Ligne à analyser



```dart
@override
_MonWidgetStatefulState createState() => _MonWidgetStatefulState();
```



##  1. `createState()` : méthode spéciale (réservée par Flutter)

* Oui, `createState()` est **une méthode prédéfinie dans Flutter**.
* Elle **doit être implémentée** quand vous créez un `StatefulWidget`.
* Elle **retourne une instance de la classe d’état**, celle qui hérite de `State<...>`.


##  2. La flèche `=>` (fonction fléchée)

```dart
createState() => _MonWidgetStatefulState();
```

* Cette notation est une **forme abrégée** pour une fonction qui retourne une seule valeur.
* Elle signifie exactement la même chose que :

```dart
@override
_MonWidgetStatefulState createState() {
  return _MonWidgetStatefulState();
}
```

C’est **juste du sucre syntaxique** : plus court, mais équivalent.



##  3. `StatefulWidget` et sa classe `State`

Prenons la structure complète pour bien relier les deux :

```dart
class MonWidgetStateful extends StatefulWidget {
  @override
  _MonWidgetStatefulState createState() => _MonWidgetStatefulState();
}
```

* `MonWidgetStateful` est un **StatefulWidget**, donc il doit dire à Flutter **quelle est la classe qui gère son état**.
* Il le fait via `createState()`, qui retourne une instance de `_MonWidgetStatefulState`.



##  4. `_MonWidgetStatefulState` : classe privée

```dart
class _MonWidgetStatefulState extends State<MonWidgetStateful>
```

* Le nom commence par `_`, donc c’est **une classe privée** dans Dart.
* Elle **hérite de `State<MonWidgetStateful>`**, ce qui veut dire :

  > Cette classe gère l’état du widget `MonWidgetStateful`.



##  Pourquoi `<MonWidgetStateful>` après `State<...>` ?

* C’est le **type générique** : on indique **à quel widget** ce `State` est lié.
* Cela permet à Flutter de savoir **quel widget reconstruire** quand on appelle `setState()`.

👉 Donc quand vous écrivez :

```dart
class _MonWidgetStatefulState extends State<MonWidgetStateful>
```

...vous dites à Flutter :

> “Je suis la classe qui contient l’état pour le widget `MonWidgetStateful`.”


## Résumé 

| Élément                    | Rôle                                                           |
| -------------------------- | -------------------------------------------------------------- |
| `createState()`            | Méthode obligatoire qui retourne la classe de l’état           |
| `=>`                       | Équivalent abrégé de `return ...`                              |
| `_MonWidgetStatefulState`  | Classe privée qui contient les données et la logique du widget |
| `State<MonWidgetStateful>` | Indique à quel widget le `State` est associé                   |



<br/>
<br/>

# Anenxe 5 - Différence entre un StatefulWidget et son State associé, ainsi que le rôle de setState()

##  Objectif

Construire un bouton interactif qui **compte les clics** et affiche la valeur mise à jour automatiquement.


## Structure du code expliquée

```dart
class MonWidgetStateful extends StatefulWidget {
  @override
  _MonWidgetStatefulState createState() => _MonWidgetStatefulState();
}
```

### 1. `StatefulWidget` – Le composant avec état

* `MonWidgetStateful` est un **widget avec état** (*stateful*).
* Il ne **gère pas directement l’état** lui-même, mais délègue cette responsabilité à une classe `State`.
* La méthode `createState()` crée une instance de cette classe d’état.

C’est **Flutter** qui appelle `createState()` une seule fois pour **initialiser** le widget.

---

```dart
class _MonWidgetStatefulState extends State<MonWidgetStateful> {
  int compteur = 0;
```

### 2. `_MonWidgetStatefulState` – La logique interne (l'état)

* C’est ici que **l’état du widget est stocké** (`compteur` ici).
* Le préfixe `_` indique que cette classe est **privée**, c’est une bonne pratique.
* Elle **étend `State<MonWidgetStateful>`**, ce qui signifie que cette classe est liée à ce widget particulier.

---

```dart
@override
Widget build(BuildContext context) {
```

### 3. `build()` – La méthode qui construit l’interface

* `build()` est **automatiquement appelée** chaque fois que l’état change.
* Elle retourne un widget Flutter (ici un `ElevatedButton`).

---

```dart
return ElevatedButton(
  onPressed: () {
    setState(() {
      compteur++;
    });
  },
  child: Text("Compteur : $compteur"),
);
```

###  4. `setState()` – Le cœur du mécanisme

* Quand on appuie sur le bouton, on appelle `setState()`.
* Cela **indique à Flutter** : “Quelque chose a changé, je veux reconstruire l’interface”.
* `compteur++` incrémente la valeur.
* Ensuite `build()` est **reconvoqué automatiquement**, donc le texte est mis à jour.



## Résumé du cycle

1. Flutter affiche le widget avec `compteur = 0`.
2. L’utilisateur clique.
3. `setState()` est appelé, `compteur` devient `1`.
4. Flutter **reconstruit le widget** avec le nouveau texte.



## À retenir 

* `StatefulWidget` = le *coffre*, qui délègue la gestion de l'état.
* `State` = la *logique interne* et les données modifiables.
* `setState()` = déclenche le **rafraîchissement de l'interface**.
* Sans `setState()`, même si la variable change, **l'interface ne se mettra pas à jour**.




