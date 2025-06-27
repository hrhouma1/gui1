# Guide étape par étape : démonstration du **Hot Reload** Flutter

> Objectif : montrer en direct comment Flutter applique les modifications de code **sans redémarrer** ni perdre l’état actuel de l’application.



## 1. Pré-requis matériels et logiciels

| Élément             | Version minimale recommandée                                         |
| ------------------- | -------------------------------------------------------------------- |
| Flutter SDK         | 3.x (stable)                                                         |
| IDE                 | VS Code **ou** Android Studio/IntelliJ                               |
| Extension IDE       | « Flutter » + « Dart »                                               |
| Appareil de test    | Émulateur Android/iOS **ou** appareil physique en mode développeur   |
| Mode de compilation | **Debug** uniquement (le Hot Reload n’est pas disponible en Release) |



## 2. Préparer le projet de démonstration

1. Ouvrir un terminal.
2. Créer un projet exemple

   ```bash
   flutter create demo_hot_reload
   cd demo_hot_reload
   ```
3. Lancer l’IDE et ouvrir ce dossier.



## 3. Démarrer l’application en mode Debug

### a) VS Code

1. Sélectionner l’appareil (barre d’état en bas à droite).
2. Appuyer sur **F5** ou cliquer sur **Run > Start Debugging**.
3. Attendre le message “**Syncing files to device…**” puis “**Application launched**”.

### b) Android Studio / IntelliJ

1. Choisir l’appareil dans la barre d’outils.
2. Cliquer sur l’icône **▶ Debug** (bug vert).
3. Vérifier que la console affiche “**Debug service listening on…**”.



## 4. Première modification de code « Hot »

1. Ouvrir **`lib/main.dart`**.
2. Dans la `Text` du widget par défaut (`MyHomePage`), remplacer

   ```dart
   'You have pushed the button this many times:'
   ```

   par

   ```dart
   'Compteur mis à jour par Hot Reload :'
   ```



## 5. Déclencher le Hot Reload

| Méthode    | VS Code                                             | Android Studio            | CLI                                     |
| ---------- | --------------------------------------------------- | ------------------------- | --------------------------------------- |
| Raccourci  | `Cmd` + `s` (macOS) ou `Ctrl` + `s` (Windows/Linux) | `Ctrl` + `s`              | Dans le terminal d’exécution, taper `r` |
| Bouton IDE | icône d’éclair « Hot Reload »                       | même icône « Hot Reload » | —                                       |

L’IDE affiche “**Syncing… Hot Reload performed in X ms**”.
L’émulateur met à jour **instantanément** le texte sans réinitialiser le compteur.



## 6. Vérifier la préservation de l’état

1. Cliquer plusieurs fois sur le bouton ➕ pour incrémenter le compteur.
2. Modifier à nouveau le texte ou la couleur du `AppBar`.
3. Lancer à nouveau **Hot Reload**.
4. Le **compteur conserve sa valeur**, preuve que l’état du widget est resté en mémoire.



## 7. Différence Hot Reload vs Hot Restart

| Aspect       | Hot Reload                                                 | Hot Restart                                                                  |
| ------------ | ---------------------------------------------------------- | ---------------------------------------------------------------------------- |
| Vitesse      | 1–2 s                                                      | 3–8 s                                                                        |
| Perte d’état | **Non** (tant que la structure des State n’est pas brisée) | **Oui** (l’application redémarre)                                            |
| Contexte     | Changement de UI, styles, logique d’un widget              | Changement de variable globale, ajout de dépendance, initialisation `main()` |

**Astuce** : dans le terminal de debug, `r` = Hot Reload, `R` (majuscule) = Hot Restart.



## 8. Cas où Hot Reload est impossible

1. Ajout d’un plugin natif (modification du dossier `android/` ou `ios/`).
2. Modification du code `main()` ou des objets `const` en haut de l’arbre.
3. Changement de signature d’une méthode utilisée au moment du build (ex. `runApp`).
4. Application exécutée en **mode release**.

Dans ces cas, relancer **Hot Restart** ou `flutter run` complet.


## 9. Bonnes pratiques pendant la démo

* Toujours surveiller la console : les avertissements “⏱  Reloaded … of … libraries” confirment la réussite.
* Éviter `setState` à l’intérieur du `build` (boucle infinie).
* Utiliser des couleurs ou du texte évidents pour prouver la mise à jour en direct.
* En cas d’erreur visuelle, lancer un Hot Restart pour repartir proprement.



## 10. Table récapitulative

| Étape | Action          | Outil                          | Résultat attendu              |
| ----- | --------------- | ------------------------------ | ----------------------------- |
| 1     | Créer le projet | `flutter create`               | Dossier prêt                  |
| 2     | Lancer en debug | IDE ou `flutter run`           | App sur émulateur             |
| 3     | Modifier code   | `main.dart`                    | Changer texte / couleur       |
| 4     | Hot Reload      | `Ctrl/Cmd+s` ou `r`            | UI mise à jour instantanément |
| 5     | Vérifier état   | Cliquer bouton ➕ avant / après | Compteur préservé             |
| 6     | Tester limite   | Changer plugin natif           | Nécessite Hot Restart         |


Avec ce guide, vous disposez d’un scénario pas-à-pas fiable pour démontrer le Hot Reload devant des étudiants ou collègues, tout en expliquant ses avantages, ses limites et les bonnes pratiques professionnelles.
