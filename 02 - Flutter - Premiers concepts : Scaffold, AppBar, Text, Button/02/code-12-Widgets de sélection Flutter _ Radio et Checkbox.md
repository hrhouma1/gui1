# Widgets de sélection Flutter : `Radio` et `Checkbox`



## 1. Introduction

Flutter propose deux widgets très utilisés pour la **saisie d’options** dans un formulaire ou une interface :

* `Radio` → pour faire un **choix unique** parmi plusieurs
* `Checkbox` → pour **cocher ou décocher** une ou plusieurs options

---

## 2. Widget `Radio`

### Objectif :

Permet à l’utilisateur de sélectionner **une seule option** parmi un groupe.

### Structure de base :

```dart
Radio(
  value: 1,
  groupValue: selectedValue,
  onChanged: (value) {
    setState(() {
      selectedValue = value;
    });
  },
)
```

---

### Paramètres principaux :

| Paramètre    | Description                                            |
| ------------ | ------------------------------------------------------ |
| `value`      | La valeur de **ce bouton radio**                       |
| `groupValue` | La valeur actuellement **sélectionnée dans le groupe** |
| `onChanged`  | Fonction appelée quand ce bouton est sélectionné       |

---

### Exemple complet :

```dart
int selectedValue = 1;

Column(
  children: [
    Radio(
      value: 1,
      groupValue: selectedValue,
      onChanged: (value) {
        setState(() {
          selectedValue = value!;
        });
      },
    ),
    Radio(
      value: 2,
      groupValue: selectedValue,
      onChanged: (value) {
        setState(() {
          selectedValue = value!;
        });
      },
    ),
    Text("Valeur sélectionnée : $selectedValue"),
  ],
)
```

---

## 3. Widget `Checkbox`

### Objectif :

Permet à l’utilisateur de **cocher ou décocher** une ou plusieurs options.
Chaque `Checkbox` est **indépendante**.

### Structure de base :

```dart
Checkbox(
  value: isChecked,
  onChanged: (value) {
    setState(() {
      isChecked = value!;
    });
  },
)
```

---

### Paramètres principaux :

| Paramètre   | Description                                 |
| ----------- | ------------------------------------------- |
| `value`     | Booléen : coché (`true`) ou non (`false`)   |
| `onChanged` | Fonction appelée quand l’utilisateur clique |

---

### Exemple complet :

```dart
bool isChecked = false;

Row(
  children: [
    Checkbox(
      value: isChecked,
      onChanged: (value) {
        setState(() {
          isChecked = value!;
        });
      },
    ),
    Text("Accepter les conditions"),
  ],
)
```

---

## 4. Différences entre `Radio` et `Checkbox`

| Critère         | `Radio`                             | `Checkbox`                                 |
| --------------- | ----------------------------------- | ------------------------------------------ |
| Nombre de choix | Un seul parmi plusieurs             | Plusieurs cases indépendantes              |
| Type de valeur  | Une valeur choisie                  | Booléen (`true` ou `false`)                |
| Usage typique   | Choix de genre, méthode de paiement | Préférences multiples, options secondaires |

---

## 5. Exercices pratiques

### Exercice 1 – Sélecteur de genre

**Objectif :** créer une interface avec 2 boutons radio : "Homme" et "Femme".
Afficher le genre sélectionné.

**Indications :**

* Utiliser un `String` pour `groupValue`
* Afficher le choix sous forme de `Text`

---

### Exercice 2 – Conditions générales

**Objectif :** afficher une `Checkbox` avec le texte "J'accepte les conditions".
Lorsque la case est cochée, afficher "Merci".

---

### Exercice 3 – Formulaire avec les deux

**Objectif :** créer un mini formulaire avec :

* Choix du type de compte : "Personnel" ou "Entreprise" (`Radio`)
* Option de recevoir la newsletter (`Checkbox`)
* Bouton de validation qui affiche les réponses choisies

---

## 6. Résumé

| Widget     | Utilité                                      |
| ---------- | -------------------------------------------- |
| `Radio`    | Sélection d’une option unique dans un groupe |
| `Checkbox` | Choix indépendant, multiple ou binaire       |

---

## Revenir à la [Table des matières – Flutter](#tb)
