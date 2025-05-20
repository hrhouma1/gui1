# **C’est quoi Dart ?**



## <h1 id="table-des-matieres">Table des matières</h1>

<ul>
  <li><a href="#1">1. Définition de Dart</a></li>
  <li><a href="#2">2. Pourquoi Dart est utilisé avec Flutter ?</a></li>
  <li><a href="#3">3. Caractéristiques principales du langage</a></li>
  <li><a href="#4">4. Exemples de code simples</a></li>
  <li><a href="#5">5. Comparaison avec d’autres langages connus</a></li>
  <li><a href="#6">6. Compilation et performance</a></li>
  <li><a href="#7">7. Ce qu’il faut retenir</a></li>
</ul>


## <h1 id="1">1. Définition de Dart</h1>

**Dart** est un **langage de programmation moderne** développé par **Google**.

Il a été conçu pour créer des **applications rapides, modernes, et multiplateformes**, notamment pour :

* Mobile (Android, iOS)
* Web
* Desktop (Windows, macOS, Linux)
* Backend (serveur)

Depuis 2017, Dart est **le langage officiel utilisé pour Flutter**.



## <h1 id="2">2. Pourquoi Dart est utilisé avec Flutter ?</h1>

Flutter utilise Dart pour plusieurs raisons techniques :

* Dart permet une **compilation native très rapide** (=> performances proches du natif)
* Dart supporte **la programmation déclarative orientée widget**
* Dart permet le **hot reload** : mise à jour instantanée de l’interface pendant le développement
* Dart a été conçu pour être **simple à apprendre** si on connaît déjà un langage comme Java, Python ou C#



## <h1 id="3">3. Caractéristiques principales de Dart</h1>

Voici les points essentiels à connaître sur le langage :

| Caractéristique                      | Description                                                        |
| ------------------------------------ | ------------------------------------------------------------------ |
| Langage orienté objet                | Tout est objet, y compris les fonctions                            |
| Typage fort                          | Les types sont obligatoires (`int`, `String`, `bool`, etc.)        |
| Typage optionnel au début            | Peut utiliser `var` ou `dynamic` au besoin                         |
| Supporte la programmation asynchrone | Avec `Future`, `async`, `await`                                    |
| Compilation flexible                 | Peut être compilé en JavaScript (web) ou en natif (mobile/desktop) |
| Syntaxe claire                       | Inspirée de JavaScript, Java, C#                                   |



## <h1 id="4">4. Exemples de code simples</h1>

### Une fonction simple :

```dart
void main() {
  print("Bonjour Dart !");
}
```

### Déclaration de variables :

```dart
int age = 25;
String nom = "Marie";
bool actif = true;
```

### Une classe en Dart :

```dart
class Personne {
  String nom;
  int age;

  Personne(this.nom, this.age);

  void afficher() {
    print("$nom a $age ans.");
  }
}
```

### Explications :

```
// Déclaration d'une classe nommée "Personne"
class Personne {
  // Déclaration d'un attribut "nom" de type String
  String nom;

  // Déclaration d'un attribut "age" de type int (entier)
  int age;

  // Constructeur de la classe : permet d'initialiser les attributs "nom" et "age"
  // L'utilisation de "this.nom" signifie que l'on affecte la valeur reçue au champ "nom" de l'objet
  Personne(this.nom, this.age);

  // Méthode de la classe qui affiche une phrase contenant les valeurs de "nom" et "age"
  void afficher() {
    print("$nom a $age ans.");
  }
}
```

### Utilisation :

```dart
void main() {
  var p = Personne("Sam", 30);
  p.afficher(); // Affiche : Sam a 30 ans.
}
```



## <h1 id="5">5. Comparaison avec d’autres langages connus</h1>

| Concept       | Dart                            | Java            | Python          |
| ------------- | ------------------------------- | --------------- | --------------- |
| Typage        | Fort, optionnel                 | Fort, explicite | Dynamique       |
| Syntaxe       | Moderne, claire                 | Verbose         | Très concise    |
| Orienté objet | Oui                             | Oui             | Oui             |
| Interfaces    | Avec `abstract` ou `implements` | Oui             | Pas directement |
| Async/await   | Oui                             | Depuis Java 8   | Oui             |

Dart cherche à combiner **la rigueur de Java** avec **la simplicité de JavaScript** et **l’expressivité de Python**.



## <h1 id="6">6. Compilation et performance</h1>

Dart propose deux types de compilation :

* **JIT (Just-In-Time)** : pendant le développement → permet le **hot reload**
* **AOT (Ahead-Of-Time)** : pour la publication → compile en **code machine natif** → performances maximales

> Résultat : Flutter (avec Dart) peut produire des applications aussi rapides que celles écrites en Swift (iOS) ou Kotlin (Android).



## <h1 id="7">7. Ce qu’il faut retenir</h1>

* Dart est un langage moderne, maintenu par Google
* Il est **simple à apprendre**, surtout si on connaît déjà un langage impératif
* Il est **orienté objet**, avec une syntaxe claire et expressive
* Il permet la création d’**interfaces réactives et rapides**, grâce à sa compatibilité directe avec Flutter
* Il est utilisé **professionnellement dans de grandes entreprises** via Flutter


