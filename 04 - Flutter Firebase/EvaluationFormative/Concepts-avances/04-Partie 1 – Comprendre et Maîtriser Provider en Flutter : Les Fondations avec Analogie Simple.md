# **C’est quoi un Provider ?**

Imagine que ton application Flutter, c’est une maison.
Dans cette maison, il y a plusieurs pièces : salon, cuisine, salle de bain.

Chacune de ces pièces (widgets) a besoin d’informations :

* combien de personnes sont dans la maison ?
* est-ce qu’on aime le chocolat ?
* est-ce qu’on a cliqué sur le bouton “favori” ?

Mais… **si quelqu’un change une information** (par exemple, il y a maintenant 2 personnes dans la maison),
on veut que **toutes les pièces soient au courant** sans devoir tout reconstruire manuellement.

👉 **C’est ça le rôle du `Provider`**.



##  **Analogie ultra simple**

Imagine :

* Il y a **un tableau blanc** à l’entrée de la maison (le `Provider`)
* Tout le monde peut **lire** ce qu’il y a dessus (nombre de personnes, préférences, etc.)
* Quand quelqu’un **change une info** sur le tableau (ex : on ajoute une personne), on crie dans la maison :

> 🔊 “Hey tout le monde ! Il y a une mise à jour !”

Et toutes les pièces qui **écoutaient** ce tableau vont se mettre à jour.



## **Exemple très simple : un compteur**

Tu as un bouton qui augmente un nombre.
Ce nombre s’appelle “compteur”.

**Sans Provider** :
Tu passes la valeur de widget en widget, comme si tu faisais une chaîne humaine. C’est vite le bordel.

**Avec Provider** :
Tu crées un `CounterProvider` qui garde la valeur, et tout le monde peut y accéder.



##  **Code (très simple)**

### 1. Crée la classe qui garde l’information (le tableau blanc)

```dart
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // On crie : “Y a une mise à jour !”
  }
}
```

### 2. Fournis cette info à toute l’app

```dart
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: MyApp(),
    ),
  );
}
```

### 3. Dans ton interface, tu accèdes à l’info :

```dart
Consumer<CounterProvider>(
  builder: (context, provider, child) {
    return Text('Compteur : ${provider.count}');
  },
);
```

Et pour le bouton :

```dart
ElevatedButton(
  onPressed: () => context.read<CounterProvider>().increment(),
  child: Text('Ajouter'),
)
```



##  **Mots simples à retenir**

| Mot               | Explication                        |
| ----------------- | --------------------------------------------------------- |
| Provider          | Endroit où on stocke des infos pour tout le monde         |
| Consumer          | Quelqu’un qui lit ces infos et réagit s’il y a changement |
| notifyListeners() | Le cri qui dit : “J’ai changé !”                          |
| read()            | Lire une fois, pas de mise à jour automatique             |
| watch()           | Lire + se mettre à jour si ça change                      |



##  Pourquoi c’est puissant ?

* Tu évites de passer des variables partout
* Tu peux garder des infos partagées (comme un panier, des favoris…)
* Tu peux construire des apps **qui réagissent toutes seules** quand une info change



## Bonus : Provider ≠ Firebase

`Provider` est un **mécanisme d’état** local à ton app.
Tu peux l’utiliser **avec ou sans Firebase**.

Mais souvent, tu :

* récupères les données **depuis Firestore**
* les **stockes dans un Provider**
* et tu laisses l’app s’en servir (favoris, recettes, utilisateurs, etc.)


