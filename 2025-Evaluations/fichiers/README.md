# Plan de contenu détaillé – Application Flutter E-Commerce (Firebase + Stripe)

### **Objectif global**

Concevoir et structurer une application e-commerce complète avec interface utilisateur (mobile et web admin), gestion des états via Provider, intégration de Firebase pour les données et d’un module de paiement sécurisé via Stripe.


> Dans cette partie du projet, les différentes composantes d’une application e-commerce complète sont explorées et mises en œuvre.
Le travail porte sur la gestion des produits, des promotions et des bannières à travers un panneau d’administration connecté à Firebase.
Les fonctionnalités liées à l’expérience utilisateur sont également développées : affichage des produits, gestion du panier, application de coupons et intégration du paiement sécurisé avec **Stripe**.
Une attention particulière est portée à la logique de traitement des commandes, depuis leur création jusqu’à leur suivi et leur mise à jour dans l’interface administrateur.
L’ensemble vise à consolider la compréhension du flux complet d’un système e-commerce moderne, du stockage des données à la gestion des transactions.





### **Section 03 — Login / Sign-Up Firebase**

Dans cette partie du projet, la mise en place de l’authentification des utilisateurs est effectuée à l’aide de Firebase. L’objectif est d’assurer la création de comptes, la connexion sécurisée et la gestion des sessions. Les formulaires d’inscription et de connexion sont structurés avec validation et retour d’erreurs. Les utilisateurs authentifiés accèdent à l’application selon leur état de connexion. Cette étape constitue la base de la gestion des rôles et de la personnalisation des fonctionnalités dans les sections suivantes.









**Objectif** : Intégrer Firebase Authentication pour l’inscription et la connexion sécurisée des utilisateurs.
**Contenu abordé** :

* Configuration du projet Firebase.
* Création des écrans de connexion et d’inscription.
* Validation des formulaires et affichage des erreurs.
* Persistance de la session utilisateur.
  **Résultat attendu** : Authentification fonctionnelle avec redirection conditionnelle selon l’état de connexion.



### **Section 04 — Provider State Management**


Cette section aborde la gestion d’état à l’aide du package **Provider**, afin d’organiser la logique métier et d’assurer la cohérence des données entre les différents écrans. Les mécanismes de `ChangeNotifier` et `Consumer` sont utilisés pour centraliser les changements d’état et réduire la redondance dans le code. L’architecture du projet est structurée autour de modèles clairs et réactifs. Ce travail prépare les fondations nécessaires à la création du tableau de bord administrateur et de l’application client.




**Objectif** : Structurer la logique métier avec Provider afin de centraliser la gestion d’état.
**Contenu abordé** :

* Création de `ChangeNotifier` pour l’authentification et les données.
* Utilisation de `Consumer` et `Selector` pour l’efficacité.
* Gestion des dépendances dans le widget tree.
  **Résultat attendu** : Architecture claire séparant UI et logique métier.



### **Section 05 — Admin Web Panel Dashboard**

Dans cette partie, l’environnement administrateur de l’application est construit sous forme de **panneau web**. L’objectif est de créer une interface de gestion centralisée où les éléments visuels, les produits et les promotions peuvent être supervisés. La navigation entre les pages principales est structurée, avec une distinction claire entre les rôles utilisateurs et administrateurs. L’ensemble du tableau de bord est conçu pour offrir une vue d’ensemble sur les données du système et les opérations à effectuer.



**Objectif** : Mettre en place le tableau de bord administratif accessible via Flutter Web.
**Contenu abordé** :

* Construction d’une interface avec sidebar et topbar.
* Routage multi-pages (produits, promos, bannières…).
* Sécurisation de l’accès selon le rôle utilisateur.
  **Résultat attendu** : Tableau de bord administrateur navigable et fonctionnel.



### **Section 06 — Admin CRUD Categories**



Cette section est consacrée à la mise en œuvre du **CRUD des catégories**, permettant la création, la mise à jour et la suppression de données dans Firestore. La gestion des formulaires et des validations assure la cohérence du contenu inséré dans la base de données. L’organisation des catégories constitue une étape essentielle pour structurer le catalogue de produits et faciliter leur filtrage ultérieur. L’interface admin permet ainsi une gestion hiérarchisée et contrôlée du contenu.






**Objectif** : Implémenter un module CRUD complet pour les catégories.
**Contenu abordé** :

* Stockage et récupération des catégories dans Firestore.
* Formulaire de création/modification.
* Suppression avec confirmation et gestion d’erreurs.
  **Résultat attendu** : Gestion dynamique des catégories côté administrateur.



### **Section 07 — Admin Add Update Delete Promos and Banners**


Dans cette partie, la logique de gestion des éléments promotionnels est introduite. Les administrateurs peuvent ajouter, modifier ou supprimer des bannières et des campagnes promotionnelles, avec des paramètres tels que les dates de validité et les conditions d’activation. Les images et textes promotionnels sont stockés dans Firebase Storage et liés aux données Firestore. Ce module permet d’administrer la dimension visuelle et marketing de l’application.





**Objectif** : Gérer les éléments promotionnels et visuels de l’application.
**Contenu abordé** :

* Téléversement d’images dans Firebase Storage.
* Gestion des dates d’activation / désactivation.
* Affichage conditionnel selon la période.
  **Résultat attendu** : Système fonctionnel de bannières et promotions.



### **Section 08 — Admin Add Update Delete Promos and Products**

Cette section traite de la **gestion complète du catalogue produits**. Les opérations d’ajout, de mise à jour et de suppression sont reliées à Firebase pour garantir la synchronisation des données. Chaque produit peut être associé à une catégorie et à une promotion active. Les informations stockées incluent les prix, la description, les images et les quantités disponibles. Ce travail permet de consolider le cœur fonctionnel de la boutique côté administrateur.


**Objectif** : Associer les promotions aux produits gérés par l’administrateur.
**Contenu abordé** :

* Création et édition des fiches produits.
* Gestion des images, prix, quantités, et catégories.
* Lien entre produits et promotions.
  **Résultat attendu** : Catalogue de produits structuré avec gestion des réductions.



### **Section 09 — Admin Add Update Delete Promos and Coupon**



Dans cette partie, le **système de coupons** est développé afin de permettre la création et l’application de codes promotionnels. Les administrateurs peuvent définir des conditions d’utilisation, telles que le montant minimal de commande ou la date d’expiration. Les coupons sont enregistrés dans Firestore et validés dynamiquement au moment de l’achat. Cette fonctionnalité renforce la flexibilité du système promotionnel et enrichit l’expérience utilisateur.





**Objectif** : Mettre en place un système de coupons de réduction.
**Contenu abordé** :

* Création et validation des codes promo.
* Définition des conditions d’utilisation (montant minimum, date, usage unique).
* Enregistrement et lecture des coupons depuis Firestore.
  **Résultat attendu** : Application cohérente des remises via codes promotionnels.



### **Section 10 — Display Promos Banners Categories and Products in Users App**



Cette section porte sur l’intégration des données administratives dans l’application client. Les promotions, bannières et catégories sont récupérées en temps réel depuis Firebase et affichées à l’utilisateur final. L’interface est structurée de manière à offrir une navigation fluide entre les sections du catalogue. Ce module relie les fonctionnalités du panneau administrateur à l’expérience utilisateur, assurant une cohérence complète entre la gestion des données et leur visualisation.




**Objectif** : Intégrer les données administratives dans l’interface utilisateur.
**Contenu abordé** :

* Affichage dynamique des promotions et bannières.
* Navigation par catégories.
* Présentation visuelle des produits.
  **Résultat attendu** : Application client affichant le contenu géré dans le panneau admin.



### **Section 11 — Show Specific Products and Discount Coupons**




Dans cette partie, le comportement des pages produit est défini afin d’afficher les informations détaillées d’un article sélectionné. Les réductions actives et les coupons applicables sont également mis en avant. Le calcul des remises et des prix actualisés est effectué dynamiquement selon les règles établies. Cette section met en place la logique de consultation approfondie des produits et de préparation au processus d’achat.






**Objectif** : Afficher les détails complets d’un produit et les réductions associées.
**Contenu abordé** :

* Page produit avec image, description, prix, disponibilité.
* Calcul et affichage des remises applicables.
* Lien vers le panier.
  **Résultat attendu** : Expérience utilisateur fluide de consultation et d’ajout au panier.



### **Section 12 — User Cart System**



Cette section introduit le **système de panier**. Les utilisateurs peuvent ajouter, retirer ou modifier les articles sélectionnés avant le paiement. Le panier est synchronisé avec Firebase afin d’assurer la persistance des données entre les sessions et les appareils. Les totaux et sous-totaux sont recalculés automatiquement à chaque modification. Ce module constitue un élément central de l’expérience e-commerce et prépare la phase de paiement.


**Objectif** : Développer un panier fonctionnel et persistant.
**Contenu abordé** :

* Ajout, suppression, modification des articles.
* Calcul des totaux en temps réel.
* Persistance du panier entre les sessions.
  **Résultat attendu** : Panier synchronisé et mis à jour dynamiquement.



### **Section 13 — Coupon System**




Dans cette partie, la logique d’application des coupons est intégrée au panier utilisateur. Le système vérifie la validité des codes, les conditions d’utilisation et les montants minimaux requis. Les remises sont appliquées en temps réel, et les messages de validation ou d’erreur sont gérés de manière cohérente. Cette étape complète le cycle promotionnel et garantit l’équilibre entre la flexibilité marketing et la sécurité transactionnelle.












**Objectif** : Appliquer les coupons de réduction au panier.
**Contenu abordé** :

* Vérification de validité et conditions.
* Application automatique du montant ou pourcentage.
* Affichage des messages de validation ou d’erreur.
  **Résultat attendu** : Gestion fiable des coupons lors du paiement.



### **Section 14 — Stripe Payment Integration**



Cette section est consacrée à l’intégration du **paiement sécurisé via Stripe**. Le flux de transaction est établi entre l’application Flutter, les serveurs Firebase et l’API Stripe. Les paiements sont validés en temps réel, et les états de transaction sont suivis pour éviter toute incohérence. Cette intégration permet de compléter la chaîne e-commerce en assurant la gestion des paiements de manière fiable et conforme aux normes de sécurité.











**Objectif** : Implémenter le paiement sécurisé avec Stripe.
**Contenu abordé** :

* Configuration du compte Stripe et des clés API.
* Création de PaymentIntent via Cloud Functions.
* Validation et retour d’état du paiement.
  **Résultat attendu** : Transaction complète et sécurisée depuis l’application.



### **Section 15 — Place Orders and Display Orders**




Dans cette partie, la **création et la consultation des commandes** sont mises en œuvre. Après validation du paiement, les données sont enregistrées dans Firestore avec un identifiant unique et un statut initial. L’application client affiche ensuite l’historique des commandes effectuées, avec les détails associés (produits, montants, statuts). Cette section introduit la logique de suivi des achats du point de vue de l’utilisateur.








**Objectif** : Enregistrer et afficher les commandes effectuées.
**Contenu abordé** :

* Création automatique d’un document commande après paiement.
* Affichage de l’historique des commandes pour chaque utilisateur.
* Gestion des statuts et des dates.
  **Résultat attendu** : Historique utilisateur cohérent et accessible.



### **Section 16 — Admin Check and Update Orders**





Cette dernière section est dédiée à la **gestion des commandes par l’administrateur**. Les commandes enregistrées peuvent être consultées, triées et mises à jour selon leur état (en attente, validée, expédiée, livrée). Les modifications sont synchronisées en temps réel avec la base de données. Ce module clôture le cycle fonctionnel du projet en reliant la logique transactionnelle à la supervision administrative.



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

