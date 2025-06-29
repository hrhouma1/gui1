
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



### ✅ Version avec `Consumer<CounterProvider>`

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

---

### ✅ Version 100 % `Consumer<CounterProvider>`

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

---

###  Résumé :

* **Un seul `Consumer<CounterProvider>`** englobe toute l'interface.
* Le `provider` est utilisé partout dans le `builder`.
* Le `FloatingActionButton` appelle `provider.increment()`.




<br/>
<br/>


# Comparaison

