##  Projets Flutter – API publiques (sans IA)

|  # | Titre du projet        | Description                                                       | API utilisée                                                                                                                           | Difficulté |
| -: | ---------------------- | ----------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- | ---------- |
|  1 | **GitHub Finder**      | Recherche d’un profil GitHub par nom d’utilisateur                | [https://api.github.com/users/{username}](https://api.github.com/users/octocat)                                                        | ★☆☆☆       |
|  2 | **Country Explorer**   | Informations générales sur un pays (capitale, langue, drapeau)    | [https://restcountries.com](https://restcountries.com)                                                                                 | ★☆☆☆       |
|  3 | **Mini Blog Reader**   | Affichage de posts, commentaires et utilisateurs (exercices CRUD) | [https://jsonplaceholder.typicode.com](https://jsonplaceholder.typicode.com)                                                           | ★☆☆☆       |
|  4 | **Quote of the Day**   | Affiche une citation inspirante aléatoire chaque jour             | [https://api.quotable.io/random](https://api.quotable.io/random)                                                                       | ★☆☆☆       |
|  5 | **Weather Now**        | Météo actuelle pour une ville donnée                              | [https://openweathermap.org/api](https://openweathermap.org/api)                                                                       | ★★☆☆       |
|  6 | **Bitcoin Tracker**    | Affichage du prix du Bitcoin en direct (CAD/USD)                  | [https://api.coingecko.com](https://api.coingecko.com)                                                                                 | ★☆☆☆       |
|  7 | **Film Searcher**      | Recherche de films via un titre                                   | [http://www.omdbapi.com](http://www.omdbapi.com)                                                                                       | ★★☆☆       |
|  8 | **Public Services 53** | Affiche les CCI du département 53                                 | [https://etablissements-publics.api.gouv.fr/v3/departements/53/cci](https://etablissements-publics.api.gouv.fr/v3/departements/53/cci) | ★★☆☆       |
|  9 | **Cocktail Finder**    | Recherche de recettes de cocktails                                | [https://www.thecocktaildb.com/api.php](https://www.thecocktaildb.com/api.php)                                                         | ★★☆☆       |
| 10 | **Trivia Quiz App**    | Jeu de questions-réponses aléatoires                              | [https://jservice.io/](https://jservice.io/)                                                                                           | ★★☆☆       |



##  Exemple de fiche-projet basée sur l’API RestCountries

### Titre du projet

**Country Explorer – Découverte de pays du monde**

### Problématique / contexte d’usage

De nombreux utilisateurs aiment explorer les pays pour en apprendre plus sur leurs caractéristiques. Une application simple peut permettre de découvrir la capitale, la langue, la population ou le drapeau d’un pays donné.

### Public cible

* Étudiants en géographie
* Voyageurs curieux
* Grand public

### API publique retenue

* **Nom** : RestCountries API
* **URL** : [https://restcountries.com](https://restcountries.com)

### Fonction principale

Afficher les informations clés d’un pays sélectionné : nom, capitale, population, langues officielles, monnaie, drapeau.

### Structure fonctionnelle préliminaire

| Écran              | Description                                                |
| ------------------ | ---------------------------------------------------------- |
| Écran de recherche | Champ texte + bouton "Chercher" pour entrer un nom de pays |
| Résultat           | Affichage de toutes les informations disponibles du pays   |
| Historique         | Liste des pays consultés récemment (optionnel)             |

