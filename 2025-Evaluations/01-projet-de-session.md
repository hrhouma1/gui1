# Énoncé du projet de fin de session

## Application e-commerce Flutter complète (Mobile + Admin Web) avec Firebase & Stripe — 2025

### Objectif

Réaliser **de A à Z** une plateforme e-commerce prête pour la production comprenant :

1. **Application mobile Flutter** (iOS & Android) pour les clients.
2. **Panneau d’administration Web** (Flutter Web) pour gérer produits, commandes et utilisateurs.
3. **Backend Firebase** (Auth, Firestore, Storage, Cloud Functions, Security Rules) avec **paiements Stripe**.
4. **Architecture propre et scalable** avec **Provider** pour la gestion d’état.
5. **Authentification & Autorisation** robustes (rôles, permissions, règles de sécurité) — **priorité absolue**.

<br/>
<br/>

## 1) Livrables attendus

* **Code source complet** (2 dossiers recommandés : `/app-mobile/` et `/admin-web/`) avec README clairs.
* **Schémas** : diagramme d’architecture, **modèle de données** et **matrice des permissions**.
* **Fichiers de configuration** : `.env.example`, `firebase.json`, `firebaserc`, `flutter_launcher_icons.yaml` si utilisés.
* **Règles de sécurité Firestore/Storage** + **Cloud Functions** (Stripe, rôles, validations).
* **Scripts de seed** (catégories, produits de test, rôles).
* **Jeu d’essais** et **plan de tests** (comptes de rôles, paiements test Stripe, cas d’erreur).
* **Courte vidéo démo** (5–8 min) : parcours client, paiement réussi, vue Admin, cas d’autorisation refusée.
* **Journal de bord** (découpage des tâches, choix techniques, difficultés, pistes d’amélioration).
* **Optionnelle** : déploiement (Admin Web sur Firebase Hosting, fonctions déployées, test live).

<br/>
<br/>

## 2) Exigences techniques minimales

* Flutter 3.x (Dart 3), **Provider** (ou Riverpod + justification), Material 3.
* **Firebase** : Authentication (Email/Password + Google OAuth), Firestore, Storage, **Cloud Functions** (Node 18+), Hosting (admin).
* **Stripe** : Checkout/PaymentIntent en mode test + **webhook** via Cloud Functions.
* **Sécurité** :

  * Rôles gérés via **Custom Claims** Firebase Auth.
  * **Firestore Security Rules** basées sur l’utilisateur et ses rôles.
  * Validation côté serveur dans les Cloud Functions (jamais faire confiance au client).
* **Qualité** : arborescence modulaire, dossiers `features/`, `domain/data/presentation`, `services/`, `widgets/` réutilisables, **null-safety**, **erreurs gérées**, **logs**.
* **Accessibilité & UX** : responsive, états de chargement/erreur, formulaires validés.

<br/>
<br/>

## 3) Rôles & Autorisations (qui peut faire quoi)

Rôles recommandés (au minimum 2 rôles sont obligatoires) :

* **customer** : client authentifié.
* **admin** : administrateur du magasin.
  *(Optionnel mais recommandé : `manager` pour la gestion des commandes sans accès système).*

### Matrice des permissions (exemple attendu)

| Action                           | Non connecté | customer | manager (opt.) |         admin |
| -------------------------------- | -----------: | -------: | -------------: | ------------: |
| Parcourir produits & catégories  |            ✓ |        ✓ |              ✓ |             ✓ |
| Ajouter au panier                |            ✗ |        ✓ |              ✓ |             ✓ |
| Passer commande / payer          |            ✗ |        ✓ |              ✓ |             ✓ |
| Voir ses propres commandes       |            ✗ |        ✓ |              ✓ |             ✓ |
| Créer/éditer/supprimer produits  |            ✗ |        ✗ |              ✗ |             ✓ |
| Gérer promos/bannières/coupons   |            ✗ |        ✗ |              ✗ |             ✓ |
| Voir toutes les commandes        |            ✗ |        ✗ |              ✓ |             ✓ |
| Changer le statut d’une commande |            ✗ |        ✗ |              ✓ |             ✓ |
| Gérer rôles utilisateurs         |            ✗ |        ✗ |              ✗ | ✓ (restreint) |

**À livrer** : cette matrice adaptée à votre projet + **extraits de Rules** et **vérifs côté client** (UI masquée) + **vérifs côté serveur** (Cloud Functions).

<br/>
<br/>

## 4) Fonctionnalités minimales à implémenter

### Côté Client (Mobile)

* Onboarding / connexion / inscription / reset password (Firebase Auth).
* Catalogue (liste, recherche simple, filtres basiques, détail produit).
* Panier local lié au compte connecté (panier persistant).
* **Checkout sécurisé avec Stripe** (test cards) : création session, redirection/SDK, gestion succès/échec.
* Historique de commandes personnelles.
* Profil utilisateur (affichage, avatar Storage optionnel).

### Côté Admin (Web)

* Auth + contrôle d’accès par rôle.
* **CRUD Produits** (titre, description, prix, stock, images Storage, catégorie).
* **CRUD Catégories**.
* **Commandes** : liste, détails, changement de statut (`pending`, `paid`, `shipped`, `cancelled`).
* **Promos/Bannières/Coupons** (min. un de ces modules).
* **Tableau de bord** (KPI simples : # commandes aujourd’hui, CA test, produits en rupture).

### Backend

* **Cloud Functions** :

  * `createCheckoutSession` (ou PaymentIntent) avec validation serveur.
  * **Webhook Stripe** pour marquer une commande comme `paid` après événement `checkout.session.completed`/`payment_intent.succeeded`.
  * (Optionnel) `assignRole` pour définir les **custom claims** (protégé admin).
* **Firestore** : collections minimales
  `users`, `products`, `categories`, `carts` (ou items dans doc user), `orders`, `promos|coupons`, `banners`.
* **Security Rules** :

  * Lecture catalogue publique **read-only**.
  * Écriture panier/commandes limitée au **propriétaire**.
  * Écriture produits/promos limitée au **admin** (via claims).
  * Interdiction de modifier le **montant** d’une commande côté client (calcul serveur).

<br/>
<br/>

## 5) Modèle de données (suggestion)

* **products**: `{ id, title, description, price_cents, images[], categoryId, stock, isActive, createdAt }`
* **categories**: `{ id, name, slug, createdAt }`
* **orders**: `{ id, userId, items:[{productId, qty, price_cents}], total_cents, status, paymentRef, createdAt }`
* **users**: `{ uid, email, displayName, photoUrl, roles:{admin?:true, manager?:true} }`
  *(claims synchronisés : `admin: true`, etc.)*
* **coupons** (opt.) : `{ code, percentOff|amountOff_cents, active, expiresAt }`

> Vous pouvez adapter, mais **documentez** clairement vos choix.

<br/>
<br/>

## 6) Parcours de paiement (attendu)

1. Client confirme son panier → appel **Cloud Function** (serveur) avec `orderId`.
2. Le serveur **recalcule** le total depuis Firestore, applique coupons valides, crée la **session Stripe**/intent.
3. Redirection/SDK → paiement test.
4. **Webhook Stripe** valide → le serveur met `orders/{id}.status = 'paid'` et journalise le paiement.
5. L’appli affiche la commande payée dans l’historique.

> Aucun montant ne doit être accepté depuis le client sans recalcul serveur.

<br/>
<br/>

## 7) Tests & validation (obligatoires)

* Comptes de test : `customer@test.com / admin@test.com` (mots de passe masqués en vidéo).
* Cas nominal : achat réussi, webhook reçu, commande passée à `paid`.
* Cas d’autorisation : un **customer** tente d’ouvrir la page Admin → refus UI + refus par Rules.
* Cas d’erreur : stock insuffisant, coupon expiré, paiement échoué.
* **Captures d’écran** / **GIF** de chaque cas + logs côté serveur (console Cloud Functions).

<br/>
<br/>

## 8) Organisation du code (guideline)

```
app-mobile/
  lib/
    core/ (constantes, theming)
    data/ (models, repositories)
    domain/ (entities, usecases)
    features/
      auth/
      catalog/
      cart/
      checkout/
      orders/
    widgets/
admin-web/
  lib/
    features/
      auth/
      products/
      orders/
      dashboard/
functions/ (Cloud Functions + Stripe)
docs/ (diagrammes, matrice rôles, schémas données)
```

<br/>
<br/>

## 9) Barème d’évaluation (100 points)

* **Authentification + rôles + autorisation** (custom claims, Rules, vérifs UI/serveur) — **25 pts**
* **Catalogue & panier** (UX, validations) — 15 pts
* **Checkout Stripe + webhook + statut commande** — **25 pts**
* **Admin Web (CRUD produits + commandes)** — 15 pts
* **Qualité du code & architecture (Provider, modularité, erreurs, accessibilité)** — 10 pts
* **Docs & tests (README, schémas, plan de tests, vidéo)** — 10 pts

**Bonus (+10 pts max)** : recherche avancée, favoris, pagination serveur, KPI temps réel, coupons complexes, internationalisation, déploiement live sécurisé.

<br/>
<br/>

## 10) Contraintes & règles

* **Projet individuel** ou **binôme** (à confirmer par l’enseignant).
* **Aucun secret en clair** dans le repo (utiliser variables d’environnement).
* **Respect de la sécurité** : toute fonction sensible doit être vérifiée **côté serveur** et par **Rules**.
* **Originalité** : code **personnel**. Le plagiat ou la simple reprise d’un template sera pénalisé.
* **Réutilisation autorisée** de packages/boilerplates si **citée** et **comprise** (expliquer ce que vous avez adapté).

<br/>
<br/>

## 11) Remise

* Lien GitHub (public ou privé avec accès), dossier `docs/`, vidéo démo, instructions `README.md` pour lancer :

  * `flutter pub get`, `flutter run` (mobile),
  * `flutter run -d chrome` (admin web),
  * `firebase emulators:start` (optionnel),
  * `firebase deploy` (si déployé).
* Date et modalités : communiqué par l’enseignant.

<br/>
<br/>

## 12) Pistes d’implémentation de l’autorisation (à documenter)

* **Attribution des rôles** : Cloud Function `assignRole(uid, role)` (appelée par un admin).
* **Propagation** : après changement de claims, forcer **refresh** du token côté client.
* **Rules Firestore** (exemples à produire dans votre repo) :

  * Lecture publique sur `products`, écriture **admin** uniquement.
  * `orders`: `create` par l’utilisateur connecté pour **sa** commande, `read` limité à `request.auth.uid == resource.data.userId`, `update` statut seulement via webhook/serveur.
* **UI** : masquer routes Admin si rôle absent, **et** bloquer côté serveur/Rules.

<br/>
<br/>

### Résultat attendu

Une **application complète et cohérente**, démontrant :

* une **authentification** fiable,
* une **autorisation** stricte (qui peut faire quoi),
* un **paiement Stripe** sécurisé,
* une **architecture propre** et testable,
* un **panneau Admin** réellement utile.

Bon courage — construisez comme si vous alliez **déployer en production**.
