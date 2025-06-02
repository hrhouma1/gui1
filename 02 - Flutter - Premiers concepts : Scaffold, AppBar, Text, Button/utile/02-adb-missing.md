
# Problèmes courants

### ❌ 1. Visual Studio is missing necessary components

#### Problème :

Flutter ne trouve pas certains composants nécessaires à la compilation d'applications Windows.

#### Solution :

1. Ouvre **Visual Studio Installer** (tu peux le chercher dans le menu Démarrer).
2. Clique sur **Modifier** pour ta version installée de Visual Studio 2022.
3. **Assure-toi que les composants suivants sont cochés** dans l’onglet "Workloads" :

   *  **"Desktop development with C++"**
4. Ensuite, va dans l’onglet **"Individual components"** et coche manuellement :

   * MSVC v142 ou v143 (selon ta version VS)
   * Windows 10 SDK
   * C++ CMake tools for Windows

➡️ Puis clique sur **Modifier / Installer** pour appliquer les changements.

---

### ❌ 2. Erreur avec `adb` (Android Debug Bridge)

#### Problème :

Le démon `adb` ne fonctionne pas correctement. Flutter ne peut pas détecter les appareils connectés.

#### Erreurs spécifiques :

* `daemon not running...`
* `protocol fault (couldn't read status): connection reset`
* `Process exited abnormally with exit code 1`

#### Solution :

1. **Redémarre `adb` manuellement** :

   ```bash
   cd %USERPROFILE%\AppData\Local\Android\sdk\platform-tools
   adb kill-server
   adb start-server
   adb devices
   ```
2. Si cela échoue :

   * **Vérifie que le chemin Android SDK est bien configuré** dans les variables d’environnement :

     * `ANDROID_HOME` → `%USERPROFILE%\AppData\Local\Android\sdk`
     * Ajoute aussi `%ANDROID_HOME%\platform-tools` dans `PATH`
3. Si toujours rien :

   * Supprime et réinstalle **Android SDK Platform Tools** via Android Studio → SDK Manager → onglet "SDK Tools"
   * Redémarre l’ordinateur

---

###  Tout le reste est OK :

* Android Studio ✔️
* IntelliJ ✔️
* VS Code ✔️
* Network ✔️

---

### Vérification finale :

Une fois les étapes ci-dessus faites, relance :

```bash
flutter doctor
```




# Partie 1

Voici un **script `.bat` automatique** qui :

1. Tente de redémarrer `adb`
2. Vérifie si `adb` fonctionne
3. T’affiche un message de succès ou d’erreur

---

### 🔧 Script `restart_adb.bat`

Copie le contenu ci-dessous dans un fichier texte, puis enregistre-le avec l’extension `.bat` (par exemple : `restart_adb.bat`), puis **exécute-le en tant qu’administrateur** :

```bat
@echo off
setlocal

:: Définir le chemin du SDK Android
set "ANDROID_HOME=%USERPROFILE%\AppData\Local\Android\sdk"
set "PATH=%ANDROID_HOME%\platform-tools;%PATH%"

echo.
echo ===========================================
echo Tentative de redémarrage du serveur ADB...
echo ===========================================
echo.

:: Aller dans le dossier des outils platform
cd /d "%ANDROID_HOME%\platform-tools"

:: Tuer et redémarrer adb
adb kill-server
adb start-server

:: Attendre quelques secondes
timeout /t 2 >nul

:: Lister les appareils
echo.
echo ===========================================
echo Vérification des appareils connectés...
echo ===========================================
adb devices

echo.
echo ===========================================
echo Vérification terminée. Si vous voyez une ligne avec "device",
echo cela signifie que tout fonctionne.
echo Si "unauthorized" ou rien n’apparaît, reconnectez votre appareil
echo ou activez le débogage USB.
echo ===========================================
pause
endlocal
```

---

### ✅ Étapes :

1. Ouvre **Bloc-notes**.
2. Colle le code ci-dessus.
3. Enregistre sous le nom `restart_adb.bat` avec **"Tous les fichiers"** comme type.
4. Clique droit → **Exécuter en tant qu’administrateur**.
5. Vérifie s’il affiche ton appareil sous la forme :

```
List of devices attached
XXXXXXXXXX	device
```





















# Partie 2

- version améliorée du script `restart_adb.bat`** qui :

1. Crée ou met à jour la variable d’environnement `ANDROID_HOME` si elle n’existe pas.
2. Ajoute `platform-tools` au `PATH` utilisateur si nécessaire.
3. Redémarre proprement le serveur `adb`.
4. Vérifie les appareils connectés.

---

### ✅ Script complet : `setup_and_restart_adb.bat`

```bat
@echo off
setlocal

:: Définir le chemin attendu du SDK Android
set "ANDROID_SDK_PATH=%USERPROFILE%\AppData\Local\Android\sdk"

echo.
echo ======================================================
echo 1. Vérification et configuration des variables d'environnement
echo ======================================================

:: Vérifie et crée/modifie ANDROID_HOME
for /f "tokens=2* delims= " %%A in ('reg query "HKCU\Environment" /v ANDROID_HOME 2^>nul') do (
    set EXISTING_ANDROID_HOME=%%B
)

if "%EXISTING_ANDROID_HOME%"=="" (
    echo - ANDROID_HOME n'existe pas. Création...
    setx ANDROID_HOME "%ANDROID_SDK_PATH%" >nul
) else (
    echo - ANDROID_HOME déjà défini sur : %EXISTING_ANDROID_HOME%
)

:: Vérifie si %ANDROID_HOME%\platform-tools est dans le PATH utilisateur
set FOUND_IN_PATH=false
for /f "tokens=2* delims= " %%A in ('reg query "HKCU\Environment" /v PATH 2^>nul') do (
    echo %%B | find /i "platform-tools" >nul && set FOUND_IN_PATH=true
)

if "%FOUND_IN_PATH%"=="false" (
    echo - Ajout de platform-tools au PATH utilisateur...
    for /f "tokens=2* delims= " %%A in ('reg query "HKCU\Environment" /v PATH 2^>nul') do (
        set "NEW_PATH=%%B;%ANDROID_SDK_PATH%\platform-tools"
        setx PATH "%NEW_PATH%" >nul
    )
) else (
    echo - platform-tools déjà présent dans PATH.
)

:: Appliquer temporairement dans cette session
set "PATH=%ANDROID_SDK_PATH%\platform-tools;%PATH%"
cd /d "%ANDROID_SDK_PATH%\platform-tools"

echo.
echo ======================================================
echo 2. Redémarrage du serveur ADB
echo ======================================================
adb kill-server
adb start-server

timeout /t 2 >nul

echo.
echo ======================================================
echo 3. Vérification des appareils connectés
echo ======================================================
adb devices

echo.
echo ======================================================
echo Si vous voyez un appareil avec "device", tout fonctionne.
echo Sinon, vérifiez votre câble ou activez le débogage USB.
echo ======================================================

pause
endlocal
```

---

### 📌 Instructions :

1. Ouvre **Bloc-notes**.
2. Colle le code ci-dessus.
3. Enregistre le fichier comme : `setup_and_restart_adb.bat`

   * Type : **Tous les fichiers**
   * Encodage : UTF-8 si proposé
4. Clique droit sur le fichier → **Exécuter en tant qu’administrateur**

