<h1 id="toc">Table des matières</h1>

<ol>
<li><a href="#intro">Introduction : pourquoi le routage est-il crucial ?</a></li>
<li><a href="#concepts">Concepts fondamentaux du routage Flutter</a></li>
<li><a href="#navigator1">Navigator 1.0 : l’API « implicite » classique</a></li>
<li><a href="#named">Routage nommé et transmission d’arguments</a></li>
<li><a href="#generate">onGenerateRoute, onUnknownRoute et contrôle centralisé</a></li>
<li><a href="#animations">Transitions et animations personnalisées</a></li>
<li><a href="#navigator2">Navigator 2.0 : Router, RouteInformationParser et RouterDelegate</a></li>
<li><a href="#packages">Packages de haut niveau : go_router, auto_route, beamer</a></li>
<li><a href="#nested">Navigation imbriquée et BottomNavigationBar</a></li>
<li><a href="#state">Gestion de l’état et navigation</a></li>
<li><a href="#web">Routage web et SEO : path vs hash</a></li>
<li><a href="#deeplinks">Deep Linking mobile (Android / iOS)</a></li>
<li><a href="#restoration">Restauration d’état et restorablePush</a></li>
<li><a href="#auth">Flux d’authentification et routes protégées</a></li>
<li><a href="#i18n-url">Internationalisation des URL</a></li>
<li><a href="#performance">Performance et mémoire</a></li>
<li><a href="#architecture">Architectures modulaires et Clean Routing</a></li>
<li><a href="#exercices">Exercices pratiques</a></li>
<li><a href="#conclusion">Conclusion et bonnes pratiques clés</a></li>
</ol>

<hr>

<h1 id="intro">1. Introduction : pourquoi le routage est-il crucial ?</h1>

La navigation—orchestration de la pile d’écrans—est le cœur d’une application Flutter. Un routage mal conçu entraîne : duplication de code, fuites de mémoire, impossibilité de partager l’état, problèmes d’accessibilité, et frustration utilisateur (retours système cassés, liens profonds impossibles, etc.). Ce cours couvre **toutes** les approches, de `Navigator.push()` jusqu’aux redirections conditionnelles de `go_router`, afin de vous donner une maîtrise complète et professionnelle.



<h1 id="concepts">2. Concepts fondamentaux du routage Flutter</h1>

<ul>
<li><strong>Route</strong> : objet représentant un écran unique (ou une portion modale) placé sur une pile.</li>
<li><strong>Navigator</strong> : widget qui gère la pile et expose `push`, `pop`, etc.</li>
<li><strong>MaterialPageRoute</strong> (ou `CupertinoPageRoute`) : implémentation la plus courante d’une `Route`.</li>
<li><strong>Modèle de navigation</strong> : <em>stack-based</em>, avec possibilité de multiples navigateurs imbriqués.</li>
<li><strong>Deep Link</strong> : URL externe (ou intent Android) ouvrant un chemin interne précis.</li>
<li><strong>Restauration d’état</strong> : sauvegarde/restauration de la pile pour reprendre après kill ou suspend.</li>
</ul>



<h1 id="navigator1">3. Navigator 1.0 : l’API « implicite » classique</h1>

<h2 id="navigator1-basics">3.1 Exemple minimal </h2>

```dart
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator 1.0 Demo',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accueil')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const DetailsPage()),
            );
          },
          child: const Text('Aller aux détails'),
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Détails')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).pop('Retour !'),
          child: const Text('Revenir avec un résultat'),
        ),
      ),
    );
  }
}
```

<h2 id="navigator1-result">3.2 Récupérer un résultat</h2>

```dart
final result = await Navigator.push(...);
debugPrint('Résultat : $result');
```

<h2 id="navigator1-replace">3.3 Remplacement et nettoyage de pile</h2>

* `pushReplacement` remplace la route courante.
* `pushAndRemoveUntil` enlève toutes les routes jusqu’à un prédicat.



<h1 id="named">4. Routage nommé et transmission d’arguments</h1>

<h2 id="named-config">4.1 Configuration dans `MaterialApp`</h2>

```dart
return MaterialApp(
  initialRoute: '/',
  routes: {
    '/':   (context) => const HomePage(),
    '/a':  (context) => const PageA(),
    '/b':  (context) => const PageB(),
  },
);
```

<h2 id="named-arguments">4.2 Passer des arguments</h2>

```dart
Navigator.pushNamed(
  context,
  '/profile',
  arguments: User(id: 42, name: 'Alice'),
);
```

Dans la page cible :

```dart
final user = ModalRoute.of(context)!.settings.arguments as User;
```

<h2 id="named-limitations">4.3 Limites</h2>

* Table statique restreinte.
* Pas de logique conditionnelle ou d’initialisation asynchrone avant la création de la route.



<h1 id="generate">5. onGenerateRoute, onUnknownRoute et contrôle centralisé</h1>

`onGenerateRoute` intercepte toute demande de navigation ; idéal pour :

* Délégation à différents <em>modules</em>.
* Guardes (authentification).
* Animations avancées (PageRouteBuilder).

Exemple :

```dart
return MaterialApp(
  onGenerateRoute: (settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/profile':
        final user = settings.arguments as User;
        return MaterialPageRoute(builder: (_) => ProfilePage(user: user));
      default:
        return null; // Laisse la chance à onUnknownRoute
    }
  },
  onUnknownRoute: (_) => MaterialPageRoute(
    builder: (_) => const NotFoundPage(),
  ),
);
```



<h1 id="animations">6. Transitions et animations personnalisées</h1>

`PageRouteBuilder` permet de contrôler `transitionDuration`, `transitionsBuilder`, etc.

```dart
Navigator.of(context).push(PageRouteBuilder(
  pageBuilder: (_, __, ___) => const DetailsPage(),
  transitionsBuilder: (_, animation, __, child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  },
));
```



<h1 id="navigator2">7. Navigator 2.0 : Router, RouteInformationParser et RouterDelegate</h1>

<h2 id="navigator2-why">7.1 Pourquoi ?</h2>

Navigator 2.0 permet :

* Contrôle explicite de la pile via un modèle déclaratif (source de vérité unique).
* Deep links naïfs (lecture/écriture d’URL).
* Navigation imbriquée plus claire.

<h2 id="navigator2-minimal">7.2 Implémentation minimale</h2>

```dart
class SimpleRoutePath {
  const SimpleRoutePath.home() : isHome = true;
  const SimpleRoutePath.details() : isHome = false;
  final bool isHome;
}

class SimpleRouteInformationParser extends RouteInformationParser<SimpleRoutePath> {
  @override
  Future<SimpleRoutePath> parseRouteInformation(RouteInformation info) async {
    final uri = Uri.parse(info.location ?? '/');
    return uri.pathSegments.isEmpty ? const SimpleRoutePath.home()
                                    : const SimpleRoutePath.details();
  }

  @override
  RouteInformation restoreRouteInformation(SimpleRoutePath configuration) {
    return RouteInformation(location: configuration.isHome ? '/' : '/details');
  }
}

class SimpleRouterDelegate extends RouterDelegate<SimpleRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<SimpleRoutePath> {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  bool _showDetails = false;

  @override
  SimpleRoutePath get currentConfiguration =>
      _showDetails ? const SimpleRoutePath.details()
                   : const SimpleRoutePath.home();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        const MaterialPage(child: HomePage()),
        if (_showDetails) const MaterialPage(child: DetailsPage()),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        _showDetails = false;
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(SimpleRoutePath configuration) async {
    _showDetails = !configuration.isHome;
  }
}
```

Dans `main.dart` :

```dart
MaterialApp.router(
  routerDelegate: SimpleRouterDelegate(),
  routeInformationParser: SimpleRouteInformationParser(),
);
```

<h2 id="navigator2-advanced">7.3 Avancé : paramètres, query, redirections</h2>

* Analyse complète via `Uri`.
* Appel `notifyListeners()` pour mettre à jour la pile.
* Écriture d’URL via `Router.neglect(context, () { … });`.



<h1 id="packages">8. Packages de haut niveau : go_router, auto_route, beamer</h1>

<h2 id="go-router">8.1 go_router (Google, stable)</h2>

```dart
final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const HomePage(),
      routes: [
        GoRoute(
          path: 'profile/:id',
          builder: (_, state) => ProfilePage(id: state.params['id']!),
        ),
      ],
    ),
  ],
  redirect: (ctx, state) {
    final loggedIn = context.read<Auth>().isLoggedIn;
    final loggingIn = state.subloc == '/login';
    return loggedIn || loggingIn ? null : '/login';
  },
);
```

`ShellRoute` (go\_router 14) gère la navigation imbriquée (BottomNavigationBar).
Avantages : configuration déclarative, redirections synchrones/asynchrones, animation personnalisable, support complet web/deep link/restoration.

<h2 id="auto-route">8.2 auto_route</h2>

* Génération automatique de code (`build_runner`) pour routes fortement typées.
* Guards (`AuthGuard`) avec injection.
* Supports `TabsRouter` (tab navigation).

<h2 id="beamer">8.3 Beamer</h2>

* Conçu pour Navigator 2.0 out-of-the-box.
* Approche « location » modulaire pour apps complexes.



<h1 id="nested">9. Navigation imbriquée et BottomNavigationBar</h1>

Problème : chaque onglet doit conserver sa propre pile.

```dart
class RootScaffold extends StatefulWidget {
  const RootScaffold({super.key});
  @override
  State<RootScaffold> createState() => _RootScaffoldState();
}

class _RootScaffoldState extends State<RootScaffold> {
  int _index = 0;
  final _navKeys = List.generate(3, (_) => GlobalKey<NavigatorState>());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: [
          _buildTabNavigator(0, 'home'),
          _buildTabNavigator(1, 'search'),
          _buildTabNavigator(2, 'settings'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Recherche'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Paramètres'),
        ],
      ),
    );
  }

  Widget _buildTabNavigator(int tabIndex, String root) {
    return Navigator(
      key: _navKeys[tabIndex],
      onGenerateRoute: (settings) {
        // Retourne la bonne page en fonction du tab et du settings.name
      },
    );
  }
}
```

Avec go\_router, utilisez `ShellRoute` pour atteindre la même fonctionnalité sans clés manuelles.



<h1 id="state">10. Gestion de l’état et navigation</h1>

* **Passage d’arguments** : OK pour données ponctuelles.
* **Provider / Riverpod** : partage d’instances entre pages sans propager explicitement.
* **InheritedNavigator** pattern pour injection de navigateurs enfants.

Exemple avec Riverpod :

```dart
final navKeyProvider = Provider((_) => GlobalKey<NavigatorState>());
...
context.read(navKeyProvider).currentState!.push(...);
```



<h1 id="web">11. Routage web et SEO : path vs hash</h1>

* Par défaut `MaterialApp.router` utilise la stratégie `PathUrlStrategy` (pas de `/#/`).
* Pour activer `HashUrlStrategy`, appeler `usePathUrlStrategy()` dans `main()` uniquement si vous ciblez des hébergeurs statiques ne gérant pas la réécriture des URLs.
* Définissez les en-têtes `flutter_service_worker.js` pour éviter les 404.

---

<h1 id="deeplinks">12. Deep Linking mobile (Android / iOS)</h1>

<h2 id="deeplinks-android">12.1 Android</h2>

* Modifiez `android/app/src/main/AndroidManifest.xml` :

```xml
<intent-filter>
  <action android:name="android.intent.action.VIEW"/>
  <category android:name="android.intent.category.DEFAULT"/>
  <category android:name="android.intent.category.BROWSABLE"/>
  <data
      android:scheme="https"
      android:host="example.com"
      android:pathPrefix="/profile"/>
</intent-filter>
```

* `go_router` lie automatiquement l’URL à la route.

<h2 id="deeplinks-ios">12.2 iOS / macOS</h2>

* Ajoutez un fichier `apple-app-site-association` sur votre domaine.
* Dans Xcode, activez **Associated Domains** et déclarez : `applinks:example.com`.



<h1 id="restoration">13. Restauration d’état et restorablePush</h1>

```dart
void main() {
  runApp(const MyApp());
  WidgetsApp.debugAllowBannerOverride = false; // utile pour des tests
}

Navigator.restorablePush(context, DetailsPage.route, arguments: 'xyz');
```

* Ajoutez `restorationScopeId` sur chaque `MaterialApp`.
* Sur Android, testez : `adb shell am kill <package>` puis relancez l’app.

---

<h1 id="auth">14. Flux d’authentification et routes protégées</h1>

Stratégies :

1. **Splash → Auth → Main** : trois navigateurs ou un flux conditionnel dans le `RouterDelegate`.
2. **go\_router** : fonction `redirect`.
3. **auto\_route** : `AuthGuard` implémentant `canNavigate`.

Exemple go\_router :

```dart
redirect: (ctx, state) async {
  final auth = ctx.read<AuthRepository>();
  if (!auth.isLoggedIn && state.subloc != '/login') return '/login';
  return null;
},
```



<h1 id="i18n-url">15. Internationalisation des URL</h1>

* Préfixez les routes : `/:lang/...`.
* Utilisez `Locale` dans le delegate et redirigez si nécessaire.
* Gardez le paramètre `lang` dans toutes les redirections pour éviter les sauts culturels.

---

<h1 id="performance">16. Performance et mémoire</h1>

* Préférez `pushReplacement` si l’utilisateur ne doit pas revenir.
* Utilisez des `Page` à clé (`key:`) stable pour éviter des rebuilds coûteux.
* Évitez d’empiler des navigateurs imbriqués sans raison.
* Dans une app à onglets, `IndexedStack` préserve l’état mais peut consommer plus de RAM ; envisagez pausing/resume des contrôleurs.



<h1 id="architecture">17. Architectures modulaires et Clean Routing</h1>

* Divisez l’app en <em>feature modules</em>, chacun exposant sa propre configuration de routes (`GoRoute` ou `RouteBase`).
* Point d’entrée unique centralisant les guards globaux.
* Injection de navigateurs locaux pour réduire les dépendances croisées.



<h1 id="exercices">18. Exercices pratiques</h1>

| # | Titre                                             | Objectif                                       | Fichier de départ |
| - | ------------------------------------------------- | ---------------------------------------------- | ----------------- |
| 1 | **Routage nommé simple**                          | `Navigator.pushNamed()` + arguments            | `exercise_01`     |
| 2 | **Navigation imbriquée avec BottomNavigationBar** | Pile indépendante par onglet                   | `exercise_02`     |
| 3 | **Implémenter Navigator 2.0 minimal**             | RouterDelegate + RouteInformationParser        | `exercise_03`     |
| 4 | **AuthGuard avec go\_router**                     | Redirection conditionnelle                     | `exercise_04`     |
| 5 | **Deep Link Android/iOS**                         | Ouvrir la page `/profile/:id` depuis un intent | `exercise_05`     |

Chaque répertoire inclut un README.md avec énoncé et solution pas à pas.



<h1 id="conclusion">19. Conclusion et bonnes pratiques clés</h1>

1. **Centralisez la logique de routage** : pas d’appels `Navigator.of(context)` dispersés.
2. **Utilisez un package de haut niveau** (go\_router) dès que l’app dépasse trois écrans.
3. **Gardez les routes pures et sans logique métier** ; placez la logique dans des providers/services.
4. **Testez la navigation** : `testWidgets` avec `pumpWidget` et `tester.tap`.
5. **Réfléchissez à l’URL** dans le design initial : deep links et web doivent fonctionner dès le prototype.
6. **Surveillez la pile** via `debugPrint(Navigator.of(context).widget.pages.toString())` en développement.

Vous disposez désormais d’un panorama complet, du `Navigator.push()` historique jusqu’aux redirections asynchrones de `go_router`. Suivez les exercices pour consolider vos acquis ; vous serez prêt à concevoir des applications Flutter robustes, maintenables et prêtes pour le web, le mobile et la desktop.
