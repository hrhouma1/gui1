
## Objectif :

- Le but de ce document est de  vous expliquer la **différence entre mots réservés, widgets, fonctions, variables** en Dart/Flutter, puis donner des *exemples concrets*



## 1. Qu’est-ce qu’un **mot réservé** en Dart ?

Les **mots réservés** sont des mots que **tu ne peux pas utiliser comme nom de variable**, car ils ont une **signification spéciale dans le langage Dart** (comme `if`, `else`, `while`, `class`, `return`, etc.).

### Exemples de mots réservés en Dart :

```dart
abstract, break, case, class, const, continue, default,
do, else, enum, false, final, for, if, in, is, new,
null, return, super, switch, this, throw, true, try,
var, void, while, with
```

Tu **ne peux pas faire** :

```dart
int class = 5; // Erreur, car "class" est un mot réservé
```

---

## 2. Comment déclarer une **variable** en Dart

### Exemple simple :

```dart
int age = 25;
String nom = "Paul";
bool actif = true;
double taille = 1.78;
```

### Mot-clé `var`

Tu peux aussi utiliser `var` si tu veux que Dart devine le type :

```dart
var nom = "Sophie"; // Dart comprend que c’est une String
```

---

## 3. C’est quoi `child`, `Text`, `SizedBox`, `Column`, etc. ?

Ce ne sont **pas des mots réservés**, ce sont :

| Mot         | Rôle          | Exemple                                     |
| ----------- | ------------- | ------------------------------------------- |
| `child`     | **Propriété** | D’un widget (ex. `Center(child: ...)`)      |
| `Text`      | **Widget**    | Qui affiche du texte                        |
| `SizedBox`  | **Widget**    | Qui crée de l’espace ou une boîte vide      |
| `Column`    | **Widget**    | Qui empile verticalement plusieurs widgets  |
| `onPressed` | **Propriété** | D’un bouton, prend une **fonction anonyme** |

---

## 4. Exemple complet et annoté

Voici un petit programme Flutter commenté ligne par ligne :

```dart
class MonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Déclaration de variables Dart
    String message = "Bonjour le monde";
    int compteur = 0;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Exemple Flutter")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message), // Widget Text qui affiche une variable
              SizedBox(height: 20), // Espace vertical
              ElevatedButton(
                onPressed: () {
                  print("Le bouton a été cliqué !");
                },
                child: Text("Clique ici"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```



## 5. Résumé

| Élément     | Type        | Peut-on l’utiliser comme nom de variable ? | Exemple                |
| ----------- | ----------- | ------------------------------------------ | ---------------------- |
| `class`     | Mot réservé | Non                                        | `class MonApp`         |
| `Text`      | Widget      | Oui, mais ce n’est **pas conseillé**       | `Text("Hello")`        |
| `child`     | Propriété   | Non (c’est une clé dans un widget)         | `child: Text(...)`     |
| `SizedBox`  | Widget      | Oui, mais pas comme variable               | `SizedBox(height: 20)` |
| `onPressed` | Propriété   | Non                                        | `onPressed: () => ...` |
| `var`       | Mot réservé | Oui, utilisé pour déclarer une variable    | `var nom = "Sarah"`    |






# Explication

```dart
// Déclaration de la classe principale de l'application, qui hérite de StatelessWidget
class MonApp extends StatelessWidget {

  // Override = redéfinition de la méthode build qui construit l'interface
  @override
  Widget build(BuildContext context) {

    // Déclaration d'une variable String en Dart
    String message = "Bonjour le monde";

    // Déclaration d'une variable entière (non utilisée ici)
    int compteur = 0;

    // Retourne la structure de l'application Flutter
    return MaterialApp(
      // Le widget principal de l'application : Scaffold fournit la structure de base
      home: Scaffold(
        // Barre d'application en haut avec un titre
        appBar: AppBar(title: Text("Exemple Flutter")),

        // Corps de la fenêtre centré
        body: Center(
          // Le widget Column permet d'empiler verticalement plusieurs widgets
          child: Column(
            // Centrage vertical du contenu dans la colonne
            mainAxisAlignment: MainAxisAlignment.center,

            // Liste des widgets enfants affichés dans la colonne
            children: [

              // Affiche le contenu de la variable message dans un widget Text
              Text(message),

              // Crée un espace vertical de 20 pixels entre les widgets
              SizedBox(height: 20),

              // Bouton cliquable avec un texte
              ElevatedButton(
                // Action exécutée quand on clique sur le bouton
                onPressed: () {
                  // Affiche un message dans la console
                  print("Le bouton a été cliqué !");
                },

                // Contenu du bouton (ici un texte)
                child: Text("Clique ici"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```


