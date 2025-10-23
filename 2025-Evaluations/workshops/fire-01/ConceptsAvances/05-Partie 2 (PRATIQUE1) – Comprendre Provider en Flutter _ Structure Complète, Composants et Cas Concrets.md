# Comprendre Provider en Flutter


## 1. Pourquoi utiliser `Provider` ?

Dans une application Flutter, les données changent souvent : un compteur qui augmente, une liste de favoris, un panier d’achats, un profil utilisateur, etc.

Le problème : comment partager ces données **entre plusieurs écrans**, sans devoir les envoyer manuellement de widget en widget (ce qu’on appelle du "prop drilling") ?

La solution : un système central qui **garde les données à jour** et **prévient l’interface** dès qu’il y a un changement.
C’est exactement ce que `Provider` permet.



## 2. Analogie simple : une radio dans une maison

Imagine une maison avec plusieurs pièces.
Dans le salon, il y a une **radio centrale** qui annonce les infos importantes.

* Les pièces qui écoutent la radio **sont au courant dès qu’il y a un changement**.
* Si une info change (exemple : le nombre de personnes dans la maison), la radio annonce la nouvelle, et les pièces se mettent à jour.

> En Flutter, cette "radio" est représentée par une classe `ChangeNotifier`.
> Les pièces qui l’écoutent sont des `Consumer`.



## 3. Composants du Provider

Voici les **éléments de base** pour utiliser le système Provider :

| Élément Flutter          | Rôle                                                              |
| ------------------------ | ----------------------------------------------------------------- |
| `ChangeNotifier`         | Classe qui contient les données et peut émettre des notifications |
| `ChangeNotifierProvider` | Fournisseur : rend la donnée disponible dans toute l’application  |
| `Consumer`               | Lit les données et se reconstruit automatiquement quand ça change |
| `notifyListeners()`      | Méthode qui déclenche la reconstruction des `Consumer` abonnés    |



## 4. Cas concret : un compteur

### Objectif

Créer une application avec :

* Un nombre affiché (compteur)
* Un bouton pour l’augmenter
* Une mise à jour automatique de l’interface


### Étape 1 : Créer la classe du Provider

```dart
import 'package:flutter/material.dart';

// Cette classe contient notre donnée : le compteur
class CounterProvider extends ChangeNotifier {
  int _count = 0;

  // Getter pour accéder à la valeur actuelle
  int get count => _count;

  // Méthode pour augmenter la valeur
  void increment() {
    _count++;
    notifyListeners(); // Avertit les widgets écoutant qu’il y a eu un changement
  }
}
```



### Étape 2 : Fournir cette classe à l’application entière

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: MyApp(),
    ),
  );
}
```



### Étape 3 : Utiliser la donnée dans l’interface

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Exemple Provider")),
        body: Center(
          child: Consumer<CounterProvider>(
            builder: (context, provider, child) {
              return Text(
                'Compteur : ${provider.count}',
                style: TextStyle(fontSize: 30),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<CounterProvider>().increment();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
```



## 5. Détails importants à comprendre

### `notifyListeners()`

Cette méthode est **le signal d’alerte**. Elle indique que les données ont changé.
Tous les widgets qui utilisent `Consumer` vont être reconstruits automatiquement.



### `Consumer`

Widget spécial qui **écoute un Provider**.
Quand les données changent, ce widget est reconstruit.

```dart
Consumer<MonProvider>(
  builder: (context, monProvider, child) {
    return Text(monProvider.maValeur);
  },
)
```



### `context.read<T>()` vs `context.watch<T>()`

| Méthode             | Sert à quoi ?                                        | Déclenche reconstruction ? |
| ------------------- | ---------------------------------------------------- | -------------------------- |
| `read<Provider>()`  | Lire une donnée une seule fois (ex : dans onPressed) | Non                        |
| `watch<Provider>()` | Lire et écouter les changements                      | Oui                        |



## 6. Exemple intermédiaire : favoris avec Firestore

Dans une app de recettes, on souhaite :

* ajouter ou retirer une recette des favoris
* sauvegarder ces données dans Firestore
* mettre à jour automatiquement l’interface



### Étapes :

1. Créer `FavoriteProvider` avec Firestore.
2. Utiliser `toggleFavorite()` pour ajouter ou retirer une recette.
3. Utiliser `Consumer` dans la vue pour afficher un cœur rouge ou gris selon l’état.



## 7. Tableau comparatif : outils d’état en Flutter

| Outil        | Difficulté | Pour quoi faire ?                              |
| ------------ | ---------- | ---------------------------------------------- |
| `setState()` | Facile     | Petite appli avec un seul écran                |
| `Provider`   | Moyen      | Appli à plusieurs écrans, besoin de partage    |
| `Riverpod`   | Avancé     | Gestion plus fine, testable, scalable          |
| `Bloc`       | Difficile  | Architecture d’entreprise avec logique séparée |



## 8. Résumé final

* `Provider` sert à **centraliser les données** de votre app.
* Il vous évite de **passer les valeurs manuellement** entre widgets.
* Il permet une **interface réactive**, qui se met à jour toute seule.
* Il est facile à mettre en place pour des débutants dès que le projet grossit.


