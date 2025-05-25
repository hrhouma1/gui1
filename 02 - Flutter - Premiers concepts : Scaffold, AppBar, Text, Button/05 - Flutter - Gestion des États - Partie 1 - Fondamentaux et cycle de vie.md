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
