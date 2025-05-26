

# 1. Qu’est-ce qu’un `StatelessWidget` ?

Un `StatelessWidget` est un **composant d’interface utilisateur** qui ne change **jamais** pendant que l'application fonctionne. On l’utilise pour afficher **quelque chose de fixe**.

Exemple :

```dart
Text("Bonjour !") // Ce texte ne changera jamais tant qu'on ne redémarre pas l'appli.
```

Exemple complet :

```dart
class MonTitre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Bienvenue !");
  }
}
```

Ce widget affichera toujours le texte "Bienvenue !". Il ne peut **pas réagir à un clic ou à une action**. Il est "statique".


```
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp()); // ← ICI : on peut mettre const si MonApp est const-compatible
}

class MonApp extends StatelessWidget {
  const MonApp({super.key}); // ← Constructor marqué const, nécessaire pour runApp(const MonApp())

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Ma première fenêtre"), // ← const ici car Text est immuable
        ),
        body: const Center(
          child: Text("Bonjour !"), // ← const car aucun état ne change ici
        ),
      ),
    );
  }
}
```


# 2. Et son inverse ? C’est un `StatefulWidget`

Un `StatefulWidget` est un widget qui peut **changer d’apparence ou de contenu** pendant que l’application fonctionne.

On l’utilise par exemple pour :

* faire changer un texte quand on clique sur un bouton
* afficher ou masquer un élément
* réagir à une saisie utilisateur
* mettre à jour l’écran à partir de données dynamiques



### Tableau comparatif

| Type de widget    | Peut changer ? | À utiliser pour...                      |
| ----------------- | -------------- | --------------------------------------- |
| `StatelessWidget` | Non            | Affichage simple, fixe                  |
| `StatefulWidget`  | Oui            | Interactions, changements, mises à jour |


# 3. La méthode `build()`

Que ce soit un `StatelessWidget` ou un `StatefulWidget`, on doit toujours définir une méthode `build()`.

Cette méthode dit à Flutter :

> "Voici ce que je veux afficher à l’écran."

Pour un `StatefulWidget`, à chaque fois qu’on appelle `setState()`, Flutter **reconstruit** l’interface en réexécutant `build()`.



# 4. Explication du code Flutter simple

Voici un exemple de base :

```dart
class MonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Ma première fenêtre")),
        body: Center(child: Text("Bonjour !")),
      ),
    );
  }
}
```

### Ligne par ligne

```dart
class MonApp extends StatelessWidget {
```

Tu crées un widget (composant visuel) **qui ne changera jamais**.

```dart
@override
Widget build(BuildContext context) {
```

C’est ici que tu construis ce que l’utilisateur verra à l’écran.

```dart
return MaterialApp(
```

Tu dis : "Je veux créer une application Flutter avec le style Material Design (comme les applis Android)."

```dart
home: Scaffold(
```

Tu définis la **page d’accueil** de ton app. Le widget `Scaffold` fournit une structure de base avec :

* une barre en haut (`AppBar`)
* un corps (`body`)
* éventuellement un bouton flottant (`FloatingActionButton`)

```dart
appBar: AppBar(title: Text("Ma première fenêtre")),
```

Tu affiches une **barre de titre** avec le texte "Ma première fenêtre".

```dart
body: Center(child: Text("Bonjour !")),
```

Tu places un texte "Bonjour !" au **centre de l’écran**.


###  child et children

En Flutter, `child` est **une propriété** utilisée dans **de nombreux widgets** pour spécifier **un seul widget enfant**. Elle est très fréquente dans les widgets qui n’acceptent **qu’un seul élément visuel** à l’intérieur.



###  Exemple dans notre code

```dart
body: Center(child: Text("Bonjour !")),
```

* Ici, le widget `Center` est un conteneur qui **centre son enfant** dans l’espace disponible.
* Le mot-clé `child:` indique que l’on place **un seul enfant** à l’intérieur de ce conteneur.
* Cet enfant est ici : `Text("Bonjour !")`.



###  Différence entre `child` et `children`

| Terme      | Type             | Utilisé pour…                                 |
| ---------- | ---------------- | --------------------------------------------- |
| `child`    | Un seul widget   | Quand un widget n’a **qu’un seul enfant**     |
| `children` | Liste de widgets | Quand un widget accepte **plusieurs enfants** |



### Autres exemples de `child`

```dart
Container(
  padding: EdgeInsets.all(16),
  child: Text("Ceci est dans un container"),
)
```



###  Exemples de `children`

```dart
Column(
  children: [
    Text("Ligne 1"),
    Text("Ligne 2"),
  ],
)
```

Ici, `Column` accepte **plusieurs widgets enfants**, donc on utilise `children`.





# 5. Visualisation de la structure

Ce que Flutter affichera :

```
------------------------------
| Ma première fenêtre        | ← AppBar (barre du haut)
------------------------------
|                            |
|         Bonjour !          | ← Texte centré
|                            |
------------------------------
```






## 6. En résumé

* `MaterialApp` = point d’entrée de l’application.
* `Scaffold` = squelette de la page : barre du haut, contenu central, boutons.
* `AppBar` = barre d’en-tête avec un titre.
* `Text` = pour afficher du texte.
* `StatelessWidget` = fixe, ne change pas.
* `StatefulWidget` = dynamique, peut changer en fonction des actions de l’utilisateur.


