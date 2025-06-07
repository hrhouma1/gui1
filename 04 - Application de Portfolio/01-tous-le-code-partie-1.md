# Plan 

Tout est découpé à l'application, on avance fichier par fichier, chapitre par chapitre.

| Chapitre | Objectif pédagogique                                                                                                                                                                              | Fichiers créés / modifiés                                                                                                                     | Code fourni                      |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------- |
| 0        | Pré-requis (Flutter + Firebase CLI installés) • Création du projet vierge `flutter create paulina_knop` • Ajout des dépendances `pubspec.yaml` • Configuration Firebase (`flutterfire configure`) | `pubspec.yaml` (complété)  `firebase_options.dart` (généré)                                                                                   | Bloc complet `pubspec.yaml`      |
| 1        | Point d’entrée et initialisation Firebase                                                                                                                                                         | `lib/main.dart`                                                                                                                               | Code complet                     |
| 2        | Système de navigation                                                                                                                                                                             | `lib/routes.dart`                                                                                                                             | Code complet                     |
| 3        | Widgets réutilisables et helpers (fonts, drawer, tabs, cartes, formulaires, Firestore helper)                                                                                                     | `lib/components.dart`                                                                                                                         | Code complet                     |
| 4        | Pages **mobile** (4 fichiers)                                                                                                                                                                     | `lib/mobile/landing_page_mobile.dart`<br>`lib/mobile/about_mobile.dart`<br>`lib/mobile/contact_mobile.dart`<br>`lib/mobile/works_mobile.dart` | Code complet de chaque page      |
| 5        | Pages **web** (4 fichiers)                                                                                                                                                                        | `lib/web/landing_page_web.dart`<br>`lib/web/about_web.dart`<br>`lib/web/contact_web.dart`<br>`lib/web/works_web.dart`                         | Code complet de chaque page      |
| 6        | Blog commun connecté à Firestore                                                                                                                                                                  | `lib/common/blog.dart`                                                                                                                        | Code complet                     |
| 7        | Test : run sur mobile (`flutter run`) et sur web (`flutter run -d chrome`) — tout doit se compiler                                                                                                | aucun nouveau fichier                                                                                                                         | instructions de test             |
| 8        | Insertion d’articles et de messages dans Firestore pour démonstration                                                                                                                             | Console Firebase                                                                                                                              | pas de code, procédure pas à pas |
| 9        | Ajustements responsives, nettoyage et assets                                                                                                                                                      | contrôle visuel                                                                                                                               | liste de vérifications           |
| 10       | Déploiement web (`flutter build web`, `firebase hosting:deploy`) et génération APK                                                                                                                | -                                                                                                                                             | commandes terminal               |


<br/>
<br/>
<br/>

#  Contenu de chaque chapitre

1. **Chapitre 0 — Pré-requis et `pubspec.yaml`**

   * Montrer le fichier entier avec les dépendances exactes.
   * Expliquer la commande `flutter pub get`.
   * Laisser les étudiants copier le bloc YAML.

2. **Chapitre 1 — `main.dart`**

   * Fournir le code que vous avez listé : importations, `Firebase.initializeApp`, `runApp(MyApp)`.
   * Test immédiat : `flutter run -d chrome` ⇒ page blanche (mais pas d’erreur).

3. **Chapitre 2 — `routes.dart`**

   * Expliquer la logique `LayoutBuilder` (≥ 800 px = web).
   * Copier le fichier entier.

4. **Chapitre 3 — `components.dart`**

   * Donner le code complet (Tabs, Drawers, Sans, AbelCustom, AnimatedCard, TextForm, ContactFormMobile, ContactFormWeb, AddDataFirestore…).
   * Insister sur la dépendance `cloud_firestore`.

5. **Chapitre 4 — Pages Mobile**

   * Distribuer un fichier à la fois : Landing → About → Contact → Works.
   * Après chaque fichier, re-compiler pour vérifier.

6. **Chapitre 5 — Pages Web**

   * Même approche : Landing → About → Contact → Works.
   * Compilation web après chaque ajout.

7. **Chapitre 6 — `blog.dart`**

   * Fournir le code, montrer comment créer la collection `articles` dans Firestore.
   * Vérifier que la liste s’affiche.

8. **Chapitre 7 — Recette et tests**

   * Lancer l’app mobile et web, cliquer sur tous les liens, soumettre le formulaire, vérifier Firestore.

9. **Chapitre 8 — Remplissage données & assets**

   * Déposer les images dans `assets/`, mettre à jour `pubspec.yaml`, exécuter `flutter pub get`.

10. **Chapitre 9 — Build et déploiement**

    * Commandes : `flutter build web`, `firebase init hosting`, `firebase deploy`; `flutter build apk`.



### Conseils de progression

* Toujours **créer/coller un seul fichier à la fois**, puis exécuter :

  ```bash
  flutter analyze
  flutter run -d chrome
  ```


<br/>
<br/>
<br/>



# 1 - Code 1 — `lib/main.dart`

Copiez / collez tel quel ; chaque bloc est abondamment commenté pour aider vos étudiants à comprendre ligne par ligne.

```dart
// main.dart
//
// Point d’entrée de l’application Flutter.
// ─────────────────────────────────────────
//
// 1. Initialise Flutter et Firebase.
// 2. Force le mode “URL clean” sur le Web (suppression du « # »).
// 3. Démarre le widget racine `MyApp`, qui délègue toute la navigation
//    à la classe `Routes` définie dans lib/routes.dart.

import 'package:flutter/material.dart';               // Widgets Flutter de base
import 'package:firebase_core/firebase_core.dart';    // Initialisation Firebase
import 'package:url_strategy/url_strategy.dart';      // Enlève « # » dans l’URL Web
import 'package:paulina_knop/routes.dart';            // Système de routes (fichier séparé)
import 'firebase_options.dart';                      // Clés et IDs Firebase générés

/// Fonction main — toujours asynchrone quand on appelle Firebase.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();          // S’assure que Flutter est prêt

  setPathUrlStrategy();                               // Web : URLs propres sans « # »

  // Initialise Firebase selon la plateforme (web, Android, iOS…).
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());                              // Lance l’application
}

/// Widget racine.  Tout le reste est enfant de ce MaterialApp.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,              // Retire le bandeau “DEBUG”
      onGenerateRoute: Routes.generateRoute,          // Routeur centralisé
      initialRoute: '/',                              // Première page affichée
      // Le thème par défaut pourrait être placé ici si besoin :
      // theme: ThemeData(primarySwatch: Colors.teal),
    );
  }
}
```

**Explications pédagogiques rapides**

* `WidgetsFlutterBinding.ensureInitialized()` : obligatoire quand on appelle du code natif (ici Firebase) avant `runApp`.
* `setPathUrlStrategy()` : module `url_strategy`; enlève le hash (`/#/`) dans les URLs pour un rendu plus propre côté Web.
* `Firebase.initializeApp()` : charge les identifiants contenus dans `firebase_options.dart` (généré par FlutterFire CLI).
* `MaterialApp` : contient le router.

  * `onGenerateRoute` renvoie une fonction qui crée chaque page (voir `routes.dart`).
  * `initialRoute` est le chemin affiché au démarrage (`'/'`).

Vous pouvez maintenant exécuter :

```bash
flutter run -d chrome   # test Web
# ou
flutter run             # un device mobile connecté
```



<br/>
<br/>
<br/>


# 2 - `lib/routes.dart` — version complète abondamment commentée

```dart
// routes.dart
//
// Routeur central de l’application.
// ──────────────────────────────────────────────────────────────
// La méthode statique `generateRoute` reçoit un `RouteSettings` qui
// contient le chemin demandé (settings.name).  On renvoie à chaque fois
// un `MaterialPageRoute` dont le builder instancie la page appropriée.
//
// • Toutes les pages « responsive » (mobile vs web) sont créées via
//   un `LayoutBuilder` : on mesure la largeur disponible et on décide
//   quel widget retourner.
//
// • Le seuil 800 px fonctionne pour desktop/tablette ; modifiez-le
//   facilement ici si vous voulez un autre point de coupure.
// -----------------------------------------------------------------

import 'package:flutter/material.dart';

// Pages « communes »
import 'package:paulina_knop/common/blog.dart';

// Pages MOBILE
import 'package:paulina_knop/mobile/about_mobile.dart';
import 'package:paulina_knop/mobile/contact_mobile.dart';
import 'package:paulina_knop/mobile/landing_page_mobile.dart';
import 'package:paulina_knop/mobile/works_mobile.dart';

// Pages WEB / DESKTOP
import 'package:paulina_knop/web/about_web.dart';
import 'package:paulina_knop/web/contact_web.dart';
import 'package:paulina_knop/web/landing_page_web.dart';
import 'package:paulina_knop/web/works_web.dart';

/// Classe utilitaire : aucune instance, uniquement la méthode statique.
class Routes {
  /// Fabrique un objet Route à partir d’un nom.
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      // ───────────────────────────────────────────────
      // Page d’accueil « / »
      // ───────────────────────────────────────────────
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              // Large écran → version Web, sinon version Mobile
              return constraints.maxWidth > 800
                  ? const LandingPageWeb()
                  : const LandingPageMobile();
            },
          ),
        );

      // ───────────────────────────────────────────────
      // Page Contact
      // ───────────────────────────────────────────────
      case '/contact':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              return constraints.maxWidth > 800
                  ? const ContactWeb()
                  : const ContactMobile();
            },
          ),
        );

      // ───────────────────────────────────────────────
      // Page About
      // ───────────────────────────────────────────────
      case '/about':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              return constraints.maxWidth > 800
                  ? const AboutWeb()
                  : const AboutMobile();
            },
          ),
        );

      // ───────────────────────────────────────────────
      // Page Blog (identique sur mobile & web)
      // ───────────────────────────────────────────────
      case '/blog':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const Blog(),
        );

      // ───────────────────────────────────────────────
      // Page Works / Portfolio
      // ───────────────────────────────────────────────
      case '/works':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              return constraints.maxWidth > 800
                  ? const WorksWeb()
                  : const WorksMobile();
            },
          ),
        );

      // ───────────────────────────────────────────────
      // Route inconnue → on retombe sur la Home
      // ───────────────────────────────────────────────
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              return constraints.maxWidth > 800
                  ? const LandingPageWeb()
                  : const LandingPageMobile();
            },
          ),
        );
    }
  }
}
```

### Points clés à tester

1. **Hot reload** : modifiez `800` → `600` dans `routes.dart`, sauvegardez ; vérifiez que la version Web apparaît plus tôt quand vous réduisez la fenêtre.
2. **Navigation** : `Navigator.of(context).pushNamed('/about');` doit afficher la page About correspondante, puis bouton « back » revient à l’accueil.
3. **404 interne** : tapez une URL inexistante (`/bidon`) ; vous retombez bien sur la Landing Page grâce au `default:`.





<br/>
<br/>
<br/>






# 3. `lib/components.dart`

```dart
// Étape 3 : widgets réutilisables (aucune dépendance réseau)

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// ---------- TEXTE RÉUTILISABLE ----------
class SansBold extends StatelessWidget {
  final String text;
  final double size;
  const SansBold(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) =>
      Text(text, style: GoogleFonts.openSans(
        fontSize: size, fontWeight: FontWeight.bold));
}

class Sans extends StatelessWidget {
  final String text;
  final double size;
  const Sans(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) =>
      Text(text, style: GoogleFonts.openSans(fontSize: size));
}

class AbelCustom extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final FontWeight? weight;
  const AbelCustom(this.text, this.size,
      {this.color, this.weight, super.key});

  @override
  Widget build(BuildContext context) =>
      Text(text, style: GoogleFonts.abel(
        fontSize: size, color: color, fontWeight: weight));
}

/// ---------- PETIT CONTENEUR COMPÉTENCE ----------
Widget tealContainer(String text) => Container(
  padding: const EdgeInsets.all(7),
  decoration: BoxDecoration(
    border: Border.all(color: Colors.tealAccent, width: 2),
    borderRadius: BorderRadius.circular(5),
  ),
  child: Sans(text, 15),
);

/// ---------- CARTE ANIMÉE ----------
class AnimatedCard extends StatefulWidget {
  final String imagePath;
  final String? text;
  final bool reverse;
  final double? width, height;
  const AnimatedCard({
    super.key,
    required this.imagePath,
    this.text,
    this.reverse = false,
    this.width,
    this.height,
  });

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(
    vsync: this, duration: const Duration(seconds: 4))
    ..repeat(reverse: true);

  late final Animation<Offset> _anim = Tween(
    begin: widget.reverse ? const Offset(0, .08) : Offset.zero,
    end  : widget.reverse ? Offset.zero : const Offset(0, .08),
  ).animate(_ctrl);

  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) => SlideTransition(
    position: _anim,
    child: Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: Colors.tealAccent),
      ),
      shadowColor: Colors.tealAccent,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Image.asset(widget.imagePath,
              width: widget.width ?? 200,
              height: widget.height ?? 200,
              fit: BoxFit.contain),
            const SizedBox(height: 10),
            if (widget.text != null) SansBold(widget.text!, 15),
          ],
        ),
      ),
    ),
  );
}
```

---

## 4-A. `lib/mobile/landing_page_mobile.dart`

```dart
// Étape 4 : page d’accueil (version mobile) – UI statique

import 'package:flutter/material.dart';
import '../components.dart';

class LandingPageMobile extends StatelessWidget {
  const LandingPageMobile({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent, elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black, size: 30),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [

          /// --------- PHOTO DE PROFIL ---------
          const CircleAvatar(
            radius: 117, backgroundColor: Colors.tealAccent,
            child: CircleAvatar(
              radius: 113, backgroundColor: Colors.black,
              child: CircleAvatar(
                radius: 110, backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/image-circle.png'),
              ),
            ),
          ),

          const SizedBox(height: 25),

          /// --------- TITRE ---------
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: const BoxDecoration(
              color: Colors.tealAccent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: const SansBold("Hello I'm", 15),
          ),
          const SansBold('Paulina Knop', 40),
          const Sans('Flutter developer', 20),

          const SizedBox(height: 30),

          /// --------- COMPÉTENCES ---------
          Wrap(
            spacing: 7, runSpacing: 7,
            children: [
              tealContainer('Flutter'),
              tealContainer('Firebase'),
              tealContainer('Android'),
              tealContainer('Windows'),
            ],
          ),

          const SizedBox(height: 60),

          /// --------- SERVICES ---------
          const SansBold('What I do?', 35),
          const SizedBox(height: 15),
          const AnimatedCard(
            imagePath: 'assets/webL.png',
            text: 'Web development',
            width: 300,
          ),
          const SizedBox(height: 35),
          const AnimatedCard(
            imagePath: 'assets/app.png',
            text: 'App development',
            width: 300, reverse: true,
          ),
          const SizedBox(height: 35),
          const AnimatedCard(
            imagePath: 'assets/firebase.png',
            text: 'Back-end development',
            width: 300,
          ),
          const SizedBox(height: 50),
        ],
      ),
    ),
  );
}
```

---

## 4-B. `lib/web/landing_page_web.dart`

```dart
// Étape 4 : page d’accueil (version web) – UI statique

import 'package:flutter/material.dart';
import '../components.dart';

class LandingPageWeb extends StatelessWidget {
  const LandingPageWeb({super.key});

  @override
  Widget build(BuildContext context) {

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: const Drawer(),          // placeholder (aucune action)
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Portfolio'), // titre simple pour l’instant
      ),
      body: ListView(
        children: [

          /// --------- SECTION INTRO ---------
          SizedBox(
            height: h - 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                /// Texte
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SansBold("Hello I'm", 25),
                    SizedBox(height: 10),
                    SansBold("Paulina Knop", 55),
                    Sans("Flutter developer", 30),
                  ],
                ),

                /// Avatar
                const CircleAvatar(
                  radius: 147, backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    radius: 143, backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 140, backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/image-circle.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// --------- SECTION SERVICES ---------
          SizedBox(
            height: h / 1.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                SansBold('What I do?', 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCard(imagePath: 'assets/webL.png',
                       text: 'Web development'),
                    AnimatedCard(imagePath: 'assets/app.png',
                       text: 'App development', reverse: true),
                    AnimatedCard(imagePath: 'assets/firebase.png',
                       text: 'Back-end development'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

---

### Comment tester maintenant ?

1. **`flutter pub get`**
2. **`flutter run -d chrome`** → vous voyez la version web.
3. **Redimensionner** la fenêtre à < 800 px → aucune page ne change (c’est normal, seule la route d’accueil est implémentée).
4. **`flutter run` sur un émulateur** Android/iOS → vous voyez la version mobile.

Une fois ces quatre fichiers maîtrisés et fonctionnels, on pourra :

* Étape 5 : ajouter la navigation complète (About, Works, Contact…).
* Étape 6 : placer les *Drawers* et les *Tabs*.
* Étape 7 : insérer les formulaires hors-ligne.
* Étape 9 +: brancher Firebase (écriture, puis lecture dans le blog).



<br/>
<br/>

# Annexe 1 - Arborescence

```
paulina_knop/
├── lib/
│   ├── common/
│   │   └── blog.dart
│   ├── mobile/
│   │   ├── about_mobile.dart
│   │   ├── contact_mobile.dart
│   │   ├── landing_page_mobile.dart
│   │   └── works_mobile.dart
│   ├── web/
│   │   ├── about_web.dart
│   │   ├── contact_web.dart
│   │   ├── landing_page_web.dart
│   │   └── works_web.dart
│   ├── components.dart
│   ├── firebase_options.dart
│   ├── main.dart
│   └── routes.dart
```




# Annexe 2


```
.
├── pubspec.yaml
├── assets/
│   ├── image-circle.png
│   ├── profile2-circle.png
│   ├── webL.png
│   ├── app.png
│   ├── firebase.png
│   ├── works.jpg
│   ├── web.jpg
│   ├── contact_image.jpg
│   ├── blog.jpg
│   └── portfolio_screenshot.PNG
└── lib/
    ├── firebase_options.dart
    ├── main.dart
    ├── routes.dart          ← fichier demandé ci-dessous
    ├── components.dart
    ├── common/
    │   └── blog.dart
    ├── mobile/
    │   ├── about_mobile.dart
    │   ├── contact_mobile.dart
    │   ├── landing_page_mobile.dart
    │   └── works_mobile.dart
    └── web/
        ├── about_web.dart
        ├── contact_web.dart
        ├── landing_page_web.dart
        └── works_web.dart
```





# Annexe 6






### Arborescence du projet (`lib/`) en ASCII

```
lib
├── common
│   └── blog.dart
├── mobile
│   ├── about_mobile.dart
│   ├── contact_mobile.dart
│   ├── landing_page_mobile.dart
│   └── works_mobile.dart
├── web
│   ├── about_web.dart
│   ├── contact_web.dart
│   ├── landing_page_web.dart
│   └── works_web.dart
├── components.dart
├── firebase_options.dart        # généré par FlutterFire CLI
├── main.dart
└── routes.dart
```

---

## Séquence de développement (code-par-code, test-par-test)

| Étape  | Fichier(s) à créer / compléter                                   | Contenu à développer                                                                                                                                                                                                                                               | Comment tester immédiatement                                                                                                              |
| ------ | ---------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------- |
| **1**  | `pubspec.yaml`, `assets/`                                        | – Définir les dépendances déjà listées.<br>– Ajouter l’entrée `assets:`.                                                                                                                                                                                           | `flutter pub get` doit se terminer sans erreur.<br>`flutter analyze` ➜ zéro warning critiques.                                            |
| **2**  | `lib/main.dart` **(déjà fourni)**                                | – Initialisation Firebase.<br>– `setPathUrlStrategy()`.<br>– `MyApp` racine (MaterialApp + routes).                                                                                                                                                                | `flutter run -d chrome` puis `http://localhost:xxxx/` doit lancer l’app vide sans bandeau *debug*.                                        |
| **3**  | `lib/firebase_options.dart`                                      | Fichier auto-généré par **FlutterFire CLI**.<br>Aucune modification manuelle.                                                                                                                                                                                      | Supprimer volontairement `apiKey` ➜ l’app plante (démonstration). Remettre la valeur.                                                     |
| **4**  | `lib/components.dart`                                            | Créer **tous les widgets réutilisables** :<br>– `Sans`, `SansBold`, `AbelCustom` (typographie)<br>– `AnimatedCard` (animation)<br>– Form widgets :`TextForm`, `ContactFormWeb`, `ContactFormMobile`<br>– Navigation drawers & tabs (`DrawersWeb`, `TabsWeb`, etc.) | Depuis `main.dart`, instancier un simple `Scaffold` qui affiche `AnimatedCard`. L’animation doit se jouer (preuve visuelle).              |
| **5**  | `lib/routes.dart`                                                | Méthode `generateRoute` déjà fournie : <br>– gérer `/`, `/contact`, `/about`, `/blog`, `/works`.<br>– Utiliser `LayoutBuilder` pour choisir mobile/web.                                                                                                            | Dans un navigateur : taper successivement `/about`, `/contact`… La bonne page doit s’ouvrir et le *hot-reload* ne doit pas casser l’état. |
| **6**  | `lib/mobile/landing_page_mobile.dart`                            | Page d’accueil mobile :<br>photo, présentation, compétences, CTA contact.                                                                                                                                                                                          | Dans l’émulateur mobile, largeur < 800 px ➜ la page mobile apparaît correctement, scroll fluide.                                          |
| **7**  | `lib/web/landing_page_web.dart`                                  | Page d’accueil web (mise en page en `Row`, typographies plus grandes).                                                                                                                                                                                             | Navigateur desktop : largeur > 800 px ➜ version web, vérifier responsive en redimensionnant la fenêtre.                                   |
| **8**  | `lib/mobile/about_mobile.dart` <br> `lib/web/about_web.dart`     | Section “About”. Réutilise `AnimatedCard`, `tealContainer()`.                                                                                                                                                                                                      | Cliquer sur l’onglet *About* dans le drawer ; vérifier responsive mobile/web.                                                             |
| **9**  | `lib/mobile/contact_mobile.dart` <br> `lib/web/contact_web.dart` | Section “Contact” + formulaires.<br>Connexions à Firestore via `AddDataFirestore`.                                                                                                                                                                                 | Remplir le formulaire ➜ message “Success”. Dans Firebase console, un nouveau document doit apparaître.                                    |
| **10** | `lib/mobile/works_mobile.dart` <br> `lib/web/works_web.dart`     | Galerie de projets : images + descriptions.                                                                                                                                                                                                                        | Cliquer sur l’onglet *Works* : cartes animées visibles, textes lisibles.                                                                  |
| **11** | `lib/common/blog.dart`                                           | Liste des articles Firestore (\<collection `articles`>).<br>Widget `BlogPost` extensible.                                                                                                                                                                          | Ajouter 1-2 documents *title/body* dans Firestore ➜ la liste s’affiche en live-reload.                                                    |
| **12** | **Tests finaux**                                                 | – Navigation fluide entre toutes les routes.<br>– Aucune erreur dans la console.<br>– Hot-reload fonctionne.<br>– Formulaires valident les champs requis.                                                                                                          | Faire une **revue de code + démonstration** : chaque étudiant présente, puis push sur Git ; run CI (`flutter test`, `flutter analyze`).   |

---

### Conseils pédagogiques supplémentaires

1. **Découpage progressif**
   Abordez chaque fichier comme un mini-projet : copier le squelette, expliquer chaque import, lancer, observer ; *jamais* plus d’un écran de code avant de tester.

2. **Validation automatisée**
   Proposez un script simple (GitHub Actions ou `melos run lint:test`) qui exécute : `flutter analyze`, `flutter test`, `flutter build web`. Les étudiants voient rouge/vert après chaque push.

3. **Debug visuel**
   Encouragez l’usage de *Flutter DevTools* : Timeline (FPS de l’animation), Inspect Widget (vérifier paddings).

4. **Journal de bord**
   Demandez à chacun de tenir un fichier `progress.md` : *Étape accomplie / Problème rencontré / Solution*.

Suivez cet ordre, testez à chaque sous-étape, et les débutants garderont toujours une application fonctionnelle tout en apprenant les bases de Flutter, Firebase et du responsive design.










<br/>
<br/>



## Ordre précis des ajouts de code

> Objectif pédagogique : les débutants voient **rapidement** quelque chose s’afficher, puis enrichissent pas-à-pas. On différera Firebase jusqu’à ce que l’UI soit solide.

| Rang   | Ce qu’on **crée ou modifie**                                                                                                                                                                                                           | Pourquoi maintenant ?                                                      | À tester immédiatement                                                                              |
| ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| **0**  | `pubspec.yaml` (dépendances déjà listées) + dossier `assets/`                                                                                                                                                                          | Base du projet                                                             | `flutter pub get` doit réussir ; `flutter run` sur un projet vide affiche l’écran blanc par défaut. |
| **1**  | `lib/main.dart` **minimal**  <br>`dart<br>void main() => runApp(const MaterialApp(home: Scaffold()));<br>`                                                                                                                             | Vérifier que Flutter compile sur chaque poste avant d’écrire plus de code. | `flutter run` sur Chrome/émulateur : écran vide blanc sans erreurs.                                 |
| **2**  | `lib/routes.dart` **squelette**  (classe `Routes` avec `generateRoute` renvoyant toujours un `Placeholder`)                                                                                                                            | Introduire la notion de navigation **avant** de créer des pages réelles.   | Passer `initialRoute: '/about'` → placeholder visible.                                              |
| **3**  | `lib/components.dart`  <br>– `Sans`, `SansBold`, `AbelCustom` <br>– `AnimatedCard` (image fixe)                                                                                                                                        | Avoir les widgets réutilisables dès le départ pour éviter la duplication.  | Placer `AnimatedCard` dans `home:` et observer l’animation.                                         |
| **4**  | **Pages d’accueil statiques**  <br>`landing_page_mobile.dart` et `landing_page_web.dart` **sans aucune logique** (texte et images en dur)                                                                                              | Les étudiants voient tout de suite la différence mobile/web.               | Dans Chrome (largeur > 800) vs. smartphone (largeur < 800).                                         |
| **5**  | Compléter `Routes.generateRoute`  pour choisir la bonne page selon la largeur (code déjà fourni).                                                                                                                                      | Toute l’app pourra maintenant changer de section.                          | Cliquer sur les routes (`/works`, `/about`…) en changeant le navigateur.                            |
| **6**  | `DrawersWeb`, `DrawersMobile`, `TabsWeb`, `TabsMobile`  (navigations)                                                                                                                                                                  | Permettre de **bouger** dans l’app avant d’ajouter du contenu dynamique.   | Ouvrir/fermer le drawer, cliquer sur *Blog* etc.                                                    |
| **7**  | **Sections statiques restantes**  <br>`about_mobile.dart`, `about_web.dart`, `works_*`, `contact_*` **sans formulaire**                                                                                                                | L’UI ressemble déjà au produit final → motivation.                         | Scroll fluide, pas d’exception de layout.                                                           |
| **8**  | **Formulaires** (classe `TextForm`, validation locale) mais **sans** appel Firestore : <br>`ContactFormMobile`, `ContactFormWeb` ➜ afficher simplement un `SnackBar("OK")`                                                             | Les débutants apprennent la validation sans dépendances réseau.            | Laisser un champ vide → message d’erreur ; remplir → SnackBar.                                      |
| **9**  | **Intégration Firebase CLI**  (exécuter `flutterfire configure`) <br>génère `firebase_options.dart` puis **mettre à jour `main.dart`** :  `dart<br>await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);<br>` | Maintenant que l’IU est stable, on introduit Firestore.                    | L’app compile toujours (pas encore de lecture/écriture).                                            |
| **10** | Classe utilitaire `AddDataFirestore` + remplacement du `SnackBar` par l’appel `addResponse()` dans les formulaires                                                                                                                     | On voit une **écriture** dans Firebase.                                    | Remplir le formulaire → document dans collection `messages`.                                        |
| **11** | `Blog` : remplacer la liste factice par  `StreamBuilder<QuerySnapshot>` (code déjà fourni).                                                                                                                                            | Introduction à la **lecture** temps-réel.                                  | Ajouter un doc dans `articles` → l’app se met à jour automatiquement.                               |
| **12** | Derniers détails : `AnimatedCard.reverse`, images réelles, mise au point responsive, suppression des warnings `flutter analyze`                                                                                                        | Fignoler et consolider.                                                    | Tour complet de l’app sur mobile + web, aucune erreur console.                                      |

### Réponse à ta question : Firebase on le laisse à la fin ?

Oui : **étapes 9 à 11 seulement**.
Avant cela, les étudiants travaillent hors-ligne :

* UI statique → navigation → validation locale.
* Une fois à l’aise, on active Firebase (écriture), puis la lecture temps-réel pour le blog.


<br/>
<br/>



### Prochain pas : décortiquer `lib/main.dart`

Pour vos étudiants, c’est le moment idéal d’aborder **le point d’entrée de toute application Flutter** ; ils comprendront ainsi comment tout le reste (routes, pages, Firebase, etc.) se branche.

---

## 1. Objectifs pédagogiques de ce chapitre

| Objectif                                                       | Pourquoi c’est important                                                          |
| -------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| Comprendre `WidgetsFlutterBinding.ensureInitialized()`         | Nécessaire quand on exécute du code asynchrone avant `runApp()` (ici : Firebase). |
| Savoir initialiser Firebase avec des options multi-plateformes | Essentiel pour les applis cross-platform, prépare la mise en ligne.               |
| Savoir activer la réécriture d’URL (`url_strategy`)            | Permet des URL propres sur le Web sans le `#`.                                    |
| Créer et lancer le widget racine (`MyApp`)                     | Point de départ de la navigation et du thème.                                     |

À la fin, chaque étudiant doit pouvoir **expliquer ligne par ligne** ce qui se passe dans `main.dart`, compiler, puis voir l’application démarrer sans erreur.

---

## 2. Code complet (commenté ligne par ligne)

```dart
// lib/main.dart
//
// Point d’entrée de l’application.
// ─────────────────────────────────────────────────────────

// 1. Firebase
import 'package:firebase_core/firebase_core.dart';

// 2. Flutter
import 'package:flutter/material.dart';

// 3. Navigation interne
import 'package:paulina_knop/routes.dart';

// 4. Pour retirer le ‘#/’ des URL sur le Web
import 'package:url_strategy/url_strategy.dart';

// 5. Fichier généré automatiquement par FlutterFire CLI
import 'firebase_options.dart';

/// Fonction main — exécute avant tout le reste.
/// La signature `Future<void>` est requise car on attend
/// l’initialisation asynchrone de Firebase.
Future<void> main() async {
  // Oblige Flutter à lier ses services (indispensable avant du code asynchrone).
  WidgetsFlutterBinding.ensureInitialized();

  // En Web, supprime le hash dans les URL : /about au lieu de /#/about
  setPathUrlStrategy();

  // Initialisation de Firebase avec les bons identifiants
  // (plateforme détectée automatiquement dans firebase_options.dart).
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Lancement de l’application.
  runApp(const MyApp());
}

/// Widget racine.
/// Contient les paramètres globaux : thème, routes, etc.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Désactive le bandeau “debug” en haut à droite.
      debugShowCheckedModeBanner: false,

      // Utilise le routeur personnalisé défini dans lib/routes.dart
      onGenerateRoute: Routes.generateRoute,

      // Première page affichée.
      initialRoute: '/',
    );
  }
}
```

---

## 3. Déroulé pas-à-pas pour la séance

| Étape | Action en classe                                                                                      | Vérification immédiate                                         |
| ----- | ----------------------------------------------------------------------------------------------------- | -------------------------------------------------------------- |
| 1     | Chaque étudiant crée `lib/main.dart` tel quel et importe les paquets.                                 | `flutter analyze` ne doit signaler aucune erreur.              |
| 2     | Expliquer `WidgetsFlutterBinding.ensureInitialized()` et faire commenter son rôle dans le fichier.    | Retirer la ligne provoque un crash (tester pour montrer).      |
| 3     | Montrer le contenu auto-généré de `firebase_options.dart`, expliquer qu’il varie selon la plateforme. | Changer la valeur de `apiKey` → l’appli ne se connecte plus.   |
| 4     | Lancer `flutter run -d chrome` et vérifier que l’URL est propre (`/` sans `#/`).                      | Désactiver `setPathUrlStrategy()` pour observer la différence. |
| 5     | Naviguer vers `http://localhost:xxxx/about` → l’appli doit charger la page About.                     | Confirmer que la route est gérée par `Routes.generateRoute`.   |

---

## 4. Exercices d’application

1. **Personnalisation du thème global**

   * Ajouter un `theme: ThemeData(primarySwatch: Colors.teal)` dans `MaterialApp`.
   * Tester la propagation sur les AppBars des pages mobiles/web.

2. **Ajout d’un SplashScreen simulé**

   * Avant `runApp`, insérer un `await Future.delayed(Duration(seconds:2));`
   * Expliquer l’impact sur l’expérience utilisateur et pourquoi un vrai Splash devrait être natif.

3. **Gestion d’erreurs Firebase**

   * Entourer `Firebase.initializeApp()` d’un `try/catch` et afficher un `runApp(ErrorWidget)` custom en cas d’échec.

---

## 5. Validation de fin de chapitre

* L’application démarre sur mobile et sur Web.
* Aucune erreur de connexion Firebase dans la console.
* Les étudiants peuvent expliquer :

  1. Pourquoi on attend Firebase avant `runApp`.
  2. Le rôle de `Routes.generateRoute`.
  3. L’effet de `setPathUrlStrategy()`.






<br/>
<br/>



### Code complet **jusqu’à l’étape 4**

*(tout fonctionne hors‐ligne, sans Firebase ; les formulaires et le blog arriveront à l’étape suivante)*

---

## 1. `lib/main.dart`

```dart
// Étape 1 : point d’entrée minimal + navigation générée par Routes
import 'package:flutter/material.dart';
import 'routes.dart'; // notre fichier de routes

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // toutes les pages sortiront de ce générateur de routes
      onGenerateRoute: Routes.generateRoute,
      initialRoute: '/',     // page d’accueil
    );
  }
}
```

---

## 2. `lib/routes.dart`

```dart
// Étape 2 : squelette de navigation responsive (mobile / web)
import 'package:flutter/material.dart';
import 'mobile/landing_page_mobile.dart';
import 'web/landing_page_web.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      // page d’accueil
      case '/':
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) =>
                constraints.maxWidth > 800
                    ? const LandingPageWeb()
                    : const LandingPageMobile(),
          ),
        );

      // si la route n’existe pas, on retombe sur l’accueil
      default:
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) =>
                constraints.maxWidth > 800
                    ? const LandingPageWeb()
                    : const LandingPageMobile(),
          ),
        );
    }
  }
}
```

---

