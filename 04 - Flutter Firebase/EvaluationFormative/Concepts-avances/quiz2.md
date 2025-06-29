# <h1 id="quiz-provider">Quiz Flutter – Comparaison des méthodes Provider (`watch` / `Consumer`)</h1>



## <h2>Partie 1 – Questions à Choix Multiples (QCM)</h2>

### Question 1

Dans la méthode 1, combien de fois `context.watch<CounterProvider>()` est-il utilisé dans le `build()` ?
A. 1 fois
B. 2 fois
C. 3 fois
D. 4 fois

---

### Question 2

La méthode 1 utilise principalement :
A. `Consumer`
B. `context.read` uniquement
C. `context.watch` pour la lecture de la donnée
D. `ChangeNotifierBuilder`

---

### Question 3

Dans la méthode 2, quelle partie de l’interface réagit aux changements de `count` ?
A. Tout le widget `build()`
B. Seule la `Text`
C. La `Scaffold` entière
D. Le `body` enveloppé dans `Consumer`

---

### Question 4

Dans la méthode 3, le `Consumer<CounterProvider>` englobe :
A. Seulement le widget `Text`
B. Le bouton flottant uniquement
C. Toute la `Scaffold`
D. Rien, on utilise `watch`

---

### Question 5

Le principal inconvénient de `context.watch` utilisé plusieurs fois est :
A. Code plus propre
B. Meilleure modularité
C. Trop de rebuilds
D. Il ne fonctionne pas avec `ChangeNotifierProvider`

---

### Question 6

Quelle méthode est la plus adaptée si **seule une partie** de l’interface dépend de la donnée ?
A. Méthode 1
B. Méthode 2
C. Méthode 3
D. Aucune des trois

---

### Question 7

Quelle méthode rend le plus difficile la réutilisation de widgets dans d'autres projets ?
A. Méthode 2
B. Méthode 3
C. Méthode 1
D. Toutes

---

### Question 8

Quelle méthode reconstruit le **moins** de widgets lors d’un `notifyListeners()` ?
A. Méthode 1
B. Méthode 2
C. Méthode 3
D. Toutes reconstruisent tout

---

### Question 9

Dans les trois méthodes, comment appelle-t-on la fonction `increment()` dans la méthode 1 et 2 ?
A. `provider.increment()`
B. `context.increment()`
C. `context.read<CounterProvider>().increment()`
D. `ref.watch().increment()`

---

### Question 10

Dans la méthode 3, où accède-t-on à `provider.count` ?
A. Dans un `Consumer` spécifique au `Text`
B. À plusieurs endroits du builder
C. Avec `context.watch()`
D. Uniquement dans le FAB

---

## <h2>Partie 2 – Vrai / Faux</h2>

### Question 11

`context.watch` peut être utilisé dans un `StatelessWidget`.
Réponse : \_\_\_

---

### Question 12

Utiliser plusieurs fois `context.watch()` dans un même `build()` augmente la performance.
Réponse : \_\_\_

---

### Question 13

`Consumer<ProviderType>` permet de limiter le scope de redessins à une sous-partie précise du widget.
Réponse : \_\_\_

---

### Question 14

Dans la méthode 2, la `backgroundColor` du `Scaffold` est redessinée automatiquement à chaque `notifyListeners`.
Réponse : \_\_\_

---

### Question 15

Dans la méthode 3, il n’est plus nécessaire d’utiliser `context.watch()` ou `context.read()`.
Réponse : \_\_\_

---

### Question 16

Il est possible d’utiliser `context.read()` dans un `build()` sans provoquer de rebuild.
Réponse : \_\_\_

---

### Question 17

`watch` est une fonction synchrone.
Réponse : \_\_\_

---

### Question 18

Tous les widgets dans `MaterialApp` sont réactifs par défaut au Provider.
Réponse : \_\_\_

---

### Question 19

`Consumer` doit toujours être déclaré dans `main.dart`.
Réponse : \_\_\_

---

### Question 20

`context.watch` écoute les changements de données et redessine l’arbre depuis l’endroit où il est appelé.
Réponse : \_\_\_

---

## <h2>Partie 3 – Analyse de code (choisir la bonne réponse)</h2>

### Question 21

Que fait ce code ?

```dart
context.read<CounterProvider>().increment();
```

A. Abonne le widget au Provider
B. Lit la valeur et écoute les changements
C. Lit la valeur sans s’abonner
D. Met à jour la couleur du widget

---

### Question 22

Dans la méthode 1, si `count` change, que se passe-t-il ?
A. Rien ne change
B. Tout le widget `build()` est reconstruit
C. Seul le bouton est reconstruit
D. Une erreur est levée

---

### Question 23

Dans la méthode 3, quel est l’avantage principal de `Consumer` global ?
A. Rebuild partiel de la UI
B. Pas besoin de `ChangeNotifier`
C. Centralisation de toute la logique dans un seul bloc
D. Moins de dépendances

---

### Question 24

Dans la méthode 2, pourquoi garde-t-on `context.watch()` pour le `backgroundColor` ?
A. Pour tester les couleurs
B. Parce qu’il est impossible d’avoir deux `Consumer`
C. Car on n’a pas enveloppé tout le `Scaffold`
D. Car `watch` est obligatoire avec `MaterialApp`

---

### Question 25

Pourquoi `context.watch()` ne doit-il pas être utilisé à répétition dans des composants larges ?
A. Car `watch` est déprécié
B. Car cela provoque un `hot reload`
C. Car chaque `watch` peut entraîner un rebuild complet
D. Car cela casse le Provider

---

### Question 26

Que renvoie le code suivant ?

```dart
final compteur = context.read<CounterProvider>().count;
```

A. Un stream
B. Une Future
C. Une valeur immédiatement sans écoute
D. Un widget

---

### Question 27

Quel est le rôle de `ChangeNotifierProvider` ?
A. Fournir des couleurs
B. Gérer l’état et la mise à jour des widgets
C. Gérer les routes Flutter
D. Remplacer `setState`

---

### Question 28

Pourquoi peut-on dire que la méthode 2 est un compromis entre clarté et performance ?
A. Parce qu’elle supprime `Scaffold`
B. Car elle isole les rebuilds aux zones utiles
C. Parce qu’elle utilise `setState()`
D. Car elle est plus récente

---

### Question 29

La méthode `read()` est-elle réactive ?
A. Oui
B. Non
C. Seulement dans un `StatefulWidget`
D. Uniquement si combinée avec `notifyListeners`

---

### Question 30

Dans quel cas est-il pertinent d’utiliser un `Consumer` global (méthode 3) ?
A. Quand seule la valeur dans le `Text` dépend du Provider
B. Quand on veut construire l’interface entière en fonction du Provider
C. Quand le Provider ne change jamais
D. Quand on veut éviter les performances




<br/>
<br/>

# Partie 1 – QCM

### Question 1

Dans la méthode 1, combien de fois `context.watch<CounterProvider>()` est-il utilisé dans `build()` ?
A. 1 B. 2 C. 3 D. 4

**Réponse : C**
**Explication :** on le trouve dans `backgroundColor`, dans la couleur du `Container` et dans le `Text`.

---

### Question 2

La méthode 1 utilise principalement :
A. `Consumer` B. `context.read` uniquement C. `context.watch` D. `ChangeNotifierBuilder`

**Réponse : C**
**Explication :** toutes les lectures de l’état passent par `context.watch`, ce qui rend le widget entier réactif.

---

### Question 3

Dans la méthode 2, quelle partie de l’interface réagit aux changements de `count` ?
A. Tout `build()` B. Uniquement le `Text` C. La `Scaffold` entière D. Le `body` enveloppé dans `Consumer`

**Réponse : D**
**Explication :** seul le `body` est placé dans le `Consumer`; le reste n’est pas reconstruit.

---

### Question 4

Dans la méthode 3, le `Consumer<CounterProvider>` englobe :
A. Seulement le `Text` B. Le FAB C. Toute la `Scaffold` D. Aucun widget

**Réponse : C**
**Explication :** le `builder` du `Consumer` retourne directement la `Scaffold`.

---

### Question 5

Le principal inconvénient de multiplier les appels à `context.watch` est :
A. Code plus propre B. Meilleure modularité C. Trop de rebuilds D. Incompatibilité avec `ChangeNotifierProvider`

**Réponse : C**
**Explication :** chaque `watch` force la reconstruction complète de `build()` quand l’état change.

---

### Question 6

Quelle méthode est la plus adaptée si seule une petite partie de la page dépend du Provider ?
A. Méthode 1 B. Méthode 2 C. Méthode 3 D. Aucune

**Réponse : B**
**Explication :** le `Consumer` partiel limite les rebuilds au strict nécessaire.

---

### Question 7

Quelle méthode complique le plus la réutilisation de widgets dans un projet différent ?
A. Méthode 2 B. Méthode 3 C. Méthode 1 D. Toutes

**Réponse : C**
**Explication :** les appels à `context.watch` disséminés imposent de trimballer le Provider partout.

---

### Question 8

Quelle méthode reconstruit le **moins** de widgets après `notifyListeners()` ?
A. Méthode 1 B. Méthode 2 C. Méthode 3 D.  Elles reconstruisent toutes tout

**Réponse : B**
**Explication :** seul le sous-arbre dans le `Consumer` est mis à jour.

---

### Question 9

Dans les méthodes 1 et 2, l’appel à `increment()` s’écrit :
A. `provider.increment()` B. `context.increment()` C. `context.read<CounterProvider>().increment()` D. `ref.watch().increment()`

**Réponse : C**
**Explication :** `read` lit sans écoute et permet d’appeler une méthode.

---

### Question 10

Dans la méthode 3, où l’on accède à `provider.count` ?
A. Dans un `Consumer` spécifique au `Text` B. À plusieurs endroits du `builder` global C. Avec `context.watch()` D. Uniquement dans le FAB

**Réponse : B**
**Explication :** la valeur est utilisée pour le `backgroundColor`, la couleur du `Container` et le `Text`.

---

## Partie 2 – Vrai / Faux

| #  | Énoncé                                                                                         | Réponse | Explication                                                                                   |
| -- | ---------------------------------------------------------------------------------------------- | ------- | --------------------------------------------------------------------------------------------- |
| 11 | `context.watch` peut être appelé dans un `StatelessWidget`.                                    | Vrai    | `watch` est accessible via `BuildContext`, quelle que soit la nature du widget.               |
| 12 | Multiplier les `watch()` améliore les performances.                                            | Faux    | Plus il y a de `watch`, plus le scope des rebuilds est large.                                 |
| 13 | Un `Consumer` limite la reconstruction à son propre sous-arbre.                                | Vrai    | Seul son `builder` repart quand l’état change.                                                |
| 14 | Dans la méthode 2, la couleur d’arrière-plan est recalculée à chaque changement d’état.        | Vrai    | Elle utilise `context.watch`, donc la `Scaffold` se reconstruit aussi.                        |
| 15 | Dans la méthode 3, `context.watch()` et `context.read()` deviennent inutiles.                  | Vrai    | Le `builder` reçoit `provider`, et les appels se font via cette variable.                     |
| 16 | `context.read()` dans `build()` ne déclenche pas de rebuild automatiques.                      | Vrai    | `read` n’écoute pas le Provider.                                                              |
| 17 | `watch` est synchrone et renvoie la valeur courante immédiatement.                             | Vrai    | Il ne retourne pas une `Future`, il scrute le Provider dès l’appel.                           |
| 18 | Tous les widgets à l’intérieur de `MaterialApp` sont réactifs à tous les Providers par défaut. | Faux    | Ils ne réagissent qu’aux Providers qu’ils écoutent explicitement (`watch`, `Consumer`, etc.). |
| 19 | `Consumer` doit obligatoirement être déclaré dans `main.dart`.                                 | Faux    | Il peut être placé n’importe où dans l’arbre.                                                 |
| 20 | `context.watch` redessine le widget à partir du point d’appel vers le bas.                     | Vrai    | Le rebuild démarre au widget qui appelle `watch`.                                             |

---

## Partie 3 – Analyse de code

### Question 21

Que fait `context.read<CounterProvider>().increment();` ?
A. Abonne le widget B. Écoute la valeur C. Lit sans s’abonner et appelle la méthode D. Change la couleur

**Réponse : C**
**Explication :** `read` accède au Provider sans écoute; on déclenche `increment()`.

---

### Question 22

Dans la méthode 1, si `count` passe de 0 à 1, que se passe-t-il ?
A. Aucun changement B. Tout `build()` est reconstruit C. Seul le bouton change D. Exception

**Réponse : B**
**Explication :** chaque `watch` notifie Flutter, donc `build()` entier est rappelé.

---

### Question 23

Avantage majeur d’un `Consumer` global (méthode 3) ?
A. Rebuild partiel B. Abolit `ChangeNotifier` C. Centralise toute la logique - facile à lire D. Moins de dépendances

**Réponse : C**
**Explication :** on regroupe la logique dans un seul `builder`, clair pour les débutants.

---

### Question 24

Pourquoi garde-t-on `context.watch()` pour le `backgroundColor` dans la méthode 2 ?
A. Test de couleurs B. Impossible d’avoir deux `Consumer` C. Le `Scaffold` n’est pas enveloppé dans un `Consumer` D. Obligation de `MaterialApp`

**Réponse : C**
**Explication :** sans `Consumer` autour du `Scaffold`, il faut un `watch` direct pour rendre la couleur réactive.

---

### Question 25

Pourquoi éviter d’appeler `watch` à répétition dans une grosse arborescence ?
A. `watch` est obsolète B. Provoque un hot-reload permanent C. Chaque `watch` peut déclencher un rebuild complet D. Brise le Provider

**Réponse : C**
**Explication :** plus le scope est grand, plus la mise à jour est coûteuse.

---

### Question 26

Que renvoie `final compteur = context.read<CounterProvider>().count;` ?
A. Un stream B. Une `Future` C. La valeur immédiate sans écoute D. Un widget

**Réponse : C**
**Explication :** `read` obtient la valeur courante et s’arrête là.

---

### Question 27

Rôle de `ChangeNotifierProvider` ?
A. Fournir des couleurs B. Exposer un objet `ChangeNotifier` à l’arbre et relayer `notifyListeners` C. Gérer les routes D. Remplacer `setState` sans Provider

**Réponse : B**
**Explication :** il instancie l’état et diffuse ses mises à jour.

---

### Question 28

Pourquoi la méthode 2 est-elle un compromis ?
A. Supprime `Scaffold` B. Isole les rebuilds aux zones utiles tout en laissant le reste stable C. Utilise `setState` D. C’est la plus récente

**Réponse : B**
**Explication :** un seul `Consumer` cible la partie dynamique, limitant le coût des mises à jour.

---

### Question 29

`read()` est-il réactif ?
A. Oui B. Non C. Seulement dans un `StatefulWidget` D. Uniquement avec `notifyListeners`

**Réponse : B**
**Explication :** il lit la valeur une fois et n’écoute pas les changements.

---

### Question 30

Quand choisir un `Consumer` global (méthode 3) ?
A. Si seul le `Text` dépend du Provider B. Si l’intégralité de la page réagit à l’état (thème, contenu, actions) C. Si le Provider ne change jamais D. Pour dégrader les performances

**Réponse : B**
**Explication :** lorsque chaque élément de la page varie en fonction du même état, un `Consumer` englobant simplifie la logique et reste lisible.

---

### Utilisation pédagogique

* Les explications peuvent servir de **corrigé diffusé aux étudiants**.
* Pour un LMS (Moodle, Thinkific, etc.), chaque bloc question-réponse peut être converti en item de quiz automatique en ajoutant des champs de feedback.

Besoin d’un export `.docx`, `.pdf` ou d’un fichier QTI / Moodle XML ?
