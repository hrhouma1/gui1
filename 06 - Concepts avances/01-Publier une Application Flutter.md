<h1 id="publier-application-flutter">Publier une Application Flutter</h1>

## Table des matières

1. [Préparation du projet Flutter](#preparation-projet)
2. [Publication sur Google Play Store](#google-play)

   * [Préparer la version Android](#android-preparation)
   * [Créer un compte Google Play Console](#google-play-console)
   * [Téléverser l'application](#televerser-android)
3. [Publication sur Apple App Store](#apple-store)

   * [Préparer la version iOS](#ios-preparation)
   * [Créer un compte développeur Apple](#apple-dev-account)
   * [Téléverser l'application avec Xcode](#televerser-ios)
4. [Bonnes pratiques de publication](#bonnes-pratiques)



<h2 id="preparation-projet">1. Préparation du Projet Flutter</h2>

Avant de publier :

* Assurez-vous que votre application fonctionne parfaitement en mode `release`.
* Vérifiez l’interface utilisateur, les performances et les erreurs.
* Mettez à jour les icônes, splash screen, et permissions.

Commandes clés :

```bash
flutter clean
flutter pub get
flutter build apk --release
flutter build appbundle --release
flutter build ios --release
```



<h2 id="google-play">2. Publication sur Google Play Store</h2>

<h3 id="android-preparation">2.1 Préparer la Version Android</h3>

1. Modifiez le fichier `android/app/build.gradle` :

   ```gradle
   defaultConfig {
       applicationId "com.votrepackage.app"
       minSdkVersion 21
       targetSdkVersion 33
       versionCode 1
       versionName "1.0.0"
   }
   ```

2. Générez une **clé de signature** :

   ```bash
   keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias votre-alias
   ```

3. Ajoutez cette clé dans `android/key.properties` :

   ```properties
   storePassword=******
   keyPassword=******
   keyAlias=votre-alias
   storeFile=../key.jks
   ```

4. Liez-la dans `android/app/build.gradle`.

5. Générez le fichier `.aab` :

   ```bash
   flutter build appbundle --release
   ```



<h3 id="google-play-console">2.2 Créer un Compte Google Play Console</h3>

* Adresse : [https://play.google.com/console/](https://play.google.com/console/)
* Frais uniques : 25 USD
* Remplissez les informations de l’entreprise, développeur, politique de confidentialité, etc.



<h3 id="televerser-android">2.3 Téléverser l'Application</h3>

1. Créez une **nouvelle application** dans le tableau de bord.
2. Fournissez :

   * Nom de l'application
   * Description, icône, captures d'écran
   * Politique de confidentialité (lien)
3. Téléversez le fichier `.aab`.
4. Déclarez les autorisations demandées par l'app.
5. Remplissez les **formulaires de contenu** (confidentialité, public cible, annonces).
6. Lancez la **vérification** et la **publication**.



<h2 id="apple-store">3. Publication sur Apple App Store</h2>

<h3 id="ios-preparation">3.1 Préparer la Version iOS</h3>

1. Installez Xcode sur macOS.

2. Connectez un compte Apple Developer à Xcode.

3. Configurez le fichier `ios/Runner.xcodeproj` :

   * `Bundle Identifier`
   * `Version` et `Build`

4. Activez la signature automatique avec votre certificat Apple.

5. Compilez en mode release :

   ```bash
   flutter build ios --release
   ```


<h3 id="apple-dev-account">3.2 Créer un Compte Développeur Apple</h3>

* Adresse : [https://developer.apple.com/](https://developer.apple.com/)
* Coût annuel : 99 USD
* Remplissez les informations juridiques, fiscales, bancaires.



<h3 id="televerser-ios">3.3 Téléverser l'Application avec Xcode</h3>

1. Ouvrez le projet dans Xcode (`ios/Runner.xcworkspace`).

2. Sélectionnez "Generic iOS Device".

3. Menu `Product` > `Archive`

4. Une fois archivée, cliquez sur **Distribute App**.

5. Téléversez sur **App Store Connect**.

6. Accédez à [https://appstoreconnect.apple.com/](https://appstoreconnect.apple.com/) :

   * Ajoutez description, captures d’écran, notes de version.
   * Remplissez les sections légales et soumettez pour revue.



<h2 id="bonnes-pratiques">4. Bonnes Pratiques de Publication</h2>

* Respectez toutes les règles de contenu (pas de contenu sensible ou trompeur).
* Ajoutez des captures d’écran de haute qualité.
* Fournissez une politique de confidentialité claire.
* Testez sur plusieurs appareils.
* Soyez prêt à répondre aux retours de validation.
