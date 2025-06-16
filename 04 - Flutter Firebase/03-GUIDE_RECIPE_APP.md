# 🍴 Flutter Complete App - Application de Recettes

Une application Flutter complète pour parcourir et gérer des recettes de cuisine, intégrée avec Firebase pour la gestion des données en temps réel.

## 📱 Fonctionnalités

- **Navigation par catégories** : Parcourir les recettes par catégories
- **Affichage des recettes** : Vue détaillée avec images, temps de préparation, calories
- **Système de favoris** : Ajouter/supprimer des recettes favorites
- **Recherche** : Barre de recherche pour trouver des recettes
- **Gestion des quantités** : Système d'incrémentation/décrémentation
- **Interface moderne** : Design responsive avec Material Design

## 🏗️ Architecture du Projet

```
lib/
├── Views/                          # Écrans de l'application
│   ├── my_app_home_screen.dart    # Écran d'accueil principal
│   ├── app_main_screen.dart       # Écran principal avec navigation
│   ├── recipe_detail_screen.dart  # Détails d'une recette
│   ├── view_all_items.dart        # Vue de toutes les recettes
│   └── favorite_screen.dart       # Écran des favoris
├── Provider/                       # Gestion d'état avec Provider
│   ├── favorite_provider.dart     # Gestion des favoris
│   └── quantity.dart              # Gestion des quantités
├── Widget/                         # Composants réutilisables
│   ├── food_items_display.dart    # Affichage des items de nourriture
│   ├── banner.dart                # Bannière d'exploration
│   ├── my_icon_button.dart        # Bouton d'icône personnalisé
│   └── quantity_increment_decrement.dart
├── Utils/                          # Utilitaires et constantes
│   └── constants.dart             # Constantes de l'app
└── main.dart                       # Point d'entrée de l'application
```

## 🔥 Intégration Firebase

### Collections Firestore Utilisées

1. **`Complete-Flutter-App`** - Collection principale des recettes
   ```json
   {
     "name": "Nom de la recette",
     "image": "URL_de_l_image",
     "cal": "calories",
     "time": "temps_en_minutes",
     "rate": "note_sur_5",
     "reviews": "nombre_d_avis",
     "category": "catégorie"
   }
   ```

2. **`App-Category`** - Collection des catégories
   ```json
   {
     "name": "Nom de la catégorie"
   }
   ```

3. **`userFavorite`** - Collection des favoris utilisateur
   ```json
   {
     "isFavorite": true
   }
   ```

### Récupération des Données

#### Dans `my_app_home_screen.dart`
```dart
// Collection des catégories
final CollectionReference categoriesItems =
    FirebaseFirestore.instance.collection("App-Category");

// Requêtes pour les recettes
Query get fileteredRecipes =>
    FirebaseFirestore.instance.collection("Complete-Flutter-App")
        .where('category', isEqualTo: category);

Query get allRecipes =>
    FirebaseFirestore.instance.collection("Complete-Flutter-App");
```

#### Utilisation avec StreamBuilder
```dart
StreamBuilder(
  stream: selectedRecipes.snapshots(),
  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasData) {
      final List<DocumentSnapshot> recipes = snapshot.data?.docs ?? [];
      // Affichage des données
    }
    return const Center(child: CircularProgressIndicator());
  },
)
```

## 🖼️ Gestion des Assets

### ⚠️ Important : Tous les assets sont dans Firebase !

- **Aucun asset local** : Pas de dossier `assets/` dans le projet
- **Images depuis Firebase** : Toutes les images sont stockées comme URLs dans Firestore
- **Chargement réseau** : Utilisation de `NetworkImage` pour afficher les images

```dart
// Dans food_items_display.dart
image: NetworkImage(
  documentSnapshot['image'], // URL depuis Firestore
),
```

## 📦 Dépendances

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.6
  firebase_core: ^3.4.1        # Firebase Core
  provider: ^6.1.2            # Gestion d'état
  iconsax: ^0.0.8             # Icônes
  cloud_firestore: ^5.4.1     # Base de données Firestore
```

## 🚀 Installation et Configuration

### 1. Cloner le Projet
```bash
git clone <url-du-repo>
cd flutter_complete_app
```

### 2. Installer les Dépendances
```bash
flutter pub get
```

### 3. Configuration Firebase

1. **Créer un projet Firebase** sur [Firebase Console](https://console.firebase.google.com/)

2. **Ajouter une application Android/iOS** à votre projet Firebase

3. **Télécharger les fichiers de configuration** :
   - `google-services.json` pour Android → `android/app/`
   - `GoogleService-Info.plist` pour iOS → `ios/Runner/`

4. **⭐ IMPORTANT : Suivez le guide détaillé** :
   - 📖 **[Guide complet Firebase](FIREBASE_SETUP_GUIDE.md)** - Instructions étape par étape
   - Ce guide vous montre comment créer les collections, ajouter les images et peupler la base de données

### 4. Structure des Données Firebase

#### Collection `Complete-Flutter-App`
```json
{
  "name": "Salade César",
  "image": "https://example.com/image.jpg",
  "cal": "250",
  "time": "15",
  "rate": "4.5",
  "reviews": "120",
  "category": "Salades"
}
```

#### Collection `App-Category`
```json
{
  "name": "Salades"
}
```

### 5. Lancer l'Application
```bash
flutter run
```

## 🎯 Gestion d'État

### Provider Pattern
L'application utilise le pattern Provider pour :

- **FavoriteProvider** : Gestion des recettes favorites
  - `toggleFavorite()` : Ajouter/supprimer des favoris
  - `isExist()` : Vérifier si une recette est favorite
  - Synchronisation avec Firebase

- **QuantityProvider** : Gestion des quantités d'ingrédients

### Exemple d'utilisation
```dart
// Accéder au provider
final provider = FavoriteProvider.of(context);

// Basculer favori
provider.toggleFavorite(documentSnapshot);

// Vérifier si favori
bool isFavorite = provider.isExist(documentSnapshot);
```

## 🔧 Fonctionnalités Clés

### Navigation par Catégories
- Filtrage dynamique des recettes par catégorie
- Interface horizontale scrollable
- Mise à jour en temps réel

### Système de Favoris
- Ajout/suppression des favoris
- Persistance dans Firebase
- Synchronisation multi-appareil

### Recherche
- Barre de recherche intégrée
- Interface utilisateur intuitive

### Détails des Recettes
- Affichage complet des informations
- Images haute résolution depuis Firebase
- Informations nutritionnelles

## 🎨 Design et UI

- **Material Design** : Interface conforme aux standards Google
- **Responsive** : Adaptation aux différentes tailles d'écran
- **Couleurs personnalisées** : Palette de couleurs définie dans `constants.dart`
- **Icônes Iconsax** : Icônes modernes et cohérentes

## 📋 Prérequis

- Flutter SDK (>=3.4.4 <4.0.0)
- Dart SDK
- Compte Firebase
- Android Studio / VS Code
- Émulateur Android/iOS ou appareil physique

## 🔄 Mises à Jour Temps Réel

L'application utilise les **StreamBuilder** de Flutter avec Firestore pour :
- Mise à jour automatique des données
- Synchronisation en temps réel
- Gestion des états de chargement

## 🛠️ Développement

### Ajouter une Nouvelle Recette
1. Ajouter un document dans la collection `Complete-Flutter-App`
2. Inclure tous les champs requis
3. L'application se mettra à jour automatiquement

### Ajouter une Nouvelle Catégorie
1. Ajouter un document dans la collection `App-Category`
2. Spécifier le nom de la catégorie
3. La catégorie apparaîtra automatiquement dans l'interface

## 📱 Plateformes Supportées

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ Linux
- ✅ macOS

## 📄 Licence

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.

## 👥 Contribution

Les contributions sont les bienvenues ! N'hésitez pas à :
1. Fork le projet
2. Créer une branche pour votre fonctionnalité
3. Commit vos changements
4. Push vers la branche
5. Ouvrir une Pull Request

## 📞 Support

Pour toute question ou problème, n'hésitez pas à ouvrir une issue sur GitHub.

---

**Développé avec ❤️ en Flutter et Firebase**
