# EXAMEN – DÉVELOPPEMENT D’UNE APPLICATION FLUTTER

## Sujet : Persistance des préférences utilisateur et gestion dynamique du thème

### 1. CONTEXTE GÉNÉRAL

Vous êtes mandaté pour démontrer vos compétences en Flutter dans un cadre professionnel strict. L’application à réaliser doit :

1. Authentifier l’utilisateur à l’aide d’un écran de connexion.
2. Mémoriser, sur demande, les identifiants dans la mémoire locale avec **SharedPreferences**.
3. Fournir un écran « Paramètres » permettant à l’utilisateur de choisir entre un thème clair et un thème sombre.
4. Conserver le thème sélectionné pour les sessions futures.

Le non-respect d’une instruction entraînera l’invalidation de l’épreuve.

---

### 2. EXIGENCES TECHNIQUES OBLIGATOIRES

| Référence | Exigence                                                                   |
| --------- | -------------------------------------------------------------------------- |
| E-01      | Projet Flutter créé avec `flutter create login_prefs_theme`.               |
| E-02      | Organisation en trois répertoires : `screens/`, `providers/`, `services/`. |
| E-03      | Utilisation exclusive du package `shared_preferences` pour la persistance. |
| E-04      | Implémentation d’un `ThemeProvider` basé sur `ChangeNotifier`.             |
| E-05      | Navigation gérée via `Navigator` ou `MaterialApp` avec `routes`.           |
| E-06      | Respect strict des étapes détaillées au § 4.                               |

---

### 3. MATÉRIELS AUTORISÉS

* Documentation officielle Flutter et Dart.
* IDE au choix (Android Studio, VS Code, IntelliJ).
* Aucun dépôt de code externe ne peut être importé tel quel. Toute portion copiée doit être citée et justifiée.

---

### 4. GUIDE DE RÉALISATION PAS À PAS

#### 4.1 PRÉPARATION DU PROJET

1. Créez le projet `login_prefs_theme`.
2. Ajoutez `shared_preferences` à `pubspec.yaml`.
3. Vérifiez que l’application se lance sans erreur sur un simulateur ou un appareil physique.

#### 4.2 ÉCRAN DE CONNEXION (`LoginScreen`)

1. Placez le fichier dans `screens/login_screen.dart`.
2. Structure imposée :

   * `TextFormField` pour **username** (clavier texte).
   * `TextFormField` pour **password** (mode `obscureText`).
   * `CheckboxListTile` libellé « Se souvenir de moi ».
   * `ElevatedButton` libellé « Connexion ».
3. Au clic sur « Connexion » :

   * Si la case est cochée, enregistrez `username` et `password` avec `SharedPreferences`.
   * Si la case n’est pas cochée, assurez-vous qu’aucune donnée précédente n’est conservée.
4. Validation de formulaire : champs non vides obligatoires.

#### 4.3 CHARGEMENT INITIALE DES DONNÉES

1. Au démarrage, l’application doit vérifier la présence d’identifiants enregistrés.
2. S’ils existent :

   * Pré-remplir les champs du formulaire.
   * Cocher automatiquement la case « Se souvenir de moi ».
3. Sinon : afficher les champs vides et la case décochée.

#### 4.4 NAVIGATION VERS L’ÉCRAN PRINCIPAL (`HomeScreen`)

1. Créez `screens/home_screen.dart`.
2. Affichez « Bienvenue, <username> ».
3. Ajoutez un `Drawer` ou un `BottomNavigationBar` comportant une entrée **Settings**.

#### 4.5 ÉCRAN PARAMÈTRES (`SettingsScreen`)

1. Créez `screens/settings_screen.dart`.
2. Incluez un `SwitchListTile` intitulé « Mode sombre ».
3. Lorsqu’il est activé :

   * Appliquez immédiatement le thème sombre via `ThemeProvider`.
   * Enregistrez la préférence dans `SharedPreferences`.
4. Lorsqu’il est désactivé :

   * Appliquez le thème clair.
   * Mémorisez le choix clair.

#### 4.6 GESTION DU THÈME

1. Implémentez `providers/theme_provider.dart` :

   * Champ booléen `_isDark`.
   * Méthode `toggleTheme()` inversant `_isDark` puis `notifyListeners()`.
   * Méthode statique `loadFromPrefs()` récupérant la valeur initiale.
2. Dans `main.dart` :

   * Chargez le thème depuis `SharedPreferences` avant d’exécuter `runApp`.
   * Fournissez `ThemeProvider` via `ChangeNotifierProvider`.
   * Liez `theme` et `darkTheme` de `MaterialApp` aux valeurs du provider.

---

### 5. CRITÈRES D’ÉVALUATION

| Critère                                                                  | Points |
| ------------------------------------------------------------------------ | ------ |
| Fonctionnalité « Se souvenir de moi » opérationnelle et persistante      | 30     |
| Sécurité et validation des champs de connexion                           | 10     |
| Changement de thème immédiat et persistant                               | 25     |
| Architecture du code (dossiers requis, provider correctement implémenté) | 15     |
| Clarté, commentaires, lisibilité du code                                 | 10     |
| Respect du guide (exigences E-01 à E-06)                                 | 10     |

Total : **100 points**

---

### 6. LIVRABLES À SOUMETTRE

1. Archive `.zip` ou lien Git incluant tout le projet.
2. `README.md` contenant :

   * Instructions de compilation (`flutter pub get`, `flutter run`).
   * Versions de Flutter, Dart et dépendances utilisées.
3. Quatre captures d’écran :

   * Écran de connexion sans données.
   * Écran de connexion pré-rempli après redémarrage (case cochée).
   * Écran principal en thème clair.
   * Écran principal en thème sombre.



### 7. DISPOSITIONS FINALES

* Toute fonctionnalité manquante, incorrecte ou non persistante entraîne la perte des points correspondants.
* Aucun ajout fonctionnel non demandé ne sera évalué.
* Tout manquement aux répertoires imposés ou à la structure provoque une pénalité de 5 points par écart.


<br/>
<br/>

# Indications et instructions importantes :




L’étudiant doit impérativement utiliser à la fois :

* `SharedPreferences` (persistance locale **asynchrone**, simple clé-valeur)
* `Provider` (gestion **réactive** et **centralisée** de l’état en mémoire)

Ces deux concepts sont **complémentaires** mais ont des **usages très distincts**. Voici une explication claire, structurée, et adaptée à ton cadre pédagogique strict :



## <h1 id="distinction-shared-provider">DIFFÉRENCE ENTRE `SharedPreferences` ET `Provider`</h1>

| Objectif                                                                                   | Utiliser `SharedPreferences` | Utiliser `Provider` |
| ------------------------------------------------------------------------------------------ | ---------------------------- | ------------------- |
| Sauvegarder une valeur **dans la mémoire locale** du téléphone (même après fermeture)      | ✅ Oui                        | ❌ Non               |
| Gérer un état **en mémoire, réactif** et notifier l’interface graphique quand il change    | ❌ Non                        | ✅ Oui               |
| Lire ou écrire une préférence utilisateur (thème, identifiants, booléens)                  | ✅ Oui                        | ❌ Non               |
| Modifier dynamiquement l’UI quand l’utilisateur active un switch, un toggle ou se connecte | ❌ Non                        | ✅ Oui               |
| Notifier plusieurs widgets automatiquement en cas de changement                            | ❌ Non                        | ✅ Oui               |



## <h2 id="quand-quel-usage">QUAND UTILISER QUOI DANS CET EXAMEN ?</h2>

| Fonctionnalité requise par le sujet                                        | Technologie obligatoire       | Justification                                        |
| -------------------------------------------------------------------------- | ----------------------------- | ---------------------------------------------------- |
| Sauvegarder `username` et `password` si « Se souvenir de moi » est coché   | `SharedPreferences`           | Persister les données même après redémarrage         |
| Préremplir le formulaire de connexion si les identifiants sont enregistrés | `SharedPreferences`           | Lecture directe des valeurs au lancement             |
| Appliquer un thème clair ou sombre de façon réactive                       | `Provider` (`ChangeNotifier`) | Permet de reconstruire l’interface dynamique         |
| Enregistrer la préférence de thème pour qu’elle persiste au redémarrage    | `SharedPreferences`           | Le thème doit être restauré après fermeture de l’app |
| Réagir au `Switch` du thème dans `SettingsScreen`                          | `Provider`                    | Le `Switch` doit déclencher un `notifyListeners()`   |



## <h2 id="structure-recommandee">STRUCTURE TECHNIQUE RECOMMANDÉE</h2>

* `ThemeProvider` (classe `ChangeNotifier`)

  * Contient un booléen `isDarkMode`
  * Contient une méthode `toggleTheme()`
  * Appelle `notifyListeners()` à chaque changement
  * Utilise `SharedPreferences` **à l’intérieur** du provider pour :

    * Sauvegarder la préférence dans `setBool`
    * Charger la valeur au démarrage avec `getBool`



## <h2 id="schema">SCHÉMA DE FLUX PÉDAGOGIQUE</h2>

```
[Démarrage de l'app]
        |
        V
Chargement des préférences → SharedPreferences
        |
        V
Initialisation du Provider → ThemeProvider
        |
        V
Provider notifie les widgets via notifyListeners()
        |
        V
L’UI se met à jour automatiquement avec le bon thème
```


## <h2 id="règles-pédagogiques-imposées">RÈGLES PÉDAGOGIQUES IMPOSÉES POUR L'ÉTUDIANT</h2>

1. **Toute donnée persistée (ex: thème, identifiants)** doit obligatoirement passer par `SharedPreferences`.
2. **Toute donnée affichée ou mise à jour dynamiquement** dans l’interface doit obligatoirement passer par un `Provider`.
3. **Le thème ne peut pas être appliqué uniquement avec `SharedPreferences` sans Provider**, car aucun rebuild automatique ne serait déclenché.
4. **Le thème ne peut pas être uniquement stocké dans le `Provider` sans `SharedPreferences`**, sinon la valeur sera perdue au redémarrage.

## <h2 id="erreurs-a-eviter">ERREURS MAJEURES À ÉVITER</h2>

| Erreur                                                                        | Conséquence                                               |
| ----------------------------------------------------------------------------- | --------------------------------------------------------- |
| Utiliser uniquement `setState()` au lieu de `Provider` pour le thème          | L’UI ne sera pas réactive et non persistante              |
| Stocker le thème uniquement dans `SharedPreferences` sans Provider            | Impossible d’avoir une UI réactive et synchronisée        |
| Oublier de sauvegarder dans `SharedPreferences` après le `toggleTheme()`      | La préférence ne sera pas persistée au prochain lancement |
| Lire `SharedPreferences` dans un `build()` sans `FutureBuilder` ou async init | Erreur d’exécution ou mauvaise UX                         |



*Il faut eécrire un **modèle complet de `ThemeProvider`** intégrant les deux technologies (`Provider` + `SharedPreferences`)*

