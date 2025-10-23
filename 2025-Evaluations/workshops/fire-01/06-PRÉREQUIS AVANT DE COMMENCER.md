## 🔧 **PRÉREQUIS AVANT DE COMMENCER**

Avant de suivre ce guide, **assurez-vous d’avoir :**

* Un compte Google
* Accès à [https://console.firebase.google.com](https://console.firebase.google.com)
* Un projet Flutter déjà créé
* Firebase déjà ajouté à votre projet (via `flutterfire configure` ou manuellement)



## 🗂️ ÉTAPE 1 : Créer la collection `App-Category`

### ✅ Étapes détaillées :

1. Allez sur [https://console.firebase.google.com](https://console.firebase.google.com)
2. Cliquez sur votre projet
3. Dans le menu gauche, cliquez **Firestore Database**
4. Cliquez sur **Créer une base de données** (si ce n’est pas déjà fait)
5. Choisissez **Démarrer en mode test**, puis **Activer**
6. Cliquez sur **Démarrer une collection**
7. **Nom de la collection :** `App-Category`
8. **ID du document :** laissez vide (Firestore en générera un)
9. **Champ :**

   * Nom : `name`
   * Type : `string`
   * Valeur : `Breakfast`
10. Cliquez sur **Enregistrer**
11. Répétez pour créer **3 autres documents** avec :

    * `Lunch`
    * `Dinner`
    * `Snack`



## 🍽️ ÉTAPE 2 : Créer la collection `Complete-Flutter-App`

### ✅ Créer les documents recettes :

1. Cliquez sur **Démarrer une collection**
2. **Nom de la collection :** `Complete-Flutter-App`
3. **ID du document :** vide (Firestore en générera un)
4. Ajoutez **les 7 champs** suivants, tous de type `string` :

| Clé        | Exemple de valeur      |
| ---------- | ---------------------- |
| `cal`      | `"450"`                |
| `category` | `"Dinner"`             |
| `image`    | `"URL_DE_VOTRE_IMAGE"` |
| `name`     | `"Grilled Beef Steak"` |
| `rating`   | `"4.8"`                |
| `reviews`  | `"25"`                 |
| `time`     | `"30"`                 |

5. Cliquez sur **Enregistrer**
6. Répétez cette étape **6 fois** avec les recettes suivantes :

* Butter Chicken
* French Toast
* Mexican Pizza
* Dumplings
* Ramen Noodles

Remplacez les champs avec les valeurs données dans ta description.

> 📝 Laissez l'image vide pour l’instant, vous la remplirez après l’upload (étape 3).



## 📁 ÉTAPE 3 : Uploader les images dans Firebase Storage

### ✅ Étapes pour Firebase Storage :

1. Dans Firebase Console, allez dans **Storage**
2. Cliquez sur **Commencer**, choisissez l’emplacement recommandé (us-central ou autre)
3. Cliquez sur **Créer un dossier**, nommez-le `images`
4. Cliquez dans ce dossier, puis **Importer des fichiers**
5. Uploadez vos 6 images :

```
beef-steak.jpg
butter-chicken.jpg
french-toast.jpg
mexican-pizza.jpg
dumplings.jpg
ramen-noodles.jpg
```

6. Après l’upload, cliquez sur une image → **Menu “…” → Ouvrir dans un nouvel onglet**
7. Copiez l’**URL publique** et remplacez la valeur `"URL_DE_VOTRE_IMAGE_XXX"` dans le champ `image` de vos documents Firestore.

---

## ✅ CHECKLIST RAPIDE (à cocher une fois terminé)

* [ ] Créez la collection `App-Category`
* [ ] Ajoutez 4 documents (`Breakfast`, `Lunch`, `Dinner`, `Snack`)
* [ ] Créez la collection `Complete-Flutter-App`
* [ ] Ajoutez 6 documents avec 7 champs (tous en **string**)
* [ ] Uploadez les 6 images dans `Storage/images`
* [ ] Copiez les URL des images et mettez-les dans les documents


##  CONSEILS

* **Pas besoin d’ajouter manuellement des ID** de document, laissez Firestore générer automatiquement.
* **Tous les champs doivent être de type "string"**, même les chiffres (comme `"30"` et non `30`).
* Vous pouvez changer les noms ou catégories plus tard sans problème.


# Annexe: 


![image](https://github.com/user-attachments/assets/a4857e76-71c8-4a98-96f6-e125e4cb0f33)

![image](https://github.com/user-attachments/assets/c7bc92a2-1a05-485a-890c-308655299d40)


<br/>


# Annexe -  **6 exemples complets de tables/documents** avec 7 champs (tous `string`) que tu peux insérer dans Firestore (collection `"Complete-Flutter-App"`). 


- Chaque ligne représente un document structuré avec :

* `cal` : calories
* `category` : type de repas
* `image` : lien d’image
* `name` : nom du plat
* `rating` : note utilisateur
* `reviews` : nombre de commentaires
* `time` : durée de préparation (en minutes)



### 🍽️ Exemples de documents (7 champs string)

| Clé        | Exemple de valeur                        |
| ---------- | ---------------------------------------- |
| `cal`      | `"450"`                                  |
| `category` | `"Dinner"`                               |
| `image`    | `"https://example.com/images/steak.jpg"` |
| `name`     | `"Grilled Beef Steak"`                   |
| `rating`   | `"4.8"`                                  |
| `reviews`  | `"25"`                                   |
| `time`     | `"30"`                                   |

---

| Clé        | Exemple de valeur                           |
| ---------- | ------------------------------------------- |
| `cal`      | `"320"`                                     |
| `category` | `"Breakfast"`                               |
| `image`    | `"https://example.com/images/pancakes.jpg"` |
| `name`     | `"Blueberry Pancakes"`                      |
| `rating`   | `"4.5"`                                     |
| `reviews`  | `"40"`                                      |
| `time`     | `"20"`                                      |

---

| Clé        | Exemple de valeur                              |
| ---------- | ---------------------------------------------- |
| `cal`      | `"600"`                                        |
| `category` | `"Lunch"`                                      |
| `image`    | `"https://example.com/images/bowl_quinoa.jpg"` |
| `name`     | `"Quinoa Power Bowl"`                          |
| `rating`   | `"4.9"`                                        |
| `reviews`  | `"31"`                                         |
| `time`     | `"25"`                                         |

---

| Clé        | Exemple de valeur                          |
| ---------- | ------------------------------------------ |
| `cal`      | `"150"`                                    |
| `category` | `"Snack"`                                  |
| `image`    | `"https://example.com/images/granola.jpg"` |
| `name`     | `"Granola Energy Bar"`                     |
| `rating`   | `"4.2"`                                    |
| `reviews`  | `"12"`                                     |
| `time`     | `"10"`                                     |

---

| Clé        | Exemple de valeur                                |
| ---------- | ------------------------------------------------ |
| `cal`      | `"500"`                                          |
| `category` | `"Brunch"`                                       |
| `image`    | `"https://example.com/images/eggs_benedict.jpg"` |
| `name`     | `"Eggs Benedict with Spinach"`                   |
| `rating`   | `"4.6"`                                          |
| `reviews`  | `"18"`                                           |
| `time`     | `"35"`                                           |

---

| Clé        | Exemple de valeur                                   |
| ---------- | --------------------------------------------------- |
| `cal`      | `"180"`                                             |
| `category` | `"Dessert"`                                         |
| `image`    | `"https://example.com/images/chocolate_mousse.jpg"` |
| `name`     | `"Dark Chocolate Mousse"`                           |
| `rating`   | `"4.9"`                                             |
| `reviews`  | `"50"`                                              |
| `time`     | `"15"`                                              |


