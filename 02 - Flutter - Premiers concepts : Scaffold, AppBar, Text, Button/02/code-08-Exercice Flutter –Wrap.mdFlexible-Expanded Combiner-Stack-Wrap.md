# Exercice Flutter – Combiner `Expanded`, `Flexible`, `Stack`, et `Wrap`


# Objectif général

Construire une interface Flutter réactive et organisée avec :

* Des blocs colorés répartis avec `Expanded` et `Flexible`
* Une image avec texte superposé (`Stack`)
* Une liste de mots qui s’enroule automatiquement (`Wrap`)



# Étapes de réalisation

###  Étape 1 – Entête avec `Stack`

**But :** superposer du texte sur une image.

**Instructions :**

* Utiliser un `Container` avec une hauteur fixe (ex. 200px)
* Mettre une image en fond (`Image.network(...)` ou `Image.asset(...)`)
* Ajouter un `Text("Bienvenue")` en bas à droite avec `Positioned(...)`



### Étape 2 – Zone d’options avec `Expanded` et `Flexible`

**But :** créer une ligne avec 3 blocs colorés :

* Le premier prend **50 %** de l’espace (`Expanded`)
* Le deuxième est **large de 100px** (`Flexible`)
* Le troisième prend le reste (`Expanded`)

**Instructions :**

* Utiliser un `Row`
* Ajouter trois `Container` avec des couleurs et hauteurs identiques
* Jouer avec `Expanded`, `Flexible`, et `flex`



###  Étape 3 – Affichage dynamique avec `Wrap`

**But :** afficher une série de **tags** (mots-clés) qui passent à la ligne automatiquement.

**Instructions :**

* Utiliser `Wrap`
* Ajouter 8 à 10 `Chip(label: Text(...))`
* Définir un `spacing` et un `runSpacing` pour l’aération



###  Étape 4 – Structure finale

Assembler le tout dans un `Column`, avec des marges (`Padding`) et des séparateurs (`SizedBox`) entre les sections.



## 💡 Représentation attendue 

```
[Image avec texte "Bienvenue"] ← Stack

[ Bloc 1 ][ Bloc 2 (100px) ][ Bloc 3 ] ← Row avec Expanded/Flexible

[ Tag A ] [ Tag B ] [ Tag C ]
[ Tag D ] [ Tag E ] [ Tag F ] ← Wrap
```


##  Bonus (optionnel)

* Animer l’apparition des blocs avec `AnimatedContainer`
* Rendre la liste de tags interactive (clic = print dans console)
* Ajouter un bouton flottant (`FloatingActionButton`) qui affiche une boîte de dialogue



## Contraintes techniques

| Élément       | Utiliser obligatoirement      |
| ------------- | ----------------------------- |
| Superposition | `Stack` + `Positioned`        |
| Répartition   | `Row` + `Expanded`/`Flexible` |
| Enroulement   | `Wrap`                        |
| Espacement    | `SizedBox`, `Padding`         |


<br/>

# Correction



```dart
import 'package:flutter/material.dart';

class ExempleLayoutsAvances extends StatefulWidget {
  @override
  _ExempleLayoutsAvancesState createState() => _ExempleLayoutsAvancesState();
}

class _ExempleLayoutsAvancesState extends State<ExempleLayoutsAvances> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mise en page avancée"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // marge intérieure globale
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // occuper toute la largeur
          children: [

            // Étape 1 : Image avec texte superposé
            Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Image.network(
                    "https://via.placeholder.com/600x200",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Text(
                    "Bienvenue",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      backgroundColor: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20), // espace entre les sections

            // Étape 2 : Ligne de blocs avec Expanded et Flexible
            Row(
              children: [
                Expanded(
                  flex: 1, // 50% de l'espace
                  child: Container(
                    height: 60,
                    color: Colors.red,
                    child: Center(child: Text("Bloc 1")),
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Container(
                    height: 60,
                    width: 100, // taille fixe possible
                    color: Colors.green,
                    child: Center(child: Text("Bloc 2")),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1, // 50% de l'espace restant
                  child: Container(
                    height: 60,
                    color: Colors.blue,
                    child: Center(child: Text("Bloc 3")),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20), // espace entre les sections

            // Étape 3 : Liste de tags (Wrap)
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                "Tag A",
                "Tag B",
                "Tag C",
                "Tag D",
                "Tag E",
                "Tag F",
                "Tag G",
                "Tag H",
              ].map((tag) {
                return Chip(
                  label: Text(tag),
                  backgroundColor: Colors.grey[200],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## Structure du code

| Section                | Composants utilisés                                |
| ---------------------- | -------------------------------------------------- |
| Image + texte          | `Stack`, `Positioned`, `Image.network`, `Text`     |
| Ligne de blocs         | `Row`, `Expanded`, `Flexible`, `Container`, `Text` |
| Tags adaptatifs        | `Wrap`, `Chip`                                     |
| Espacement / structure | `SizedBox`, `Padding`, `Column`, `Scaffold`        |


