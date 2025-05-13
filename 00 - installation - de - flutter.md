
-----------------
# 1. Installer les prérequis
-----------------

### 1.1 Git

Flutter nécessite Git pour cloner et gérer ses dépendances.

* Télécharger Git depuis : [https://git-scm.com/downloads](https://git-scm.com/downloads)
* Lancer l’installation avec les options par défaut.
* Redémarrer le terminal ou PowerShell après installation.

### 1.2 Flutter SDK

* Aller sur : [https://docs.flutter.dev/get-started/install/windows](https://docs.flutter.dev/get-started/install/windows)
* Télécharger le fichier ZIP du SDK Flutter.
* Extraire le dossier (par exemple dans `C:\flutter`).
* Ne pas placer Flutter dans `C:\Program Files`.

### 1.3 Ajouter Flutter au PATH

* Ouvrir "Variables d’environnement" via Panneau de configuration > Système > Paramètres système avancés.
* Dans la section "Path", ajouter une nouvelle entrée :
  `C:\flutter\bin`


<br/>
<br/>


-----------------
# 2. Installer un éditeur de code
-----------------


### Option 1 : Visual Studio Code

* Télécharger depuis : [https://code.visualstudio.com](https://code.visualstudio.com)
* Installer les extensions suivantes via le menu Extensions :

  * Flutter
  * Dart

### Option 2 : Android Studio

* Télécharger depuis : [https://developer.android.com/studio](https://developer.android.com/studio)
* Pendant ou après l’installation, ajouter les plugins :

  * Flutter
  * Dart


<br/>
<br/>

-----------------
# 3. Vérifier l’installation
-----------------

Ouvrir un terminal ou PowerShell, puis taper :

```bash
flutter doctor
```

Cette commande vérifie la présence du SDK Flutter, Dart, Android SDK, les émulateurs, les éditeurs, etc.

Corriger chaque point manquant selon les instructions affichées.

<br/>
<br/>

-----------------
# 4. Installer Android SDK
-----------------

Si ce n’est pas déjà fait, installer Android Studio (voir étape 2).

* Ouvrir Android Studio
* Aller dans Tools > SDK Manager
* Vérifier que le "Android SDK" est bien installé
* Installer un appareil virtuel via Tools > Device Manager > Create Device


<br/>
<br/>

-----------------
# 5. Créer un projet Flutter
-----------------

Dans un terminal ou PowerShell :

```bash
flutter create mon_projet_flutter
cd mon_projet_flutter
flutter run
```

Cela va :

* Créer un projet dans un nouveau dossier
* Compiler l'application
* Lancer l'application dans un simulateur ou sur un téléphone branché (avec le débogage USB activé)


<br/>
<br/>

-----------------
# 6. Lancer un émulateur Android (optionnel mais recommandé)
-----------------

* Ouvrir Android Studio
* Aller dans Device Manager
* Créer un nouvel appareil virtuel (ex. Pixel 4)
* Lancer l’émulateur

Puis, dans le terminal :

```bash
flutter run
```

<br/>
<br/>

-----------------
# 7. Résumé
-----------------

| Composant          | Rôle                                           |
| ------------------ | ---------------------------------------------- |
| Git                | Gestion des sources (obligatoire pour Flutter) |
| Flutter SDK        | Outils et bibliothèques Flutter                |
| Android Studio     | SDK Android, gestionnaire d'émulateur          |
| Visual Studio Code | Éditeur léger avec extensions Flutter/Dart     |


<br/>
<br/>




-----------------
# 8. Résolution de Problèmes 
-----------------

### 8.1. **cmdline-tools manquant dans l’Android SDK**

#### Explication :

Flutter a besoin des **command line tools** du SDK Android (comme `sdkmanager`) pour fonctionner correctement. Ce composant n’est pas installé dans ton Android SDK actuel.

#### Solution :

1. **Ouvre Android Studio**
2. Va dans :

   * `File > Settings > Appearance & Behavior > System Settings > Android SDK`
   * Onglet **SDK Tools**
3. Coche l'option **Android SDK Command-line Tools (latest)**
4. Clique sur **Apply** pour l’installer



### 8.2. **Licences Android non acceptées**

#### Solution :

Dans ton terminal PowerShell ou CMD (avec Flutter bien dans le PATH) :

```bash
flutter doctor --android-licenses
```

Accepte toutes les licences (tape `y` à chaque question).



## Vérification finale

Une fois ces deux étapes terminées, relance :

```bash
flutter doctor
```

Tu devrais obtenir un rapport 100 %  (aucun "!" ni "X").

