

# Exercices – Événements : clics, saisies, interactions dans Flutter

Voici un **ensemble d'exercices pratiques et progressifs** sur les **événements Flutter** liés aux interactions utilisateur : clics, saisies, clics longs, focus, etc. Ces exercices s’appuient sur les événements suivants :




* `onPressed`
* `onChanged`
* `onLongPress`
* `FocusNode`

# Rappel – Principaux événements

| Action                       | Méthode Flutter associée     |
| ---------------------------- | ---------------------------- |
| Appui sur un bouton          | `onPressed:`                 |
| Clic long (maintenu)         | `onLongPress:`               |
| Saisie/modification de texte | `onChanged:`                 |
| Gérer le focus d’un champ    | `FocusNode()` + `FocusScope` |



# Exercice 1 – Détecter un clic sur un bouton

**Objectif :**
Afficher "Bonjour le monde" dans la console quand l’utilisateur clique sur un bouton.

**Consignes :**

* Créer un `ElevatedButton`
* Utiliser `onPressed:`
* Utiliser `print()` pour afficher le message



# Exercice 2 – Réagir à la saisie d’un champ

**Objectif :**
Afficher dans la console le texte saisi à chaque frappe.

**Consignes :**

* Ajouter un `TextField`
* Utiliser `onChanged: (val) => print(val)`
* Afficher en temps réel le contenu tapé



# Exercice 3 – Utiliser un `onLongPress`

**Objectif :**
Afficher "Clic long détecté" si l’utilisateur **maintient** le doigt sur un bouton.

**Consignes :**

* Créer un `ElevatedButton`
* Ajouter `onLongPress:`
* Utiliser `print()` pour tester



# Exercice 4 – Saisie + bouton = message

**Objectif :**
Afficher un message personnalisé après saisie d’un prénom.

**Exemple attendu :**
Saisir "Alice", puis cliquer sur "Valider" → affiche "Bienvenue Alice"

**Consignes :**

* `TextField` avec `onChanged` → stocker dans `String nom`
* `ElevatedButton` avec `onPressed`
* Utiliser `setState()` pour mettre à jour un `Text(...)` en bas



# Exercice 5 – Focus sur un champ

**Objectif :**
Afficher dans la console "Champ activé" lorsque le champ `TextField` prend le focus (quand on clique dedans).

**Consignes :**

* Utiliser `FocusNode`
* Attacher un `listener` pour détecter quand le champ est sélectionné
* Afficher un message dans la console

**Aide :**

```dart
final focusNode = FocusNode();

@override
void initState() {
  super.initState();
  focusNode.addListener(() {
    if (focusNode.hasFocus) {
      print("Champ activé");
    }
  });
}

...

TextField(focusNode: focusNode)
```



# Exercice 6 – Afficher une interaction combinée

**Objectif :**
Créer une mini interface avec :

* Un champ de saisie de ville (`TextField`)
* Deux boutons :

  * "Afficher" → affiche le nom de la ville saisie
  * "Effacer" → vide le champ
* Un texte en dessous qui affiche dynamiquement la valeur



# Bonus – Exercice avancé avec validation

**Objectif :**
Créer un champ `TextField` pour saisir un e-mail, et un bouton "Envoyer".

Si le champ est vide, le bouton est **désactivé**.

**Consignes :**

* Utiliser `TextEditingController`
* Sur chaque modification (`onChanged`), vérifier si le champ est vide
* Si oui : désactiver le bouton (`onPressed: null`)
* Sinon : activer le bouton
