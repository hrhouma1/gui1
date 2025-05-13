### Parcours **Flutter 11 × 5 h** – Application complète, méthode “démonstration + reproduction”

> **Total : 55 heures** • 1 session = 5 h (pause incluse) • Groupe : 12-18 étudiants
> Vous présentez chaque fonctionnalité en direct ; les étudiants la ré-implémentent immédiatement après votre démo, à l’intérieur d’un même créneau.
> Matériel fourni avant le cours : README d’installation, backend Express déjà déployé (REST + JWT + Stripe Webhooks en mode test).



## Calendrier 

| #      | **Titre de la séance (5 h)**                  | Fonctionnalités livrées en fin de séance                                                                                               | Pré-requis étudiants    | Travail indépendant avant séance suivante             |
| ------ | --------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- | ----------------------- | ----------------------------------------------------- |
| **1**  | **Bootstrap & navigation**                    | • Projet `flutter create` configuré (Android + Web)<br>• Trois écrans reliés par `Navigator` 2.0<br>• Widget design system `AppButton` | Connaître `flutter run` | Lire fiche “Widgets vs Elements vs RenderObjects”     |
| **2**  | **HTTP GET + état Riverpod**                  | • Appel `dio` → `/posts`<br>• Modèle `Post` (freezed)<br>• Affichage liste + skeleton loader                                           | Session 1               | Résoudre mini-kata : afficher message d’erreur réseau |
| **3**  | **Formulaire & POST**                         | • Écran “Créer un post” avec validation<br>• Envoi POST + rafraîchissement du feed                                                     | Session 2               | Quiz 10 Q. sur validation & gestion d’état            |
| **4**  | **Architecture propre + tests unitaires**     | • Découpage data/domain/UI<br>• 4 use-cases testés (coverage ≥ 60 %)                                                                   | Session 3               | Revoir vidéo Clean Architecture (20 min)              |
| **5**  | **Base locale Hive (offline-first)**          | • Cache Hive du feed<br>• Mode avion ➜ lecture OK, resync au retour                                                                    | Session 4               | Ajouter timestamp aux posts (exercice)                |
| **6**  | **Auth JWT (register, login)**                | • Écrans Register/Login<br>• Stockage token sécurisé<br>• Interceptor auth dans `dio`                                                  | Jusqu’à Session 5       | Lire fiche “Flux JWT + Refresh”                       |
| **7**  | **Routes protégées & rafraîchissement token** | • Guard Riverpod : redirection si 401<br>• Endpoint `/auth/refresh` implémenté                                                         | Session 6               | Poster capture démontrant logout auto                 |
| **8**  | **UI avancée & animations**                   | • Thème clair/sombre<br>• Hero animation sur Post Card<br>• Accessibilité (semantics labels)                                           | Session 7               | Corriger score Lighthouse > 90 accessibility          |
| **9**  | **Stripe (Checkout)**                         | • Intégration `flutter_stripe`<br>• Session Checkout sandbox opérationnelle                                                            | Session 8               | Brainstorm : idées de contenu Premium                 |
| **10** | **Stripe Webhook + badge Premium**            | • Webhook met à jour `isPremium`<br>• Affichage conditionnel contenu Premium                                                           | Session 9               | Rédiger README “Déployer le backend”                  |
| **11** | **CI/CD + push FCM + soutenance**             | • Pipeline GitHub Actions ➜ build Web + Android<br>• Notification FCM → Deep-link<br>• Démo finale & feedback pair-review              | Toutes                  | Préparer slides architecture (7 min)                  |



## Scénario détaillé d’une séance de 5 h

| Phase                    | Durée   | Activité                                                                   | Rôle enseignant                                | Rôle étudiants                                          |
| ------------------------ | ------- | -------------------------------------------------------------------------- | ---------------------------------------------- | ------------------------------------------------------- |
| **Kick-off & objectifs** | 20 min  | Présentation du résultat attendu + quiz Mentimeter (5 Q.)                  | Anime, répond aux questions                    | Participent, évaluent leur pré-requis                   |
| **Démo “live-coding”**   | 90 min  | Vous codez la fonctionnalité étape par étape, commitez chaque “milestone”. | Explique, justifie choix, montre tests         | Écoutent, prennent notes, posent cartes “SOS” si perdus |
| **Pause**                | 10 min  | —                                                                          | —                                              | —                                                       |
| **Reproduction guidée**  | 110 min | Les étudiants refont la démo sur leur machine, en binôme.                  | Tourne dans la salle, débloque, challenge      | Codent, se valident mutuellement                        |
| **Sprint challenge**     | 40 min  | Petit défi supplémentaire (= “Stretch Goal”)                               | Introduit l’énoncé, garde le time              | Tentent d’aller plus loin (ex. loader animé)            |
| **Rétro & commit tagué** | 20 min  | Debrief collectif : obstacles, bonnes pratiques                            | Note points de douleur pour la séance suivante | Taguent `vX.Y` + push + post comment Trello             |
| **Wrap-up & preview**    | 10 min  | Teaser de la feature suivante, devoirs                                     | —                                              | Photographient tableau, planifient lecture              |

*(Le break de midi est prévu à mi-parcours, hors grille ci-dessus.)*



## Matériel pédagogique fourni

1. **Dépôt “Teacher”** avec 11 branches `01-bootstrap` … `11-ci-cd` (une par séance).
2. **Guides PDF 2 pages** par séance (objectifs, commandes clés, pièges fréquents).
3. **Check-list d’auto-évaluation** (rubrique “Je sais installer les dépendances Stripe” etc.).
4. **Mini-capsules vidéo** (< 6 min) sur la configuration OS-spécifique (Xcode PATH, clés SHA-1 Android).
5. **Trello template** avec 11 listes “Séance N” + cartes **“Livrable”** et **“Stretch Goal”** déjà créées.



## Livrables globaux & notation 

| Axe                                         | %    | Vérification                                    |
| ------------------------------------------- | ---- | ----------------------------------------------- |
| Fonctionnalités “core” (CRUD, Auth, Stripe) | 40 % | Démo live + tests Postman                       |
| Qualité code & architecture                 | 25 % | Audit automatique Dart analyzer + revue humaine |
| Expérience utilisateur (UI, a11y, offline)  | 15 % | Check-list UX + scores Lighthouse               |
| CI/CD & documentation                       | 10 % | Pipeline vert + README clair                    |
| Présentation finale & soft skills           | 10 % | Pitch 7 min + réponses Q/R                      |


