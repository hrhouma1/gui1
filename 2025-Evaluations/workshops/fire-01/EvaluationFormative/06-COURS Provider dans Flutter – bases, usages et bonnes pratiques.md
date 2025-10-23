# Cours complet : Provider dans Flutter – bases, usages et bonnes pratiques

- L’objectif est de présenter **Provider**, d’expliquer comment partager un état avec `ChangeNotifier`, et de détailler **les deux grandes manières d’écouter l’état : `context.watch` et `Consumer`**. 
- Le contenu est volontairement exhaustif pour poser des fondations solides.

---

## 1. Pourquoi Provider ?

1. **Problème résolu** : passer un même objet d’état à de nombreux widgets sans « prop drilling » (passage d’arguments de parent en enfant).
2. **Solution** : placer l’état dans un objet (`ChangeNotifier`), l’injecter dans l’arbre de widgets avec `ChangeNotifierProvider` et le consommer où l’on veut.
3. **Avantages** : API simple, intégration native à Flutter, approche réactive (mise à jour automatique de l’interface).

---

## 2. Les rôles des classes clés

| Élément                  | Rôle                                                                  | Méthodes importantes                                 |
| ------------------------ | --------------------------------------------------------------------- | ---------------------------------------------------- |
| `ChangeNotifier`         | Stocke l’état mutable et signale les modifications.                   | `notifyListeners()`                                  |
| `ChangeNotifierProvider` | Fait connaître un `ChangeNotifier` à tout le sous-arbre de widgets.   | `create`, `child`                                    |
| `BuildContext`           | Point d’entrée pour accéder au Provider depuis n’importe quel widget. | `watch`, `read`, `select`                            |
| `Consumer<T>`            | Écoute un Provider et reconstruit son `builder` à chaque changement.  | `builder`, `child` (widget statique non reconstruit) |

---

## 3. Étape par étape : implémenter un compteur

### 3.1. Créer la classe d’état

```dart
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // avertit tous les auditeurs
  }
}
```

### 3.2. Injecter l’état dans l’arbre

```dart
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: const MyApp(),
    ),
  );
}
```

---

## 4. Deux grandes façons d’écouter l’état

### 4.1. Méthode 1 : `context.watch<T>()`

```dart
class CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final value = context.watch<CounterProvider>().count;
    return Text('Compteur : $value', style: const TextStyle(fontSize: 28));
  }
}
```

* **Fonctionnement** : `watch` souscrit au Provider **au moment précis où il est appelé** ; si `notifyListeners()` est déclenché, **le widget qui appelle `watch` est reconstruit en entier**.
* **Avantages** : syntaxe concise, facile à lire.
* **Limites** : si l’appel est fait à un niveau élevé (par exemple en haut d’une `Scaffold`), un changement d’état reconstruit potentiellement un grand sous-arbre, ce qui peut être coûteux.

### 4.2. Méthode 2 : `Consumer<T>`

```dart
class CounterBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
      builder: (context, provider, child) {
        return Center(
          child: Text('Compteur : ${provider.count}',
              style: const TextStyle(fontSize: 28)),
        );
      },
    );
  }
}
```

* **Fonctionnement** : seul le contenu du `builder` est reconstruit quand l’état change.
* **Avantages** : permet de **limiter la zone reconstruite** à un sous-arbre précis ; utile dans les écrans complexes.
* **Limites** : code plus verbeux ; on multiplie les widgets si l’on abuse de `Consumer`.

---

## 5. Comparaison synthétique

| Critère             | `context.watch`               | `Consumer<T>`                    |
| ------------------- | ----------------------------- | -------------------------------- |
| Syntaxe             | Très courte                   | Plus verbeuse (closure)          |
| Zone de rebuild     | Widget contenant l’appel      | Uniquement le `builder`          |
| Usage recommandé    | Petits widgets, valeur unique | Sections complexes, optimisation |
| Inconvénient majeur | Peut reconstruire trop large  | Verbosité + widgets imbriqués    |

---

## 6. Autres méthodes d’accès

| Méthode                          | Usage                                                                                     | Rebuild déclenché ?                        |
| -------------------------------- | ----------------------------------------------------------------------------------------- | ------------------------------------------ |
| `context.read<T>()`              | Appeler une méthode du Provider (ex. `increment()`)                                       | Non                                        |
| `context.select<T, R>(selector)` | Écouter un **champ précis** ; ne reconstruit que si la valeur de retour change selon `==` | Oui, mais seulement si la sélection change |
| `Selector<T, R>` widget          | Variante widget de `select`                                                               | Oui, zone limitée au `builder`             |

---

## 7. Exemple complet combinant les deux approches

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Provider')),
        // 1. couleur du fond avec watch (simple, acceptable ici)
        backgroundColor: context.watch<CounterProvider>().count.isEven
            ? Colors.amber
            : Colors.blue,
        // 2. corps optimisé avec Consumer (rebuild limité)
        body: Consumer<CounterProvider>(
          builder: (_, provider, __) => Center(
            child: Text('Compteur : ${provider.count}',
                style: const TextStyle(fontSize: 34)),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // appel de méthode sans écoute : read
          onPressed: () =>
              context.read<CounterProvider>().increment(),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
```

---

## 8. Impacts sur la performance

1. **Éviter** de placer `watch` dans la racine d’un gros widget arbitraire.
2. **Préférer** `Consumer` ou `select` pour les éléments qui changent souvent.
3. **Garder** le `Scaffold`, l’`AppBar` ou les animations hors des reconstructions inutiles.
4. **Mesurer** avec le DevTools (`Performance` et `Widget rebuild stats`) pour identifier les hot-spots.

---

## 9. Bonnes pratiques récapitulatives

1. **Une seule source de vérité** : stocker l’état dans le Provider, éviter les duplications de variables.
2. **`read()` pour agir, `watch`/`Consumer` pour afficher** : garder cette distinction claire.
3. **`Consumer` minimal** : entourer uniquement la partie qui change, pas plus.
4. **`select` pour champs isolés** : écouter un booléen, un int ou un sous-objet, pas tout le Provider.
5. **Tester** : vérifier que les rebuilds restent raisonnables quand on déclenche `notifyListeners()` dans des scenarios réalistes.

---

## 10. Exercices proposés

1. **Exercice 1 – Compteur couleur alternée**

   * Modifier la couleur d’un bouton selon la parité du compteur en utilisant `watch`.
2. **Exercice 2 – Liste dynamique**

   * Créer un `TodoProvider` avec une liste de tâches et afficher la liste via `Consumer`.
3. **Exercice 3 – Sélecteur**

   * Ajouter un champ `hasCompletedTodos` dans le `Provider` et n’écouter que ce champ avec `select` pour changer la couleur d’une icône.

---

## 11. Conclusion

Provider offre deux accès principaux à l’état : **`watch`** (lecture simple, rebuild large) et **`Consumer`** (écoute optimisée d’un sous-arbre). Le choix dépend de la taille du widget et de la fréquence des mises à jour. Bien comprendre cette différence permet de construire des interfaces performantes et maintenables dès les premiers projets.


<br/>
<br/>

# Résumé:

- Nous avons appris:

* Ce qu’est `Provider` dans Flutter
* Comment partager un état avec `ChangeNotifier`
* Comment consommer l’état de deux manières différentes :

  * avec `context.watch`
  * avec `Consumer`
* Quand choisir l’une ou l’autre méthode
* Comprendre les implications sur la performance

---

## <h2 id="1-provider-contexte">1. Contexte : pourquoi utiliser Provider ?</h2>

Flutter propose plusieurs techniques pour **partager un état** (ex: compteur, thème, utilisateur connecté) entre plusieurs widgets.
`Provider` est l’un des moyens les plus simples et puissants de le faire proprement.

---

## <h2 id="2-architecture-provider">2. Architecture d’une application avec Provider</h2>

Voici les étapes pour utiliser `Provider` :

1. Créer une **classe d’état** (ex: `CounterProvider`) qui hérite de `ChangeNotifier`.
2. Envelopper votre app avec `ChangeNotifierProvider` dans `main.dart`.
3. Lire ou modifier l’état avec :

   * `context.watch<T>()`
   * `context.read<T>()`
   * ou `Consumer<T>`

---

## <h2 id="3-classe-provider">3. Exemple simple de classe Provider</h2>

```dart
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners(); // avertit tous les widgets abonnés
  }
}
```

---

## <h2 id="4-injection-provider">4. Injection du Provider</h2>

Dans `main.dart`, on fournit notre provider à l’application via `ChangeNotifierProvider` :

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

---

## <h2 id="5-consommation-watch">5. Méthode 1 : Lire avec `context.watch()`</h2>

### Exemple

```dart
Text(
  "Compteur : ${context.watch<CounterProvider>().count}",
  style: TextStyle(fontSize: 30),
)
```

* 🔍 Cette méthode **écoute** automatiquement le Provider.
* **Dès que `notifyListeners()` est appelé**, le widget **qui appelle `watch()` est reconstruit**.

---

## <h2 id="6-consommation-consumer">6. Méthode 2 : Lire avec `Consumer`</h2>

### Exemple

```dart
Consumer<CounterProvider>(
  builder: (context, provider, child) {
    return Text(
      "Compteur : ${provider.count}",
      style: TextStyle(fontSize: 30),
    );
  },
)
```

* `Consumer` prend un `builder` avec accès direct à l’objet Provider (`provider`)
* Cela permet de **limiter les rebuilds** à une petite zone précise
* Plus **performant** dans les interfaces complexes

---

## <h2 id="7-comparaison">7. Comparaison : `watch` vs `Consumer`</h2>

| Critère                                 | `context.watch()`                      | `Consumer<T>`                          |
| --------------------------------------- | -------------------------------------- | -------------------------------------- |
| **Syntaxe**                             | Plus courte                            | Un peu plus verbeuse                   |
| **Rebuilds**                            | Tout le widget où `watch()` est appelé | Uniquement le `builder` du `Consumer`  |
| **Clarté pour débutant**                | Plus facile                            | Plus technique mais mieux à long terme |
| **Performance dans les grands widgets** | Moins bonne                            | Meilleure : scope limité               |
| **Lisibilité globale**                  | OK pour petit widget                   | Préféré pour structurer des composants |

---

## <h2 id="8-bonnes-pratiques">8. Bonnes pratiques</h2>

* ✅ Utiliser `watch` pour des **valeurs simples dans des petits widgets**
* ✅ Utiliser `Consumer` pour **éviter des rebuilds globaux**
* ❌ Éviter d’appeler `watch()` plusieurs fois dans un grand `build()`
* ✅ Utiliser `read()` quand on veut juste appeler une méthode sans écouter l’état

---

## <h2 id="9-exercice-simple">9. Exercice guidé</h2>

Créer une application Flutter avec :

* Un compteur géré via `CounterProvider`
* Un bouton `+` qui appelle `increment()` via `context.read`
* Un affichage du compteur :

  * d'abord avec `context.watch`
  * puis avec `Consumer`


