
## 0. Préparer l’environnement VS Code

1. **Installer Flutter ≥ 3.22** (inclut JDK 17).

   ```bash
   flutter doctor --android-licenses
   flutter doctor -v
   ```
2. **VS Code » Extensions** : installe **Flutter** et **Dart**.
3. **Android** : Android Studio (ou cmdline-tools) + un **émulateur API 34**.
4. **Node 18+** puis :

   ```bash
   npm i -g firebase-tools
   dart pub global activate flutterfire_cli   # plus pratique que le manuel
   ```

---

## 1. Créer le projet Flutter

```bash
flutter create mon_projet_firebase
code mon_projet_firebase          # ouvre VS Code
```

Dans l’arborescence VS Code :

```
android/
└─ build.gradle        ← niveau-projet
  app/
  └─ build.gradle       ← niveau-module
```

---

## 2. Déclarer l’app dans Firebase

1. Console Firebase → *Ajouter un projet* → **mon\_projet\_firebase**.
2. *Ajouter une appli Android*

   * **Package** : `com.example.mon_projet_firebase` (doit matcher `AndroidManifest.xml`).
   * **SHA-1** : laisse vide pour l’instant.
3. Télécharge **google-services.json** et glisse-le dans `android/app/`.

---

## 3. Configurer le build Android

### 3 a. `android/build.gradle`  (niveau projet)

```gradle
buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:8.3.0'
        classpath 'com.google.gms:google-services:4.4.2'   // plugin Google Services :contentReference[oaicite:0]{index=0}
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}
```

### 3 b. `android/app/build.gradle`  (niveau module)

1. En haut, vérifie :

   ```gradle
   android {
       namespace "com.example.mon_projet_firebase"
       compileSdk 34
       defaultConfig {
           minSdk 21
           targetSdk 34
       }
   }
   ```
2. Dans `dependencies { … }` :

   ```gradle
   implementation platform('com.google.firebase:firebase-bom:3.12.0') // BoM juin 2025 :contentReference[oaicite:1]{index=1}
   implementation 'com.google.firebase:firebase-analytics'
   ```
3. Tout en bas du fichier :

   ```gradle
   apply plugin: 'com.google.gms.google-services'
   ```

---

## 4. Ajouter les packages Dart

`pubspec.yaml` :

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^3.13.0      # dernière version mars 2025 :contentReference[oaicite:2]{index=2}
  firebase_analytics: ^11.0.0
```

Terminal VS Code :

```bash
flutter pub get
```

---

## 5. Initialiser Firebase dans Dart

`lib/main.dart` :

```dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';           // généré par flutterfire configure

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Firebase OK')),
        body: const Center(child: Text('Connexion réussie')),
      ),
    );
  }
}
```

> **Astuce** : si tu as installé **flutterfire \_cli**, exécute :
>
> ```bash
> flutterfire configure
> ```
>
> Il crée automatiquement `firebase_options.dart` et ajuste les Gradle. Plus simple pour les débutants.

---

## 6. Lancer depuis VS Code

1. **Sélectionne** ton émulateur (barre d’état VS Code).
2. Terminal intégré :

   ```bash
   flutter clean   # si besoin
   flutter run
   ```
3. Dans le Debug Console tu dois lire **“All Firebase APIs loaded successfully”**.

---

## 7. Erreurs fréquentes & correctifs

| Message                                               | Cause                               | Correctif                                                                    |
| ----------------------------------------------------- | ----------------------------------- | ---------------------------------------------------------------------------- |
| `Plugin com.google.gms.google-services was not found` | mauvais fichier ou mauvaise version | Vérifie que le `classpath` est dans **android/build.gradle** + version 4.4.2 |
| `AAPT: error: resource android:attr/... not found`    | compileSdk trop bas                 | Mets `compileSdk 34`                                                         |
| `Duplicate class com.google...`                       | dépendances Firebase doublées       | Utilise la **BoM** (platform()) et supprime les versions explicites          |

---

## 8. Étapes suivantes

* **Firestore** : ajoute `cloud_firestore` et la BoM suffit.
* **Auth** : package `firebase_auth`.
* **Crashlytics** : ajoute `firebase_crashlytics` + plugin Gradle `com.google.firebase.crashlytics`.

Chaque lib Firebase se déclare **côté Dart** seulement ; aucune ligne Gradle supplémentaire tant que tu restes dans la BoM.

---

### Récapitulatif clé

1. `google-services.json` → `android/app/`
2. `classpath 'com.google.gms:google-services:4.4.2'` → **build.gradle projet**
3. `apply plugin: 'com.google.gms.google-services'` → **build.gradle module**
4. Dépendances Dart + BoM

