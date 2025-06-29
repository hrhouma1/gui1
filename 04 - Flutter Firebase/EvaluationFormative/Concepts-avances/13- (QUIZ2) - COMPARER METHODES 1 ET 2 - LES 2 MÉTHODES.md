# <h1 id="quiz-provider">Quiz Flutter – Comparaison des méthodes Provider (`watch` / `Consumer`)</h1>

### Prérequis :

**Lire les 2 fichiers suivants :**

- *04 - Flutter Firebase/EvaluationFormative/Concepts-avances/12- (PRATIQUE3) - COMPARER METHODES 1 ET 2 - LES 2 MÉTHODES*
- *04 - Flutter Firebase/EvaluationFormative/Concepts-avances/20- (IMPORTANT) Explications intermédiaires pratiques-1-et-2.md*

## <h2>Partie 1 – Questions à choix multiples (QCM)</h2>

### Question 1

Dans la méthode 1, combien de fois `context.watch<CounterProvider>()` est-il utilisé dans le `build()` ?
A. 1 fois B. 2 fois C. 3 fois D. 4 fois

* **Réponse : C – 3 fois**
* **Explication :** appels pour `backgroundColor`, `Container.color` et `Text`.

---

### Question 2

La méthode 1 utilise principalement :
A. `Consumer` B. `context.read` seulement C. `context.watch` D. `ChangeNotifierBuilder`

* **Réponse : C – `context.watch`**
* **Explication :** toutes les lectures passent par `watch`, rendant tout le widget réactif.

---

### Question 3

Dans la méthode 2, quelle partie de l’interface réagit aux changements de `count` ?
A. Tout `build()` B. seulement la `Text` C. la `Scaffold` entière D. le `body` dans `Consumer`

* **Réponse : D – le `body`**
* **Explication :** seul le sous-arbre enveloppé par `Consumer` est reconstruit.

---

### Question 4

Dans la méthode 3, le `Consumer<CounterProvider>` englobe :
A. seulement le `Text` B. le FAB C. toute la `Scaffold` D. aucun widget

* **Réponse : C – toute la `Scaffold`**
* **Explication :** le `builder` retourne directement la `Scaffold`.

---

### Question 5

Le principal inconvénient de multiplier les appels à `context.watch` est :
A. code plus propre B. meilleure modularité C. trop de rebuilds D. incompatibilité

* **Réponse : C – trop de rebuilds**
* **Explication :** chaque `watch` déclenche la reconstruction complète de `build()`.

---

### Question 6

Méthode la plus adaptée si seule une petite partie dépend du Provider ?
A. Méthode 1 B. Méthode 2 C. Méthode 3 D. Aucune

* **Réponse : B – méthode 2 (`Consumer` partiel)**
* **Explication :** on isole la zone réactive, le reste reste stable.

---

### Question 7

Méthode qui complique le plus la réutilisation de widgets ailleurs ?
A. Méthode 2 B. Méthode 3 C. Méthode 1 D. Toutes

* **Réponse : C – méthode 1**
* **Explication :** `watch` dispersé impose la présence du Provider dans tout le code.

---

### Question 8

Méthode qui reconstruit le moins de widgets après `notifyListeners()` ?
A. Méthode 1 B. Méthode 2 C. Méthode 3 D. Toutes

* **Réponse : B – méthode 2**
* **Explication :** seul le sous-arbre du `Consumer` est mis à jour.

---

### Question 9

Appel correct de `increment()` dans les méthodes 1 et 2 ?
A. `provider.increment()` B. `context.increment()` C. `context.read<CounterProvider>().increment()` D. `ref.watch().increment()`

* **Réponse : C – `context.read<CounterProvider>().increment()`**
* **Explication :** `read` lit sans écoute puis appelle la méthode.

---

### Question 10

Dans la méthode 3, où accède-t-on à `provider.count` ?
A. Consumer sur `Text` B. Plusieurs endroits du builder C. via `context.watch()` D. seulement dans le FAB

* **Réponse : B – plusieurs endroits**
* **Explication :** utilisé pour le `backgroundColor`, le `Container` et le `Text`.

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

---

## <h2>Partie 3 – Analyse de code (choix unique)</h2>

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

