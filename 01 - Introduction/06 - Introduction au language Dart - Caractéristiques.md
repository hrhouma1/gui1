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


<br/>

# Annexe 1 -AOT (Ahead-of-Time compilation) :



## Qu’est-ce que AOT (Ahead-of-Time) ?

AOT, ou **compilation anticipée**, est une technique où ton **code source** est **transformé en code machine** **avant** que le programme ne soit lancé.



## Explication simple

Imagine que tu écris une recette de cuisine en français (ton code), mais ton robot cuisinier ne comprend que le chinois (le code machine).
Avec AOT, tu fais **toute la traduction à l’avance**, avant même de commencer à cuisiner.

Quand vient le moment d’exécuter la recette, **tout est déjà prêt**, donc tu gagnes du temps.
Le robot exécute les instructions **sans attendre**.


## Différence entre AOT et JIT

| Type de compilation | Moment où ça se passe | Avantage principal                 |
| ------------------- | --------------------- | ---------------------------------- |
| AOT (Ahead-of-Time) | Avant l’exécution     | Temps de démarrage plus rapide     |
| JIT (Just-in-Time)  | Pendant l’exécution   | Optimisations dynamiques possibles |

Avec **JIT**, c’est comme si tu traduisais les phrases de ta recette **pendant que tu cuisines**. Cela permet parfois d’améliorer certains passages en cours de route, mais **ça prend plus de temps au début**.


## Exemple avec Flutter

En Flutter, quand tu prépares une application pour Android ou iOS en mode production, le code Dart est **compilé en code machine natif** à l’avance grâce à AOT.

Cela permet à l’application :

* de démarrer plus rapidement
* d’être plus performante
* de ne pas dépendre d’un interpréteur au moment du lancement



## Conclusion

AOT signifie que le code est compilé **avant l’exécution** du programme, ce qui permet des **temps de démarrage plus courts** et une **meilleure performance initiale**.
C’est particulièrement utile pour les **applications mobiles**, où la réactivité est essentielle.


<br/>

<br/>


# Annexe 2 -  Tableau comparatif : AOT vs JIT

| Critère                          | AOT (Ahead-of-Time)              | JIT (Just-in-Time)                   |
| -------------------------------- | -------------------------------- | ------------------------------------ |
| **Moment de la compilation**     | Avant l'exécution                | Pendant l'exécution                  |
| **Langage / Plateforme exemple** | Dart (Flutter), C, C++           | Java, C#, JavaScript                 |
| **Temps de démarrage**           | Très rapide                      | Plus lent (compilation au lancement) |
| **Performances à long terme**    | Stables et constantes            | Peut s’adapter et s’optimiser        |
| **Taille du binaire**            | Plus grande                      | Moins de code initial                |
| **Besoin d'une VM ou runtime**   | Non (tout est déjà compilé)      | Oui (Java Virtual Machine, CLR…)     |
| **Utilisation typique**          | Applications mobiles, embarquées | Applications web, desktop, serveurs  |
| **Exemple concret**              | Flutter (appli mobile)           | Java (application desktop, Android)  |



## À retenir

* **Flutter** utilise **AOT** pour générer du code natif avant d’installer l’application : l’exécution est rapide et fluide.
* **Java** repose sur **JIT** via la JVM : le code est compilé pendant l'exécution, ce qui permet des ajustements dynamiques mais avec un coût au démarrage.


