#  Fiche Mémo – Visibilité, underscore `_` et conventions en Dart (Flutter)



## 1. Le underscore `_` = visibilité privée au fichier

###  Règle principale :

En Dart, **tout ce qui commence par un `_` est privé au fichier** dans lequel il est défini.

> Cela signifie : inaccessible depuis un autre fichier Dart, même s'il est importé.



###  Exemples :

```dart
// fichier : mon_widget.dart
class _WidgetPrive {
  void afficher() => print("Privé");
}
```

```dart
// fichier : main.dart
import 'mon_widget.dart';

void main() {
  var x = _WidgetPrive(); // ❌ ERREUR : cette classe est privée au fichier mon_widget.dart
}
```


## 2. Pourquoi Flutter utilise toujours `_MaClasseState` ?

### Exemple standard Flutter :

```dart
class PageAccueil extends StatefulWidget {
  @override
  _PageAccueilState createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil> {
  // Contient le message, les interactions, etc.
}
```

### Pourquoi `_PageAccueilState` est privé ?

* Parce que cette classe ne doit pas être utilisée ailleurs que dans ce fichier.
* Elle ne sert **que pour gérer l’état interne de PageAccueil**, donc on la protège.

> Le `StatefulWidget` est public, l’implémentation de l’état est privée.



## 3. Que peut-on rendre privé avec `_` ?

| Élément Dart         | Privé si `_` devant ? | Exemple                          |
| -------------------- | --------------------- | -------------------------------- |
| Classe               | Oui                   | `class _MonControleur {}`        |
| Fonction             | Oui                   | `void _validerFormulaire() {}`   |
| Variable             | Oui                   | `String _motDePasse = 'secret';` |
| Méthode d’une classe | Oui                   | `void _calculerTotal()`          |
| Constante            | Oui                   | `const _hauteurMax = 200;`       |



## 4. Résumé de la portée

| Syntaxe       | Visible où ?                              |
| ------------- | ----------------------------------------- |
| `maVariable`  | Partout (publique)                        |
| `_maVariable` | Seulement dans le **fichier Dart** actuel |
| `MaClasse`    | Partout (publique)                        |
| `_MaClasse`   | Seulement dans ce fichier                 |



## 5. Bonnes pratiques (Flutter/Dart)

| Pratique courante           | Pourquoi ?                                                       |
| --------------------------- | ---------------------------------------------------------------- |
| `PageAccueil` (public)      | Widget utilisé dans toute l’application                          |
| `_PageAccueilState` (privé) | Composant interne utilisé uniquement pour gérer l’état du widget |
| `_monControleur`            | Variable interne non exposée à l’extérieur                       |
| `_initialiser()`            | Fonction locale non destinée à être réutilisée                   |



## 6. Comparaison avec d'autres langages

| Langage | Mots-clés de visibilité     | Notes                                    |
| ------- | --------------------------- | ---------------------------------------- |
| Dart    | `_` pour fichier privé      | Aucun mot-clé `private` ou `public`      |
| Java    | `private`, `public`, etc.   | Visibilité par classe ou package         |
| Python  | `_` pour convention         | Non strict, pas bloquant                 |
| C++     | `private:`, `public:`       | Bloc structuré dans la classe            |
| C#      | `private`, `internal`, etc. | Visibilité par fichier, classe ou projet |



## 7. À retenir absolument

* Dart **n’a pas** de mot-clé `private` ou `public`.
* Le **seul moyen** de restreindre la visibilité à un fichier, c’est de **mettre un `_` devant** le nom.
* Flutter **respecte strictement** cette convention dans tous ses fichiers internes et widgets personnalisés.
