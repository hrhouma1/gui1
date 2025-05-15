# SÉANCE 11 – CI/CD, Notifications Push et Soutenance Finale



## PARTIE 1 – CI/CD (Build Web + APK automatiquement à chaque commit)

---

### ÉTAPE 1 – Préparer un dépôt GitHub propre

1. Pousser votre projet vers GitHub :

```bash
git init
git remote add origin https://github.com/votre-nom/projet-flutter.git
git add .
git commit -m "Initial commit"
git push -u origin main
```

2. Créer un fichier `.gitignore` si ce n’est pas encore fait :

```
build/
.dart_tool/
.packages
pubspec.lock
.idea/
android/key.properties
```

---

### ÉTAPE 2 – Intégrer GitHub Actions pour build Web

Créer le fichier `.github/workflows/build_web.yml` :

```yaml
name: Build Flutter Web

on:
  push:
    branches: [main]
  pull_request:

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Install Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.19.0'

      - name: Install dependencies
        run: flutter pub get

      - name: Build Web
        run: flutter build web

      - name: Upload artifact
        uses: actions/upload-artifact@v3
        with:
          name: flutter-web
          path: build/web
```

À chaque commit sur `main`, cela construira votre app Flutter Web et l'enverra dans les **"Artifacts"** GitHub.

---

### ÉTAPE 3 – Build APK automatiquement avec Codemagic (optionnel)

1. Créez un compte sur [https://codemagic.io](https://codemagic.io)
2. Connectez votre compte GitHub
3. Créez un nouveau pipeline → Flutter Android + Web
4. Ajoutez un fichier `codemagic.yaml` à la racine du projet :

```yaml
workflows:
  flutter-app:
    name: Build & Test Flutter App
    environment:
      flutter: stable
      vars:
        STRIPE_PUBLISHABLE_KEY: 'pk_test_...'
    scripts:
      - flutter pub get
      - flutter test
      - flutter build apk --release
      - flutter build web
    artifacts:
      - build/app/outputs/flutter-apk/app-release.apk
      - build/web/**

    publishing:
      email:
        recipients:
          - votre@email.com
```

5. À chaque commit, Codemagic enverra l’APK et le dossier `web/` dans votre email.

---

## PARTIE 2 – Notifications Push via Firebase Cloud Messaging (FCM)

---

### ÉTAPE 1 – Créer le projet Firebase

1. Aller sur [https://console.firebase.google.com](https://console.firebase.google.com)
2. Ajouter un projet “FlutterAppFCM”
3. Activer **Cloud Messaging**
4. Télécharger le fichier `google-services.json` pour Android
5. Le placer dans `android/app/`

---

### ÉTAPE 2 – Installer les dépendances

```bash
flutter pub add firebase_core
flutter pub add firebase_messaging
```

---

### ÉTAPE 3 – Configurer Android pour FCM

Dans `android/build.gradle` :

```groovy
classpath 'com.google.gms:google-services:4.3.15'  // dans dependencies
```

Dans `android/app/build.gradle` :

```groovy
apply plugin: 'com.google.gms.google-services' // à la fin du fichier

dependencies {
    implementation 'com.google.firebase:firebase-messaging:23.1.2'
}
```

---

### ÉTAPE 4 – Initialiser Firebase dans `main.dart`

```dart
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(ProviderScope(child: MyApp()));
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Message en arrière-plan: ${message.messageId}');
}
```

---

### ÉTAPE 5 – Demander la permission et recevoir un message

Dans `HomeScreen` :

```dart
@override
void initState() {
  super.initState();

  FirebaseMessaging.instance.requestPermission();
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Message reçu : ${message.notification?.title}');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message.notification?.body ?? ''),
    ));
  });
}
```

---

### ÉTAPE 6 – Tester l’envoi depuis Firebase Console

1. Aller sur **Firebase > Cloud Messaging**
2. Cliquer sur “Envoyer un message”
3. Saisir un titre + texte
4. Sélectionner la version Android
5. Lancer l’app sur Android → recevoir la notification

---

## PARTIE 3 – Soutenance finale

---

### ÉTAPE 1 – Préparer un plan de présentation

1. **Présentation de l’équipe** (2 min)
2. **Fonctionnalités principales** (démo live) (8 min)
3. **Choix techniques** (architecture, outils) (5 min)
4. **Difficultés rencontrées** (3 min)
5. **Questions / réponses** (5 min)

---

### ÉTAPE 2 – Éléments à rendre

* Lien GitHub du projet
* Lien Vercel / Netlify pour Web
* Fichier APK Android
* Présentation PowerPoint ou Google Slides
* Vidéo de démonstration optionnelle (5-8 min)

---

### ÉTAPE 3 – Évaluation (exemple)

| Critère                            | Note |
| ---------------------------------- | ---- |
| Fonctionnalité (complet, bug-free) | /40  |
| Structure du code (clean archi)    | /20  |
| Interface (responsive, UX)         | /15  |
| CI/CD et Firebase intégrés         | /15  |
| Présentation orale                 | /10  |
| **Total**                          | /100 |

