
# Méthode 1 - version watch (pas de Consumer)


```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CounterProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => CounterProvider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: context.watch<CounterProvider>().count % 2 == 0
            ? Colors.amber
            : Colors.blue,
        appBar: AppBar(title: const Text("Mon Exercice Provider")),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              color: context.watch<CounterProvider>().count % 2 == 0
                  ? Colors.blue
                  : Colors.amber,
              border: Border.all(color: Colors.black, width: 5),
            ),
            /*child: Consumer<CounterProvider>(
              builder: (context, provider, child) {
                return Text(
                  "Compteur : ${provider.count}",
                  style: TextStyle(fontSize: 30),
                );
              },
            ),*/
            child: Text(
              "Compteur : ${context.watch<CounterProvider>().count}",
              style: TextStyle(fontSize: 30),
            ),
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

<br/>
<br/>

# Méthode 2 - Version Consumer (partielle)

*Ceci est la version **équivalente** de ton code, mais en utilisant **`Consumer<CounterProvider>`** au lieu de `context.watch<CounterProvider>()` :*



###  Version avec `Consumer<CounterProvider>`

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CounterProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Mon Exercice Provider")),
        body: Consumer<CounterProvider>(
          builder: (context, provider, child) {
            return Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: provider.count % 2 == 0 ? Colors.blue : Colors.amber,
                  border: Border.all(color: Colors.black, width: 5),
                ),
                child: Text(
                  "Compteur : ${provider.count}",
                  style: const TextStyle(fontSize: 30),
                ),
              ),
            );
          },
        ),
        backgroundColor: context.watch<CounterProvider>().count % 2 == 0
            ? Colors.amber
            : Colors.blue,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<CounterProvider>().increment();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
```



### Remarques :

* On utilise ici `Consumer<CounterProvider>` uniquement pour la partie `body` (le `Container`) afin d'écouter les changements de valeur du compteur.
* Pour la couleur de fond de la page (`backgroundColor`), on utilise encore `context.watch<CounterProvider>()`. Si tu veux **remplacer aussi ça**, il faudra tout envelopper dans un `Consumer`, y compris la `Scaffold`.



<br/>
<br/>

# Méthode 3 - Version Consumer (complète)


Ceci est la **version complète** où **tout** est intégré dans un unique `Consumer<CounterProvider>`, y compris :

* Le `Scaffold`
* Le `backgroundColor`
* Le `Container` avec le compteur



### Version 100 % `Consumer<CounterProvider>`

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CounterProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<CounterProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            backgroundColor: provider.count % 2 == 0
                ? Colors.amber
                : Colors.blue,
            appBar: AppBar(title: const Text("Mon Exercice Provider")),
            body: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: provider.count % 2 == 0 ? Colors.blue : Colors.amber,
                  border: Border.all(color: Colors.black, width: 5),
                ),
                child: Text(
                  "Compteur : ${provider.count}",
                  style: const TextStyle(fontSize: 30),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                provider.increment();
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
```



###  Résumé :

* **Un seul `Consumer<CounterProvider>`** englobe toute l'interface.
* Le `provider` est utilisé partout dans le `builder`.
* Le `FloatingActionButton` appelle `provider.increment()`.




<br/>
<br/>


# Comparaison 1


## <h1 id="comparaison-provider">Comparaison des trois méthodes Provider</h1>

| Critère                               | Méthode 1 – `watch` partout               | Méthode 2 – `Consumer` partiel             | Méthode 3 – `Consumer` global                       |
| ------------------------------------- | ----------------------------------------- | ------------------------------------------ | --------------------------------------------------- |
| **Lisibilité**                        | Moyenne : duplication fréquente           | Bonne : code plus centralisé               | Bonne : tout est centralisé dans un seul bloc       |
| **Performance**                       | Moins optimale : redessine tout `build()` | Optimisée : seul le widget dans `Consumer` | Optimisée : on contrôle le `rebuild` de toute la UI |
| **Modularité**                        | Faible : pas facile à extraire des blocs  | Moyenne : logique séparée pour une section | Moyenne : tout est lié dans un seul `builder`       |
| **Facilité d'écriture**               | Très simple pour débutant                 | Moyennement simple                         | Un peu plus verbeux mais logique                    |
| **Réactivité au changement d’état**   | Oui (via `watch`)                         | Oui (via `Consumer`)                       | Oui (via `Consumer`)                                |
| **Risque de rebuild non nécessaires** | Élevé : tout le `build()` est reconstruit | Faible : seul `Consumer` reconstruit       | Contrôlé : dépend du design du `builder`            |
| **Accès direct au provider**          | context.watch / context.read              | `provider` passé dans le builder           | `provider` passé dans le builder                    |
| **Meilleur cas d’usage**              | Pour de très petits widgets ou tests      | Pour isoler des parties réactives          | Pour contrôler toute la logique dans un seul bloc   |



## En résumé :

* **Méthode 1 – `watch` :** pratique mais dangereuse si utilisée dans toute l’arborescence ; chaque changement redessine **tout**.
* **Méthode 2 – `Consumer` partiel :** un bon compromis. Le `Scaffold` ne bouge pas, seul le `body` est reconstruit.
* **Méthode 3 – `Consumer` global :** adapté si toute la page dépend du provider, ou pour garder tout dans une logique unique.









<br/>
<br/>

# Comparaison 2

# <h1 id="comparaison-lignes-provider">Comparaison ligne par ligne : injection, écoute, accès</h1>

| Élément                                            | Méthode 1 – `watch`                                                                                                                                    | Méthode 2 – `Consumer` partiel                                                                                              | Méthode 3 – `Consumer` global                                                                                                        |
| -------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| **Injection Provider** (`ChangeNotifierProvider`)  | `main()` ligne 6–7                                                                                                                                     | `main()` ligne 6–7                                                                                                          | `main()` ligne 6–7                                                                                                                   |
| **Accès valeur (`count`)**                         | `context.watch<CounterProvider>().count` à **3 endroits** :<br>- `backgroundColor` (ligne 16)<br>- `Container.color` (ligne 24)<br>- `Text` (ligne 29) | `provider.count` via `Consumer` dans le `body` (ligne 19) <br>Mais `context.watch` encore pour `backgroundColor` (ligne 16) | `provider.count` **partout**, y compris :<br>- `backgroundColor` (ligne 12)<br>- `Container.color` (ligne 22)<br>- `Text` (ligne 27) |
| **Accès méthode (`increment()`)**                  | `context.read<CounterProvider>().increment()` (ligne 34)                                                                                               | `context.read<CounterProvider>().increment()` (ligne 34)                                                                    | `provider.increment()` (ligne 31)                                                                                                    |
| **Inscription à l’écoute (`watch` ou `Consumer`)** | `watch` utilisé **plusieurs fois** dans tout le widget `build()`                                                                                       | `Consumer` utilisé **localement** dans le `body`                                                                            | `Consumer` entoure **tout le widget `Scaffold`**                                                                                     |
| **Zone affectée par les changements**              | Toute la méthode `build()` est reconstruite à chaque `notifyListeners()`                                                                               | Seul le `body` est reconstruit via `Consumer`                                                                               | Tout le `Scaffold` est reconstruit via `Consumer`                                                                                    |



## Visualisation rapide par couleur :

| Élément du widget        | Méthode 1 (`watch`) | Méthode 2 (`Consumer` partiel) | Méthode 3 (`Consumer` global) |
| ------------------------ | ------------------- | ------------------------------ | ----------------------------- |
| `backgroundColor`        | via `context.watch` | via `context.watch`            | via `provider.count`          |
| `Container.color`        | via `context.watch` | via `provider.count`           | via `provider.count`          |
| `Text("Compteur : ...")` | via `context.watch` | via `provider.count`           | via `provider.count`          |
| `FAB` `onPressed`        | via `context.read`  | via `context.read`             | via `provider.increment()`    |



## Conclusion :

* **Méthode 1** disperse les appels à `watch`, ce qui fragilise les performances.
* **Méthode 2** centralise l'écoute uniquement là où c'est nécessaire (`body`) tout en gardant le reste stable.
* **Méthode 3** place toute la logique dans un seul `Consumer`, ce qui est très clair mais impose de reconstruire tout le `Scaffold`.

