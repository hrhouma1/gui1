<h1 id="exercices-dio">Exercices Flutter – Utilisation de Dio avec des APIs publiques</h1>



## Exercice 1 – Afficher une liste d’utilisateurs

**Objectif** : Créer une application Flutter qui interroge une API publique et affiche les données sous forme de liste.

### Instructions :

1. Créez une nouvelle application Flutter.
2. Ajoutez le package `dio` dans `pubspec.yaml`.
3. Faites une requête HTTP `GET` vers cette URL :
   `https://jsonplaceholder.typicode.com/users`
4. Affichez les informations suivantes pour chaque utilisateur :

   * Nom (`name`)
   * Adresse email (`email`)
5. Affichez un indicateur de chargement pendant la requête.
6. Gérez les erreurs réseau avec un message affiché à l’écran.

---

## Exercice 2 – Afficher une liste de pays avec leur drapeau

**Objectif** : Se familiariser avec l’affichage d’images distantes et la lecture de données JSON plus complexes.

### Instructions :

1. Créez une nouvelle application Flutter.
2. Ajoutez la dépendance `dio`.
3. Effectuez une requête `GET` vers :
   `https://restcountries.com/v3.1/all`
4. Pour chaque pays, affichez :

   * Le nom (`name.common`)
   * L’image du drapeau (`flags.png`)
5. Affichez une liste déroulante avec au moins 20 pays.
6. Ajoutez un indicateur de chargement et un message en cas d’erreur.

---

## Exercice 3 – Rafraîchir les données avec un bouton

**Objectif** : Comprendre la mise à jour dynamique des données.

### Instructions :

1. Reprenez l’exercice 1 ou 2.
2. Ajoutez un bouton "Rafraîchir" dans la barre d'application.
3. Lorsque l’utilisateur appuie sur le bouton, les données doivent être rechargées (nouvel appel à l’API).
4. Ajoutez une animation de chargement lors de la mise à jour.

---

## Exercice 4 – Requête avec paramètre dynamique (optionnel)

**Objectif** : Ajouter une interaction utilisateur (champ de recherche ou filtre).

### Instructions :

1. Ajoutez un champ de texte dans votre application.
2. Permettez à l’utilisateur de chercher un pays par son nom.
3. Utilisez l’API suivante :
   `https://restcountries.com/v3.1/name/{nom}`
4. Affichez uniquement les pays correspondant à la recherche.
5. Gérez les cas où aucun pays n’est trouvé.

