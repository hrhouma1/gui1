# Variables d’état dans Flutter et mise à jour dynamique avec `setState()`


## 1. Introduction

Dans Flutter, les **données de l’interface** (comme le contenu d’un champ, un message affiché, un bouton activé/désactivé, etc.) sont stockées dans des **variables Dart**.

Contrairement à Tkinter (Python), Flutter **n’utilise pas des objets comme `StringVar` ou `IntVar`**.
Il repose simplement sur des **variables classiques Dart**, combinées à une fonction spéciale : `setState()`.



## 2. Comparaison avec Tkinter

| Concept              | Tkinter (Python)         | Flutter (Dart)               |
| -------------------- | ------------------------ | ---------------------------- |
| Texte lié à un champ | `StringVar()`            | `String nom = "";`           |
| Mise à jour visuelle | Automatique via `.set()` | Manuelle via `setState()`    |
| Suivi de changement  | `.trace()`               | `onChanged()` + `setState()` |



## 3. Exemple de variable d’état dans Flutter

```dart
String nom = "";

TextField(
  onChanged: (value) {
    setState(() {
      nom = value;
    });
  },
)
```

### Explication :

* `nom` est une **variable Dart** qui contient ce que l’utilisateur écrit.
* `onChanged` est appelée **à chaque frappe**.
* `setState()` informe Flutter qu’il faut **redessiner l’interface**.



## 4. Utiliser une variable d’état pour afficher du texte dynamique

### Exemple complet :

```dart
class PageTexte extends StatefulWidget {
  @override
  _PageTexteState createState() => _PageTexteState();
}

class _PageTexteState extends State<PageTexte> {
  String nom = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: "Entrez votre nom"),
          onChanged: (value) {
            setState(() {
              nom = value;
            });
          },
        ),
        SizedBox(height: 20),
        Text("Bonjour $nom"),
      ],
    );
  }
}
```



## 5. Comprendre `setState()`

### Exemple minimal :

```dart
String texte = "Bienvenue";

setState(() {
  texte = "Texte mis à jour";
});
```

### À quoi sert `setState()` ?

> C’est une **fonction spéciale** qui informe Flutter que les **valeurs ont changé** et qu’il doit **reconstruire l’interface**.

**Sans `setState()`, rien ne se passe à l’écran** même si tu changes une variable.



## 6. Quand faut-il utiliser `setState()` ?

| Situation                            | Utiliser `setState()` ?    |
| ------------------------------------ | -------------------------- |
| Modifier un texte affiché            | Oui                        |
| Réagir à un clic de bouton           | Oui                        |
| Charger des données depuis une API   | Oui (après chargement)     |
| Modifier une constante locale        | Non (inutile visuellement) |
| Affichage statique (StatelessWidget) | Non                        |


## 7. Erreurs fréquentes à éviter

* ❌ Oublier `setState()` → l’interface **ne se met pas à jour**
* ❌ Appeler `setState()` **pour rien** → ralentit l’application
* ❌ Modifier une variable **en dehors de `setState()`** dans un `StatefulWidget` → comportement imprévisible



## 8. Exercice d’application

### Objectif :

Créer une interface Flutter avec :

* Un champ `TextField` pour entrer un prénom
* Un bouton `ElevatedButton` qui affiche un message personnalisé :

  * Exemple : si on écrit "Alice" → le message devient "Bienvenue Alice"

### Contraintes :

* Utiliser une variable `String` pour stocker le prénom
* Le bouton doit déclencher `setState()`



## 9. Résumé

| Élément       | Rôle                                               |
| ------------- | -------------------------------------------------- |
| Variable Dart | Stocke une valeur dynamique (texte, booléen, etc.) |
| `setState()`  | Demande à Flutter de **redessiner l’interface**    |
| `TextField`   | Champ de saisie relié à une variable               |
| `onChanged`   | Détecte les modifications dans le champ            |



## Revenir à la [Table des matières – Flutter](#tb)


