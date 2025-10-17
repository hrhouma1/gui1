# Plan de contenu détaillé – Application Flutter E-Commerce (Firebase + Stripe)

### **Objectif global**

Concevoir et structurer une application e-commerce complète avec interface utilisateur (mobile et web admin), gestion des états via Provider, intégration de Firebase pour les données et d’un module de paiement sécurisé via Stripe.


> Dans cette partie du projet, les différentes composantes d’une application e-commerce complète sont explorées et mises en œuvre.
Le travail porte sur la gestion des produits, des promotions et des bannières à travers un panneau d’administration connecté à Firebase.
Les fonctionnalités liées à l’expérience utilisateur sont également développées : affichage des produits, gestion du panier, application de coupons et intégration du paiement sécurisé avec **Stripe**.
Une attention particulière est portée à la logique de traitement des commandes, depuis leur création jusqu’à leur suivi et leur mise à jour dans l’interface administrateur.
L’ensemble vise à consolider la compréhension du flux complet d’un système e-commerce moderne, du stockage des données à la gestion des transactions.





### **Section 03 — Login / Sign-Up Firebase**

**Objectif** : Intégrer Firebase Authentication pour l’inscription et la connexion sécurisée des utilisateurs.
**Contenu abordé** :

* Configuration du projet Firebase.
* Création des écrans de connexion et d’inscription.
* Validation des formulaires et affichage des erreurs.
* Persistance de la session utilisateur.
  **Résultat attendu** : Authentification fonctionnelle avec redirection conditionnelle selon l’état de connexion.



### **Section 04 — Provider State Management**

**Objectif** : Structurer la logique métier avec Provider afin de centraliser la gestion d’état.
**Contenu abordé** :

* Création de `ChangeNotifier` pour l’authentification et les données.
* Utilisation de `Consumer` et `Selector` pour l’efficacité.
* Gestion des dépendances dans le widget tree.
  **Résultat attendu** : Architecture claire séparant UI et logique métier.



### **Section 05 — Admin Web Panel Dashboard**

**Objectif** : Mettre en place le tableau de bord administratif accessible via Flutter Web.
**Contenu abordé** :

* Construction d’une interface avec sidebar et topbar.
* Routage multi-pages (produits, promos, bannières…).
* Sécurisation de l’accès selon le rôle utilisateur.
  **Résultat attendu** : Tableau de bord administrateur navigable et fonctionnel.



### **Section 06 — Admin CRUD Categories**

**Objectif** : Implémenter un module CRUD complet pour les catégories.
**Contenu abordé** :

* Stockage et récupération des catégories dans Firestore.
* Formulaire de création/modification.
* Suppression avec confirmation et gestion d’erreurs.
  **Résultat attendu** : Gestion dynamique des catégories côté administrateur.



### **Section 07 — Admin Add Update Delete Promos and Banners**

**Objectif** : Gérer les éléments promotionnels et visuels de l’application.
**Contenu abordé** :

* Téléversement d’images dans Firebase Storage.
* Gestion des dates d’activation / désactivation.
* Affichage conditionnel selon la période.
  **Résultat attendu** : Système fonctionnel de bannières et promotions.



### **Section 08 — Admin Add Update Delete Promos and Products**

**Objectif** : Associer les promotions aux produits gérés par l’administrateur.
**Contenu abordé** :

* Création et édition des fiches produits.
* Gestion des images, prix, quantités, et catégories.
* Lien entre produits et promotions.
  **Résultat attendu** : Catalogue de produits structuré avec gestion des réductions.



### **Section 09 — Admin Add Update Delete Promos and Coupon**

**Objectif** : Mettre en place un système de coupons de réduction.
**Contenu abordé** :

* Création et validation des codes promo.
* Définition des conditions d’utilisation (montant minimum, date, usage unique).
* Enregistrement et lecture des coupons depuis Firestore.
  **Résultat attendu** : Application cohérente des remises via codes promotionnels.



### **Section 10 — Display Promos Banners Categories and Products in Users App**

**Objectif** : Intégrer les données administratives dans l’interface utilisateur.
**Contenu abordé** :

* Affichage dynamique des promotions et bannières.
* Navigation par catégories.
* Présentation visuelle des produits.
  **Résultat attendu** : Application client affichant le contenu géré dans le panneau admin.



### **Section 11 — Show Specific Products and Discount Coupons**

**Objectif** : Afficher les détails complets d’un produit et les réductions associées.
**Contenu abordé** :

* Page produit avec image, description, prix, disponibilité.
* Calcul et affichage des remises applicables.
* Lien vers le panier.
  **Résultat attendu** : Expérience utilisateur fluide de consultation et d’ajout au panier.



### **Section 12 — User Cart System**

**Objectif** : Développer un panier fonctionnel et persistant.
**Contenu abordé** :

* Ajout, suppression, modification des articles.
* Calcul des totaux en temps réel.
* Persistance du panier entre les sessions.
  **Résultat attendu** : Panier synchronisé et mis à jour dynamiquement.



### **Section 13 — Coupon System**

**Objectif** : Appliquer les coupons de réduction au panier.
**Contenu abordé** :

* Vérification de validité et conditions.
* Application automatique du montant ou pourcentage.
* Affichage des messages de validation ou d’erreur.
  **Résultat attendu** : Gestion fiable des coupons lors du paiement.



### **Section 14 — Stripe Payment Integration**

**Objectif** : Implémenter le paiement sécurisé avec Stripe.
**Contenu abordé** :

* Configuration du compte Stripe et des clés API.
* Création de PaymentIntent via Cloud Functions.
* Validation et retour d’état du paiement.
  **Résultat attendu** : Transaction complète et sécurisée depuis l’application.



### **Section 15 — Place Orders and Display Orders**

**Objectif** : Enregistrer et afficher les commandes effectuées.
**Contenu abordé** :

* Création automatique d’un document commande après paiement.
* Affichage de l’historique des commandes pour chaque utilisateur.
* Gestion des statuts et des dates.
  **Résultat attendu** : Historique utilisateur cohérent et accessible.



### **Section 16 — Admin Check and Update Orders**

**Objectif** : Permettre à l’administrateur de suivre et modifier l’état des commandes.
**Contenu abordé** :

* Tableau des commandes en attente, validées, livrées.
* Mise à jour des statuts et des remarques.
* Synchronisation en temps réel.
  **Résultat attendu** : Interface d’administration opérationnelle pour la gestion logistique.



### **Compétences visées**

* Intégration complète Flutter + Firebase + Stripe.
* Gestion d’état réactive avec Provider.
* Conception multi-plateforme (mobile + web admin).
* Sécurisation des flux utilisateur et administrateur.
* Maîtrise du cycle complet d’un projet e-commerce (de l’authentification au paiement).

