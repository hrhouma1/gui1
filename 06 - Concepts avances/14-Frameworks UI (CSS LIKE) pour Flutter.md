## <h1 id="flutter-ui-frameworks">Frameworks UI pour Flutter (équivalents aux frameworks CSS)</h1>

---

### 1. **Flutter Material (intégré par défaut)**

* **Objectif** : Fournir des composants respectant les lignes directrices de Material Design (Google).
* **Avantages** :

  * Inclus dans Flutter par défaut.
  * Large éventail de widgets : boutons, AppBar, Scaffold, Drawer, etc.
  * Compatible Android/iOS/web.
* **Inconvénients** :

  * Design parfois rigide ou trop standardisé.
  * Moins personnalisable sans effort supplémentaire.

---

### 2. **Flutter Cupertino**

* **Objectif** : Offrir des interfaces fidèles au style iOS natif.
* **Avantages** :

  * Expérience utilisateur iOS naturelle.
  * Composants cohérents avec les attentes des utilisateurs Apple.
* **Inconvénients** :

  * Moins riche que Material.
  * Peu de compatibilité avec Android.

---

### 3. **GetWidget**

* **Site** : [https://getwidget.dev/](https://getwidget.dev/)
* **Objectif** : Fournir une bibliothèque complète de composants personnalisables (plus de 100).
* **Avantages** :

  * Très riche en widgets UI prêts à l’emploi.
  * Belle documentation.
  * Gain de temps sur le prototypage.
* **Inconvénients** :

  * Peut alourdir la taille de l’application.
  * Certaines personnalisations avancées nécessitent du code manuel.
* **Installation** :

  ```yaml
  dependencies:
    getwidget: ^2.0.4
  ```

---

### 4. **VelocityX**

* **Site** : [https://velocityx.dev/](https://velocityx.dev/)
* **Objectif** : Inspiré de Tailwind CSS, propose une approche fluide et déclarative.
* **Avantages** :

  * Syntaxe rapide et enchaînable.
  * Bon pour des interfaces simples et dynamiques.
* **Exemple** :

  ```dart
  "Bonjour".text.white.bold.make().p16().box.red500.rounded.make();
  ```
* **Inconvénients** :

  * Peu standard.
  * Syntaxe peu intuitive pour les débutants.
* **Installation** :

  ```yaml
  dependencies:
    velocity_x: ^4.1.1
  ```

---

### 5. **Flutter Neumorphic**

* **Objectif** : Créer des interfaces basées sur le design *neumorphism* (effets doux, ombres).
* **Avantages** :

  * Visuellement moderne et attractif.
  * Bons effets de profondeur et de lumière.
* **Inconvénients** :

  * Peu adapté à tous les types d’applications.
  * Peut poser des problèmes d’accessibilité.
* **Installation** :

  ```yaml
  dependencies:
    flutter_neumorphic: ^3.2.0
  ```

---

### 6. **Fluent UI (Microsoft)**

* **Objectif** : Apporter le design Fluent de Microsoft à Flutter.
* **Avantages** :

  * Recommandé pour les applications desktop sur Windows.
  * Interface cohérente avec les produits Microsoft.
* **Inconvénients** :

  * Moins utile pour les apps mobiles Android/iOS.
* **Installation** :

  ```yaml
  dependencies:
    fluent_ui: ^4.5.3
  ```

---

## <h1 id="comparatif-frameworks">Tableau comparatif des frameworks UI pour Flutter</h1>

| Framework          | Inspiré de         | Usage principal      | Points forts                          | Inconvénients                     |
| ------------------ | ------------------ | -------------------- | ------------------------------------- | --------------------------------- |
| Material (Flutter) | Google Material    | App Android, Web     | Complet, intégré, standard            | Moins flexible visuellement       |
| Cupertino          | iOS natif          | App iOS              | Style Apple cohérent                  | Peu adapté à Android/web          |
| GetWidget          | Bootstrap-like     | Mobile, web          | 100+ widgets, gain de temps           | Taille de l’app, personnalisation |
| VelocityX          | Tailwind CSS       | Design fluide/rapide | Syntaxe rapide, enchaînable           | Courbe d’apprentissage            |
| Neumorphic         | Neumorphism        | Design moderne       | Effets visuels doux                   | Accessibilité, usage limité       |
| Fluent UI          | Fluent (Microsoft) | Desktop Windows      | Cohérence avec l’écosystème Microsoft | Peu utile pour Android/iOS        |


