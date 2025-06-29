# <h1 id="quiz-shared-preferences">Quiz Flutter – SharedPreferences</h1>

---

## <h2>Partie 1 – Questions à Choix Multiples (QCM)</h2>

### Question 1

* **Quel package Flutter permet d’accéder à SharedPreferences ?**

  * A. `flutter_secure_storage`
  * B. `shared_preferences`
  * C. `sqflite`
  * D. `hive_flutter`
    **Réponse : B**

> `shared_preferences` est le plugin officiel pour stocker des données simples localement.

---

### Question 2

* **Quel type de données ne peut PAS être stocké avec SharedPreferences ?**

  * A. `String`
  * B. `bool`
  * C. `List<String>`
  * D. `Map<String, dynamic>`
    **Réponse : D**

> Les maps ne sont pas prises en charge. Il faut les sérialiser manuellement (ex : en JSON).

---

### Question 3

* **Quelle méthode permet de sauvegarder une chaîne de caractères ?**

  * A. `prefs.saveString()`
  * B. `prefs.store("key", "value")`
  * C. `prefs.setString("key", "value")`
  * D. `prefs.write()`
    **Réponse : C**

> La méthode exacte est `prefs.setString(...)`.

---

### Question 4

* **Avant d’utiliser SharedPreferences, il faut obligatoirement :**

  * A. Créer un fichier JSON
  * B. Faire un `await SharedPreferences.getInstance()`
  * C. Définir une classe de stockage
  * D. Utiliser `WidgetsFlutterBinding.ensureInitialized()`
    **Réponse : B**

> On récupère l’instance unique via `SharedPreferences.getInstance()` en asynchrone.

---

### Question 5

* **Quelle est la portée de SharedPreferences ?**

  * A. Locale à un widget
  * B. Globale à toute l’application
  * C. Liée au `State`
  * D. Limitée à une session
    **Réponse : B**

> SharedPreferences est stocké sur le **disque** du téléphone et accessible globalement.

---

### Question 6

* **Que se passe-t-il si une clé demandée n’existe pas ?**

  * A. Une exception est levée
  * B. Elle retourne `null` ou une valeur par défaut
  * C. L’application plante
  * D. La clé est créée automatiquement
    **Réponse : B**

> Les getters (`getString`, etc.) retournent `null` si la clé est absente.

---

### Question 7

* **SharedPreferences est le mieux adapté pour stocker :**

  * A. Des images encodées
  * B. Un grand tableau de données
  * C. Des identifiants, préférences utilisateur, booléens simples
  * D. Un binaire brut
    **Réponse : C**

> Il est conçu pour des **petites données simples et fréquentes**.

---

### Question 8

* **Comment supprimer une entrée enregistrée ?**

  * A. `prefs.clear("key")`
  * B. `prefs.delete("key")`
  * C. `prefs.remove("key")`
  * D. `prefs.set("key", null)`
    **Réponse : C**

> `prefs.remove("key")` permet de supprimer une donnée existante.

---

## <h2>Partie 2 – Vrai / Faux</h2>

| #  | Énoncé                                                                           | Réponse | Explication                                                                            |
| -- | -------------------------------------------------------------------------------- | ------- | -------------------------------------------------------------------------------------- |
| 9  | SharedPreferences est synchrone.                                                 | Faux    | Toutes les opérations sont asynchrones via `Future`.                                   |
| 10 | SharedPreferences peut stocker des listes de chaînes.                            | Vrai    | `setStringList()` permet de sauvegarder une `List<String>`.                            |
| 11 | SharedPreferences utilise SQLite en interne.                                     | Faux    | Il utilise un système natif de key-value store, différent de SQLite.                   |
| 12 | SharedPreferences peut être utilisé dans un `StatefulWidget`.                    | Vrai    | Il peut être utilisé n’importe où tant que `BuildContext` ou `async` sont disponibles. |
| 13 | Les valeurs stockées avec SharedPreferences sont supprimées après un hot reload. | Faux    | Elles persistent sur le disque de l'appareil.                                          |

---

## <h2>Partie 3 – Analyse de code</h2>

### Question 14

Quel est le but de ce code ?

```dart
final prefs = await SharedPreferences.getInstance();
prefs.setBool('remember_me', true);
```

* A. Supprimer une préférence
* B. Lire une préférence
* C. Sauvegarder une valeur booléenne
* D. Réinitialiser toutes les préférences
  **Réponse : C**

> `setBool()` permet d’enregistrer un booléen avec la clé `remember_me`.

---

### Question 15

Quel est le résultat de ce code si la clé `"theme"` n’a jamais été enregistrée ?

```dart
final prefs = await SharedPreferences.getInstance();
print(prefs.getString('theme'));
```

* A. `"default"`
* B. `null`
* C. Erreur
* D. `""`
  **Réponse : B**

> Si la clé n’existe pas, `getString()` retourne `null`.


