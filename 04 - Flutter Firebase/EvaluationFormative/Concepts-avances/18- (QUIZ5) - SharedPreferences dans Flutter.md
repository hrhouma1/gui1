# **Quiz Flutter – SharedPreferences**


### Prérequis :

**Lire le fichier suivant :**

- *04 - Flutter Firebase/EvaluationFormative/07-COURS SharedPreferences dans Flutter.md*




### **Question 1**

**Pourquoi la méthode `SharedPreferences.getInstance()` est-elle `async` ?**

* A. Car elle lit depuis un fichier local en JSON
* B. Car elle nécessite une connexion Internet
* C. Car elle accède à une ressource I/O de manière asynchrone
* D. Car elle crée un nouvel objet à chaque appel

**Réponse : C**

> La méthode est `async` car elle effectue un accès I/O (stockage local persistent). Flutter utilise `Future` pour éviter de bloquer le thread principal.

---

### **Question 2**

**Quelle est la valeur par défaut retournée par `prefs.getInt('counter')` si la clé n'existe pas ?**

* A. 0
* B. null
* C. -1
* D. Une exception est levée

**Réponse : B**

> Si la clé n’existe pas, `getInt()` renvoie `null`. Il est donc courant d’utiliser `prefs.getInt('counter') ?? 0`.

---

### **Question 3**

**Laquelle des méthodes suivantes est incorrecte avec SharedPreferences ?**

* A. `prefs.setStringList()`
* B. `prefs.setDouble()`
* C. `prefs.setMap()`
* D. `prefs.setBool()`

**Réponse : C**

> SharedPreferences **ne supporte pas directement les Map**. Il faut les sérialiser manuellement en JSON (`Map -> String`).

---

### **Question 4**

**Comment stocker un objet complexe avec SharedPreferences ?**

* A. En utilisant `prefs.setObject()`
* B. En l'encodant avec `jsonEncode()` et en le stockant en `String`
* C. En utilisant `prefs.setMap()`
* D. En utilisant `prefs.setDynamic()`

**Réponse : B**

> Les objets complexes doivent être encodés avec `jsonEncode()` avant d’être stockés sous forme de chaîne avec `setString()`.

---

### **Question 5**

**Quel type n'est **pas** nativement pris en charge par SharedPreferences ?**

* A. int
* B. double
* C. bool
* D. List<int>

**Réponse : D**

> Seules les `List<String>` sont supportées nativement. Les autres types de liste comme `List<int>` ne sont pas acceptés.

---

### **Question 6**

**Quelle instruction efface toutes les données stockées dans SharedPreferences ?**

* A. `prefs.removeAll()`
* B. `prefs.clear()`
* C. `prefs.flush()`
* D. `prefs.reset()`

**Réponse : B**

> `prefs.clear()` supprime toutes les clés et toutes les valeurs enregistrées.

---

### **Question 7**

**Pourquoi appelle-t-on `WidgetsFlutterBinding.ensureInitialized()` avant `runApp()` ?**

* A. Pour initialiser les dépendances
* B. Pour permettre l’utilisation de méthodes `async` avant le lancement de l’app
* C. Pour activer le `MaterialApp`
* D. Pour charger les assets

**Réponse : B**

> Cette méthode est nécessaire si on exécute du code asynchrone (comme `await SharedPreferences.getInstance()`) **avant** d'appeler `runApp()`.

---

### **Question 8**

**La méthode suivante est-elle correcte ?**

```dart
await prefs.setStringList('cities', ['Paris', 'Tunis']);
```

* A. Oui
* B. Non, SharedPreferences ne supporte pas de liste
* C. Non, il faut sérialiser manuellement la liste
* D. Non, seules les maps sont autorisées

**Réponse : A**

> `setStringList()` est une méthode valide. Les listes de chaînes sont **le seul type de liste autorisé nativement**.

---

### **Question 9**

**Que renvoie `prefs.getString('username')` si la clé n’a jamais été écrite ?**

* A. La chaîne vide `""`
* B. `null`
* C. Une erreur
* D. `undefined`

**Réponse : B**

> Si la clé n’existe pas, `getString()` renvoie `null`.

---

### **Question 10**

**Quel est l’intérêt d’utiliser un `FutureBuilder` pour lire des préférences ?**

* A. Il permet d’ajouter des animations
* B. Il permet de gérer la lecture `Future` de façon déclarative
* C. Il remplace `SharedPreferences.getInstance()`
* D. Il rend la lecture synchrone

**Réponse : B**

> `FutureBuilder` permet de construire dynamiquement un widget **en fonction de l’état d’un `Future`**.

---

### **Question 11**

**Laquelle de ces méthodes est valide pour supprimer une clé ?**

* A. `prefs.clearKey('key')`
* B. `prefs.remove('key')`
* C. `prefs.delete('key')`
* D. `prefs.drop('key')`

**Réponse : B**

> `prefs.remove()` est la méthode officielle pour supprimer **une seule** clé.

---

### **Question 12**

**Pourquoi utilise-t-on souvent un singleton pour encapsuler `SharedPreferences` ?**

* A. Pour gagner en performance et éviter de répéter `getInstance()`
* B. Pour avoir plusieurs instances indépendantes
* C. Pour rendre l’objet observable
* D. Pour simplifier le test unitaire uniquement

**Réponse : A**

> Cela centralise l’accès et évite de dupliquer `SharedPreferences.getInstance()` dans plusieurs fichiers.

---

### **Question 13**

**Quelle classe faut-il utiliser pour permettre la persistance dans une architecture Provider ?**

* A. `StreamController`
* B. `SettingsManager`
* C. `ChangeNotifier`
* D. `BlocBuilder`

**Réponse : C**

> `ChangeNotifier` permet de notifier la vue qu’un changement a eu lieu après la mise à jour des préférences.

---

### **Question 14**

**À quel moment doit-on appeler `notifyListeners()` dans un Provider ?**

* A. Après avoir écrit dans SharedPreferences
* B. Avant d’écrire
* C. Jamais
* D. Seulement au premier chargement

**Réponse : A**

> Cela signale à tous les widgets consommateurs que l’état a changé.

---

### **Question 15**

**Quelle est la bonne séquence dans un Provider lors d’un `toggleDarkMode()` ?**

* A. Modifier variable, écrire dans prefs, `notifyListeners()`
* B. `notifyListeners()`, modifier variable, écrire prefs
* C. écrire dans prefs uniquement
* D. Modifier variable uniquement

**Réponse : A**

> On modifie l’état, on le persiste, puis on notifie la vue.

---

### **Question 16**

**Quel est le rôle de `prefs.containsKey('username')` ?**

* A. Supprimer une clé
* B. Écrire une valeur
* C. Vérifier si une clé existe
* D. Réinitialiser une valeur

**Réponse : C**

> `containsKey()` retourne un booléen indiquant si une certaine clé est présente dans la base.

---

### **Question 17**

**Laquelle des affirmations suivantes est correcte ?**

* A. `SharedPreferences` est synchrone
* B. Les préférences sont stockées dans la RAM
* C. `SharedPreferences` utilise une base de données SQLite
* D. Les préférences sont stockées dans le stockage local persistant

**Réponse : D**

> Les préférences sont stockées localement, **dans un fichier XML (Android)** ou **NSUserDefaults (iOS)**.

---

### **Question 18**

**Quelle est la méthode recommandée pour tester une méthode utilisant SharedPreferences ?**

* A. Utiliser `Mockito` et mocker `SharedPreferences`
* B. Utiliser `runApp()` directement
* C. Utiliser un `FutureBuilder` dans les tests
* D. Tester dans `main()`

**Réponse : A**

> Il est recommandé de **faker ou mocker** l’instance `SharedPreferences` pour ne pas écrire dans la vraie base pendant les tests.

---

### **Question 19**

**Le contenu de SharedPreferences est-il conservé après redémarrage de l’application ?**

* A. Non
* B. Oui, sauf si on utilise Flutter Web
* C. Oui
* D. Uniquement si on utilise `save()`

**Réponse : C**

> Oui, c’est **le but de SharedPreferences** : persister les données entre plusieurs exécutions.

---

### **Question 20**

**Quelle est la taille maximale recommandée d’un objet stocké dans SharedPreferences ?**

* A. 512 Ko
* B. 1 Mo
* C. 100 Ko
* D. 10 Mo

**Réponse : C**

> Il est conseillé de **ne pas dépasser 100 Ko**, au risque de ralentir le chargement et d’avoir des erreurs.
