# <h1 id="quiz-provider">Quiz Flutter – Comparaison des méthodes Provider (`watch` / `Consumer`)</h1>

### Prérequis :

**Lire les 3 fichiers suivants :**

- *04 - Flutter Firebase/EvaluationFormative/Concepts-avances/12- (PRATIQUE3) - COMPARER METHODES 1 ET 2 - LES 2 MÉTHODES*
- *04 - Flutter Firebase/EvaluationFormative/06-Provider dans Flutter – bases, usages et bonnes pratiques.md*
- *04 - Flutter Firebase/EvaluationFormative/Concepts-avances/20- (IMPORTANT) Explications intermédiaires pratiques-1-et-2.md*

## <h2>Partie 1 – Questions à choix multiples (QCM)</h2>

### Question 1

Dans la méthode 1, combien de fois `context.watch<CounterProvider>()` est-il utilisé dans le `build()` ?
A. 1 fois B. 2 fois C. 3 fois D. 4 fois

* **Réponse : C – 3 fois**
* **Explication :** appels pour `backgroundColor`, `Container.color` et `Text`.





**Explication détaillée:**


### Question 1

Dans la méthode 1, combien de fois `context.watch<CounterProvider>()` est-il utilisé dans le `build()` ?
A. 1 fois
B. 2 fois
C. 3 fois
D. 4 fois

**Réponse : C**



Dans la méthode 1, `context.watch<CounterProvider>()` est appelé trois fois dans la méthode `build()` :

1. Première fois — pour la `backgroundColor` de la `Scaffold` :

   ```dart
   backgroundColor: context.watch<CounterProvider>().count % 2 == 0
       ? Colors.amber
       : Colors.blue,
   ```

2. Deuxième fois — pour la couleur du `Container` :

   ```dart
   color: context.watch<CounterProvider>().count % 2 == 0
       ? Colors.blue
       : Colors.amber,
   ```

3. Troisième fois — pour afficher le compteur dans le `Text` :

   ```dart
   Text(
     "Compteur : ${context.watch<CounterProvider>().count}",
   )
   ```

Chacun de ces appels déclenche un rebuild de tout le widget `build()` quand `notifyListeners()` est appelé.



---

### Question 2

La méthode 1 utilise principalement :
A. `Consumer` B. `context.read` seulement C. `context.watch` D. `ChangeNotifierBuilder`

* **Réponse : C – `context.watch`**
* **Explication :** toutes les lectures passent par `watch`, rendant tout le widget réactif.


<br/>
<br/>

### Question 2 détaillée

**La méthode 1 utilise principalement :**

* A. `Consumer`
* B. `context.read` uniquement
* C. `context.watch` pour la lecture de la donnée
* D. `ChangeNotifierBuilder`

---

**Réponse : C. `context.watch` pour la lecture de la donnée**

**Explication détaillée :**

Dans la méthode 1, l’accès aux données du provider se fait systématiquement par :

```dart
context.watch<CounterProvider>()
```

Cela signifie que le widget écoute activement les changements de l’état (`count` dans ce cas), et que **chaque modification** via `notifyListeners()` déclenchera un **rebuild de tout le widget `build()`**.

* **A. Faux**, car `Consumer` n’est jamais utilisé dans cette méthode.
* **B. Faux**, car `read` est utilisé uniquement pour l’appel à `increment()`, mais pas pour lire la valeur.
* **C. Correct**, car `watch` est appelé à plusieurs endroits dans le `build()` pour lire la donnée.
* **D. Faux**, `ChangeNotifierBuilder` n’est pas une structure courante en Provider (cela n’existe pas dans ce contexte Flutter).




---

### Question 3

Dans la méthode 2, quelle partie de l’interface réagit aux changements de `count` ?
A. Tout `build()` B. seulement la `Text` C. la `Scaffold` entière D. le `body` dans `Consumer`

* **Réponse : D – le `body`**
* **Explication :** seul le sous-arbre enveloppé par `Consumer` est reconstruit.






### Question 3 détaillée

**Dans la méthode 2, quelle partie de l’interface réagit aux changements de `count` ?**

* A. Tout le widget `build()`
* B. Seule la `Text`
* C. La `Scaffold` entière
* D. Le `body` enveloppé dans `Consumer`

---

**Réponse : D. Le `body` enveloppé dans `Consumer`**

**Explication détaillée :**

Dans la méthode 2, la structure est conçue pour **isoler les reconstructions**. Seule la partie qui a besoin de se mettre à jour (ici le `body` contenant le `Text`) est enveloppée dans un `Consumer`.

Extrait typique :

```dart
body: Consumer<CounterProvider>(
  builder: (context, provider, child) {
    return Center(
      child: Text('${provider.count}'),
    );
  },
),
```

Cela signifie que :

* Le `Scaffold` **n’est pas reconstruit**,
* Seule la fonction `builder` du `Consumer` est exécutée quand `count` change.

Analyse des choix :

* **A. Faux**, car `build()` n’est pas entièrement réexécuté.
* **B. Faux**, la `Text` est effectivement reconstruite, mais ce n’est pas le seul élément concerné (c’est tout le `body` du `Consumer`).
* **C. Faux**, la `Scaffold` est hors du `Consumer`, donc elle ne change pas.
* **D. Correct**, le `body` est le seul élément à réagir aux changements grâce au `Consumer`.









---

### Question 4

Dans la méthode 3, le `Consumer<CounterProvider>` englobe :
A. seulement le `Text` B. le FAB C. toute la `Scaffold` D. aucun widget

* **Réponse : C – toute la `Scaffold`**
* **Explication :** le `builder` retourne directement la `Scaffold`.




### Question 4 détaillée

**Dans la méthode 3, le `Consumer<CounterProvider>` englobe :**

* A. Seulement le widget `Text`
* B. Le bouton flottant uniquement
* C. Toute la `Scaffold`
* D. Rien, on utilise `watch`

---

**Réponse : C. Toute la `Scaffold`**

---

**Explication détaillée :**

Dans la **méthode 3**, le `Consumer<CounterProvider>` est placé **tout en haut de l’arbre de rendu**, au niveau de `build()`, et il englobe toute la structure visuelle :

```dart
return Consumer<CounterProvider>(
  builder: (context, provider, child) {
    return Scaffold(
      backgroundColor: provider.currentColor,
      body: Center(
        child: Text('${provider.count}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: provider.increment,
      ),
    );
  },
);
```

**Cela signifie que :**

* Le `Scaffold` **et tout son contenu** sont redessinés à chaque `notifyListeners()` venant du `Provider`.
* Cela rend **toute l'interface réactive**, même les parties qui n’ont pas besoin d’être mises à jour (ce qui peut avoir un impact sur la performance si mal utilisé).

---

**Analyse des choix :**

* **A. Faux** — Le `Text` est bien inclus, mais **pas seul**.
* **B. Faux** — Le bouton est inclus aussi, mais **pas seul**.
* **C. Vrai** — C’est le `Scaffold` entier qui est retourné par le `builder` du `Consumer`.
* **D. Faux** — Cette méthode **n’utilise pas** `watch`, mais un `Consumer` global.







---

### Question 5

Le principal inconvénient de multiplier les appels à `context.watch` est :
A. code plus propre B. meilleure modularité C. trop de rebuilds D. incompatibilité

* **Réponse : C – trop de rebuilds**
* **Explication :** chaque `watch` déclenche la reconstruction complète de `build()`.





### Question 5 détaillée

**Le principal inconvénient de `context.watch` utilisé plusieurs fois est :**

* A. Code plus propre
* B. Meilleure modularité
* C. Trop de rebuilds
* D. Il ne fonctionne pas avec `ChangeNotifierProvider`

---

**Réponse : C. Trop de rebuilds**

---

**Explication détaillée :**

Quand on appelle plusieurs fois `context.watch<T>()` **dans une même méthode `build()`**, chaque appel :

* **écoute activement** le `Provider`
* **provoque un rebuild** du widget courant **entier** quand `notifyListeners()` est appelé

Donc, si vous avez ceci dans `build()` :

```dart
final color = context.watch<ThemeProvider>().color;
final count = context.watch<CounterProvider>().count;
final name = context.watch<UserProvider>().username;
```

Alors **le widget `build()` entier sera redessiné** même si **seule une de ces valeurs a changé**, ce qui est **inefficace**.

---

**Analyse des choix :**

* **A. Faux** — C’est plus rapide à écrire, mais pas plus propre une fois que le widget devient complexe.
* **B. Faux** — Multiplier les `watch` dans `build()` rend le widget **moins modulaire**.
* **C. Vrai** — Chaque `watch` agrandit la portée des reconstructions (rebuilds).
* **D. Faux** — `watch` **fonctionne parfaitement** avec `ChangeNotifierProvider`, c’est même fait pour.



---

### Question 6

Méthode la plus adaptée si seule une petite partie dépend du Provider ?
A. Méthode 1 B. Méthode 2 C. Méthode 3 D. Aucune

* **Réponse : B – méthode 2 (`Consumer` partiel)**
* **Explication :** on isole la zone réactive, le reste reste stable.






### Question 6 détaillée

**Quelle méthode est la plus adaptée si *seule une partie* de l’interface dépend de la donnée ?**

* A. Méthode 1
* B. Méthode 2
* C. Méthode 3
* D. Aucune des trois

---

**Réponse : B. Méthode 2**

---

**Explication détaillée :**

La **méthode 2** utilise un **`Consumer<CounterProvider>`** autour d’un **sous-arbre précis**, par exemple autour du widget `Text`, ou du `body` uniquement :

```dart
body: Consumer<CounterProvider>(
  builder: (context, provider, child) {
    return Text('${provider.count}');
  },
),
```

Cela signifie que **seule cette partie-là sera reconstruite** quand l’état change, et non toute la méthode `build()` du widget.

C’est **idéale** quand :

* Le `Scaffold`, l’`AppBar`, et les autres parties **ne changent pas**
* Seul un `Text`, une couleur, une `Icon`, etc. **doit être mis à jour dynamiquement**

---

**Analyse des choix :**

* **A. Méthode 1** — Faux. Elle utilise plusieurs `watch`, donc **reconstruit tout le `build()`**.
* **B. Méthode 2** — **Vrai.** Elle cible précisément la zone réactive avec `Consumer`.
* **C. Méthode 3** — Faux. Le `Consumer` global englobe tout, donc reconstruit tout.
* **D. Aucune** — Faux. La méthode 2 est justement prévue pour ça.








---

### Question 7

Méthode qui complique le plus la réutilisation de widgets ailleurs ?
A. Méthode 2 B. Méthode 3 C. Méthode 1 D. Toutes

* **Réponse : C – méthode 1**
* **Explication :** `watch` dispersé impose la présence du Provider dans tout le code.




### Question 7 détaillée

**Quelle méthode rend le plus difficile la réutilisation de widgets dans d'autres projets ?**

* A. Méthode 2
* B. Méthode 3
* C. Méthode 1
* D. Toutes

---

**Réponse : C. Méthode 1**

---

**Explication détaillée :**

La **méthode 1** utilise des appels directs à `context.watch<CounterProvider>()` **partout dans le `build()`**, comme dans :

```dart
backgroundColor: context.watch<CounterProvider>().currentColor,
...
Text('${context.watch<CounterProvider>().count}')
```

Cela crée **une dépendance forte entre les widgets et le Provider**, ce qui :

* **Couple fortement** la logique métier à l’UI
* Rend le widget **non réutilisable dans un autre contexte**
* Oblige à **reconfigurer ou injecter le même Provider** si on veut réutiliser ce widget ailleurs

---

**Analyse des choix :**

* **A. Méthode 2** — Faux. Elle isole les appels à `Consumer`, ce qui permet de réutiliser plus facilement les widgets ailleurs.
* **B. Méthode 3** — Faux. Le `Consumer` est centralisé, les widgets peuvent être découplés.
* **C. Méthode 1** — ✅ **Vrai**. Car elle dissémine les appels à `watch()` dans tout le code.
* **D. Toutes** — Faux. Seule la méthode 1 présente une telle rigidité.






---

### Question 8

Méthode qui reconstruit le moins de widgets après `notifyListeners()` ?
A. Méthode 1 B. Méthode 2 C. Méthode 3 D. Toutes

* **Réponse : B – méthode 2**
* **Explication :** seul le sous-arbre du `Consumer` est mis à jour.







### Question 8 détaillée

**Quelle méthode reconstruit le *moins* de widgets lors d’un `notifyListeners()` ?**

* A. Méthode 1
* B. Méthode 2
* C. Méthode 3
* D. Toutes reconstruisent tout

---

**Réponse : B. Méthode 2**

---

**Explication détaillée :**

La **méthode 2** est conçue pour limiter les reconstructions inutiles. Elle utilise un **`Consumer` ciblé** uniquement autour des éléments qui dépendent du `Provider`.

Exemple :

```dart
body: Consumer<CounterProvider>(
  builder: (context, provider, child) {
    return Text('${provider.count}');
  },
)
```

**Seul ce `Text`** (ou le `body` s'il englobe plus) sera reconstruit quand `notifyListeners()` est appelé, tandis que le reste du `Scaffold` ne bouge pas.

---

**Analyse des choix :**

* **A. Méthode 1** — Faux. Elle utilise `context.watch()` dans tout `build()`, donc **tout le widget est reconstruit** à chaque changement.
* **B. Méthode 2** — ✅ **Vrai**. Grâce à un `Consumer` partiel, seul le sous-arbre concerné est reconstruit.
* **C. Méthode 3** — Faux. Elle utilise un `Consumer` global : **tout est reconstruit** à chaque changement.
* **D. Toutes reconstruisent tout** — Faux. Justement, la méthode 2 est optimisée pour ne pas tout reconstruire.





---

### Question 9

Appel correct de `increment()` dans les méthodes 1 et 2 ?
A. `provider.increment()` B. `context.increment()` C. `context.read<CounterProvider>().increment()` D. `ref.watch().increment()`

* **Réponse : C – `context.read<CounterProvider>().increment()`**
* **Explication :** `read` lit sans écoute puis appelle la méthode.






### Question 9 détaillée

**Dans les méthodes 1 et 2, comment appelle-t-on la fonction `increment()` ?**

* A. `provider.increment()`
* B. `context.increment()`
* C. `context.read<CounterProvider>().increment()`
* D. `ref.watch().increment()`

---

**Réponse : C. `context.read<CounterProvider>().increment()`**

---

**Explication détaillée :**

Lorsque tu veux **appeler une méthode comme `increment()` sans redessiner le widget**, il faut utiliser `context.read()`.

```dart
onPressed: () {
  context.read<CounterProvider>().increment();
}
```

* `read` permet d’accéder **au Provider sans écouter** les changements.
* Contrairement à `watch`, il **ne déclenche pas de rebuild**.

---

**Analyse des choix :**

* **A. `provider.increment()`** — Faux. `provider` n’est pas une variable définie automatiquement dans Flutter ; il faut d’abord l’obtenir via `context.read()` ou via un `Consumer`.
* **B. `context.increment()`** — Faux. `increment()` n’est pas une méthode de `BuildContext`.
* **C. `context.read<CounterProvider>().increment()`** — ✅ Vrai. C’est la **bonne syntaxe pour appeler une méthode sans écouter l’état**.
* **D. `ref.watch().increment()`** — Faux. Cette syntaxe vient de **Riverpod**, pas de Provider.





---

### Question 10

Dans la méthode 3, où accède-t-on à `provider.count` ?
A. Consumer sur `Text` B. Plusieurs endroits du builder C. via `context.watch()` D. seulement dans le FAB

* **Réponse : B – plusieurs endroits**
* **Explication :** utilisé pour le `backgroundColor`, le `Container` et le `Text`.




### Question 10 détaillée

**Dans la méthode 3, où accède-t-on à `provider.count` ?**

* A. Dans un `Consumer` spécifique au `Text`
* B. À plusieurs endroits du builder
* C. Avec `context.watch()`
* D. Uniquement dans le FAB

---

**Réponse : B. À plusieurs endroits du builder**

---

**Explication détaillée :**

Dans la méthode 3 (Consumer global), on écrit souvent quelque chose comme :

```dart
return Consumer<CounterProvider>(
  builder: (context, provider, child) {
    return Scaffold(
      backgroundColor: provider.count % 2 == 0 ? Colors.blue : Colors.red,
      body: Container(
        color: provider.count > 5 ? Colors.green : Colors.grey,
        child: Text('${provider.count}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: provider.increment,
      ),
    );
  },
);
```

👉 On voit que `provider.count` est utilisé :

* pour le `backgroundColor`
* pour la couleur du `Container`
* dans le widget `Text`

Donc **plusieurs fois dans le `builder`**.

---

**Analyse des choix :**

* **A. Dans un `Consumer` spécifique au `Text`** — Faux. Il n’y a **qu’un seul `Consumer`** qui englobe toute la `Scaffold`, pas juste le `Text`.
* **B. À plusieurs endroits du builder** — ✅ Vrai. C’est ce qu’on observe dans la méthode 3.
* **C. Avec `context.watch()`** — Faux. Dans cette méthode, on **ne fait pas appel à `context.watch()`** : on utilise directement la variable `provider` donnée par le `Consumer`.
* **D. Uniquement dans le FAB** — Faux. Le FAB utilise `increment`, mais `count` est utilisé ailleurs.





---

## <h2>Partie 2 – Vrai / Faux</h2>

| #  | Énoncé                                                                                   | Réponse  | Explication                                                |
| -- | ---------------------------------------------------------------------------------------- | -------- | ---------------------------------------------------------- |
| 11 | `context.watch` peut être appelé dans un `StatelessWidget`.                              | **Vrai** | Accessible via n’importe quel `BuildContext`.              |
| 12 | Multiplier les `watch()` améliore les performances.                                      | **Faux** | Plus de `watch` → zone de rebuild plus large.              |
| 13 | `Consumer` limite la reconstruction à son sous-arbre.                                    | **Vrai** | Seul son `builder` est rappelé.                            |
| 14 | Dans la méthode 2, la couleur d’arrière-plan est mise à jour à chaque changement d’état. | **Vrai** | Car `backgroundColor` utilise aussi `watch`.               |
| 15 | Dans la méthode 3, `watch` et `read` deviennent inutiles.                                | **Vrai** | On passe par la variable `provider` du `builder`.          |
| 16 | `context.read()` dans `build()` ne déclenche pas de rebuild.                             | **Vrai** | `read` n’écoute pas l’état.                                |
| 17 | `watch` est synchrone.                                                                   | **Vrai** | Renvoie immédiatement la valeur courante.                  |
| 18 | Tous les widgets de `MaterialApp` écoutent tous les Providers par défaut.                | **Faux** | Ils n’écoutent que si on le demande (`watch`, `Consumer`). |
| 19 | `Consumer` doit être placé dans `main.dart`.                                             | **Faux** | Il peut être inséré n’importe où dans l’arbre.             |
| 20 | `context.watch` redessine le widget du point d’appel vers le bas.                        | **Vrai** | Le rebuild démarre au widget qui appelle `watch`.          |




## Partie 2 – Vrai / Faux – Explications globales

Dans Flutter, la méthode `context.watch<T>()` peut parfaitement être utilisée dans un `StatelessWidget`, car elle s’appuie uniquement sur le `BuildContext`, qui est accessible même dans les widgets non-états. Toutefois, utiliser `watch` à plusieurs reprises dans un même `build()` nuit aux performances, car cela agrandit la zone de reconstruction : à chaque appel de `notifyListeners()`, l’ensemble du sous-arbre à partir de chaque `watch()` est redessiné. C’est pourquoi il est souvent préférable d’utiliser un `Consumer` pour limiter les rebuilds uniquement à une sous-partie du widget.

Le widget `Consumer<T>` est précisément conçu pour cela : il écoute le Provider et ne reconstruit que son propre builder, rien de plus. Par exemple, dans la méthode 2 (Consumer partiel), seule la zone enveloppée par le `Consumer` (souvent le `body`) est redessinée. En revanche, si on utilise `watch()` sur le `backgroundColor` du `Scaffold`, comme c’est encore le cas dans cette méthode, alors le `Scaffold` entier est reconstruit à chaque changement d’état.

Dans la méthode 3, où l’on entoure tout le `Scaffold` dans un `Consumer` global, les appels à `context.watch()` et `context.read()` deviennent inutiles, car la variable `provider` injectée dans le `builder` suffit pour accéder à la fois à la donnée (`count`) et aux méthodes (`increment()`). De plus, `context.read()` peut être appelé dans un `build()` sans provoquer de reconstruction, car il ne déclenche aucune écoute — il lit simplement la valeur au moment T.

La méthode `watch` est elle-même synchrone : elle retourne immédiatement la dernière valeur connue du Provider sans attendre. En revanche, tous les widgets de l’arborescence de `MaterialApp` ne sont pas magiquement connectés aux Providers : seuls les widgets qui utilisent explicitement `watch()`, `read()`, ou un `Consumer` réagissent aux changements. Enfin, le `Consumer` n’est pas limité au fichier `main.dart` : il peut être placé à n’importe quel niveau de l’arbre de widgets. Quand on utilise `context.watch()`, c’est bien à partir du **widget appelant** que le redessin va se propager — tout ce qui est en dessous sera reconstruit à chaque changement.




## <h2>Partie 3 – Analyse de code (choix unique)</h2>


## Introduction et synthèse



## Partie 3 – Analyse de code – Explications globales

Lorsque l'on appelle `context.read<CounterProvider>().increment();`, on utilise `read` pour accéder à une méthode sans s’abonner aux changements. Cela permet de déclencher une action (comme incrémenter un compteur) sans causer de redessin du widget qui contient l’appel. Dans la méthode 1, où `context.watch` est utilisé plusieurs fois dans `build()`, un changement dans `count` provoque le rappel complet de cette méthode. Le `backgroundColor`, le `Container` et le `Text` utilisent tous `watch`, donc le widget entier est reconstruit à chaque `notifyListeners()`.

En revanche, la méthode 3 adopte une approche centralisée : un `Consumer` global englobe toute la structure `Scaffold`. Cela offre un avantage de lisibilité, car toute la logique d’affichage est contenue dans un unique `builder`, ce qui est très clair pour les débutants. Ce n’est pas optimal pour les très grandes interfaces, mais c’est un bon point de départ pour comprendre la logique de Provider.

Dans la méthode 2, on continue à utiliser `context.watch()` pour la couleur de fond du `Scaffold` car celui-ci n’est pas inclus dans le `Consumer`. Si on voulait rendre aussi cette couleur dépendante du Provider, il faudrait envelopper toute la `Scaffold` dans un `Consumer`. Répéter `context.watch()` dans différents widgets d’une grande arborescence doit être évité : cela augmente les zones de reconstruction et diminue les performances.

Quand on lit une donnée avec `read`, comme dans `final compteur = context.read<CounterProvider>().count;`, on récupère simplement une valeur sans établir d’écoute : aucun rebuild ne sera déclenché si la valeur change par la suite. Le rôle du `ChangeNotifierProvider` est justement d’exposer un objet (ici `CounterProvider`) à l’arbre de widgets et de notifier tous les widgets abonnés à chaque mise à jour via `notifyListeners()`.

La méthode 2 est souvent considérée comme un bon compromis, car elle isole les parties de l’interface qui doivent réagir, tout en maintenant les autres parties stables. Enfin, il est essentiel de comprendre que `read()` n’est pas réactif. Il lit une valeur à un instant donné, mais ne déclenche pas de mise à jour automatique du widget si la valeur change plus tard. Un `Consumer` global est particulièrement utile lorsque l’ensemble de l’interface (fond, texte, action) dépend d’un seul état centralisé, car cela permet de garder toute la logique dans un seul bloc cohérent.


### Question 21

Que fait `context.read<CounterProvider>().increment();` ?
A. Abonne le widget B. Écoute les changements C. Lit sans s’abonner D. Change la couleur

* **Réponse : C – lit sans s’abonner**
* **Explication :** `read` récupère l’instance sans écoute puis appelle `increment()`.

---

### Question 22

Dans la méthode 1, quand `count` change, que se passe-t-il ?
A. Rien B. Tout `build()` est reconstruit C. Seul le bouton change D. Erreur

* **Réponse : B – tout `build()` est reconstruit**
* **Explication :** chaque `watch` notifie Flutter, réexécutant `build()`.

---

### Question 23

Avantage principal d’un `Consumer` global (méthode 3) ?
A. Rebuild partiel B. Supprime `ChangeNotifier` C. Centralise la logique D. Réduit les dépendances

* **Réponse : C – centralise la logique**
* **Explication :** tout le code dépendant de l’état est dans un seul bloc clair.

---

### Question 24

Pourquoi garde-t-on `watch` pour `backgroundColor` dans la méthode 2 ?
A. Tests de couleur B. Pas deux `Consumer` possibles C. `Scaffold` hors `Consumer` D. Obligation `MaterialApp`

* **Réponse : C – `Scaffold` hors `Consumer`**
* **Explication :** sans `Consumer` autour du `Scaffold`, on utilise `watch` directement.

---

### Question 25

Pourquoi éviter plusieurs `watch` dans une grande arborescence ?
A. `watch` obsolète B. Provoque hot-reload C. Trop de rebuilds D. Casse le Provider

* **Réponse : C – trop de rebuilds**
* **Explication :** chaque `watch` élargit le scope du rebuild et dégrade les perfs.

---

### Question 26

Que renvoie `final compteur = context.read<CounterProvider>().count;` ?
A. Stream B. Future C. Valeur immédiate D. Widget

* **Réponse : C – valeur immédiate**
* **Explication :** `read` renvoie la valeur courante sans écoute.

---

### Question 27

Rôle de `ChangeNotifierProvider` ?
A. Fournir des couleurs B. Exposer un `ChangeNotifier` C. Gérer les routes D. Remplacer `setState`

* **Réponse : B – exposer un `ChangeNotifier`**
* **Explication :** il instancie l’objet d’état et relaie ses notifications.

---

### Question 28

Pourquoi la méthode 2 est-elle un compromis ?
A. Supprime `Scaffold` B. Isole les rebuilds utiles C. Utilise `setState` D. Plus récente

* **Réponse : B – isole les rebuilds utiles**
* **Explication :** un seul `Consumer` cible la zone dynamique, le reste reste stable.

---

### Question 29

`read()` est-il réactif ?
A. Oui B. Non C. Seulement en `StatefulWidget` D. Avec `notifyListeners`

* **Réponse : B – non**
* **Explication :** `read` lit une fois sans écoute continue.

---

### Question 30

Quand choisir un `Consumer` global (méthode 3) ?
A. Seul le `Text` dépend du Provider B. Toute la page dépend de l’état C. Le Provider ne change jamais D. Pour dégrader les perfs

* **Réponse : B – toute la page dépend de l’état**
* **Explication :** chaque élément varie selon le même état ; un `Consumer` englobant simplifie le code.

