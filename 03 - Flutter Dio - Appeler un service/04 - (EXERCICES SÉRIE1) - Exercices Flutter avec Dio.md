<h1 id="exercices-dio-api-changee">Exercices Flutter avec Dio – Changer l’API publique</h1>

> Objectif général : Développer plusieurs petites applications Flutter en modifiant uniquement l’API utilisée, tout en gardant la même structure (Dio, affichage de liste, gestion du chargement et des erreurs).

---

## Exercice 1 – Afficher une liste d’utilisateurs GitHub

### API :

```
https://api.github.com/users
```

### Consignes :

* Affichez les utilisateurs GitHub publics.
* Pour chaque utilisateur, montrez :

  * Le nom d’utilisateur (`login`)
  * L’avatar (`avatar_url`)
  * Un lien ou texte vers le profil (`html_url`)

---

## Exercice 2 – Afficher des photos de l’API JSONPlaceholder

### API :

```
https://jsonplaceholder.typicode.com/photos
```

### Consignes :

* Affichez une liste de photos (limitez à 30 éléments).
* Pour chaque photo, affichez :

  * Le titre (`title`)
  * L’image miniature (`thumbnailUrl`)
  * L’image complète (`url`) si on clique

---

## Exercice 3 – Afficher des posts de blog

### API :

```
https://jsonplaceholder.typicode.com/posts
```

### Consignes :

* Affichez une liste de titres d’articles.
* Pour chaque article, affichez :

  * Le titre (`title`)
  * Le contenu (`body`)
* Ajoutez un bouton "Recharger" pour relancer l’appel à l’API.

---

## Exercice 4 – Afficher des informations sur des Pokémon

### API :

```
https://pokeapi.co/api/v2/pokemon?limit=20
```

### Consignes :

* Affichez une liste des 20 premiers Pokémon.
* Pour chaque élément, affichez :

  * Le nom (`name`)
  * Un identifiant ou l’URL (`url`)
* Optionnel : aller chercher l’image via une autre requête.

---

## Exercice 5 – Afficher des faits aléatoires sur les chats

### API :

```
https://catfact.ninja/facts
```

### Consignes :

* Affichez une liste de faits sur les chats.
* Pour chaque fait, affichez :

  * Le texte (`fact`)
  * La longueur (`length`)
* Facultatif : bouton "Nouveau fait" pour charger d’autres données.


