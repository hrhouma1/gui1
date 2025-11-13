# Projets Intégrateurs d'Applications Mobiles

## Introduction

Ce document présente **5 projets intégrateurs avancés** conçus pour des étudiants en développement mobile. Ces projets sont plus ambitieux que les projets simples et nécessitent une compréhension approfondie de Flutter, de la gestion d'état avec Provider/Riverpod, et de l'intégration backend.

**Durée recommandée** : 8 à 12 semaines par projet (projet de session complet)

**Niveau** : Intermédiaire à Avancé

**Format** : Individuel ou en équipe de 2-3 personnes


---


<details>

<summary> PROJET 1 : SWEATLY - Application de Fitness </summary>

## Description Générale

Sweatly est une application mobile complète de conditionnement physique qui accompagne les utilisateurs dans leur parcours de mise en forme. Elle combine une bibliothèque d'exercices, des programmes d'entraînement personnalisés et un système de suivi de progression motivant.

### Problématique résolue

Beaucoup de personnes abandonnent leurs objectifs de mise en forme par manque de structure, de motivation ou de suivi. Sweatly offre un système complet et accessible pour maintenir la motivation et voir les progrès.

### Public cible

- Débutants en fitness cherchant de la guidance
- Sportifs intermédiaires voulant suivre leur progression
- Personnes cherchant à maintenir une routine d'entraînement


## Fonctionnalités Détaillées

### Phase 1 : Fonctionnalités de Base (Semaines 1-4)

**Authentification et Profil**
- Inscription/connexion (email, Google)
- Onboarding interactif (âge, poids, objectifs)
- Sélection du niveau (débutant, intermédiaire, avancé)
- Choix du matériel disponible (maison, gym, minimal)

**Bibliothèque d'Exercices**
- Liste de 50+ exercices avec catégories
- Fiches détaillées avec :
  - Images ou GIF de démonstration
  - Instructions étape par étape
  - Muscles ciblés
  - Niveau de difficulté
  - Équipement requis
- Recherche et filtrage par catégorie/muscle/équipement
- Exercices favoris

**Profil Utilisateur**
- Affichage des statistiques de base
- Historique des 5 dernières séances
- Modification du profil


### Phase 2 : Programmes et Suivi (Semaines 5-8)

**Programmes d'Entraînement**
- 5-10 programmes prédéfinis (débutant à avancé)
- Détails du programme :
  - Durée totale (4, 8, 12 semaines)
  - Fréquence (3-5 séances/semaine)
  - Objectif (perte de poids, muscle, endurance)
  - Liste des séances
- Démarrage et suivi d'un programme
- Marquer les séances comme complétées

**Séance d'Entraînement**
- Affichage de la séance du jour
- Liste des exercices avec :
  - Nombre de séries
  - Répétitions ou durée
  - Temps de repos
- Chronomètre intégré pour temps de repos
- Enregistrement des données :
  - Séries complétées
  - Répétitions effectuées
  - Poids utilisés (optionnel)
- Bouton "Terminer la séance"

**Historique et Statistiques**
- Calendrier des séances complétées
- Total de séances ce mois
- Temps d'entraînement total
- Graphique de progression hebdomadaire


### Phase 3 : Motivation et Social (Semaines 9-12)

**Système de Gamification**
- Points gagnés par séance complétée
- Système de niveaux (niveau 1 à 50)
- Badges débloquables :
  - "Première séance"
  - "Streak 7 jours"
  - "100 séances complétées"
  - "Programme terminé"
- Affichage des badges dans le profil

**Streaks et Rappels**
- Compteur de jours consécutifs
- Notifications de rappel personnalisables
- Encouragements en cas d'absence
- Félicitations pour les milestones

**Partage**
- Résumé de séance partageable (image)
- Statistiques mensuelles exportables
- QR code du profil public

**Fonctionnalités Bonus**
- Mode sombre/clair
- Calcul IMC et poids idéal
- Notes personnelles par exercice
- Création de programmes personnalisés


## Architecture Technique

### Structure du Projet

```
lib/
├── main.dart
├── core/
│   ├── constants/
│   ├── themes/
│   └── utils/
├── models/
│   ├── user_model.dart
│   ├── exercise_model.dart
│   ├── workout_model.dart
│   ├── program_model.dart
│   └── session_model.dart
├── providers/
│   ├── auth_provider.dart
│   ├── exercises_provider.dart
│   ├── workouts_provider.dart
│   ├── programs_provider.dart
│   └── stats_provider.dart
├── screens/
│   ├── auth/
│   ├── onboarding/
│   ├── home/
│   ├── exercises/
│   ├── workouts/
│   ├── programs/
│   ├── profile/
│   └── stats/
├── widgets/
│   ├── exercise_card.dart
│   ├── workout_timer.dart
│   ├── progress_chart.dart
│   └── badge_widget.dart
└── services/
    ├── firebase_service.dart
    ├── notification_service.dart
    └── analytics_service.dart
```

### Modèles de Données

**Exercise**
```dart
class Exercise {
  String id;
  String name;
  String description;
  List<String> instructions;
  String imageUrl;
  String category; // cardio, force, flexibilité
  String muscleGroup;
  String difficulty; // débutant, intermédiaire, avancé
  String equipment;
  bool isFavorite;
}
```

**WorkoutSession**
```dart
class WorkoutSession {
  String id;
  String userId;
  DateTime date;
  List<ExerciseSet> exercises;
  int duration; // en minutes
  int caloriesBurned;
  String programId;
  bool completed;
}
```

**Program**
```dart
class Program {
  String id;
  String name;
  String description;
  int durationWeeks;
  String difficulty;
  String goal;
  List<Workout> workouts;
  String imageUrl;
}
```


## Pile Technologique

### Flutter Packages

**Essentiels**
- `provider` ou `riverpod` - Gestion d'état
- `firebase_auth` - Authentification
- `cloud_firestore` - Base de données
- `firebase_storage` - Stockage des images

**UI et Navigation**
- `go_router` - Navigation avancée
- `fl_chart` - Graphiques de progression
- `table_calendar` - Calendrier des séances
- `cached_network_image` - Cache des images

**Fonctionnalités**
- `firebase_messaging` - Notifications push
- `flutter_local_notifications` - Notifications locales
- `shared_preferences` - Stockage local
- `path_provider` - Accès aux fichiers

**Utilitaires**
- `intl` - Formatage dates
- `uuid` - Génération d'IDs
- `image_picker` - Photos de profil


### Backend Firebase

**Firestore Collections**
```
users/
  {userId}/
    profile: { name, age, weight, goals }
    stats: { totalWorkouts, streak, level }

exercises/
  {exerciseId}/
    data: { name, description, category... }

programs/
  {programId}/
    data: { name, weeks, difficulty... }
    workouts/
      {day}/

sessions/
  {userId}/
    {sessionId}/
      data: { date, exercises, duration... }

achievements/
  {userId}/
    badges: [ array of badge objects ]
```

**Cloud Functions**
- Calcul automatique des statistiques
- Envoi de notifications planifiées
- Vérification et attribution des badges
- Nettoyage des données anciennes


## Plan de Développement (12 semaines)

### Sprint 1 (Semaines 1-3) : Fondations
- Configuration Firebase et projet Flutter
- Authentification complète
- Onboarding interactif
- Structure de navigation
- Modèles de données

### Sprint 2 (Semaines 4-6) : Bibliothèque et Exercices
- Liste des exercices avec filtres
- Détails d'un exercice
- Système de favoris
- Recherche fonctionnelle
- Ajout de 50+ exercices dans Firestore

### Sprint 3 (Semaines 7-9) : Programmes et Séances
- Affichage des programmes
- Démarrage d'un programme
- Interface de séance active
- Chronomètre et enregistrement
- Historique des séances

### Sprint 4 (Semaines 10-12) : Stats et Gamification
- Graphiques de progression
- Système de badges
- Compteur de streaks
- Notifications
- Partage social
- Tests et polish


## Critères d'Évaluation (100 points)

### Fonctionnalités (40 points)
- Authentification et profil (5 pts)
- Bibliothèque d'exercices complète (10 pts)
- Programmes et séances fonctionnels (10 pts)
- Suivi et statistiques (8 pts)
- Gamification et badges (7 pts)

### Aspect Technique (30 points)
- Architecture propre et organisée (10 pts)
- Gestion d'état avec Provider/Riverpod (8 pts)
- Intégration Firebase correcte (7 pts)
- Gestion des erreurs (5 pts)

### Interface Utilisateur (20 points)
- Design cohérent et moderne (8 pts)
- Navigation intuitive (6 pts)
- Animations et transitions (6 pts)

### Documentation et Présentation (10 points)
- README complet avec screenshots (4 pts)
- Code commenté (3 pts)
- Démo finale convaincante (3 pts)


## Défis Techniques et Solutions

### Défi 1 : Gestion du chronomètre
**Problème** : Maintenir le chronomètre actif même en arrière-plan
**Solution** : Utiliser `flutter_background_service` ou sauvegarder l'heure de début et calculer la différence

### Défi 2 : Performance avec beaucoup de données
**Problème** : Chargement lent de l'historique complet
**Solution** : Pagination avec `limit()` et `startAfter()` dans Firestore

### Défi 3 : Calcul automatique des badges
**Problème** : Vérifier les conditions à chaque séance
**Solution** : Cloud Functions déclenchées sur création de session


## Extensions Possibles

- Mode hors ligne complet avec Hive
- Intégration Google Fit / Apple Health
- Programmes générés par IA selon les objectifs
- Chat avec coach virtuel
- Challenges entre amis
- Intégration avec wearables (smartwatch)


</details>


---


<details>

<summary> PROJET 2 : SHIFTLY - Gestion des Horaires de Travail </summary>

## Description Générale

Shiftly est une application de gestion des quarts de travail qui facilite la planification, le pointage et le suivi des heures pour les employés et les gestionnaires. Elle répond aux besoins des petites et moyennes entreprises qui ont des équipes avec horaires variables.

### Problématique résolue

La gestion manuelle des horaires entraîne des erreurs, des conflits et une perte de temps. Shiftly automatise le processus, assure la transparence et facilite la communication entre employés et gestionnaires.

### Public cible

- Petites entreprises (restaurants, commerce, services)
- Gestionnaires d'équipe
- Employés à horaires variables


## Fonctionnalités Détaillées

### Phase 1 : Authentification et Profils (Semaines 1-3)

**Système d'Authentification**
- Inscription avec validation email
- Connexion sécurisée
- Récupération de mot de passe
- Deux types de comptes : Employé et Gestionnaire

**Profil Employé**
- Informations personnelles
- Numéro d'employé unique
- Poste et département
- Taux horaire (masqué sauf pour le gestionnaire)
- Disponibilités hebdomadaires
- Photo de profil

**Profil Gestionnaire**
- Informations entreprise
- Liste des employés sous supervision
- Permissions et accès


### Phase 2 : Gestion des Quarts (Semaines 4-6)

**Création de Quarts (Gestionnaire)**
- Formulaire de création :
  - Date et heure début/fin
  - Poste concerné
  - Assignation d'employé(s)
  - Lieu de travail
  - Notes spéciales
- Vue calendrier hebdomadaire/mensuelle
- Codes couleur par poste ou employé
- Duplication de quarts récurrents
- Templates de semaine type

**Consultation des Quarts (Employé)**
- Calendrier personnel des quarts
- Liste des prochains quarts (7 jours)
- Détails d'un quart
- Notifications 24h avant le quart
- Option de demande de changement

**Gestion des Disponibilités**
- Déclaration des indisponibilités
- Demandes de congé
- Validation par le gestionnaire
- Alerte en cas de conflit


### Phase 3 : Système de Pointage (Semaines 7-9)

**Pointage d'Entrée/Sortie**
- Bouton de pointage visible et accessible
- Horodatage automatique avec timezone
- Trois modes de validation :
  - **GPS** : Vérification de la proximité du lieu de travail
  - **QR Code** : Scan d'un code affiché sur place
  - **Photo** : Selfie de confirmation
- Enregistrement automatique dans Firestore
- Confirmation visuelle (vert = succès)

**Historique de Pointages (Employé)**
- Liste des pointages des 30 derniers jours
- Affichage par jour avec :
  - Heure d'arrivée
  - Heure de départ
  - Total d'heures
  - Statut (à l'heure, retard, absence)
- Filtre par période

**Gestion des Pointages (Gestionnaire)**
- Vue d'ensemble des pointages du jour
- Liste des présences/absences
- Alertes pour retards ou absences non justifiées
- Modification manuelle en cas d'erreur
- Export des données


### Phase 4 : Rapports et Fiches de Paie (Semaines 10-12)

**Calcul des Heures**
- Total hebdomadaire par employé
- Détection automatique des heures supplémentaires
- Calcul des heures de nuit (si applicable)
- Ajustements manuels possibles

**Rapports pour Gestionnaires**
- Rapport hebdomadaire/mensuel
- Total des heures par employé
- Coût total de la main-d'œuvre
- Export en CSV pour comptabilité
- Export en PDF pour archives

**Fiches de Paie (Employés)**
- Accès sécurisé aux fiches de paie
- PDF téléchargeable
- Historique des 12 derniers mois
- Protection par mot de passe ou biométrie
- Affichage des détails :
  - Heures régulières
  - Heures supplémentaires
  - Total brut
  - Retenues
  - Net à payer

**Notifications**
- Nouveau quart assigné
- Changement de quart
- Rappel avant le quart
- Fiche de paie disponible
- Message du gestionnaire


## Architecture Technique

### Structure du Projet

```
lib/
├── main.dart
├── core/
│   ├── constants/
│   ├── themes/
│   ├── utils/
│   └── validators/
├── models/
│   ├── user_model.dart
│   ├── shift_model.dart
│   ├── punch_model.dart
│   └── payslip_model.dart
├── providers/
│   ├── auth_provider.dart
│   ├── user_provider.dart
│   ├── shifts_provider.dart
│   ├── punch_provider.dart
│   └── reports_provider.dart
├── screens/
│   ├── auth/
│   ├── employee/
│   │   ├── home_screen.dart
│   │   ├── schedule_screen.dart
│   │   ├── punch_screen.dart
│   │   └── payslips_screen.dart
│   ├── manager/
│   │   ├── dashboard_screen.dart
│   │   ├── create_shift_screen.dart
│   │   ├── employees_screen.dart
│   │   └── reports_screen.dart
│   └── shared/
├── widgets/
│   ├── shift_card.dart
│   ├── punch_button.dart
│   ├── calendar_view.dart
│   └── report_chart.dart
└── services/
    ├── firebase_service.dart
    ├── geolocation_service.dart
    ├── qr_service.dart
    ├── pdf_service.dart
    └── notification_service.dart
```

### Modèles de Données

**Shift**
```dart
class Shift {
  String id;
  String employeeId;
  DateTime startTime;
  DateTime endTime;
  String location;
  String position;
  String status; // scheduled, completed, cancelled
  String? notes;
  DateTime createdAt;
  String createdBy; // managerId
}
```

**Punch**
```dart
class Punch {
  String id;
  String employeeId;
  String shiftId;
  DateTime punchIn;
  DateTime? punchOut;
  String validationMethod; // gps, qr, photo
  GeoPoint? location;
  String? photoUrl;
  double totalHours;
  bool approved;
}
```

**Payslip**
```dart
class Payslip {
  String id;
  String employeeId;
  DateTime periodStart;
  DateTime periodEnd;
  double regularHours;
  double overtimeHours;
  double hourlyRate;
  double grossPay;
  double deductions;
  double netPay;
  String pdfUrl;
  DateTime generatedAt;
}
```


## Pile Technologique

### Flutter Packages

**Essentiels**
- `provider` ou `riverpod` - Gestion d'état
- `firebase_auth` - Authentification
- `cloud_firestore` - Base de données
- `firebase_storage` - Stockage PDF et photos

**Pointage**
- `geolocator` - Géolocalisation
- `mobile_scanner` - Scan QR code
- `image_picker` - Photos de pointage
- `local_auth` - Authentification biométrique

**UI et Fonctionnalités**
- `table_calendar` - Calendrier des quarts
- `pdf` - Génération de PDF
- `file_picker` - Sélection de fichiers
- `share_plus` - Partage de documents

**Notifications**
- `firebase_messaging` - Push notifications
- `flutter_local_notifications` - Notifications locales
- `timezone` - Gestion des fuseaux horaires


### Backend

**Firestore Collections**
```
users/
  {userId}/
    profile: { name, role, employeeNumber, hourlyRate }
    
companies/
  {companyId}/
    info: { name, address, settings }
    
shifts/
  {shiftId}/
    data: { employeeId, startTime, endTime, location }
    
punches/
  {punchId}/
    data: { employeeId, shiftId, punchIn, punchOut }
    
payslips/
  {payslipId}/
    data: { employeeId, period, hours, amounts }
```

**Supabase (Alternative)**
- Base PostgreSQL avec PostGIS pour requêtes géospatiales
- Row Level Security pour sécurité des données
- Edge Functions pour logique métier
- Storage pour PDF et photos


## Plan de Développement (12 semaines)

### Sprint 1 (Semaines 1-3) : Auth et Profils
- Configuration Firebase/Supabase
- Système d'authentification complet
- Création des profils employé/gestionnaire
- Navigation conditionnelle selon le rôle
- Écrans de base

### Sprint 2 (Semaines 4-6) : Gestion des Quarts
- Interface de création de quarts
- Calendrier interactif
- Assignation d'employés
- Notifications de nouveau quart
- Vue employé des quarts

### Sprint 3 (Semaines 7-9) : Système de Pointage
- Interface de pointage
- Intégration GPS avec rayon de validation
- Scan QR code
- Photo de confirmation
- Historique des pointages
- Calcul automatique des heures

### Sprint 4 (Semaines 10-12) : Rapports et Paie
- Génération de rapports
- Export CSV/PDF
- Upload des fiches de paie
- Accès sécurisé aux fiches
- Tests finaux et optimisation


## Critères d'Évaluation (100 points)

### Fonctionnalités (40 points)
- Authentification et rôles (5 pts)
- Gestion des quarts complète (10 pts)
- Système de pointage avec validation (15 pts)
- Rapports et fiches de paie (10 pts)

### Aspect Technique (30 points)
- Architecture et organisation (8 pts)
- Sécurité des données (8 pts)
- Intégrations (GPS, QR, PDF) (8 pts)
- Performance et optimisation (6 pts)

### Interface Utilisateur (20 points)
- Design professionnel (8 pts)
- UX intuitive pour les deux rôles (8 pts)
- Responsive et accessible (4 pts)

### Documentation (10 points)
- README avec guide d'installation (4 pts)
- Documentation technique (3 pts)
- Présentation finale (3 pts)


## Considérations Légales et Sécurité

### Protection des Données (RGPD/PIPEDA)
- Consentement explicite pour géolocalisation
- Chiffrement des données sensibles
- Politique de confidentialité claire
- Droit à l'oubli (suppression de données)
- Limitation de la durée de conservation

### Sécurité
- Authentification forte
- Chiffrement des communications
- Règles Firestore strictes par rôle
- Validation côté serveur des pointages
- Logs d'audit pour modifications

### Conformité Travail
- Respect des lois sur le temps de travail
- Calcul correct des heures supplémentaires
- Preuves de pointage conservées


## Défis Techniques et Solutions

### Défi 1 : Falsification de localisation
**Problème** : Employé utilisant un GPS faker
**Solution** : Combiner plusieurs méthodes (GPS + QR + Photo), détection de mock location

### Défi 2 : Synchronisation en temps réel
**Problème** : Affichage immédiat des pointages pour le gestionnaire
**Solution** : Utiliser Firestore snapshots avec StreamBuilder

### Défi 3 : Génération de PDF sécurisés
**Problème** : Créer des fiches de paie non modifiables
**Solution** : Générer côté serveur avec Cloud Functions, signature numérique


## Extensions Possibles

- Demandes de congé et validation
- Échange de quarts entre employés
- Chat intégré gestionnaire-employé
- Intégration avec systèmes de paie externes
- Mode hors ligne avec synchronisation
- Analytics pour optimisation des horaires
- Export vers Google Calendar/Outlook


</details>


---


<details>

<summary> PROJET 3 : PLANEX - Agenda Intelligent </summary>

## Description Générale

PlaneEx est une application d'agenda enrichi qui va au-delà d'un simple calendrier. Elle intègre des données contextuelles (météo, trafic, jours fériés) et détecte intelligemment les conflits d'horaire pour aider les utilisateurs à mieux organiser leur temps.

### Problématique résolue

Les agendas traditionnels ne prennent pas en compte le contexte réel : conditions météo, temps de déplacement, jours fériés. PlaneEx offre une vision plus intelligente et proactive de la gestion du temps.

### Public cible

- Professionnels avec emplois du temps chargés
- Étudiants jonglant entre cours et activités
- Toute personne cherchant à optimiser son temps


## Fonctionnalités Détaillées

### Phase 1 : Calendrier de Base (Semaines 1-3)

**Gestion des Événements**
- Création d'événement avec :
  - Titre et description
  - Date et heure début/fin
  - Lieu (adresse)
  - Catégorie (travail, personnel, sport, etc.)
  - Couleur personnalisée
  - Niveau de confidentialité (privé, public, partagé)
- Modification d'événement
- Suppression avec confirmation
- Événements récurrents (quotidien, hebdomadaire, mensuel)

**Vues du Calendrier**
- Vue jour (liste horaire)
- Vue semaine (grille 7 jours)
- Vue mois (calendrier classique)
- Vue agenda (liste chronologique)
- Navigation fluide entre les vues
- Aujourd'hui en surbrillance

**Rappels**
- Configuration des rappels par événement
- Multiple rappels (ex: 1 jour avant, 1h avant, 15min avant)
- Notifications push à l'heure configurée
- Son et vibration personnalisables


### Phase 2 : Intelligence et Contexte (Semaines 4-7)

**Détection des Conflits**
- Analyse automatique lors de la création
- Alerte si chevauchement d'événements
- Visualisation des conflits (rouge)
- Suggestions d'horaires alternatifs
- Option de forcer la création malgré le conflit

**Intégration Météo**
- API OpenWeather ou similaire
- Affichage de la météo du jour
- Prévisions à 7 jours
- Icônes météo sur les événements extérieurs
- Alertes pour événements extérieurs en cas de mauvais temps
- Suggestions de report

**Jours Fériés**
- Calendrier des jours fériés locaux
- Affichage dans le calendrier
- Badge spécial sur les dates
- Configuration du pays/région

**Estimation de Déplacement**
- Intégration Google Maps Distance Matrix API
- Calcul automatique du temps de trajet
- Considération du trafic en temps réel
- Alerte si pas assez de temps entre deux événements avec lieux différents
- Suggestion de partir plus tôt
- Affichage du meilleur itinéraire


### Phase 3 : Collaboration et Partage (Semaines 8-10)

**Partage d'Événements**
- Invitation d'autres utilisateurs
- Événements partagés avec synchronisation
- Statuts de participation (accepté, refusé, peut-être)
- Commentaires sur événements partagés

**Export et Import**
- Export en format ICS (standard calendrier)
- Import depuis ICS
- Export PDF d'une semaine/mois
- Envoi par email de l'agenda

**Intégrations Externes**
- Synchronisation Google Calendar (optionnel)
- Import depuis autres calendriers
- Partage vers réseaux sociaux


### Phase 4 : Analytics et Optimisation (Semaines 11-12)

**Statistiques**
- Temps passé par catégorie
- Graphique circulaire des activités
- Nombre d'événements par mois
- Tendances hebdomadaires
- Taux de conflits

**Suggestions Intelligentes**
- Horaires recommandés selon l'historique
- Lieux fréquents suggérés
- Catégories automatiques basées sur les mots-clés


## Architecture Technique

### Structure du Projet

```
lib/
├── main.dart
├── core/
│   ├── constants/
│   ├── themes/
│   └── utils/
├── models/
│   ├── event_model.dart
│   ├── weather_model.dart
│   ├── location_model.dart
│   └── holiday_model.dart
├── providers/
│   ├── auth_provider.dart
│   ├── events_provider.dart
│   ├── weather_provider.dart
│   ├── navigation_provider.dart
│   └── statistics_provider.dart
├── screens/
│   ├── auth/
│   ├── calendar/
│   │   ├── day_view.dart
│   │   ├── week_view.dart
│   │   ├── month_view.dart
│   │   └── agenda_view.dart
│   ├── event/
│   │   ├── create_event_screen.dart
│   │   ├── edit_event_screen.dart
│   │   └── event_details_screen.dart
│   ├── statistics/
│   └── settings/
├── widgets/
│   ├── event_card.dart
│   ├── calendar_day.dart
│   ├── weather_widget.dart
│   ├── conflict_alert.dart
│   └── time_estimation.dart
└── services/
    ├── firebase_service.dart
    ├── weather_api_service.dart
    ├── maps_api_service.dart
    ├── holidays_api_service.dart
    └── notification_service.dart
```

### Modèles de Données

**Event**
```dart
class Event {
  String id;
  String userId;
  String title;
  String description;
  DateTime startTime;
  DateTime endTime;
  String? location;
  GeoPoint? coordinates;
  String category;
  Color color;
  bool isRecurring;
  RecurrenceRule? recurrence;
  List<String> reminders; // '1d', '1h', '15m'
  String privacy; // private, public, shared
  List<String> sharedWith;
  bool isOutdoor;
  DateTime createdAt;
  DateTime updatedAt;
}
```

**ConflictInfo**
```dart
class ConflictInfo {
  Event event1;
  Event event2;
  Duration overlap;
  String type; // time, location, impossible_travel
  List<DateTime> suggestedTimes;
}
```


## Pile Technologique

### Flutter Packages

**Essentiels**
- `provider` ou `riverpod` - Gestion d'état
- `firebase_auth` - Authentification
- `cloud_firestore` - Base de données
- `firebase_messaging` - Notifications

**Calendrier**
- `table_calendar` - Widget de calendrier
- `syncfusion_flutter_calendar` - Vues avancées (alternative)
- `intl` - Formatage des dates

**APIs Externes**
- `http` ou `dio` - Requêtes HTTP
- `google_maps_flutter` - Cartes et localisation
- `geolocator` - Position de l'utilisateur
- `geocoding` - Conversion adresse ↔ coordonnées

**Export**
- `pdf` - Génération de PDF
- `share_plus` - Partage de fichiers
- `path_provider` - Accès aux fichiers

**Utilitaires**
- `flutter_local_notifications` - Notifications locales
- `timezone` - Gestion des fuseaux horaires
- `uuid` - Génération d'IDs uniques


### APIs Externes

**OpenWeather API** (Gratuit jusqu'à 1000 calls/jour)
- Météo actuelle
- Prévisions à 7 jours
- Conditions détaillées

**Google Maps APIs**
- Distance Matrix API - Calcul de temps de trajet
- Geocoding API - Adresse ↔ Coordonnées
- Places API - Autocomplétion des adresses

**Holiday API** (Gratuit)
- Calendarific API
- Nager.Date API
- Abstract API


### Backend Firebase

**Firestore Collections**
```
users/
  {userId}/
    profile: { name, email, timezone, preferences }
    
events/
  {userId}/
    {eventId}/
      data: { title, start, end, location, category }
      
shared_events/
  {eventId}/
    participants: [ list of userIds ]
    
statistics/
  {userId}/
    monthly: { totalEvents, timeByCategory }
```

**Cloud Functions**
- Détection automatique des conflits
- Calcul des statistiques mensuelles
- Envoi des rappels programmés
- Nettoyage des événements expirés


## Plan de Développement (12 semaines)

### Sprint 1 (Semaines 1-3) : Calendrier de Base
- Configuration du projet
- Authentification Firebase
- CRUD complet des événements
- Trois vues de calendrier (jour, semaine, mois)
- Système de rappels
- Notifications locales

### Sprint 2 (Semaines 4-7) : Intelligence Contextuelle
- Détection des conflits temporels
- Intégration OpenWeather API
- Affichage météo sur événements
- Intégration jours fériés
- Google Maps Distance Matrix
- Calcul des temps de trajet
- Alertes de déplacement impossible

### Sprint 3 (Semaines 8-10) : Partage et Export
- Événements partagés
- Invitations et statuts
- Export ICS
- Export PDF
- Import de calendriers
- Amélioration de l'UI

### Sprint 4 (Semaines 11-12) : Analytics et Polish
- Statistiques personnelles
- Graphiques de temps
- Suggestions intelligentes
- Optimisations de performance
- Tests complets
- Documentation


## Critères d'Évaluation (100 points)

### Fonctionnalités (45 points)
- CRUD des événements (8 pts)
- Vues de calendrier multiples (8 pts)
- Détection de conflits (8 pts)
- Intégration météo (7 pts)
- Temps de trajet (7 pts)
- Jours fériés (4 pts)
- Export/Import (3 pts)

### Aspect Technique (30 points)
- Architecture propre (10 pts)
- Gestion d'état efficace (8 pts)
- Intégrations API (8 pts)
- Gestion des erreurs (4 pts)

### Interface Utilisateur (15 points)
- Design moderne et intuitif (8 pts)
- Navigation fluide (4 pts)
- Responsive (3 pts)

### Documentation (10 points)
- README détaillé (4 pts)
- Documentation API keys (3 pts)
- Présentation (3 pts)


## Défis Techniques et Solutions

### Défi 1 : Calcul des conflits avec événements récurrents
**Problème** : Événement récurrent peut créer des centaines de conflits
**Solution** : Calculer les occurrences sur une fenêtre glissante (ex: 3 mois)

### Défi 2 : Coût des API calls
**Problème** : Google Maps et OpenWeather ont des limites
**Solution** : Cache local avec expiration, limiter les requêtes aux événements proches

### Défi 3 : Synchronisation multi-appareils
**Problème** : Maintenir la cohérence des données
**Solution** : Firestore snapshots avec gestion optimiste des conflits


## Extensions Possibles

- Mode hors ligne avec synchronisation
- Intégration Uber/Lyft pour réservation transport
- Suggestions basées sur IA (ML Kit)
- Widget pour écran d'accueil
- Wear OS / Apple Watch companion
- Mode focus (bloquer notifications pendant événements)
- Intégration Zoom/Meet pour visioconférences
- Reconnaissance vocale pour création rapide


</details>


---


<details>

<summary> PROJET 4 : DEVLINGO - Apprentissage des Langages de Programmation </summary>

## Description Générale

DevLingo est une plateforme éducative mobile inspirée par Duolingo, mais dédiée à l'apprentissage des langages de programmation. Elle rend l'apprentissage du code progressif, interactif et motivant grâce à des leçons courtes, des quiz et un système de gamification.

### Problématique résolue

Apprendre à programmer peut être intimidant et difficile sans structure. DevLingo décompose l'apprentissage en petites leçons digestibles avec un système de progression clair et motivant.

### Public cible

- Débutants en programmation
- Étudiants en informatique
- Professionnels en reconversion
- Autodidactes cherchant une méthode structurée


## Fonctionnalités Détaillées

### Phase 1 : Onboarding et Structure (Semaines 1-3)

**Authentification et Profil**
- Inscription/connexion (email, Google, Apple)
- Sélection du langage à apprendre :
  - Python
  - JavaScript
  - Java
  - Dart/Flutter
  - C++
  - (au moins 2 langages au minimum)
- Évaluation du niveau :
  - Débutant complet
  - Quelques bases
  - Intermédiaire
- Définition d'objectifs :
  - Minutes par jour (5, 10, 15, 30)
  - Objectif (apprentissage loisir, projet, carrière)
- Personnalisation du profil (avatar, nom d'utilisateur)

**Tableau de Bord Principal**
- Streak (jours consécutifs d'apprentissage)
- Barre de progression du niveau
- Points XP totaux
- Badges débloqués
- Leçon du jour suggérée
- Statistiques hebdomadaires


### Phase 2 : Contenu Pédagogique (Semaines 4-7)

**Structure des Cours**
Chaque langage est divisé en :
- **Unités** (ex: Bases, Contrôle de flux, Fonctions, OOP...)
- **Leçons** (3-8 leçons par unité)
- **Exercices** (5-15 exercices par leçon)

**Leçons Interactives**
- Introduction théorique courte (1-2 paragraphes)
- Exemples de code commentés
- Illustrations visuelles si nécessaire
- 3-5 concepts clés mis en évidence
- Durée estimée (5-10 minutes)

**Types d'Exercices**
1. **Questions à Choix Multiples**
   - Question sur un concept
   - 4 choix de réponses
   - Explication de la bonne réponse

2. **Complétion de Code**
   - Code avec espaces à remplir
   - Liste de mots proposés
   - Drag & drop ou sélection

3. **Détection d'Erreurs**
   - Code avec une erreur
   - Identifier la ligne problématique
   - Expliquer l'erreur

4. **Résultat de Code**
   - Code affiché
   - Prédire le résultat (output)
   - Vérification de la réponse

5. **Écriture de Code** (Avancé)
   - Problème à résoudre
   - Éditeur de code simple
   - Validation automatique
   - Tests cachés

**Système de Progression**
- Chaque exercice réussi donne 10 XP
- Leçon complétée = 50 XP bonus
- Unité complétée = 200 XP bonus
- Niveaux basés sur XP total (niveau 1 à 50+)
- Débloquage progressif des leçons


### Phase 3 : Gamification et Motivation (Semaines 8-10)

**Système de Streaks**
- Compteur de jours consécutifs
- Rappel quotidien pour maintenir le streak
- Objectif quotidien personnalisable
- Gel de streak (1 par mois - ne perd pas le streak si 1 jour manqué)

**Badges et Accomplissements**
Exemples de badges :
- "Première leçon" 
- "Streak de 7 jours"
- "Streak de 30 jours"
- "100 exercices complétés"
- "Maître des boucles"
- "Perfectionniste" (10 exercices d'affilée sans erreur)
- "Marathonien" (1h d'apprentissage en une journée)
- "Polyglotte" (apprendre 2+ langages)

**Vies et Réessais**
- 5 vies au départ
- Perte d'une vie si erreur
- Récupération d'une vie toutes les 4 heures
- Option de regarder une pub pour récupérer une vie
- Mode pratique illimité (sans perte de vies)

**Classement**
- Leaderboard hebdomadaire
- Classement par pays/région
- Points basés sur XP de la semaine
- Top 10 affiché
- Position personnelle


### Phase 4 : Fonctionnalités Avancées (Semaines 11-12)

**Révisions Espacées**
- Système de révision automatique
- Algorithme pour identifier les concepts faibles
- Sessions de révision suggérées
- Boost de XP pour révisions

**Mode Challenge**
- Défis quotidiens (3 exercices aléatoires difficiles)
- Défis hebdomadaires thématiques
- Récompenses spéciales (double XP, badges exclusifs)

**Communauté**
- Forum de discussion par langage
- Partage de code
- Entraide entre apprenants
- Célébration des accomplissements

**Personnalisation**
- Choix de thème (clair/sombre)
- Son et notifications
- Rappels personnalisés
- Objectif quotidien ajustable


## Architecture Technique

### Structure du Projet

```
lib/
├── main.dart
├── core/
│   ├── constants/
│   ├── themes/
│   └── utils/
├── models/
│   ├── user_model.dart
│   ├── language_model.dart
│   ├── unit_model.dart
│   ├── lesson_model.dart
│   ├── exercise_model.dart
│   ├── progress_model.dart
│   └── badge_model.dart
├── providers/
│   ├── auth_provider.dart
│   ├── user_progress_provider.dart
│   ├── lessons_provider.dart
│   ├── exercises_provider.dart
│   ├── leaderboard_provider.dart
│   └── streaks_provider.dart
├── screens/
│   ├── auth/
│   ├── onboarding/
│   ├── home/
│   │   └── dashboard_screen.dart
│   ├── learning/
│   │   ├── lesson_screen.dart
│   │   ├── exercise_screen.dart
│   │   └── results_screen.dart
│   ├── profile/
│   ├── leaderboard/
│   └── settings/
├── widgets/
│   ├── lesson_card.dart
│   ├── exercise_widgets/
│   │   ├── mcq_widget.dart
│   │   ├── fill_blank_widget.dart
│   │   ├── code_editor_widget.dart
│   │   └── find_error_widget.dart
│   ├── progress_bar.dart
│   ├── streak_indicator.dart
│   └── badge_widget.dart
└── services/
    ├── firebase_service.dart
    ├── progress_service.dart
    ├── notification_service.dart
    └── analytics_service.dart
```

### Modèles de Données

**Lesson**
```dart
class Lesson {
  String id;
  String unitId;
  String languageId;
  int order;
  String title;
  String description;
  String theoryContent;
  List<String> keyPoints;
  List<String> codeExamples;
  int estimatedMinutes;
  int xpReward;
  bool isLocked;
  String? prerequisiteLesson;
}
```

**Exercise**
```dart
class Exercise {
  String id;
  String lessonId;
  ExerciseType type; // mcq, fillBlank, findError, predict, write
  String question;
  String? codeSnippet;
  dynamic correctAnswer;
  List<dynamic>? options;
  String explanation;
  int xpReward;
  DifficultyLevel difficulty;
}
```

**UserProgress**
```dart
class UserProgress {
  String userId;
  String languageId;
  int currentLevel;
  int totalXP;
  int streakDays;
  DateTime lastActivityDate;
  int livesRemaining;
  DateTime? lastLifeRegeneration;
  Map<String, LessonProgress> lessons;
  List<String> unlockedBadges;
  Map<String, int> conceptMastery; // concept -> score
}
```


## Pile Technologique

### Flutter Packages

**Essentiels**
- `provider` ou `riverpod` - Gestion d'état
- `firebase_auth` - Authentification
- `cloud_firestore` - Base de données
- `hive` - Cache local hors ligne

**UI et Interactions**
- `flutter_syntax_view` - Coloration syntaxique du code
- `code_text_field` - Éditeur de code
- `animations` - Animations personnalisées
- `confetti` - Célébrations visuelles

**Gamification**
- `percent_indicator` - Barres de progression
- `fl_chart` - Graphiques de stats
- `badges` - Affichage de badges

**Notifications**
- `firebase_messaging` - Push
- `flutter_local_notifications` - Notifications locales
- `timezone` - Planification


### Backend Firebase

**Firestore Collections**
```
languages/
  {languageId}/ (python, javascript, java...)
    info: { name, icon, description }
    units/
      {unitId}/
        info: { title, order, description }
        lessons/
          {lessonId}/
            content: { theory, examples, keyPoints }
            exercises/
              {exerciseId}/
                data: { type, question, answer }

users/
  {userId}/
    profile: { name, email, avatar, settings }
    progress/
      {languageId}/
        stats: { level, xp, streak, lives }
        completed: { lessons: [], exercises: [] }
    badges: [ array of badge objects ]

leaderboard/
  weekly/
    {year_week}/
      rankings: [ {userId, xp, rank} ]
```

**Cloud Functions**
- Calcul automatique du classement hebdomadaire
- Réinitialisation des défis quotidiens/hebdomadaires
- Attribution automatique des badges
- Envoi des notifications de rappel
- Régénération des vies
- Détection et récompense des streaks


## Plan de Développement (12 semaines)

### Sprint 1 (Semaines 1-3) : Fondations
- Configuration Firebase
- Système d'authentification
- Onboarding complet
- Dashboard principal
- Modèles de données
- Navigation

### Sprint 2 (Semaines 4-7) : Contenu et Apprentissage
- Structure cours/unités/leçons
- Création de 2 langages avec au moins 3 unités chacun
- 4 types d'exercices fonctionnels
- Système de progression et XP
- Calcul et affichage du niveau
- Débloquage progressif

### Sprint 3 (Semaines 8-10) : Gamification
- Système de streaks
- 10-15 badges avec conditions
- Système de vies
- Leaderboard hebdomadaire
- Révisions espacées
- Mode challenge

### Sprint 4 (Semaines 11-12) : Polish et Contenu
- Ajout de plus d'exercices (minimum 100 total)
- Animations et transitions
- Mode hors ligne
- Notifications intelligentes
- Tests et optimisation
- Documentation


## Critères d'Évaluation (100 points)

### Contenu Pédagogique (30 points)
- Qualité du contenu des leçons (10 pts)
- Variété des exercices (10 pts)
- Progression logique (5 pts)
- Au moins 100 exercices total (5 pts)

### Fonctionnalités (35 points)
- Système d'apprentissage complet (10 pts)
- Système de progression et XP (8 pts)
- Gamification (streaks, badges, vies) (10 pts)
- Leaderboard (4 pts)
- Révisions (3 pts)

### Aspect Technique (20 points)
- Architecture propre (8 pts)
- Gestion d'état efficace (6 pts)
- Performance (3 pts)
- Mode hors ligne (3 pts)

### Interface Utilisateur (10 points)
- Design motivant et engageant (5 pts)
- Animations et feedbacks (3 pts)
- Accessibilité (2 pts)

### Documentation (5 points)
- README complet (3 pts)
- Présentation (2 pts)


## Création du Contenu Pédagogique

### Exemple de Structure - Python

**Unité 1 : Les Bases**
- Leçon 1 : Hello World et print()
- Leçon 2 : Variables et types
- Leçon 3 : Opérations mathématiques
- Leçon 4 : Strings et concaténation
- Leçon 5 : Input utilisateur

**Unité 2 : Contrôle de Flux**
- Leçon 1 : Conditions if/else
- Leçon 2 : Comparaisons et booléens
- Leçon 3 : Boucle while
- Leçon 4 : Boucle for
- Leçon 5 : Break et continue

**Unité 3 : Fonctions**
- Leçon 1 : Définir une fonction
- Leçon 2 : Paramètres et arguments
- Leçon 3 : Return
- Leçon 4 : Scope des variables
- Leçon 5 : Fonctions lambda

### Conseils pour Créer le Contenu

1. **Gardez les leçons courtes** (5-10 minutes max)
2. **Exemples concrets** avant la théorie
3. **Progression très graduelle** (un concept à la fois)
4. **Répétition espacée** des concepts
5. **Explications claires** pour les erreurs


## Défis Techniques et Solutions

### Défi 1 : Validation du code écrit
**Problème** : Exécuter du code utilisateur de manière sécurisée
**Solution** : 
- Backend avec sandboxing (Judge0 API, Piston API)
- Ou limitation aux exercices de sélection/complétion seulement
- Tests unitaires prédéfinis

### Défi 2 : Taille de l'app avec tout le contenu
**Problème** : 100+ exercices = app volumineuse
**Solution** : 
- Contenu stocké dans Firestore
- Cache local avec Hive
- Téléchargement à la demande

### Défi 3 : Maintien du streak à minuit
**Problème** : Vérifier le streak à minuit dans le fuseau horaire de l'utilisateur
**Solution** : Cloud Functions schedulées + stockage du timezone


## Extensions Possibles

- Mode code en direct (peer programming)
- Projets finaux par unité
- Certificats de complétion
- Mode compétition 1v1
- Intégration GitHub pour portfolio
- Exercices avec code sandbox réel
- Support de plus de langages
- Path personnalisés (Web Dev, Data Science...)


</details>


---


<details>

<summary> PROJET 5 : GAZGO - Prix de l'Essence Collaboratifs </summary>

## Description Générale

GazGo est une application collaborative permettant aux automobilistes de consulter et partager les prix de l'essence en temps réel dans leur région. Elle repose sur la participation communautaire et utilise la géolocalisation pour trouver les stations les moins chères à proximité.

### Problématique résolue

Les prix de l'essence varient considérablement d'une station à l'autre et changent fréquemment. GazGo permet aux utilisateurs d'économiser en trouvant facilement les meilleures options près de chez eux.

### Public cible

- Automobilistes cherchant à économiser sur le carburant
- Conducteurs professionnels (taxi, Uber, livraison)
- Toute personne faisant des déplacements réguliers


## Fonctionnalités Détaillées

### Phase 1 : Carte et Stations (Semaines 1-4)

**Carte Interactive**
- Google Maps intégré en plein écran
- Position actuelle de l'utilisateur (GPS)
- Marqueurs pour chaque station-service
- Zoom et déplacement fluides
- Bouton "Centrer sur ma position"
- Affichage de la distance de chaque station

**Informations Stations**
- Données de base :
  - Nom de la station (Petro-Canada, Shell, Esso...)
  - Adresse complète
  - Coordonnées GPS
  - Distance depuis position actuelle
- Types de carburant disponibles :
  - Ordinaire (87)
  - Super (91)
  - Premium (94)
  - Diesel
  - Électrique (si borne de recharge)

**Affichage des Prix**
- Prix par type de carburant
- Horodatage de la dernière mise à jour
- Code couleur :
  - Vert = prix récent (< 24h)
  - Orange = prix ancien (1-3 jours)
  - Rouge = prix très ancien (> 3 jours)
  - Gris = aucun prix renseigné

**Mode Invité**
- Consultation sans compte
- Accès en lecture seule
- Limitation à 50km de rayon
- Bannière encourageant l'inscription


### Phase 2 : Contribution et Validation (Semaines 5-7)

**Création de Compte**
- Inscription email/mot de passe
- Connexion avec Google
- Profil utilisateur avec :
  - Nom d'utilisateur
  - Photo de profil (optionnelle)
  - Score de fiabilité (0-100%)
  - Nombre de contributions
  - Niveau (Bronze, Argent, Or, Platine)

**Ajout de Prix**
- Bouton flottant "Ajouter un prix"
- Sélection de la station (via carte ou liste)
- Formulaire simple :
  - Type de carburant
  - Prix (en cents/litre)
  - Date et heure (auto-rempli)
  - Photo de preuve (optionnelle mais recommandée)
- Validation et envoi
- Points gagnés (+10 points)

**Modification de Prix**
- Signaler un prix incorrect
- Proposer une correction
- Justification obligatoire
- Système de votes

**Validation Communautaire**
- Boutons "Prix confirmé" 👍 (vert)
- Bouton "Prix incorrect" 👎 (rouge)
- Compteur de validations
- Algorithme de confiance :
  - Prix avec 3+ confirmations = fiable
  - Prix avec 2+ signalements = suspect (orange)
  - Prix avec 5+ signalements = supprimé

**Système de Points et Niveau**
- +10 points par prix ajouté
- +5 points par validation correcte
- -5 points par ajout incorrect
- Niveaux basés sur le total de points :
  - Bronze : 0-100 points
  - Argent : 101-500 points
  - Or : 501-1500 points
  - Platine : 1500+ points
- Badge visible sur le profil


### Phase 3 : Fonctionnalités Avancées (Semaines 8-10)

**Filtres et Recherche**
- Rayon de recherche ajustable (1km à 50km)
- Filtre par type de carburant
- Filtre par prix maximum
- Filtre par marque de station
- Tri par :
  - Prix croissant
  - Distance
  - Dernière mise à jour
- Recherche par adresse ou code postal

**Stations Favorites**
- Marquer jusqu'à 5 stations en favoris
- Accès rapide dans un onglet dédié
- Notification si prix avantageux détecté
- Historique des prix (graphique 30 jours)

**Navigation et Itinéraire**
- Bouton "Y aller" sur chaque station
- Ouverture de Google Maps/Waze
- Calcul de l'itinéraire
- Estimation temps d'arrivée
- Alternative : navigation in-app (optionnel)

**Calculateur d'Économies**
- Saisie du type de véhicule ou consommation
- Volume du réservoir
- Calcul du coût total pour un plein
- Comparaison entre stations
- Économies potentielles affichées

**Statistiques Utilisateur**
- Total de contributions
- Taux de fiabilité
- Classement régional
- Stations les plus contribuées
- Graphique d'activité mensuelle


### Phase 4 : Communauté et Notifications (Semaines 11-12)

**Classement**
- Leaderboard par région (ville, province)
- Top 10 contributeurs du mois
- Score basé sur :
  - Nombre de contributions
  - Taux de fiabilité
  - Validations reçues
- Récompenses pour le top 3

**Notifications**
- Baisse de prix dans les favoris
- Nouveau prix ajouté à proximité
- Prix exceptionnel détecté
- Niveau supérieur atteint
- Personnalisables dans les paramètres

**Commentaires et Avis**
- Commentaires sur les stations
- Informations utiles :
  - Propreté
  - Service
  - Commodités (café, toilettes, lave-auto)
  - Heures d'ouverture
- Système de votes sur les commentaires

**Signalement de Problèmes**
- Signaler une station fermée
- Signaler une erreur de localisation
- Signaler un utilisateur malveillant
- Modération par l'admin


## Architecture Technique

### Structure du Projet

```
lib/
├── main.dart
├── core/
│   ├── constants/
│   ├── themes/
│   └── utils/
├── models/
│   ├── user_model.dart
│   ├── station_model.dart
│   ├── price_model.dart
│   ├── validation_model.dart
│   └── comment_model.dart
├── providers/
│   ├── auth_provider.dart
│   ├── location_provider.dart
│   ├── stations_provider.dart
│   ├── prices_provider.dart
│   ├── user_stats_provider.dart
│   └── leaderboard_provider.dart
├── screens/
│   ├── auth/
│   ├── map/
│   │   └── map_screen.dart
│   ├── station/
│   │   ├── station_details_screen.dart
│   │   └── add_price_screen.dart
│   ├── profile/
│   │   ├── my_profile_screen.dart
│   │   └── user_stats_screen.dart
│   ├── favorites/
│   ├── leaderboard/
│   └── settings/
├── widgets/
│   ├── station_marker.dart
│   ├── station_card.dart
│   ├── price_tile.dart
│   ├── filter_panel.dart
│   ├── savings_calculator.dart
│   └── validation_buttons.dart
└── services/
    ├── firebase_service.dart
    ├── supabase_service.dart
    ├── maps_service.dart
    ├── location_service.dart
    └── notification_service.dart
```

### Modèles de Données

**Station**
```dart
class Station {
  String id;
  String name;
  String brand; // Shell, Petro-Canada, Esso...
  String address;
  GeoPoint location;
  List<FuelType> availableFuels;
  String? phone;
  String? website;
  bool hasCarWash;
  bool hasConvenienceStore;
  double averageRating;
  int totalComments;
  DateTime createdAt;
}
```

**Price**
```dart
class Price {
  String id;
  String stationId;
  String userId;
  FuelType fuelType;
  double pricePerLiter;
  DateTime reportedAt;
  String? proofPhotoUrl;
  int validations; // thumbs up
  int reports; // thumbs down
  List<String> validatedBy; // userIds
  List<String> reportedBy; // userIds
  PriceStatus status; // active, suspected, removed
}
```

**UserStats**
```dart
class UserStats {
  String userId;
  int totalContributions;
  int correctContributions;
  int incorrectContributions;
  double reliabilityScore; // 0-100%
  int points;
  UserLevel level; // bronze, silver, gold, platinum
  int rank; // classement régional
  List<String> favoriteStations;
  DateTime joinedAt;
  DateTime lastContributionAt;
}
```


## Pile Technologique

### Flutter Packages

**Essentiels**
- `provider` ou `riverpod` - Gestion d'état
- `firebase_auth` ou `supabase_flutter` - Authentification
- `cloud_firestore` ou `supabase_flutter` - Base de données

**Cartographie et Localisation**
- `google_maps_flutter` - Carte interactive
- `geolocator` - Position GPS
- `geocoding` - Adresse ↔ Coordonnées
- `geoflutterfire` ou `postgis` - Requêtes géospatiales

**UI et Fonctionnalités**
- `url_launcher` - Ouverture Maps externe
- `image_picker` - Photos de preuve
- `cached_network_image` - Cache des images
- `fl_chart` - Graphiques d'historique

**Notifications**
- `firebase_messaging` - Push notifications
- `flutter_local_notifications` - Notifications locales


### Backend - Option Supabase (Recommandé)

**Avantages de Supabase pour ce projet**
- PostgreSQL avec extension PostGIS pour géospatial
- Requêtes spatiales efficaces (rayon, proximité)
- Row Level Security (RLS) pour sécurité
- Storage intégré pour photos
- Edge Functions pour logique serveur
- Moins coûteux que Firebase pour beaucoup de requêtes géo

**Tables PostgreSQL**
```sql
-- Stations
CREATE TABLE stations (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  brand TEXT,
  address TEXT,
  location GEOGRAPHY(POINT, 4326),
  available_fuels TEXT[],
  created_at TIMESTAMP DEFAULT NOW()
);

-- Index spatial pour requêtes géographiques rapides
CREATE INDEX stations_location_idx 
  ON stations USING GIST(location);

-- Prix
CREATE TABLE prices (
  id UUID PRIMARY KEY,
  station_id UUID REFERENCES stations(id),
  user_id UUID REFERENCES auth.users(id),
  fuel_type TEXT,
  price_per_liter DECIMAL(5,2),
  proof_photo_url TEXT,
  reported_at TIMESTAMP DEFAULT NOW(),
  validations INT DEFAULT 0,
  reports INT DEFAULT 0,
  status TEXT DEFAULT 'active'
);

-- Stats utilisateurs
CREATE TABLE user_stats (
  user_id UUID PRIMARY KEY REFERENCES auth.users(id),
  total_contributions INT DEFAULT 0,
  correct_contributions INT DEFAULT 0,
  points INT DEFAULT 0,
  level TEXT DEFAULT 'bronze',
  reliability_score DECIMAL(5,2) DEFAULT 100
);
```

**Requête Spatiale Exemple**
```sql
-- Trouver stations dans un rayon de 5km
SELECT 
  s.*,
  ST_Distance(s.location, ST_MakePoint($longitude, $latitude)::geography) as distance
FROM stations s
WHERE ST_DWithin(
  s.location,
  ST_MakePoint($longitude, $latitude)::geography,
  5000  -- 5km en mètres
)
ORDER BY distance;
```

**Edge Functions**
```typescript
// Fonction pour valider un prix
export async function validatePrice(priceId, userId, isValid) {
  // Logique de validation
  // Mise à jour du score de fiabilité
  // Attribution de points
  // Détection de spam
}
```


### Alternative Firebase

**Firestore avec GeoFlutterFire**
- Package `geoflutterfire2` pour requêtes géo
- Collections :
  ```
  stations/ - avec geohash
  prices/
  users/
  user_stats/
  leaderboard/
  ```


## Plan de Développement (12 semaines)

### Sprint 1 (Semaines 1-4) : Carte et Données
- Configuration Supabase/Firebase
- Authentification complète
- Google Maps intégré
- Géolocalisation utilisateur
- Base de données de stations (min 50 stations)
- Affichage des marqueurs
- Détails d'une station
- Mode invité fonctionnel

### Sprint 2 (Semaines 5-7) : Contribution
- Formulaire d'ajout de prix
- Upload de photos
- Système de validation communautaire
- Calcul du score de fiabilité
- Système de points et niveaux
- Profil utilisateur avec stats

### Sprint 3 (Semaines 8-10) : Fonctionnalités Avancées
- Filtres complets
- Système de favoris
- Calculateur d'économies
- Historique des prix
- Navigation vers la station
- Classement régional

### Sprint 4 (Semaines 11-12) : Communauté et Polish
- Système de commentaires
- Notifications intelligentes
- Signalement de problèmes
- Optimisation des requêtes géo
- Tests et debugging
- Documentation


## Critères d'Évaluation (100 points)

### Fonctionnalités (40 points)
- Carte interactive avec stations (10 pts)
- Système d'ajout de prix (8 pts)
- Validation communautaire (8 pts)
- Filtres et recherche (6 pts)
- Système de points et niveaux (8 pts)

### Aspect Technique (30 points)
- Requêtes géospatiales efficaces (10 pts)
- Architecture propre (8 pts)
- Performance de la carte (6 pts)
- Gestion des permissions GPS (6 pts)

### Interface Utilisateur (20 points)
- Carte intuitive et fluide (10 pts)
- UX pour ajout de prix (5 pts)
- Design général (5 pts)

### Documentation (10 points)
- README avec setup (5 pts)
- Documentation API keys (3 pts)
- Présentation (2 pts)


## Considérations Importantes

### Données Initiales
- Créer une base de 50-100 stations pour démarrer
- Utiliser l'API Google Places pour récupérer les stations
- Ou saisie manuelle des stations principales

### Permissions
- Géolocalisation (toujours autoriser pour meilleure UX)
- Caméra (pour photos de preuve)
- Notifications (optionnelles)

### Modération
- Système de signalement utilisateur
- Détection automatique de spam
- Blocage des utilisateurs malveillants
- Dashboard admin (optionnel)

### Legal
- Conditions d'utilisation claires
- Disclaimer sur l'exactitude des prix
- Protection des données (RGPD/PIPEDA)


## Défis Techniques et Solutions

### Défi 1 : Performance avec beaucoup de marqueurs
**Problème** : Carte lente avec 100+ stations affichées
**Solution** : 
- Clustering des marqueurs proches
- Chargement uniquement des stations visibles (viewport)
- Package `google_maps_cluster_manager`

### Défi 2 : Requêtes géospatiales coûteuses
**Problème** : Beaucoup de lectures Firestore
**Solution** :
- Utiliser Supabase avec PostGIS (plus efficace)
- Ou GeoHash avec Firebase
- Cache local des stations proches

### Défi 3 : Spam et faux prix
**Problème** : Utilisateurs ajoutant de faux prix
**Solution** :
- Exiger photo de preuve après X signalements
- Système de réputation
- Vérification croisée avec d'autres sources
- Ban automatique si score trop bas


## Extensions Possibles

- Intégration avec APIs de prix officiels
- Prédiction des tendances de prix (ML)
- Bornes de recharge électrique
- Programme de récompenses partenaires
- Mode hors ligne avec cache
- Widget écran d'accueil
- Android Auto / CarPlay integration
- Partage des trouvailles sur réseaux sociaux
- Alertes de prix par trajet régulier


</details>


---


# PROJETS SIMPLES ET JEUX (6-8 semaines)

Ces projets sont plus simples que les 5 projets intégrateurs précédents, mais tout aussi fascinants. Parfaits pour des projets intermédiaires ou pour se familiariser avec la création de jeux en Flutter.


---


<details>

<summary> PROJET 6 : SNAKE GAME - Jeu du Serpent Classique </summary>

## Description Générale

Un clone moderne du célèbre jeu Snake où le joueur contrôle un serpent qui grandit en mangeant de la nourriture. Simple mais addictif, parfait pour apprendre la logique de jeu et les animations.

### Pourquoi ce projet est fascinant

- Logique de jeu claire et compréhensible
- Parfait pour apprendre les game loops
- Gestion de collision simple
- Système de score satisfaisant
- Possibilité d'ajouter des power-ups créatifs

### Public cible

- Nostalgiques des jeux classiques
- Joueurs occasionnels
- Tout le monde (très accessible)


## Fonctionnalités

### Fonctionnalités de Base

**Gameplay**
- Serpent qui se déplace automatiquement
- 4 directions (haut, bas, gauche, droite)
- Génération aléatoire de nourriture
- Serpent grandit après avoir mangé
- Collision avec les murs = game over
- Collision avec soi-même = game over
- Score basé sur la nourriture mangée

**Contrôles**
- Swipe pour changer de direction
- Boutons directionnels
- Prévention du demi-tour (ne peut pas aller à l'opposé)

**Interface**
- Grille de jeu (20x20 ou 30x30)
- Affichage du score actuel
- Affichage du meilleur score
- Écran de game over avec option rejouer
- Animation fluide (60 FPS)

### Fonctionnalités Avancées

**Niveaux de Difficulté**
- Facile : vitesse lente
- Moyen : vitesse normale
- Difficile : vitesse rapide
- Expert : vitesse très rapide + obstacles

**Power-ups**
- Ralentissement temporaire
- Invincibilité (traverser les murs)
- Double points
- Réduction de taille

**Modes de Jeu**
- Mode Classique
- Mode Sans Murs (serpent réapparaît de l'autre côté)
- Mode Obstacles (murs aléatoires)
- Mode Contre-la-montre (2 minutes)

**Personnalisation**
- Skins du serpent
- Thèmes de couleur
- Effets sonores
- Musique de fond


## Architecture Technique

### Structure

```
lib/
├── models/
│   ├── snake_model.dart
│   ├── food_model.dart
│   └── game_state_model.dart
├── providers/
│   └── game_provider.dart
├── screens/
│   ├── home_screen.dart
│   ├── game_screen.dart
│   └── game_over_screen.dart
├── widgets/
│   ├── game_board.dart
│   ├── snake_cell.dart
│   ├── food_cell.dart
│   └── control_buttons.dart
└── utils/
    ├── constants.dart
    └── direction.dart
```

### Logique Clé

**Game Loop**
```dart
class GameProvider extends ChangeNotifier {
  Timer? _gameTimer;
  List<Offset> snakeBody = [Offset(10, 10)];
  Offset food = Offset(15, 15);
  Direction currentDirection = Direction.right;
  int score = 0;
  
  void startGame() {
    _gameTimer = Timer.periodic(
      Duration(milliseconds: 200),
      (timer) => updateGame(),
    );
  }
  
  void updateGame() {
    moveSnake();
    checkCollisions();
    notifyListeners();
  }
}
```

### Packages Nécessaires

- `provider` - Gestion d'état
- `shared_preferences` - Meilleur score
- `audioplayers` - Sons
- `vibration` - Feedback tactile

## Temps de Développement

**6 semaines recommandées**

- Semaine 1-2 : Logique de base + grille
- Semaine 3-4 : Contrôles + collisions + score
- Semaine 5 : Power-ups + modes
- Semaine 6 : Polish + sons + menu


## Évaluation (100 points)

- Gameplay fonctionnel (40 pts)
- Logique sans bugs (20 pts)
- Contrôles intuitifs (15 pts)
- UI/UX (15 pts)
- Fonctionnalités bonus (10 pts)


</details>


---


<details>

<summary> PROJET 7 : QUIZ MASTER - Application de Quiz Multithèmes </summary>

## Description Générale

Une application de quiz interactive avec plusieurs catégories, questions à choix multiples, système de score et classement. Parfaite pour apprendre la gestion de données et l'UI/UX engageante.

### Pourquoi ce projet est fascinant

- Très engageant et éducatif
- Facile à étendre avec nouvelles catégories
- Bon pour apprendre la gestion de données JSON
- Interface dynamique et colorée
- Potentiel viral (défis entre amis)


## Fonctionnalités

### Core Features

**Catégories**
- Culture générale
- Sciences
- Histoire
- Géographie
- Sport
- Cinéma
- Technologie
- Au moins 5 catégories avec 20+ questions chacune

**Types de Questions**
- Choix multiples (4 options)
- Vrai ou Faux
- Questions à réponse courte
- Questions avec images

**Modes de Jeu**
- Mode Rapide (10 questions, 15 sec chacune)
- Mode Marathon (50 questions)
- Mode Survie (jusqu'à la première erreur)
- Mode Défi Quotidien

**Système de Score**
- Points par bonne réponse
- Bonus de rapidité
- Streak bonus (réponses consécutives)
- Pénalité pour mauvaise réponse

### Fonctionnalités Avancées

**Progression**
- Niveaux par catégorie
- Déblocage progressif des catégories
- Statistiques détaillées
- Graphiques de performance

**Social**
- Partage du score
- Défi d'amis
- Classement global
- Classement par catégorie

**Gamification**
- Système de vies (5 vies)
- Power-ups (50-50, skip, double chance)
- Badges d'accomplissement
- Récompenses quotidiennes


## Structure Technique

```
lib/
├── models/
│   ├── question_model.dart
│   ├── category_model.dart
│   ├── quiz_session_model.dart
│   └── user_stats_model.dart
├── data/
│   ├── questions_data.json
│   └── categories_data.json
├── providers/
│   ├── quiz_provider.dart
│   ├── timer_provider.dart
│   └── stats_provider.dart
├── screens/
│   ├── home_screen.dart
│   ├── categories_screen.dart
│   ├── quiz_screen.dart
│   ├── results_screen.dart
│   └── stats_screen.dart
└── widgets/
    ├── question_card.dart
    ├── answer_button.dart
    ├── progress_bar.dart
    └── timer_widget.dart
```

### Modèle de Question

```dart
class Question {
  final String id;
  final String category;
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;
  final String difficulty; // easy, medium, hard
  final String? imageUrl;
}
```

## Packages

- `provider` - État
- `flutter_countdown_timer` - Timer
- `fl_chart` - Graphiques stats
- `confetti` - Célébrations

## Temps : 6-7 semaines


</details>


---


<details>

<summary> PROJET 8 : 2048 GAME - Puzzle de Nombres </summary>

## Description Générale

Clone du populaire jeu 2048 où le joueur combine des tuiles avec les mêmes nombres pour atteindre 2048. Excellent pour apprendre les animations et la logique de puzzle.

### Pourquoi fascinant

- Logique mathématique intéressante
- Animations satisfaisantes
- Addictif et stratégique
- Code réutilisable pour d'autres puzzles


## Fonctionnalités

**Gameplay**
- Grille 4x4
- Tuiles avec puissances de 2
- Swipe dans 4 directions
- Fusion des tuiles identiques
- Nouvelle tuile (2 ou 4) après chaque mouvement
- Game over si grille pleine et aucun mouvement possible

**Scoring**
- Score basé sur les fusions
- Meilleur score sauvegardé
- Compteur de mouvements

**Features Bonus**
- Annuler le dernier coup (1 fois)
- Grilles alternatives (3x3, 5x5, 6x6)
- Thèmes de couleurs
- Mode Zen (sans game over)
- Défis quotidiens (atteindre X en Y coups)

**Animations**
- Glissement fluide des tuiles
- Apparition des nouvelles tuiles
- Fusion avec effet
- Celebration pour 2048

## Architecture

```dart
class GameProvider extends ChangeNotifier {
  List<List<int>> grid = List.generate(4, (_) => List.filled(4, 0));
  int score = 0;
  
  void swipe(Direction direction) {
    // Logique de déplacement et fusion
    bool moved = moveAndMerge(direction);
    if (moved) {
      addRandomTile();
      checkGameOver();
      notifyListeners();
    }
  }
  
  bool moveAndMerge(Direction dir) {
    // Implémentation selon la direction
  }
}
```

## Packages

- `provider`
- `flutter_swipe_detector`
- `shared_preferences`
- `flutter_animate`

## Temps : 5-6 semaines


</details>


---


<details>

<summary> PROJET 9 : POMODORO FOCUS - Timer de Productivité </summary>

## Description Générale

Application de technique Pomodoro pour améliorer la productivité avec sessions de travail de 25 minutes, pauses courtes et longues, statistiques et historique.

### Pourquoi fascinant

- Très utile au quotidien
- Simple mais puissant
- Bon pour apprendre les timers et notifications
- Statistiques visuelles motivantes


## Fonctionnalités

**Timer Pomodoro**
- Session de travail (25 min par défaut, ajustable)
- Pause courte (5 min)
- Pause longue (15 min après 4 sessions)
- Compte automatique des sessions
- Notifications sonores et visuelles

**Tâches**
- Liste de tâches à accomplir
- Association tâche-pomodoro
- Estimation du nombre de pomodoros nécessaires
- Cocher les tâches terminées

**Statistiques**
- Pomodoros complétés par jour
- Temps total de focus
- Graphique hebdomadaire/mensuel
- Streak de jours productifs
- Tâches complétées

**Personnalisation**
- Durées personnalisables
- Sons de notification
- Thème de l'interface
- Citation motivante entre sessions
- Mode ne pas déranger (bloquer notifs externes)

**Fonctionnalités Avancées**
- Catégories de tâches (travail, étude, perso)
- Objectifs quotidiens
- Rapport hebdomadaire par email
- Intégration calendrier
- Mode équipe (sync entre collègues)


## Structure

```
lib/
├── models/
│   ├── pomodoro_session_model.dart
│   ├── task_model.dart
│   └── statistics_model.dart
├── providers/
│   ├── timer_provider.dart
│   ├── tasks_provider.dart
│   └── stats_provider.dart
├── screens/
│   ├── timer_screen.dart
│   ├── tasks_screen.dart
│   ├── statistics_screen.dart
│   └── settings_screen.dart
└── services/
    ├── notification_service.dart
    └── audio_service.dart
```

## Packages

- `provider`
- `circular_countdown_timer`
- `fl_chart`
- `flutter_local_notifications`
- `audioplayers`
- `shared_preferences`

## Temps : 5-6 semaines


</details>


---


<details>

<summary> PROJET 10 : COLOR MATCH - Jeu de Mémoire des Couleurs </summary>

## Description Générale

Jeu où le joueur doit mémoriser et reproduire une séquence de couleurs qui s'allonge progressivement. Inspiré du jeu Simon, mais avec une touche moderne.

### Pourquoi fascinant

- Gameplay simple mais captivant
- Bon pour apprendre les animations
- Défi de mémoire addictif
- Visuel attrayant


## Fonctionnalités

**Gameplay de Base**
- 4 boutons colorés (rouge, bleu, vert, jaune)
- Séquence générée aléatoirement
- Le jeu montre la séquence
- Le joueur reproduit la séquence
- Séquence s'allonge de 1 à chaque tour
- Game over si erreur

**Modes**
- Mode Classique (4 couleurs)
- Mode Difficile (6 couleurs)
- Mode Contre-la-montre (temps limité par tour)
- Mode Infini (sans game over, compte les erreurs)

**Scoring**
- Points par séquence réussie
- Bonus de vitesse
- Meilleur score
- Niveau atteint (longueur de séquence)

**Features**
- Animations visuelles
- Sons différents par couleur
- Vibration au tap
- Ralenti de la séquence (power-up)
- Voir une fois de plus (power-up)

**Statistiques**
- Meilleur séquence
- Temps de jeu total
- Séquences totales jouées
- Précision moyenne


## Structure

```dart
class ColorMatchProvider extends ChangeNotifier {
  List<int> sequence = [];
  List<int> playerInput = [];
  int currentLevel = 1;
  bool isShowingSequence = false;
  
  void startNewRound() {
    sequence.add(Random().nextInt(4));
    showSequence();
  }
  
  Future<void> showSequence() async {
    isShowingSequence = true;
    for (int colorIndex in sequence) {
      await highlightColor(colorIndex);
      await Future.delayed(Duration(milliseconds: 800));
    }
    isShowingSequence = false;
  }
  
  void onColorTap(int colorIndex) {
    playerInput.add(colorIndex);
    if (!checkInput()) {
      gameOver();
    } else if (playerInput.length == sequence.length) {
      startNewRound();
    }
  }
}
```

## Packages

- `provider`
- `audioplayers`
- `vibration`
- `flutter_animate`

## Temps : 4-5 semaines


</details>


---


<details>

<summary> PROJET 11 : EXPENSE TRACKER - Suivi de Dépenses Simple </summary>

## Description Générale

Application de suivi des dépenses personnelles avec catégories, graphiques et budget mensuel. Plus simple que le projet Shiftly mais très pratique.

### Pourquoi fascinant

- Utilité réelle immédiate
- Bonne introduction aux graphiques
- Gestion de données CRUD
- Calculs et agrégations


## Fonctionnalités

**Gestion des Dépenses**
- Ajouter une dépense (montant, catégorie, date, note)
- Modifier une dépense
- Supprimer une dépense
- Dépenses récurrentes (abonnements)

**Catégories**
- 10 catégories prédéfinies avec icônes
- Couleur par catégorie
- Possibilité d'ajouter des catégories

**Budget**
- Définir un budget mensuel global
- Budget par catégorie
- Alertes si dépassement
- Projection de fin de mois

**Visualisation**
- Graphique camembert par catégorie
- Graphique en barres par jour/semaine
- Évolution mensuelle
- Comparaison mois précédent

**Rapports**
- Total du mois actuel
- Moyenne quotidienne
- Plus grosse dépense
- Catégorie la plus dépensée
- Export en CSV

**Interface**
- Écran d'accueil avec résumé
- Calendrier des dépenses
- Liste filtrable
- Recherche par montant/catégorie


## Structure

```
lib/
├── models/
│   ├── expense_model.dart
│   ├── category_model.dart
│   └── budget_model.dart
├── providers/
│   ├── expenses_provider.dart
│   └── budget_provider.dart
├── screens/
│   ├── home_screen.dart
│   ├── add_expense_screen.dart
│   ├── statistics_screen.dart
│   └── budget_screen.dart
└── widgets/
    ├── expense_tile.dart
    ├── pie_chart_widget.dart
    └── budget_progress.dart
```

## Packages

- `provider`
- `fl_chart`
- `intl`
- `sqflite` (stockage local)
- `path_provider`

## Temps : 6 semaines


</details>


---


<details>

<summary> PROJET 12 : WORD GUESS - Jeu de Devinettes de Mots </summary>

## Description Générale

Inspiré de Wordle, le joueur doit deviner un mot de 5 lettres en 6 essais maximum. Les indices de couleur indiquent si les lettres sont correctes et bien placées.

### Pourquoi fascinant

- Très populaire actuellement
- Logique de jeu intéressante
- Manipulation de strings
- Design minimaliste élégant


## Fonctionnalités

**Gameplay**
- Mot de 5 lettres à deviner
- 6 tentatives maximum
- Feedback par lettre :
  - Vert : lettre correcte, bonne position
  - Jaune : lettre correcte, mauvaise position
  - Gris : lettre absente
- Clavier virtuel avec feedback de couleur
- Un mot par jour (mode daily)

**Modes**
- Mode Daily (1 mot/jour, partageable)
- Mode Practice (illimité)
- Mode Contre-la-montre
- Mots de 4, 5 ou 6 lettres

**Statistiques**
- Parties jouées
- Pourcentage de victoire
- Streak actuel
- Distribution des victoires (en combien d'essais)
- Partage du résultat (grille de couleurs)

**Interface**
- Grille 6x5
- Animation de flip des tuiles
- Animation de shake si mot invalide
- Keyboard avec couleurs
- Mode sombre/clair


## Structure

```dart
class WordGuessProvider extends ChangeNotifier {
  String targetWord = '';
  List<String> guesses = [];
  int currentRow = 0;
  String currentGuess = '';
  
  Map<String, LetterStatus> letterStatuses = {};
  
  void addLetter(String letter) {
    if (currentGuess.length < 5) {
      currentGuess += letter;
      notifyListeners();
    }
  }
  
  void submitGuess() {
    if (currentGuess.length == 5 && isValidWord(currentGuess)) {
      guesses.add(currentGuess);
      updateLetterStatuses();
      checkWin();
      currentGuess = '';
      currentRow++;
      notifyListeners();
    }
  }
}
```

## Base de Mots

Créer deux fichiers JSON :
- `valid_words.json` - Mots acceptés (10k+ mots)
- `target_words.json` - Mots sélectionnables (2k mots courants)

## Packages

- `provider`
- `flutter_animate`
- `shared_preferences`
- `share_plus`

## Temps : 5-6 semaines


</details>


---


<details>

<summary> PROJET 13 : HABIT TRACKER - Suivi d'Habitudes </summary>

## Description Générale

Application pour suivre et construire des habitudes positives avec calendrier visuel, streaks et statistiques motivantes.

### Pourquoi fascinant

- Impact réel sur la vie quotidienne
- Gamification de la productivité
- Visualisation satisfaisante
- Psychologie des habitudes


## Fonctionnalités

**Gestion des Habitudes**
- Créer une habitude (nom, icône, couleur)
- Fréquence (quotidien, jours spécifiques, X fois par semaine)
- Heure de rappel
- Catégorie (santé, productivité, apprentissage...)
- Objectif (nombre de jours)

**Tracking Quotidien**
- Liste des habitudes du jour
- Cocher comme complété
- Notes journalières
- Mood tracker associé

**Visualisation**
- Calendrier avec code couleur
- Vue d'ensemble annuelle (GitHub-style)
- Streak counter par habitude
- Taux de complétion

**Statistiques**
- Meilleur streak
- Streak actuel
- Total de jours réussis
- Pourcentage de réussite
- Graphique de tendance

**Motivation**
- Quotes motivantes
- Badges d'accomplissement
- Rappels intelligents
- Célébrations visuelles

**Fonctionnalités Avancées**
- Habitudes avec mesure (ex: boire 8 verres d'eau)
- Habitudes négatives à éviter
- Analyse de corrélation (humeur vs habitudes)
- Export des données


## Structure

```
lib/
├── models/
│   ├── habit_model.dart
│   ├── habit_completion_model.dart
│   └── statistics_model.dart
├── providers/
│   ├── habits_provider.dart
│   └── stats_provider.dart
├── screens/
│   ├── home_screen.dart
│   ├── add_habit_screen.dart
│   ├── calendar_screen.dart
│   └── statistics_screen.dart
└── widgets/
    ├── habit_tile.dart
    ├── calendar_heatmap.dart
    ├── streak_counter.dart
    └── progress_ring.dart
```

## Packages

- `provider`
- `flutter_heatmap_calendar`
- `fl_chart`
- `flutter_local_notifications`
- `sqflite`
- `intl`

## Temps : 6-7 semaines


</details>


---


<details>

<summary> PROJET 14 : ROCK PAPER SCISSORS - Pierre Papier Ciseaux Amélioré </summary>

## Description Générale

Version moderne du jeu Pierre-Papier-Ciseaux avec IA, multijoueur local, statistiques et modes de jeu variés.

### Pourquoi fascinant

- Simple à comprendre
- Bon pour apprendre les algorithmes de jeu
- Animations amusantes
- Extensible facilement


## Fonctionnalités

**Modes de Jeu**
- Contre IA (facile, moyen, difficile)
- Multijoueur local (2 joueurs)
- Mode Tournoi (meilleur de 5/7/9)
- Mode Rapide (série de 10 manches)

**Intelligence Artificielle**
- Facile : choix aléatoire
- Moyen : détecte les patterns simples
- Difficile : mémorise l'historique et prédit

**Gameplay**
- Boutons visuels (pierre/papier/ciseaux)
- Animation du choix
- Compte à rebours
- Affichage du gagnant
- Score en temps réel

**Statistiques**
- Victoires/Défaites/Égalités
- Taux de victoire par choix
- Patterns de jeu détectés
- Historique des 20 dernières manches
- Graphique de performance

**Personnalisation**
- Skins des icônes
- Effets sonores
- Thèmes visuels
- Avatar personnalisé

**Modes Bonus**
- Pierre-Papier-Ciseaux-Lézard-Spock (5 options)
- Mode Chance (options aléatoires à chaque manche)
- Mode Handicap (moins d'options pour le meilleur joueur)


## IA Niveau Difficile

```dart
class SmartAI {
  List<Choice> playerHistory = [];
  Map<String, Choice> patterns = {};
  
  Choice predict() {
    if (playerHistory.length < 3) {
      return randomChoice();
    }
    
    // Détecte patterns de 2-3 coups
    String lastMoves = playerHistory.takeLast(2).toString();
    if (patterns.containsKey(lastMoves)) {
      // Prédit le prochain coup et choisit le counter
      return counterTo(patterns[lastMoves]);
    }
    
    // Sinon choix basé sur la fréquence
    return counterToMostFrequent();
  }
}
```

## Packages

- `provider`
- `flutter_animate`
- `audioplayers`

## Temps : 4 semaines


</details>


---


<details>

<summary> PROJET 15 : MEDITATION TIMER - Timer de Méditation </summary>

## Description Générale

Application de méditation guidée avec timers personnalisables, sons ambiants, progression et journal de méditation.

### Pourquoi fascinant

- Bien-être et santé mentale
- Audio et timers avancés
- Design zen et apaisant
- Impact positif réel


## Fonctionnalités

**Sessions de Méditation**
- Durées prédéfinies (5, 10, 15, 20, 30 min)
- Durée personnalisée
- Timer avec progression circulaire
- Sons de début et fin (bol tibétain)
- Intervalle de rappel respiration

**Sons Ambiants**
- Pluie
- Océan
- Forêt
- Vent
- Feu de cheminée
- Bol chantant
- Volume ajustable
- Mix de plusieurs sons

**Méditations Guidées**
- Audio préenregistrés (5-10 méditations)
- Catégories (débutant, stress, sommeil)
- Progression de la voix avec musique
- Téléchargement optionnel pour offline

**Suivi**
- Calendrier des séances
- Streak de jours consécutifs
- Temps total médité
- Graphique de régularité
- Mood tracking (avant/après)

**Journal**
- Notes après méditation
- Humeur et ressenti
- Niveau de stress (1-10)
- Tags (calme, anxieux, énergisé...)

**Interface**
- Design minimaliste et apaisant
- Animations douces
- Mode sombre obligatoire
- Pas de distractions


## Structure

```
lib/
├── models/
│   ├── meditation_session_model.dart
│   ├── guided_meditation_model.dart
│   └── journal_entry_model.dart
├── providers/
│   ├── timer_provider.dart
│   ├── audio_provider.dart
│   └── stats_provider.dart
├── screens/
│   ├── home_screen.dart
│   ├── timer_screen.dart
│   ├── guided_screen.dart
│   ├── statistics_screen.dart
│   └── journal_screen.dart
└── services/
    ├── audio_service.dart
    └── notification_service.dart
```

## Packages

- `provider`
- `audioplayers`
- `circular_countdown_timer`
- `flutter_local_notifications`
- `sqflite`
- `wakelock` (garde écran allumé)

## Temps : 6 semaines


</details>


---


## Comparaison des Projets

### Par Difficulté

**Facile (4-5 semaines)**
- Rock Paper Scissors
- Color Match Game
- Snake Game

**Moyen (5-6 semaines)**
- 2048 Game
- Quiz Master
- Word Guess
- Pomodoro Focus

**Intermédiaire (6-7 semaines)**
- Expense Tracker
- Habit Tracker
- Meditation Timer

**Avancé (8-12 semaines)**
- Les 5 projets intégrateurs (Sweatly, Shiftly, PlaneEx, DevLingo, GazGo)


### Par Type

**Jeux**
- Snake Game
- Quiz Master
- 2048 Game
- Color Match
- Word Guess
- Rock Paper Scissors

**Productivité**
- Pomodoro Focus
- Habit Tracker
- Expense Tracker

**Bien-être**
- Meditation Timer


### Par Apprentissage Technique

**Game Loops et Animation**
- Snake, 2048, Color Match

**Gestion de Données**
- Quiz, Expense Tracker, Habit Tracker

**Timers et Notifications**
- Pomodoro, Meditation Timer

**Algorithmes**
- Word Guess, Rock Paper Scissors (IA)

**Graphiques et Stats**
- Habit Tracker, Expense Tracker, Quiz


---


## Méthodologie de Développement Recommandée

### Approche Agile par Sprints

**Sprint Duration** : 3 semaines

**Sprint Planning**
- Définir les user stories du sprint
- Estimer la complexité
- Répartir les tâches si en équipe

**Daily/Weekly Standup**
- Ce qui a été fait
- Ce qui sera fait
- Obstacles rencontrés

**Sprint Review**
- Démo des fonctionnalités
- Feedback
- Ajustements

**Sprint Retrospective**
- Ce qui a bien fonctionné
- Ce qui peut être amélioré
- Actions pour le prochain sprint


### Gestion de Projet

**Outils Recommandés**
- **Trello** ou **Notion** - Kanban board
- **GitHub Projects** - Intégré avec le code
- **Figma** - Maquettes UI/UX
- **Discord/Slack** - Communication équipe

**Branches Git**
```
main (production)
├── develop (développement)
    ├── feature/authentication
    ├── feature/map-integration
    ├── feature/gamification
    └── bugfix/crash-on-startup
```


## Ressources et APIs Utiles

### APIs Gratuites/Freemium

**Cartographie**
- Google Maps Platform (crédit gratuit mensuel)
- Mapbox (alternative à Google Maps)
- OpenStreetMap (100% gratuit)

**Météo**
- OpenWeather API (1000 calls/jour gratuit)
- WeatherAPI (1M calls/mois gratuit)

**Jours Fériés**
- Calendarific API
- Nager.Date (open source)

**Exécution de Code**
- Judge0 API (pour DevLingo)
- Piston API (gratuit, open source)

**Géolocalisation**
- IP Geolocation API
- Nominatim (OpenStreetMap)


### Documentation Essentielle

- Flutter Official Docs : flutter.dev
- Firebase Docs : firebase.google.com/docs
- Supabase Docs : supabase.com/docs
- Provider Package : pub.dev/packages/provider
- Riverpod : riverpod.dev


## Critères de Réussite Globaux

### Minimum Viable Product (MVP)

Chaque projet doit avoir au minimum :
- Authentification fonctionnelle
- 3-4 écrans principaux
- Fonctionnalités CRUD de base
- Interface utilisable
- Base de données fonctionnelle
- Code versionné sur GitHub
- README documenté

### Projet Complet

Pour obtenir la note maximale :
- Toutes les fonctionnalités listées
- Code propre et organisé
- Gestion d'erreurs robuste
- Tests (unitaires et widgets)
- Performance optimisée
- UI/UX soignée
- Documentation complète
- Démo convaincante


## Conseils de l'Enseignant

### Planification

1. **Ne sous-estimez pas la complexité** - Choisissez des fonctionnalités réalistes
2. **Commencez par le MVP** - Fonctionnalités de base d'abord
3. **Testez tôt et souvent** - Ne laissez pas les bugs s'accumuler
4. **Documentez en parallèle** - Pas à la dernière minute

### Développement

1. **Architecture d'abord** - Structure claire dès le départ
2. **Commits réguliers** - Petit et souvent
3. **Code reviews** si en équipe - Qualité du code
4. **Gestion d'état cohérente** - Provider ou Riverpod, pas un mix

### Présentation

1. **Préparez une démo fluide** - Testez votre chemin de démo
2. **Montrez les défis surmontés** - Problèmes techniques résolus
3. **Soyez honnête sur les limitations** - Ce qui reste à faire
4. **Parlez de ce que vous avez appris** - Compétences acquises


## Support et Ressources

### Où trouver de l'aide

1. **Documentation officielle** - Toujours la première source
2. **Stack Overflow** - Questions spécifiques
3. **Discord Flutter** - Communauté active
4. **GitHub Issues** - Problèmes de packages
5. **Vos enseignants** - Heures de bureau

### Packages Essentiels à Connaître

- `provider` / `riverpod` - Gestion d'état
- `go_router` - Navigation
- `dio` - Requêtes HTTP
- `flutter_riverpod` - State management moderne
- `freezed` - Immutabilité
- `json_serializable` - Parsing JSON
- `cached_network_image` - Images
- `shared_preferences` - Stockage simple


## Conclusion

Ces 5 projets intégrateurs représentent des applications réelles avec une vraie valeur ajoutée. Ils vous permettront de :

- Maîtriser Flutter et Dart
- Comprendre l'architecture d'applications complètes
- Intégrer des services backend (Firebase/Supabase)
- Travailler avec des APIs externes
- Développer des compétences en UX/UI
- Gérer un projet de A à Z
- Construire un portfolio professionnel

**Choisissez le projet qui vous passionne** - La motivation est clé pour mener à bien un projet de cette envergure.

**Bonne chance !**
