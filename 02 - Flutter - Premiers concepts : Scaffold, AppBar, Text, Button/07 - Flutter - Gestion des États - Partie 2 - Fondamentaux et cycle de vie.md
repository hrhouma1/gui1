# Liste des exercices – Partie 2 : États fondamentaux

### <h2 id="ex1">🟢 Exercice 1 – Afficher un compteur statique</h2>

> Objectif : comprendre `Text()` dans un widget sans état.

* Afficher simplement le texte : `Compteur : 0` (rien ne change).



### <h2 id="ex2">🟢 Exercice 2 – Créer un bouton sans action</h2>

> Objectif : découvrir `ElevatedButton` et `StatelessWidget`.

* Afficher un bouton `"Clique ici"` qui ne fait rien.
* Pas d'état, pas de `setState()`.



### <h2 id="ex3">🟢 Exercice 3 – Créer un bouton qui change le texte</h2>

> Objectif : introduire `StatefulWidget` et `setState()`.

* Au clic, le bouton affiche `"Merci !"`.
* Le texte ne revient pas en arrière.



### <h2 id="ex4">🟢 Exercice 4 – Incrémenter un compteur</h2>

> Objectif : découvrir une **variable entière** dans l’état.

* Afficher `Compteur : 0` puis `Compteur : 1`, `2`, `3` à chaque clic.



### <h2 id="ex5">🟢 Exercice 5 – Bouton Réinitialiser</h2>

> Objectif : gérer **plusieurs actions avec `setState()`**.

* Bouton 1 : Incrémenter le compteur.
* Bouton 2 : Réinitialiser à zéro.



### <h2 id="ex6">🟢 Exercice 6 – Afficher “Bonjour” ou “Bonsoir”</h2>

> Objectif : changer **un texte affiché** via un bouton.

* Texte affiché : `"Bonjour"` (par défaut)
* Bouton : `"Changer"` → passe à `"Bonsoir"` puis alterne.


### <h2 id="ex7">🟢 Exercice 7 – Afficher une couleur différente</h2>

> Objectif : utiliser `Container` avec `setState()`.

* Un carré coloré (bleu).
* Bouton : `"Changer la couleur"` → passe au rouge, puis bleu, etc.



### <h2 id="ex8">🟢 Exercice 8 – Case à cocher simple</h2>

> Objectif : découvrir `Checkbox` avec `setState()`.

* Afficher une case cochable : `"J'accepte les conditions"`.
* Elle change dynamiquement quand on clique.



### <h2 id="ex9">🟢 Exercice 9 – Affichage conditionnel</h2>

> Objectif : introduire une **condition d’affichage**.

* Bouton : `"Afficher le message"`
* Si cliqué : afficher `"Bienvenue"`
* Sinon : rien.



### <h2 id="ex10">🟢 Exercice 10 – Sélecteur avec `DropdownButton`</h2>

> Objectif : introduire un `DropdownButton` contrôlé par `setState()`.

* Liste déroulante : `"Rouge"`, `"Vert"`, `"Bleu"`.
* Afficher la couleur choisie sous forme de texte.


