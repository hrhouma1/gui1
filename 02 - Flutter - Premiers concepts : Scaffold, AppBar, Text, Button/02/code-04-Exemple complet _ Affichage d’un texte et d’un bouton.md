

## 1. Objectif du code

Cette application affiche :

* Un **texte au centre** : "Bonjour le monde"
* Un **bouton** : "Changer le message"

Quand on clique sur le bouton, le texte devient :

> "Tu as cliqué sur le bouton !"

Ici, on a besoin d’un **StatefulWidget**, car le message **change en fonction d’une action** (un clic).



## 2. Structure du code

### Déclaration du widget principal

```dart
class PageAccueil extends StatefulWidget {
  @override
  _PageAccueilState createState() => _PageAccueilState();
}
```

#### Explication :

* `PageAccueil` est la **page principale**.
* Elle est **dynamique** (elle peut changer) donc elle hérite de `StatefulWidget`.
* `createState()` crée une **classe qui gère les changements** (la classe `_PageAccueilState`).



### Classe d’état : \_PageAccueilState

```dart
class _PageAccueilState extends State<PageAccueil> {
```

Cette classe va **contenir et gérer l’état de la page**, c’est-à-dire tout ce qui peut changer à l’écran.



### Variable d’état

```dart
String message = "Bonjour le monde";
```

Ici, on déclare une **variable texte** qu’on affichera à l’écran.
Elle va **changer de valeur** quand on clique sur le bouton.



### Fonction qui modifie le message

```dart
void changerMessage() {
  setState(() {
    message = "Tu as cliqué sur le bouton !";
  });
}
```

#### Explication :

* `changerMessage()` est appelée **quand on clique sur le bouton**.
* `setState()` indique à Flutter :

  > "J’ai changé quelque chose. Redessine l’écran avec les nouvelles valeurs."

Sans `setState()`, Flutter ne mettrait **pas à jour l’écran**.

---

## 3. La méthode `build()`

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text("Accueil")),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message, style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: changerMessage,
            child: Text("Changer le message"),
          ),
        ],
      ),
    ),
  );
}
```

### Ligne par ligne :

* `Scaffold` : structure de base de la page (barre + contenu).
* `AppBar` : barre en haut avec le titre **"Accueil"**.
* `Center` : centre tout le contenu sur l’écran.
* `Column` : empile verticalement les widgets.

Dans la colonne :

1. `Text(message)` : affiche le texte qui peut changer.
2. `SizedBox(height: 20)` : ajoute un **espace vertical**.
3. `ElevatedButton(...)` : bouton qui appelle `changerMessage()` quand on clique.



# 4. Visualisation 

```
---------------------------
| Accueil                 | ← Barre AppBar
---------------------------
|                         |
|   Bonjour le monde      | ← Texte initial
|                         |
|   [Changer le message]  | ← Bouton
---------------------------
```

Puis après clic :

```
---------------------------
| Accueil                 |
---------------------------
|                         |
| Tu as cliqué sur le...  | ← Texte mis à jour
|                         |
|   [Changer le message]  |
---------------------------
```



# 5. Résumé 

| Élément               | Rôle                                                                         |
| --------------------- | ---------------------------------------------------------------------------- |
| `StatefulWidget`      | Permet de créer une interface **qui change**                                 |
| `State`               | Gère les **valeurs qui changent** dans l’interface                           |
| `setState()`          | Demande à Flutter de **reconstruire l’interface** avec les nouvelles valeurs |
| `Scaffold`            | Fournit la structure visuelle de base                                        |
| `AppBar`              | Affiche une barre de titre                                                   |
| `Text(...)`           | Affiche un texte dynamique                                                   |
| `ElevatedButton(...)` | Déclenche une action au clic                                                 |


<br/>

# Annexe 1  - Le underscore `_` ?



Le **underscore `_`** devant un nom, comme `_PageAccueilState`, est **une convention en Dart (le langage de Flutter)** qui signifie que ce **nom est privé**.



## 1. Que veut dire **"privé"** ?

Quand tu écris :

```dart
_PageAccueilState
```

Cela signifie :

> "Ce nom est **réservé à ce fichier**. Les autres fichiers Dart ne peuvent pas y accéder."

C’est une façon de dire :

> "Ceci est **interne**. Tu ne dois pas l’utiliser en dehors de ce fichier."



## 2. Pourquoi on met `_` devant `PageAccueilState` ?

Parce que cette classe est utilisée **uniquement** à l’intérieur de `PageAccueil`.
Elle ne sera **jamais utilisée ailleurs dans l’application**.

Donc, on suit la convention Dart :

```dart
class _PageAccueilState extends State<PageAccueil>
```

→ `_PageAccueilState` est **privée**, mais `PageAccueil` (sans `_`) reste **publique**.



## 3. Est-ce que c’est obligatoire ?

Non. Tu pourrais écrire :

```dart
class PageAccueilState extends State<PageAccueil>
```

Mais ce serait une **mauvaise pratique**. Tu rendrais cette classe visible **partout**, alors que tu veux la garder **interne** à ce widget.



## 4. Pourquoi ce n’est pas `_PageAccueil` aussi ?

Excellente remarque.

Parce que `PageAccueil` est le **nom du widget** que tu vas utiliser **ailleurs** dans ton app (par exemple dans `MaterialApp(home: PageAccueil())`).
Donc, **on veut qu’il soit public**.



## 5. Résumé simple

| Nom                 | Public / Privé ? | Pourquoi ?                                       |
| ------------------- | ---------------- | ------------------------------------------------ |
| `PageAccueil`       | Public           | Tu veux pouvoir l'utiliser ailleurs dans ton app |
| `_PageAccueilState` | Privé            | Tu veux que son usage reste limité au fichier    |




# Annexe 2 - Le underscore `_` en Dart

Dans Dart, **un nom qui commence par `_` est automatiquement privé au fichier**.

Cela veut dire :

* Si tu écris `_MaClasse`, `_maVariable`, ou `_maFonction` :
  → Ils seront **inaccessibles** depuis un autre fichier Dart.

C’est **la seule façon de rendre quelque chose privé** en Dart.



### Exemple :

#### Dans `mon_widget.dart` :

```dart
class _WidgetInterne {
  void faireQuelqueChose() => print("privé");
}
```

#### Dans `main.dart` :

```dart
import 'mon_widget.dart';

void main() {
  var w = _WidgetInterne(); // ❌ ERREUR : _WidgetInterne est privé !
}
```



##  2. Comparaison avec d'autres langages

| Langage    | Visibilité privée      | Syntaxe                            |
| ---------- | ---------------------- | ---------------------------------- |
| **Dart**   | Fichier uniquement     | Préfixe `_`                        |
| **Java**   | Classe / package       | Mots-clés : `private`, `protected` |
| **C#**     | Classe / assembly      | `private`, `internal`, etc.        |
| **Python** | Convention non stricte | `_ma_fonction()` (pas enforce)     |
| **C++**    | Bloc de classe         | `private:` dans la classe          |

Donc :

> Le underscore `_` **a une vraie signification spéciale en Dart**, **contrairement à Python** où c’est juste une convention sans effet technique.



##  3. En Flutter

Dans Flutter, c’est utilisé **partout**, notamment :

* Pour nommer les **classes d’état privées** (`_MonWidgetState`)
* Pour cacher des **fonctions utilitaires**
* Pour protéger des **données internes d’un widget**



##  Résumé

* En Dart, un nom qui commence par `_` est **privé au fichier**.
* C’est la **seule façon de rendre quelque chose privé**.
* Flutter utilise cette règle **systématiquement** pour ses widgets avec état (`StatefulWidget`).

<br/>
<br/>

# Annexe 2 - ElevatedButton — Bouton avec relief

Un `ElevatedButton` est un bouton **matériel** qui donne un **effet de profondeur** (relief). Il est largement utilisé pour les actions principales dans une interface Flutter.



### Exemple 1 — Bouton simple

```dart
ElevatedButton(
  onPressed: () {
    print("Bouton cliqué !");
  },
  child: Text("Clique ici"),
)
```

**Résultat** : Un bouton affichant "Clique ici" qui imprime un message dans la console lorsqu’on clique dessus.



### Exemple 2 — Bouton désactivé

```dart
ElevatedButton(
  onPressed: null,
  child: Text("Je suis désactivé"),
)
```

**Résultat** : Le bouton est grisé et non cliquable.



### Exemple 3 — Bouton avec icône

```dart
ElevatedButton.icon(
  onPressed: () {
    print("Action avec icône");
  },
  icon: Icon(Icons.thumb_up),
  label: Text("J’aime"),
)
```

**Résultat** : Un bouton contenant une icône à gauche et du texte à droite.



### Exemple 4 — Bouton avec mise en forme

```dart
ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.green,
    foregroundColor: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  child: Text("Valider"),
)
```

**Résultat** : Un bouton vert avec texte blanc, coins arrondis et marges internes personnalisées.



### Exemple 5 — Utilisation dans une colonne

```dart
Column(
  children: [
    ElevatedButton(
      onPressed: () {},
      child: Text("Valider"),
    ),
    SizedBox(height: 20),
    ElevatedButton(
      onPressed: () {},
      child: Text("Annuler"),
    ),
  ],
)
```

**Résultat** : Deux boutons empilés verticalement, espacés par 20 pixels.




