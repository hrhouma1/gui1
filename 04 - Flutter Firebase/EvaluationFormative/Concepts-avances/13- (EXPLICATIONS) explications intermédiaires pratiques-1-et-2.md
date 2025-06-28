# 1 - Modes de flutter run

```
flutter run
flutter run --debug
flutter run --profile
flutter run --release
```

La commande `flutter run` **par défaut** lance ton application en **mode debug**, donc :

```
flutter run
```

est **équivalent** à :

```
flutter run --debug
```

Il n'y a **pas de différence** entre les deux dans ce cas précis.



### Explication des différents modes

Flutter offre **trois modes de compilation** :

| Mode    | Commande explicite                     | Caractéristiques principales                                                                                     |
| ------- | -------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| Debug   | `flutter run` ou `flutter run --debug` | - Hot reload activé 🔥<br>- Affichage de la console <br>- Symboles de debug et assertions activés                |
| Profile | `flutter run --profile`                | - Optimisé, mais avec certains outils de performance<br>- Pas de hot reload                                      |
| Release | `flutter run --release`                | - Code compilé au maximum<br>- Aucun outil de debug, aucun log, aucun hot reload<br>- Utilisé pour la production |


<br/>

###  Autres options utiles avec `flutter run`

Voici quelques options **complémentaires** à `flutter run` :

| Option                   | Description                                                                    |
| ------------------------ | ------------------------------------------------------------------------------ |
| `--release`              | Compile et lance en mode production                                            |
| `--profile`              | Lance en mode profilage (pour mesurer performances)                            |
| `--flavor nom`           | Utilise une variante (`flavor`) spécifique                                     |
| `-d device_id`           | Spécifie le périphérique cible                                                 |
| `--verbose`              | Affiche **tous** les logs (très verbeux)                                       |
| `--no-sound-null-safety` | Pour ignorer la sécurité nulle (utile si certaines libs ne sont pas null-safe) |

<br/>

### Résumé

* `flutter run` = `flutter run --debug` → **aucune différence**
* Ce sont juste deux façons de dire **"lance l'app en mode debug"**
* Les autres options (`--release`, `--profile`, etc.) changent le comportement de build et d'exécution.


## Exercices :

Je vous propose de chercher des exemples avec le build time, logs, taille d'APK, hot reload.





<br/>

# 2 - Frameworks de tests intégrés  dans Flutter



En Flutter, il existe **trois grands types de tests** avec leurs **frameworks intégrés** ou compatibles. Voici un résumé clair et structuré :



## <h1 id="types-tests-flutter">🔍 1. Types de tests Flutter</h1>

| Type de test         | Objectif principal                                | Exemple                                        |
| -------------------- | ------------------------------------------------- | ---------------------------------------------- |
| **Unit Test**        | Tester une fonction ou classe isolée              | Tester un `Calculator.add()`                   |
| **Widget Test**      | Tester un widget Flutter (UI + interactions)      | Vérifier qu’un bouton est visible et cliquable |
| **Integration Test** | Tester l’app complète dans un simulateur/appareil | Tester une suite de navigation entre pages     |

---

## <h1 id="frameworks-tests-flutter">🧪 2. Frameworks de test Flutter</h1>

### 2.1. **flutter\_test** (officiel, pour tests unitaires et widget)

* **Déjà inclus** dans Flutter.
* Permet de tester :

  * Fonctions
  * Widgets (avec `WidgetTester`)
* Basé sur `package:test` (le framework Dart de base)

```dart
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('addition fonctionne', () {
    expect(2 + 3, 5);
  });
}
```

---

### 2.2. **integration\_test** (officiel pour tests d’intégration)

* Permet de lancer **des tests complets sur simulateur ou appareil réel**.
* Écrit comme une app complète.
* Permet :

  * Interactions utilisateur
  * Navigation
  * Performance

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('test complet', (WidgetTester tester) async {
    // Build and test your app end-to-end
  });
}
```

---

### 2.3. **Mockito** (mocking)

* Utilisé avec `flutter_test` pour **simuler des objets externes**
* Pratique pour isoler les tests unitaires (ex: simuler une API)

```yaml
dev_dependencies:
  mockito: ^5.0.0
  build_runner: ^2.0.0
```

---

### 2.4. **flutter\_driver** (obsolète)

* Ancien framework de test d’intégration
* **Déprécié** en faveur de `integration_test`

---

### 2.5. Autres outils compatibles

| Nom                 | Utilisation principale        |
| ------------------- | ----------------------------- |
| **test**            | Tests Dart (backend, logique) |
| **golden\_toolkit** | Tests visuels pixel-par-pixel |
| **mocktail**        | Alternative à `mockito`       |

---

## <h1 id="conclusion-tests">✅ Conclusion</h1>

| Type de test          | Framework principal             |
| --------------------- | ------------------------------- |
| Test unitaire         | `flutter_test` (`test`)         |
| Test widget           | `flutter_test` + `WidgetTester` |
| Test d’intégration    | `integration_test`              |
| Mocking               | `mockito`, `mocktail`           |
| Test visuel (UI fixe) | `golden_toolkit`                |



<br/>

# 3 - Hot Reload et Hot Restart 


*Différence claire entre **Hot Reload** et **Hot Restart** en Flutter :*



## <h1 id="diff-hot-reload-restart">🔥 Hot Reload vs Hot Restart</h1>

| Critère                  | 🔁 **Hot Reload**                      | 🔄 **Hot Restart**                                                    |
| ------------------------ | -------------------------------------- | --------------------------------------------------------------------- |
| **Temps**                | Très rapide (quelques ms)              | Un peu plus lent (quelques secondes)                                  |
| **État conservé ?**      | ✅ Oui, l'état (`State`) est conservé   | ❌ Non, tout est réinitialisé                                          |
| **Modifications prises** | UI (build), logique stateless, layout  | Tout : UI, logique, state, `main()`                                   |
| **Quand l’utiliser ?**   | Quand tu modifies du code UI ou layout | Quand tu modifies des variables globales, des `State`, ou le `main()` |
| **Redémarrage app ?**    | Non                                    | Oui, l’app est reconstruite depuis zéro                               |



### 💡 Exemple concret

Supposons que tu as un compteur :

```dart
int _counter = 0;

void _increment() {
  setState(() => _counter++);
}
```

Tu lances l’app, tu cliques 5 fois. Le compteur affiche **5**.

#### ➤ Si tu fais un **Hot Reload** :

* Tu changes un `Text()` ou une couleur dans le build.
* Flutter met à jour le visuel.
* Le compteur reste à **5** ✅

#### ➤ Si tu fais un **Hot Restart** :

* Le code est rechargé depuis zéro.
* Le compteur revient à **0** ❌


## <h2 id="summary">✅ Résumé visuel</h2>

| Action                                             | Hot Reload | Hot Restart |
| -------------------------------------------------- | ---------- | ----------- |
| Conserve l’état (`State`)                          | ✅          | ❌           |
| Recharge le `main()`                               | ❌          | ✅           |
| Rapide                                             | ✅✅         | ✅           |
| Requis après modif `initState`, `main`, global var | ❌          | ✅           |







<br/>

# 4 - Explication d'un bout de code

*Explication ligne par ligne du code avec `ChangeNotifierProvider`*

```dart
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // On crie : “Y a une mise à jour !”
  }
} void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: MyApp(),
    ),
  );
} 
```





```dart
import 'package:flutter/material.dart';
```

➡️ **On importe la bibliothèque Flutter principale**, qui contient tous les widgets (`MaterialApp`, `Scaffold`, `Text`, etc.).

---

```dart
class CounterProvider extends ChangeNotifier {
```

➡️ On crée une **classe** appelée `CounterProvider`.

🔁 Elle **hérite de `ChangeNotifier`**, ce qui permet à la classe de **notifier automatiquement** l’interface quand les données changent.

---

```dart
  int _count = 0;
```

➡️ On déclare une **variable privée** appelée `_count`.

💡 En Dart, le préfixe **underscore `_`** signifie que cette variable est **privée au fichier** → Personne d'autre ne peut y accéder directement de l'extérieur.

---

```dart
  int get count => _count;
```

➡️ Ceci est un **getter**. Il permet de **lire** la valeur de `_count` depuis l'extérieur.

✅ Exemple : dans un widget, on pourra écrire `provider.count` pour obtenir la valeur sans accéder directement à `_count`.

---

```dart
  void increment() {
    _count++;
    notifyListeners(); // On crie : “Y a une mise à jour !”
  }
```

➡️ Fonction appelée quand on veut **incrémenter le compteur**.

* `_count++` : on augmente la valeur de 1.
* `notifyListeners()` : cette commande **alerte tous les widgets** qui écoutent ce provider → "Le compteur a changé ! Rafraîchissez-vous !"

---

```dart
void main() {
```

➡️ C’est le **point d’entrée principal** de toute app Flutter.

---

```dart
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: MyApp(),
    ),
  );
```

➡️ On lance l'application Flutter.

### Détails :

* `ChangeNotifierProvider` : vient du package `provider`. Il **fournit** une instance de `CounterProvider` à tous les widgets enfants.
* `create: (_) => CounterProvider()` : ici, on **crée une instance** de notre classe `CounterProvider`.
* `child: MyApp()` : c’est l’arbre de widgets (l’interface), qui pourra maintenant accéder à `CounterProvider`.



## <h2 id="conclusion">✅ Résumé pédagogique</h2>

| Élément                  | Rôle                                            |
| ------------------------ | ----------------------------------------------- |
| `_count`                 | Compteur privé (underscore = privé)             |
| `get count`              | Permet de lire la valeur en externe             |
| `notifyListeners()`      | Alerte tous les widgets d’un changement         |
| `ChangeNotifier`         | Base qui permet de déclencher des notifications |
| `ChangeNotifierProvider` | Fournit notre classe à toute l’app              |


<br/>

# 6 -  Provider vs Rebuild manuel


*Je vous propose une **explication simple et pédagogique** de la différence entre :*

*  **Utiliser `Provider` (ou `Riverpod`, etc.)** pour gérer l’état centralisé
  vs.
*  **Rebuilder l’application à chaque fois manuellement** sans Provider (via `setState`, par exemple)

---

## <h1 id="comparaison-provider-vs-rebuild">🔍 1. Provider vs Rebuild manuel</h1>

| Aspect                     | **Avec `Provider`**                                 |  **Sans `Provider` (setState partout)**        |
| -------------------------- | ------------------------------------------------------ | ------------------------------------------------ |
|  Gestion de l’état       | Centralisée, réactive                                  | Locale, manuelle                                 |
|  Partage de données      | Facile entre plusieurs widgets                         | Difficile à propager (lifting state up)          |
|  Mise à jour ciblée      | Seuls les widgets concernés se reconstruisent          | Parfois toute la page se reconstruit inutilement |
|  Complexité              | Légèrement plus complexe au début (notion de provider) | Simple au début, mais rapidement ingérable       |
|  Couplage des composants | Faible (grâce à `Provider.of` / `Consumer`)            | Fort (les widgets doivent se connaître)          |
|  Testabilité             | Excellente, test unitaire facile                       | Mauvaise, code imbriqué et dépendant de l’UI     |

---

## <h2 id="exemple-concret">💡 2. Exemple concret de compteur</h2>

### 🔨 Sans Provider : tout dans le même widget

```dart
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$_count'),
        ElevatedButton(
          onPressed: _increment,
          child: Text("Increment"),
        )
      ],
    );
  }
}
```

✅ Simple, mais **le `State` est enfermé ici**. Difficile de partager `_count` ailleurs sans le remonter.



### ✅ Avec Provider

```dart
class CounterProvider extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
```

Puis dans l’app :

```dart
ChangeNotifierProvider(
  create: (_) => CounterProvider(),
  child: MyApp(),
);
```

Et n’importe quel widget peut écouter :

```dart
Consumer<CounterProvider>(
  builder: (context, provider, child) {
    return Text('${provider.count}');
  },
);
```

✅ **Tu peux maintenant partager le compteur dans toute l’app**, sans le “pousser” manuellement.



## <h2 id="quand-utiliser-provider"> 3. Quand utiliser Provider ?</h2>

| Situation                                       | Recommandé                                  |
| ----------------------------------------------- | ------------------------------------------- |
| Petite interface, état local                    | ❌ Pas besoin de Provider, `setState` suffit |
| Plusieurs widgets doivent partager un même état | ✅ Oui, Provider                             |
| Tu veux une app scalable                        | ✅ Absolument                                |
| Tu veux tester la logique séparément            | ✅ Oui, Provider permet ça facilement        |
| Tu veux contrôler l’UI par état global          | ✅ Provider est idéal                        |



## <h2 id="conclusion"> Conclusion pédagogique</h2>

* **Sans Provider** : acceptable pour **des apps simples ou des tests**. Mais vite ingérable.
* **Avec Provider** : la bonne pratique recommandée pour **toute app sérieuse et scalable**.



<br/>

# 7 -  Quand utiliser Provider 

***Quand** et **Pourquoi** tu dois utiliser `Provider` en Flutter ?*



## <h1 id="quand-utiliser-provider"> Quand utiliser `Provider` en Flutter ?</h1>

Tu dois utiliser `Provider` **dès que l'état doit être partagé entre plusieurs widgets**, ou **géré de manière centralisée, réactive et propre**.



## <h2 id="cas-usage"> Cas d’usage concrets</h2>

| Situation                                 | Est-ce que `Provider` est utile ? | Pourquoi ?                                              |
| ----------------------------------------- | --------------------------------- | ------------------------------------------------------- |
| Compteur local dans une seule page        | ❌ Non                             | Un simple `setState()` suffit                           |
| Thème sombre / clair pour toute l’app     | ✅ Oui                             | Il faut que **tous les widgets** y aient accès          |
| Utilisateur connecté (authentification)   | ✅ Oui                             | Son état doit être **accessible partout**               |
| Liste de favoris dans plusieurs pages     | ✅ Oui                             | État partagé et modifiable à plusieurs endroits         |
| Panier dans une app e-commerce            | ✅ Oui                             | Accessible dans plusieurs pages (liste, checkout, etc.) |
| Saisie d’un formulaire sur une seule page | ❌ Souvent non                     | Peut rester local avec `setState()`                     |
| Navigation conditionnelle selon rôle      | ✅ Oui                             | `Provider` peut stocker l’état du rôle utilisateur      |


## <h2 id="decider"> Règle de décision simple</h2>

Pose-toi cette question :

> 🧩 Est-ce que **plus d’un widget** ou **plus d’une page** a besoin du même état ou doit le modifier ?

* **Oui** → `Provider`
* **Non, juste ici dans le widget** → `setState`



## <h2 id="exemple-educatif"> Exemple</h2>

### 🔁 Tu veux créer une app avec :

* une page **Profil** (affiche le nom de l'utilisateur)
* une page **Paramètres** (modifie ce nom)

➡️ Tu as besoin que **les deux accèdent et modifient le même état**.

👉 Donc tu crées un `UserProvider` avec :

```dart
class UserProvider extends ChangeNotifier {
  String _name = 'Invité';
  String get name => _name;

  void setName(String newName) {
    _name = newName;
    notifyListeners(); // met à jour toute l’interface
  }
}
```

Puis tu peux l'utiliser partout avec `Consumer<UserProvider>` ou `Provider.of<UserProvider>(context)`.



## <h2 id="bonnes-pratiques"> Bonnes pratiques</h2>

| Conseil                                                           | Pourquoi                             |
| ----------------------------------------------------------------- | ------------------------------------ |
| Utilise `ChangeNotifier` pour des états simples                   | C’est suffisant pour 90 % des cas    |
| Ne fais pas `setState` et `Provider` mélangés dans le même widget | Risque d’incohérence                 |
| Si ton app devient très grande → regarde `Riverpod`               | Il est plus moderne et plus puissant |

-

## <h2 id="conclusion">Résumé final</h2>

| Cas                                          | Utilise Provider ? |
| -------------------------------------------- | ------------------ |
| Une seule page, un seul widget               | ❌ Non              |
| État partagé entre pages / widgets           | ✅ Oui              |
| Gestion globale d’utilisateur, panier, thème | ✅ Oui              |
| Tu veux tester la logique sans l’UI          | ✅ Oui              |



<br/>

# 8 -  .watch vs .read


*Explication ultra vulgarisée**, pour comprendre **le rôle de `.watch` et `.read`** dans `Provider`, et **comment réagir quand on incrémente et que c’est pair** (changement de couleur par exemple).



## <h1 id="vulgarisation-provider">🧠 1. Vulgarisation : `.watch` vs `.read`</h1>

Imagine que :

* `Provider` = un **magasin** qui vend des données.
* `context.watch()` = **tu regardes la vitrine** : dès que le produit change, tu **reviens voir** automatiquement (mise à jour UI).
* `context.read()` = **tu vas juste demander un produit**, tu le **prends une fois**, tu **ne reviendras pas** même si le produit change.



### Exemple :

```dart
final counter = context.watch<CounterProvider>().count;
```

→ Tu regardes la valeur `count`. Si elle change, le widget va se **reconstruire** (reactif).

```dart
context.read<CounterProvider>().increment();
```

→ Tu appelles une action (incrémenter). Tu n’as **pas besoin d’écouter** : tu **exécutes et tu pars**.



## <h2 id="quand-utiliser"> Quand utiliser quoi ?</h2>

| Situation                         | Utilise quoi ?                                | Pourquoi ?                            |
| --------------------------------- | --------------------------------------------- | ------------------------------------- |
| Tu veux **afficher** une valeur   | `context.watch()`                             | Pour reconstruire quand ça change     |
| Tu veux **déclencher une action** | `context.read()`                              | Tu n’as pas besoin de mise à jour ici |
| Tu es dans un `build()`           | `watch` pour afficher, `read` pour déclencher | Optimisé                              |



## <h1 id="exemple-incremente-couleur">🎨 2. Exemple complet : changer couleur si pair</h1>

### `counter_provider.dart`

```dart
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // “J’ai changé !”
  }

  bool get isEven => _count % 2 == 0;
}
```


### `main.dart`

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


### `MyApp`

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterPage(),
    );
  }
}
```


###  `CounterPage` (explication ligne par ligne en-dessous)

```dart
class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 👁 On regarde le provider
    final provider = context.watch<CounterProvider>();

    return Scaffold(
      backgroundColor: provider.isEven ? Colors.green : Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Compteur : ${provider.count}',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              // 🖱 On clique → on lit le provider (pas besoin de watch ici)
              onPressed: () => context.read<CounterProvider>().increment(),
              child: Text('Incrémenter'),
            ),
          ],
        ),
      ),
    );
  }
}
```



## <h2 id="explication-resume"> Résumé pédagogique final</h2>

| Action                            | Utilise…                        | Pourquoi                                                            |
| --------------------------------- | ------------------------------- | ------------------------------------------------------------------- |
| Afficher la valeur du compteur    | `context.watch()`               | Car on veut être **notifié si ça change**                           |
| Changer la valeur (ex: bouton)    | `context.read()`                | Car on **ne veut pas reconstruire** ce widget juste pour une action |
| Changer la couleur si nombre pair | `provider.isEven` via `watch()` | La UI doit changer automatiquement                                  |


<br/>

# 8 - Quand je supprime le watch, ça marche plus


Quand tu remplaces `context.watch<T>()` par `context.read<T>()` (ou que tu supprimes complètement le `watch`), ton widget **n’est plus inscrit** à la liste des auditeurs du `ChangeNotifier`. Résultat :

1. **La valeur affichée est lue une seule fois** (au moment du premier `build`).
2. **Aucun rebuild automatique** n’a lieu quand `notifyListeners()` est appelé.
3. L’interface reste figée même si les données changent dans le provider.

### Rappel rapide :

| Méthode              | Effet principal                                |
| -------------------- | ---------------------------------------------- |
| `context.watch<T>()` | Abonne le widget ; reconstruit si T change.    |
| `context.read<T>()`  | Prend la valeur **une fois** ; pas de rebuild. |

### Pourquoi « ça ne marche plus » sans `watch`

Dans ton code :

```dart
final provider = context.watch<CounterProvider>();   // abonnement
...
Text('${provider.count}')                           // valeur dynamique
```

* `watch` inscrit le widget actuel auprès de `CounterProvider`.
* Quand `increment()` appelle `notifyListeners()`, Flutter sait qu’il doit **reconstruire** ce widget : la couleur de fond et le texte se mettent à jour.

Si tu passes à :

```dart
final provider = context.read<CounterProvider>();    // pas d'abonnement
```

* Tu obtiens le compteur **une seule fois**.
* `notifyListeners()` continue d’être émis, mais **ton widget n’écoute plus**, donc aucune reconstruction, aucun changement visuel.

### Bonnes pratiques

* **Afficher** une donnée → `watch` (ou `Consumer`, `Selector`, etc.).
* **Déclencher** une action (bouton) → `read`.

Exemple minimal correct :

```dart
class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // On écoute : rebuild automatique quand count change
    final counter = context.watch<CounterProvider>();

    return Scaffold(
      backgroundColor: counter.isEven ? Colors.green : Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Compteur : ${counter.count}', style: TextStyle(fontSize: 30)),
            ElevatedButton(
              // Pas besoin d’écouter ici, on fait juste l’action
              onPressed: () => context.read<CounterProvider>().increment(),
              child: Text('Incrémenter'),
            ),
          ],
        ),
      ),
    );
  }
}
```

Si tu as peur de reconstruire tout le widget parce qu’il est lourd, tu peux isoler la partie qui dépend du provider :

```dart
Scaffold(
  body: Column(
    children: [
      const Header(),           // pas affecté
      Consumer<CounterProvider>(
        builder: (_, counter, __) => Text('${counter.count}'),
      ),
      const Footer(),           // pas affecté
    ],
  ),
);
```

Ainsi, seul le `Text` est rebuild, pas toute la page.



<br/>

# 9 - Autres techniques et logiques de consommation d’état


### 1. Que veut-on « extraire » ?

Dans notre extrait, **toute la logique de consommation d’état** (`colorProvider.currentColor`) est directement dans le `builder` du `Consumer`.
Pour rendre le code plus lisible (et éviter des rebuilds inutiles), on peut :

1. **Extraire** la partie “UI pure” dans une méthode privée ou un widget séparé.
2. **Remplacer** `Consumer` par d’autres techniques de consommation selon le besoin :

   * `context.watch<T>()`
   * `Selector`
   * `context.select<T,R>()`
   * `Provider.of<T>(listen: …)`


## 2. Refactor pas-à-pas

### 2.1 – Version avec méthode privée (`_buildContainer`)

```dart
class ColorBanner extends StatelessWidget {
  const ColorBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorProvider>(
      builder: (_, provider, __) => _buildContainer(provider.currentColor),
    );
  }

  // 👉 Méthode extraite : n'a aucune dépendance au Provider
  Widget _buildContainer(Color color) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, color.withOpacity(0.6)],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.palette, color: Colors.white, size: 24),
            SizedBox(width: 8),
            Text(
              'Widget Container #3',
              style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

**Avantages**

* Le `builder` reste minuscule ; toute la UI est isolée dans `_buildContainer`.
* Si tu changes la couleur dans le provider, seul `ColorBanner` est rebuild.



### 2.2 – Version avec `context.watch` (sans `Consumer`)

```dart
class ColorBanner extends StatelessWidget {
  const ColorBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final color = context.watch<ColorProvider>().currentColor;
    return _buildContainer(color);              // même méthode que plus haut
  }
}
```

> `context.watch` **écoute** le provider : dès que `notifyListeners()` est déclenché, le widget se reconstruit automatiquement.



### 2.3 – Version « ultra ciblée » avec `Selector`

Si le provider devient gros et que tu ne veux rebuild **que** quand la couleur change :

```dart
class ColorBanner extends StatelessWidget {
  const ColorBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<ColorProvider, Color>(
      selector: (_, p) => p.currentColor,   // on n'extrait qu'une seule valeur
      builder: (_, color, __) => _buildContainer(color),
    );
  }
}
```

> `Selector` ne déclenche un rebuild **que si la valeur sélectionnée** change (test d’égalité).


## 3. Récap des méthodes de consommation

| Méthode                                              | Rebuild automatique ?                             | Cas d’usage typique                                          |
| ---------------------------------------------------- | ------------------------------------------------- | ------------------------------------------------------------ |
| `context.watch<T>()`                                 | ✅ Oui (tout le widget)                            | Afficher un état (simple)                                    |
| `Consumer<T>`                                        | ✅ Oui (zone précise)                              | Extraire la partie dépendante à l’intérieur d’un gros widget |
| `Selector<T,R>()`                                    | ✅ Oui (si `R` change)                             | N’écouter qu’un champ, éviter des rebuilds                   |
| `context.select<T,R>()`                              | ✅ Oui (identique à `Selector`, mais en une ligne) | Même idée qu’au-dessus                                       |
| `context.read<T>()` / `Provider.of<T>(listen:false)` | ❌ Non                                             | Déclencher une **action** (ex : `increment()`)               |



### En pratique

* **Affichage d’une valeur → `watch` / `Consumer` / `Selector`**.
* **Appeler une méthode du provider (changer l’état) → `read`**.
* **Optimisation fine (grosse UI) → `Selector` + extraction dans méthodes/Widgets**.


<br/>

# 10 - Méthodes principales pour « consommer » un Provider


### Méthodes principales pour « consommer » un `Provider`

Dans le package **provider**, il existe plusieurs façons de récupérer la valeur d’un provider (et d’être — ou non — reconstruit quand cette valeur change).
`Consumer` n’est qu’une de ces techniques.

| Méthode                                           | Rebuild automatique ?                                                                       | Où on l’utilise                                            | Exemple rapide                                                                                                  |
| ------------------------------------------------- | ------------------------------------------------------------------------------------------- | ---------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| **`Consumer<T>`**                                 | Oui, uniquement la partie à l’intérieur du `builder`                                        | Quand on veut limiter la reconstruction à une zone précise | `Consumer<ColorProvider>(builder: (_, p, __) => Text('${p.currentColor}'))`                                     |
| **`context.watch<T>()`**                          | Oui, tout le widget qui fait l’appel                                                        | Dans un `build()` quand on affiche directement une valeur  | `final color = context.watch<ColorProvider>().currentColor;`                                                    |
| **`context.read<T>()`**                           | Non                                                                                         | Pour appeler une méthode du provider (écrire) sans écouter | `context.read<ColorProvider>().changeColor();`                                                                  |
| **`context.select<T,R>(selector)`**               | Oui, mais uniquement si la valeur retournée par le sélecteur change                         | Optimisation fine : n’écouter qu’un champ                  | `final alpha = context.select<ColorProvider,int>((p) => p.alpha);`                                              |
| **`Selector<T,R>` (widget)**                      | Oui, même principe que `select` mais sous forme de widget                                   | Quand on veut isoler la reconstruction d’un sous-arbre     | `Selector<ColorProvider, Color>(selector: (_, p) => p.currentColor, builder: (_, c, __) => Container(color:c))` |
| **`Provider.of<T>(context, listen: true/false)`** | Identique à `watch` (`listen: true`) ou `read` (`listen: false`) mais syntaxe plus ancienne | Pour compatibilité ou préférence personnelle               | `Provider.of<ColorProvider>(context).currentColor`                                                              |


#### Quand choisir quoi ?

1. **Afficher une valeur dans le même widget**
   → `context.watch<T>()` ou `context.select<T,R>()` si vous voulez cibler un champ précis.

2. **Afficher une valeur mais limiter la zone reconstruite**
   → `Consumer<T>` ou `Selector<T,R>` autour du sous-arbre concerné.

3. **Appeler une méthode du provider (modifier l’état)**
   → `context.read<T>()` (ou `Provider.of<T>(listen:false)`).

#### Application à ton extrait

Dans ton code :

```dart
return Consumer<ColorProvider>(
  builder: (_, p, __) => Container(
    gradient: LinearGradient(
      colors: [p.currentColor, p.currentColor.withOpacity(0.6)],
    ),
  ),
);
```

* `Consumer` écoute `ColorProvider`.
* À chaque `notifyListeners()`, **seul ce `Container` est reconstruit**, pas le reste de la page.

Si tu remplaces par :

```dart
final p = context.watch<ColorProvider>();
return Container(/* … p.currentColor … */);
```

tout le widget courant sera reconstruit, ce qui est parfois très bien, parfois trop large.



#### Exemple comparatif minimal

```dart
class ColorBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Version 1 : Consumer (zone ciblée)
    return Consumer<ColorProvider>(
      builder: (_, provider, __) => BannerBody(color: provider.currentColor),
    );

    // Version 2 : watch (tout ColorBanner se reconstruit)
    // final color = context.watch<ColorProvider>().currentColor;
    // return BannerBody(color: color);
  }
}

class BannerBody extends StatelessWidget {
  final Color color;
  const BannerBody({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, color.withOpacity(0.6)],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(child: Text('Widget Container #3')),
    );
  }
}
```

Choisissez la méthode selon :

* **Granularité du rebuild** (zone précise vs widget entier)
* **Lisibilité du code**
* **Performance** (sélecteur si provider volumineux)

Ainsi, `Consumer` n’est qu’une *des* méthodes ; `watch`, `read`, `select` et `Selector` offrent des alternatives plus ou moins fines selon vos besoins.



<br/>

# 11 - Équivalent de watch : c’est Consumer<ColorProvider>



**Il n'y a pas `watch`** dans notre code ci-haut— **mais il y a l’équivalent de `watch`** : c’est `Consumer<ColorProvider>` qui **écoute les changements** du provider.



## <h2> Explication claire</h2>

### 👉 `context.watch<ColorProvider>()`

C’est une **méthode** que tu appelles dans un widget (souvent dans `build`) pour dire :

> « Je veux écouter ce provider. Si quelque chose change, **reconstruis tout ce widget**. »



### 👉 `Consumer<ColorProvider>`

C’est un **widget** qui fait exactement la même chose **mais seulement à l’intérieur de son `builder`** :

> « Je veux écouter ce provider. Si quelque chose change, **reconstruis juste ce bloc-là**, pas le reste. »


## ✅ Donc dans ton code :

```dart
return Consumer<ColorProvider>(
  builder: (context, colorProvider, child) {
    // ici colorProvider est déjà l'objet qu'on aurait eu avec context.watch<ColorProvider>()
```

* **Tu n’utilises pas `context.watch()`**
* Mais tu utilises **`Consumer`**, qui est **l’alternative widget** à `context.watch()`.



## <h2> Résumé </h2>

| Forme                | Type    | Écoute les changements ? | Reconstruit quoi ?    |
| -------------------- | ------- | ------------------------ | --------------------- |
| `context.watch<T>()` | méthode | ✅ Oui                    | Tout le widget actuel |
| `Consumer<T>()`      | widget  | ✅ Oui                    | Seulement son builder |
| `context.read<T>()`  | méthode | ❌ Non                    | Rien du tout          |



Si tu écrivais :

```dart
final colorProvider = context.watch<ColorProvider>();
return Container( ... colorProvider.currentColor ... );
```

C’est **strictement équivalent fonctionnellement** à ton `Consumer`, **mais tout le widget est reconstruit** à chaque changement.




FUCK 1100
Souhaites-tu que je transforme ton code avec context.watch() pour bien voir la différence ?






















### Pour résumer :

**`watch` et `Consumer` sont équivalents en fonctionnalité**, **mais `watch` est plus dangereux si mal utilisé**.
Donc :

> **`Consumer` est généralement plus sûr et plus prévisible** pour éviter des erreurs involontaires.


## <h2> Comparatif clair : `watch` vs `Consumer`</h2>

| Critère                    | `context.watch<T>()`                                | `Consumer<T>()`                                   |
| -------------------------- | --------------------------------------------------- | ------------------------------------------------- |
| Complexité              | Plus court à écrire                                 | Légèrement plus verbeux                           |
| Reconstruction          | Tout le widget contenant est reconstruit            | Seule la **zone dans `builder`** est reconstruite |
| Risque d’erreurs        | **Plus élevé** (si utilisé hors `build()`)          | **Très faible**, car isolé                        |
| Où peut-on l’utiliser ? | Seulement dans `build()`, `didChangeDependencies()` | Partout dans l'arbre widget                       |
| Erreurs fréquentes      | `watch()` dans `initState()` → **crash**            | Aucun crash typique                               |
| ✅ Meilleur pour :          | Code court et simple                                | UI complexe ou sensible à la performance          |



## ❌ Exemple d'erreur fréquente avec `watch`

```dart
@override
void initState() {
  super.initState();
  final provider = context.watch<CounterProvider>(); // ❌ ERREUR
}
```

> `watch()` **ne doit jamais être utilisé en dehors de `build()`**. Ça fait planter l'app.



## ✅ Avec `Consumer`, aucun risque :

```dart
@override
Widget build(BuildContext context) {
  return Consumer<CounterProvider>(
    builder: (context, provider, child) {
      return Text('Valeur : ${provider.count}');
    },
  );
}
```

> Pas de problème ici. Même si tu le déplaces ou imbriques, `Consumer` isole les reconstructions.



## En résumé clair

\| Tu débutes / tu veux éviter les bugs | ➤ **Utilise `Consumer<T>()`** |
\| Tu maîtrises le cycle de vie et veux du code court | ➤ `context.watch<T>()` dans `build()` |












<br/>

# 12 - Méthodes principales pour « consommer » un Provider





- `Provider` **n’est pas le seul moyen** de partager des informations entre widgets en Flutter. Mais c’est **le plus propre, scalable et recommandé** dans 90 % des cas professionnels.

Voici un tour d’horizon **complet et comparatif** des **moyens de partager des données entre widgets** :



## <h1 id="moyens-partage-etat">📦 1. Les 5 principales façons de partager des données entre widgets</h1>

| Méthode                            | Scalable ?       | Facile ?       | Reactive ?         | Utilisée où ?                     |
| ---------------------------------- | ---------------- | -------------- | ------------------ | --------------------------------- |
| ✅ `Provider`                       | ✅ Oui            | ✅ Oui          | ✅ Oui              | Recommandée partout (apps pro)    |
| `setState()` + passage de props    | ❌ Non (manuelle) | ✅ Simple       | ✅ Oui (mais local) | Petites apps, tests               |
| `InheritedWidget`                  | ⚠️ Complexe      | ❌ Non          | ✅ Oui              | Natif Flutter, base de `Provider` |
| `GetX` / `Riverpod` / `Bloc`       | ✅ Très           | ⚠️ Courbe      | ✅ Oui              | Apps grandes, gestion poussée     |
| Singleton global (⚠️ anti-pattern) | ❌ Dangereux      | 😈 Trop simple | ❌ Non              | Mauvaise pratique, à éviter       |



## <h2> 2. Comparaison détaillée</h2>

### 🔨 1. `setState()` + props (manuellement)

```dart
class Parent extends StatefulWidget {
  int _count = 0;

  void _increment() {
    setState(() => _count++);
  }

  @override
  Widget build(BuildContext context) {
    return ChildWidget(value: _count, onTap: _increment);
  }
}
```

➡️ Très bien pour **une ou deux pages**, mais vite **impossible à maintenir** dès que tu as plusieurs widgets à synchroniser.



### 💡 2. `Provider` (recommandé)

* Tu crées une classe `ChangeNotifier`
* Tu l’injectes en haut avec `ChangeNotifierProvider`
* Tous les widgets en dessous peuvent `watch`, `read`, `consume`

**➡️ Simple, propre, maintenable, testable.**



### 🧬 3. `InheritedWidget` (bas niveau)

Tu peux faire ça toi-même :

```dart
class MyInheritedData extends InheritedWidget {
  final int count;
  const MyInheritedData({super.key, required this.count, required super.child});

  @override
  bool updateShouldNotify(MyInheritedData oldWidget) {
    return oldWidget.count != count;
  }

  static MyInheritedData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedData>()!;
  }
}
```

➡️ Trop complexe. `Provider` est basé **sur ça** mais beaucoup plus simple à utiliser.



###  4. GetX, Bloc, Riverpod…

Des alternatives à `Provider` :

| Outil      | Points forts                        | Quand l’utiliser                 |
| ---------- | ----------------------------------- | -------------------------------- |
| `Riverpod` | Testable, moderne, compile-sûr      | Apps très modulaires             |
| `Bloc`     | Archi claire (input/output, events) | Projets très stricts, entreprise |
| `GetX`     | Ultra rapide, sans boilerplate      | Pour protos ou apps rapides      |

---

### ☠️ 5. Singleton global (anti-pattern)

```dart
class GlobalUser {
  static String name = "Haythem";
}
```

➡️ Ça **marche**, mais : pas réactif, pas testable, pas clean. À **éviter sauf cas exceptionnels**.



## <h2> Conclusion </h2>

| Besoin                                     | Solution recommandée |
| ------------------------------------------ | -------------------- |
| Partager une valeur entre quelques widgets | `Provider`           |
| App simple avec 1 écran                    | `setState` + props   |
| App complexe, modulaire                    | `Riverpod` ou `Bloc` |
| Tu veux le contrôle total bas niveau       | `InheritedWidget`    |
| Tu veux aller vite sans structure          | `GetX`               |



**Donc non, `Provider` n’est pas le seul moyen — mais c’est le meilleur compromis entre :**
📦 **Lisibilité**, 🔄 **réactivité**, 🧪 **testabilité**, et 🛠 **maintenance**.
































<br/>

# 13 - Comparaison avec des méthodes des concepts **Android natifs (Java/Kotlin)** avec **Flutter (Dart)**.



## <h1 id="android-vs-flutter"> 1. Est-ce que `BroadcastReceiver` existe en Flutter ?</h1>

### ❌ Non, **pas directement**.

Le concept de `BroadcastReceiver` est **spécifique à Android natif** (Java/Kotlin) :

| Android natif (Java/Kotlin) | Rôle du `BroadcastReceiver`                                                                   |
| --------------------------- | --------------------------------------------------------------------------------------------- |
| `BroadcastReceiver`         | Écoute des **événements système ou app** (ex : changement de réseau, SMS, batterie faible...) |
| Exemple                     | `onReceive(Context context, Intent intent)`                                                   |

### En Flutter :

* Tu **n’as pas de `BroadcastReceiver`**, car Flutter est **cross-platform**, donc ce système n’existe pas dans Dart.
* Si tu veux ce comportement, il faut **utiliser un plugin Android**, par exemple :

  * [`flutter_local_notifications`](https://pub.dev/packages/flutter_local_notifications)
  * [`connectivity_plus`](https://pub.dev/packages/connectivity_plus) pour écouter le réseau
  * **ou créer un `PlatformChannel`** (pour accéder au natif Android et implémenter un `BroadcastReceiver` toi-même)



## <h1 id="shared-preferences"> 2. Est-ce que `SharedPreferences` permet de passer des variables ?</h1>

### Oui, **mais attention : ce n’est pas du partage "entre widgets" en temps réel**.

| Ce que fait `SharedPreferences`                           | Ce qu’il **ne** fait pas                           |
| --------------------------------------------------------- | -------------------------------------------------- |
| Enregistre **des données clés/valeurs**                   | Ne notifie **pas** les widgets si la valeur change |
| Persistant (sur disque, même après redémarrage)           | Pas réactif / observable                           |
| Types : `int`, `double`, `String`, `bool`, `List<String>` | ❌ Pas d'objet complexe directement                 |

### ➤ Exemple d'utilisation :

```dart
final prefs = await SharedPreferences.getInstance();
await prefs.setInt('count', 42);
final value = prefs.getInt('count');
```

> ✅ Tu peux t’en servir pour stocker un identifiant, un token, un thème, etc.
> ❌ Mais ça **ne remplace pas `Provider`** pour le **partage d’état réactif entre widgets**.



## <h1 id="intents"> 3. Et les `Intents` ?</h1>

### ❌ Non, Flutter **n’a pas de `Intent` système comme Android**.

| Android `Intent`        | Sert à...                                              |
| ----------------------- | ------------------------------------------------------ |
| `Intent`                | Envoyer une action à une autre activité ou application |
| `startActivity(intent)` | Lancer une autre page/app via intent                   |

### En Flutter :

* Pas d’`Intent`, on utilise **le système de navigation de Flutter** :

  * `Navigator.push()`, `Navigator.pop()`
  * `GoRouter`, `AutoRoute`, etc. pour les apps complexes


## <h2> En résumé (Flutter vs Android)</h2>

| Concept Android                 | Équivalent Flutter (ou non)                                          |
| ------------------------------- | -------------------------------------------------------------------- |
| `BroadcastReceiver`             | ❌ Pas d’équivalent direct → plugins natifs ou `PlatformChannel`      |
| `SharedPreferences`             | ✅ Oui → via `shared_preferences` (non-réactif)                       |
| `Intent`                        | ❌ Non → utiliser `Navigator` pour navigation                         |
| Passer des données entre écrans | ✅ `Navigator.push(context, MaterialPageRoute(...))` avec paramètres  |
| Écouter une valeur globalement  | ✅ `Provider`, `Riverpod`, `Bloc`, etc. (pas via `SharedPreferences`) |


## <h2> Ce qu’il faut retenir</h2>

* `SharedPreferences` = **stockage local persistant**, pas pour partage dynamique en live.
* `Provider` = **partage d’état réactif**, le plus proche du **LiveData** ou des `Observable`.
* `BroadcastReceiver` = **absent en Flutter**, mais tu peux le faire côté Android natif si besoin via **Platform Channel**.







<br/>

# 14 -  Mécanismes pour passer des variables et partager des informations en Flutter - partie 1


## <h1 id="cours-passage-donnees-flutter">Cours – Mécanismes pour passer des variables et des informations en Flutter</h1>



## <h2 id="1-objectifs">1. Objectifs du cours</h2>

À la fin de ce module, vous serez capable de :

* Identifier les différentes façons de passer des variables entre widgets en Flutter.
* Comprendre les avantages et limites de chaque méthode.
* Appliquer la méthode la plus appropriée selon le contexte (local, global, persistant).

---

## <h2 id="2-passage-local-entre-widgets">2. Passage local entre widgets (via constructeurs)</h2>

### Exemple :

```dart
class ParentWidget extends StatelessWidget {
  final String message = "Bonjour";

  @override
  Widget build(BuildContext context) {
    return ChildWidget(text: message);
  }
}

class ChildWidget extends StatelessWidget {
  final String text;

  const ChildWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
```

**Avantages :**

* Simple à comprendre.
* Idéal pour de petites interfaces ou des données immuables.

**Limites :**

* Ne permet pas le partage dynamique ou global.
* Difficile à maintenir si l’arbre de widgets est profond.

---

## <h2 id="3-gestion-locale-de-letat-avec-setstate">3. Gestion locale de l’état avec `setState()`</h2>

### Exemple :

```dart
class CounterPage extends StatefulWidget {
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Compteur : $counter'),
        ElevatedButton(onPressed: increment, child: Text('Incrémenter'))
      ],
    );
  }
}
```

**Avantages :**

* Suffisant pour des états locaux simples.
* Aucun package externe requis.

**Limites :**

* Ne permet pas de partager l’état entre plusieurs pages ou composants.

---

## <h2 id="4-partage-global-avec-provider">4. Partage global et réactif avec `Provider`</h2>

### Exemple :

```dart
class CounterProvider extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
```

Injection avec `ChangeNotifierProvider` :

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

Utilisation :

```dart
final count = context.watch<CounterProvider>().count;
```

**Avantages :**

* Réactif : les widgets se reconstruisent automatiquement.
* Recommandé pour les applications sérieuses et maintenables.
* Sépare clairement logique et interface.

**Limites :**

* Nécessite l’ajout d’un package (`provider`).
* Courbe d’apprentissage plus longue pour débutants.

---

## <h2 id="5-sharedpreferences-stockage-persistant">5. `SharedPreferences` – Stockage persistant</h2>

### Exemple :

```dart
final prefs = await SharedPreferences.getInstance();
await prefs.setInt('userId', 42);
final userId = prefs.getInt('userId');
```

**Avantages :**

* Données persistantes même après fermeture de l’application.
* Pratique pour stocker des paramètres ou tokens.

**Limites :**

* Pas réactif : ne notifie pas l’interface si les valeurs changent.
* Limité à des types simples (`int`, `bool`, `String`, etc.).

---

## <h2 id="6-navigation-et-passage-de-donnees-entre-pages">6. Navigation et passage de données entre pages</h2>

### Exemple :

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailsPage(name: 'Haythem'),
  ),
);
```

Et dans `DetailsPage` :

```dart
class DetailsPage extends StatelessWidget {
  final String name;

  const DetailsPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Text('Bonjour $name');
  }
}
```

**Avantages :**

* Simple pour passer des arguments entre écrans.

**Limites :**

* Les données sont perdues si l’utilisateur quitte l’écran.

---

## <h2 id="7-platform-channels-et-systemes-natifs">7. `Platform Channels` pour dialogue natif</h2>

Utilisé si vous devez intégrer une API Android/iOS native (ex. `BroadcastReceiver`, `Intent`, etc.).

**Principe :**

* Vous définissez un canal de communication entre Dart ↔ Java/Kotlin ou Swift.
* Exemples : accéder aux appels, SMS, Bluetooth, etc.

**Avantages :**

* Permet d’accéder à toutes les fonctionnalités système non exposées par Flutter.

**Limites :**

* Nécessite des compétences Android/iOS natifs.
* Moins portable, moins maintenable.

---

## <h2 id="8-resume-general">8. Résumé général</h2>

| Besoin                                     | Outil recommandé               |
| ------------------------------------------ | ------------------------------ |
| Partager des valeurs simples entre widgets | Props / Constructeurs          |
| Gérer un petit état local                  | `setState()`                   |
| Partager l’état entre plusieurs composants | `Provider`, `Riverpod`, `Bloc` |
| Stocker des valeurs sur le disque          | `SharedPreferences`            |
| Navigation avec passage de paramètres      | `Navigator.push(...)`          |
| Intégrer des fonctions système Android/iOS | `PlatformChannel`              |

---

## <h2 id="9-recommandation">9. Recommandation professionnelle</h2>

Pour les applications modernes et maintenables :

* Utilisez `Provider` (ou `Riverpod`) pour partager des états complexes.
* Évitez les singletons globaux non réactifs.
* Limitez `setState` à des cas très locaux.
* Utilisez `SharedPreferences` pour les préférences utilisateurs ou tokens.





<br/>

# 15 -  Mécanismes pour passer des variables et partager des informations en Flutter - partie 2


## <h2 id="1-objectifs">1. Objectifs du cours</h2>

À la fin de ce module, vous serez capable de :

* Identifier les différentes façons de passer des variables entre widgets en Flutter.
* Comprendre les avantages et limites de chaque méthode.
* Appliquer la méthode la plus appropriée selon le contexte (local, global, persistant).



## <h2 id="2-passage-local-entre-widgets">2. Passage local entre widgets (via constructeurs)</h2>

### Exemple :

```dart
class ParentWidget extends StatelessWidget {
  final String message = "Bonjour";

  @override
  Widget build(BuildContext context) {
    return ChildWidget(text: message);
  }
}

class ChildWidget extends StatelessWidget {
  final String text;

  const ChildWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
```

**Avantages :**

* Simple à comprendre.
* Idéal pour de petites interfaces ou des données immuables.

**Limites :**

* Ne permet pas le partage dynamique ou global.
* Difficile à maintenir si l’arbre de widgets est profond.



## <h2 id="3-gestion-locale-de-letat-avec-setstate">3. Gestion locale de l’état avec `setState()`</h2>

### Exemple :

```dart
class CounterPage extends StatefulWidget {
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Compteur : $counter'),
        ElevatedButton(onPressed: increment, child: Text('Incrémenter'))
      ],
    );
  }
}
```

**Avantages :**

* Suffisant pour des états locaux simples.
* Aucun package externe requis.

**Limites :**

* Ne permet pas de partager l’état entre plusieurs pages ou composants.



## <h2 id="4-partage-global-avec-provider">4. Partage global et réactif avec `Provider`</h2>

### Exemple :

```dart
class CounterProvider extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
```

Injection avec `ChangeNotifierProvider` :

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

Utilisation :

```dart
final count = context.watch<CounterProvider>().count;
```

**Avantages :**

* Réactif : les widgets se reconstruisent automatiquement.
* Recommandé pour les applications sérieuses et maintenables.
* Sépare clairement logique et interface.

**Limites :**

* Nécessite l’ajout d’un package (`provider`).
* Courbe d’apprentissage plus longue pour débutants.



## <h2 id="5-sharedpreferences-stockage-persistant">5. `SharedPreferences` – Stockage persistant</h2>

### Exemple :

```dart
final prefs = await SharedPreferences.getInstance();
await prefs.setInt('userId', 42);
final userId = prefs.getInt('userId');
```

**Avantages :**

* Données persistantes même après fermeture de l’application.
* Pratique pour stocker des paramètres ou tokens.

**Limites :**

* Pas réactif : ne notifie pas l’interface si les valeurs changent.
* Limité à des types simples (`int`, `bool`, `String`, etc.).



## <h2 id="6-navigation-et-passage-de-donnees-entre-pages">6. Navigation et passage de données entre pages</h2>

### Exemple :

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailsPage(name: 'Haythem'),
  ),
);
```

Et dans `DetailsPage` :

```dart
class DetailsPage extends StatelessWidget {
  final String name;

  const DetailsPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Text('Bonjour $name');
  }
}
```

**Avantages :**

* Simple pour passer des arguments entre écrans.

**Limites :**

* Les données sont perdues si l’utilisateur quitte l’écran.



## <h2 id="7-platform-channels-et-systemes-natifs">7. `Platform Channels` pour dialogue natif</h2>

Utilisé si vous devez intégrer une API Android/iOS native (ex. `BroadcastReceiver`, `Intent`, etc.).

**Principe :**

* Vous définissez un canal de communication entre Dart ↔ Java/Kotlin ou Swift.
* Exemples : accéder aux appels, SMS, Bluetooth, etc.

**Avantages :**

* Permet d’accéder à toutes les fonctionnalités système non exposées par Flutter.

**Limites :**

* Nécessite des compétences Android/iOS natifs.
* Moins portable, moins maintenable.



## <h2 id="8-resume-general">8. Résumé général</h2>

| Besoin                                     | Outil recommandé               |
| ------------------------------------------ | ------------------------------ |
| Partager des valeurs simples entre widgets | Props / Constructeurs          |
| Gérer un petit état local                  | `setState()`                   |
| Partager l’état entre plusieurs composants | `Provider`, `Riverpod`, `Bloc` |
| Stocker des valeurs sur le disque          | `SharedPreferences`            |
| Navigation avec passage de paramètres      | `Navigator.push(...)`          |
| Intégrer des fonctions système Android/iOS | `PlatformChannel`              |



## <h2 id="9-recommandation">9. Recommandation professionnelle</h2>

Pour les applications modernes et maintenables :

* Utilisez `Provider` (ou `Riverpod`) pour partager des états complexes.
* Évitez les singletons globaux non réactifs.
* Limitez `setState` à des cas très locaux.
* Utilisez `SharedPreferences` pour les préférences utilisateurs ou tokens.






<br/>

# 16 - Différence entre `Provider` et `SharedPreferences` :

1. `Provider` sert à **gérer et partager l’état en mémoire** entre plusieurs widgets de façon réactive.
2. `SharedPreferences` sert à **sauvegarder des données simples de manière persistante** (elles restent après la fermeture de l’application).
3. `Provider` **reconstruit automatiquement l’interface** quand l’état change, contrairement à `SharedPreferences`.
4. `SharedPreferences` **ne permet pas de notifier l’interface** quand une valeur change — il faut relire manuellement.
5. On utilise souvent **les deux ensemble** : `SharedPreferences` pour stocker une valeur, `Provider` pour l’utiliser dynamiquement dans l’interface.



<br/>

# 17 - C’est quoi `context` dans Flutter ?

`context` est **un pointeur vers l’endroit de l’arbre des widgets** où tu te trouves.

> Il permet de **savoir dans quel widget tu es**, et d’accéder à **tout ce qui est au-dessus de toi dans l’arbre** (comme un `Provider`, un `Theme`, un `Navigator`, etc.).



### Analogie simple

Imagine un bâtiment (l’app Flutter), et tu es dans une pièce (un widget).
`BuildContext` est **ta clé pour accéder à tout ce qui est dans les étages au-dessus**.



## <h2 id="context-vs-this">❌ `context` ≠ `this`</h2>

| Terme     | Signifie quoi ?                                    | Sert à quoi ?                                     |
| --------- | -------------------------------------------------- | ------------------------------------------------- |
| `this`    | Référence à **l’objet courant**                    | Accéder aux propriétés/méthodes de la classe      |
| `context` | Référence à **l’endroit dans l’arbre des widgets** | Accéder à `Provider`, `Theme`, `MediaQuery`, etc. |



### Exemple :

```dart
@override
Widget build(BuildContext context) {
  final color = Theme.of(context).primaryColor;
  return Container(color: color);
}
```

* `context` donne accès au **thème de l’application**
* `this` ici serait juste l'instance du widget (`this.widget`, `this.build`, etc.)



## <h2 id="dans-provider">Et dans `Provider`, pourquoi on utilise `context` ?</h2>

Parce que **`Provider` est un widget au-dessus de toi dans l’arbre**.
Pour l’atteindre, tu dois utiliser `context` :

```dart
final compteur = context.watch<CounterProvider>().count;
```

> Tu dis : « Depuis *ici*, dans l’arbre, va chercher le `CounterProvider` qui est plus haut, et donne-moi `count`. »



## <h2 id="rappel-rapide">Résumé</h2>

* `context` = **la position dans l’arbre des widgets**
* `this` = **l’objet courant** (comme dans Dart, Java, etc.)
* Tu utilises `context` pour accéder à ce qui est autour de toi (thèmes, providers, routes, tailles, etc.)






















