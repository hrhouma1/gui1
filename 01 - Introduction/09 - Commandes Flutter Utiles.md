# **Commandes Flutter Utiles (avec et sans options)**



## <h1 id="1">1. Vérification de l’environnement</h1>

### Vérifie que Flutter est bien installé et configuré

```bash
flutter doctor
```

**Options :**

```bash
flutter doctor -v     # Mode verbeux
flutter doctor --android-licenses    # Accepter les licences Android SDK
```



## <h1 id="2">2. Création et gestion de projet</h1>

### Créer un nouveau projet Flutter

```bash
flutter create nom_du_projet
```

**Options utiles :**

```bash
flutter create --org com.nom     # Nom du package (reverse DNS)
flutter create --platforms=android,ios,web,windows     # Choisir les plateformes
```



## <h1 id="3">3. Exécution et débogage</h1>

### Exécuter l'application (mode debug par défaut)

```bash
flutter run
```

**Options utiles :**

```bash
flutter run -d chrome          # Exécuter sur le navigateur Chrome
flutter run -d windows         # Exécuter sur Windows
flutter run --release          # Mode release
flutter run --profile          # Mode profil
flutter run --debug            # Mode debug explicite
flutter run --flavor prod      # Avec un flavor défini
```



## <h1 id="4">4. Gestion des dépendances</h1>

### Récupérer les packages déclarés dans `pubspec.yaml`

```bash
flutter pub get
```

### Mettre à jour les dépendances

```bash
flutter pub upgrade
```

### Ajouter une dépendance

```bash
flutter pub add nom_du_package
```

### Supprimer une dépendance

```bash
flutter pub remove nom_du_package
```

### Exécuter une commande Dart via pub

```bash
flutter pub run nom_du_package:commande
```



## <h1 id="5">5. Compilation (build)</h1>

### Générer une application pour Android

```bash
flutter build apk
```

**Options :**

```bash
flutter build apk --release
flutter build apk --debug
flutter build apk --profile
flutter build apk --split-per-abi
```

### Générer une application Android App Bundle (AAB)

```bash
flutter build appbundle
```

### Générer une application iOS (nécessite macOS)

```bash
flutter build ios
```

### Générer une application web

```bash
flutter build web
```

### Générer une application pour Windows

```bash
flutter build windows
```


## <h1 id="6">6. Tests</h1>

### Lancer tous les tests unitaires

```bash
flutter test
```

**Options :**

```bash
flutter test --coverage        # Avec rapport de couverture
```



## <h1 id="7">7. Analyse et formatage</h1>

### Analyser le code source pour détecter les erreurs/dépréciations

```bash
flutter analyze
```

### Formater le code automatiquement

```bash
flutter format .
```



## <h1 id="8">8. Informations sur les appareils</h1>

### Liste les périphériques disponibles

```bash
flutter devices
```

### Spécifier un périphérique

```bash
flutter run -d nom_du_device
```


## <h1 id="9">9. Configuration avancée</h1>

### Nettoyer les fichiers de build

```bash
flutter clean
```

### Met à jour le SDK Flutter

```bash
flutter upgrade
```

### Revenir à une version stable

```bash
flutter downgrade
```



## <h1 id="10">10. Informations sur Flutter</h1>

### Affiche la version actuelle

```bash
flutter --version
```

### Informations détaillées sur l’environnement

```bash
flutter --verbose
```


# Résumé de toutes les commandes Flutter utiles


```bash
# Vérification de l’installation
flutter doctor
flutter doctor -v
flutter doctor --android-licenses

# Création de projet
flutter create nom_du_projet
flutter create --org com.nom
flutter create --platforms=android,ios,web,windows

# Exécution / Débogage
flutter run
flutter run -d chrome
flutter run -d windows
flutter run --release
flutter run --profile
flutter run --debug
flutter run --flavor prod

# Gestion des dépendances
flutter pub get
flutter pub upgrade
flutter pub add nom_du_package
flutter pub remove nom_du_package
flutter pub run nom_du_package:commande

# Compilation (build)
flutter build apk
flutter build apk --release
flutter build apk --debug
flutter build apk --profile
flutter build apk --split-per-abi

flutter build appbundle

flutter build ios

flutter build web

flutter build windows

# Tests
flutter test
flutter test --coverage

# Analyse et formatage
flutter analyze
flutter format .

# Gestion des périphériques
flutter devices
flutter run -d nom_du_device

# Configuration avancée
flutter clean
flutter upgrade
flutter downgrade

# Informations sur Flutter
flutter --version
flutter --verbose
```

