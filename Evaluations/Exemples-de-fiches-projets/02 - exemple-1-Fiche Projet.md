# Fiche-projet – Développement Flutter avec API publique

**Remise : 27 mai 2025**

## 1. Titre du projet

**GitHub Finder – Recherche de profils GitHub**

## 2. Problématique / contexte d’usage

Les développeurs consultent fréquemment les profils GitHub pour explorer des projets, découvrir des contributeurs ou présenter leur propre activité open source. Une application mobile simple peut faciliter cette recherche et offrir un affichage clair, adapté au mobile.

## 3. Public cible

* Étudiants en informatique
* Recruteurs techniques
* Développeurs freelances ou passionnés open source

## 4. API publique retenue

* **Nom** : GitHub REST API v3
* **URL** : [https://api.github.com/users/{username}](https://api.github.com/users/{username})
* **Clé API** : Non requise pour les requêtes simples (limite 60/h sans authentification)

## 5. Fonction principale

Afficher le profil d’un utilisateur GitHub à partir de son nom d’utilisateur (username), avec ses informations principales : nom, avatar, bio, nombre de dépôts publics, nombre de followers dans des interfaces mobiles.

## 6. Structure fonctionnelle préliminaire

| Écran              | Description                                                               |
| ------------------ | ------------------------------------------------------------------------- |
| Écran d’accueil    | Champ de recherche pour entrer un username + bouton "Rechercher"          |
| Profil utilisateur | Affiche l’avatar, nom complet, bio, nombre de dépôts, followers/following |
| Message d’erreur   | S'affiche si le profil est introuvable ou si l’utilisateur est inconnu    |


