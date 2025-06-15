# <h1 id="definition"> Définition</h1>

```dart
Future<T>
```

* `Future` est un **objet asynchrone**.
* Il est de type `Future<T>` où `T` est le **type de la valeur attendue** (ex : `String`, `int`, `List`, etc.).
* Il permet d’attendre le résultat **sans bloquer** le reste du programme.



## <h1 id="exemple-simple"> Exemple simple</h1>

```dart
Future<String> getMessage() async {
  return "Bonjour depuis le futur!";
}
```

Ici, `getMessage()` retourne un `Future<String>`. Cela veut dire que la **valeur n’est pas encore disponible**, mais le sera bientôt.



## <h1 id="utilisation">💡 Utilisation</h1>

### Avec `then()`

```dart
getMessage().then((message) {
  print(message); // affiche : Bonjour depuis le futur!
});
```

### Avec `async/await`

```dart
void main() async {
  String msg = await getMessage();
  print(msg); // affiche : Bonjour depuis le futur!
}
```

>  `await` attend que le `Future` soit résolu. Il ne peut être utilisé que dans une fonction marquée `async`.



## <h1 id="etat"> Les états d’un Future</h1>

Un `Future` peut être dans un de ces 3 états :

| État          | Description                                   |
| ------------- | --------------------------------------------- |
| `uncompleted` | En attente d’un résultat                      |
| `completed`   | Le résultat est disponible                    |
| `error`       | Une erreur s’est produite pendant l’exécution |



## <h1 id="erreurs"> Gestion des erreurs</h1>

### Avec `try/catch`

```dart
Future<String> fetchData() async {
  throw Exception("Erreur réseau");
}

void main() async {
  try {
    String data = await fetchData();
    print(data);
  } catch (e) {
    print("Une erreur : $e");
  }
}
```



## <h1 id="syntaxe-complete"> Exemple complet</h1>

```dart
Future<String> fetchUser() async {
  await Future.delayed(Duration(seconds: 2));
  return "Utilisateur chargé";
}

void main() async {
  print("Chargement...");
  String user = await fetchUser();
  print(user); // s'affiche après 2 secondes
}
```

---

## <h1 id="conclusion"> Conclusion</h1>

* `Future` = **valeur qui arrivera plus tard**.
* Il est **non bloquant**, ce qui est essentiel pour les applis mobiles.
* Utilisez `async`/`await` pour du code lisible.
* Gérez les erreurs avec `try/catch`.

