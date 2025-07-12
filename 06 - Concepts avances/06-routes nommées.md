# <h1 id="exercice-named">Exercice – Navigation avec `pushNamed` (3 pages)</h1>

## <h2 id="objectif-named">Objectifs</h2>

* Déclarer les routes dans `MaterialApp`
* Naviguer entre pages avec des noms (`/page2`, `/page3`)
* Passer des arguments à une route nommée
* Revenir en arrière avec `Navigator.pop()`

---

## <h2 id="1-named">1. Fichier complet : `main.dart`</h2>

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation nommée',
      initialRoute: '/',
      routes: {
        '/': (context) => const Page1(),
        '/page2': (context) => const Page2(),
        '/page3': (context) => const Page3(), // version sans arguments
      },
      onGenerateRoute: (settings) {
        // Pour passer des arguments à Page3
        if (settings.name == '/page3') {
          final args = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => Page3(message: args),
          );
        }
        return null; // fallback
      },
    );
  }
}
```

---

## <h2 id="2-named">2. Page 1 : Page d’accueil</h2>

```dart
class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 1')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/page2');
          },
          child: const Text('Aller à la Page 2'),
        ),
      ),
    );
  }
}
```

---

## <h2 id="3-named">3. Page 2 : Aller vers Page 3 avec message</h2>

```dart
class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/page3',
                  arguments: 'Salut depuis la Page 2',
                );
              },
              child: const Text('Aller à la Page 3 avec message'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Retour à Page 1'),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## <h2 id="4-named">4. Page 3 : Réception du message</h2>

```dart
class Page3 extends StatelessWidget {
  final String message;

  const Page3({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 3')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Retour à Page 2'),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## <h2 id="5-named">5. Résumé</h2>

| Action                                 | Code                                                       |
| -------------------------------------- | ---------------------------------------------------------- |
| Aller à une route                      | `Navigator.pushNamed(context, '/page2')`                   |
| Aller avec argument                    | `Navigator.pushNamed(context, '/page3', arguments: '...')` |
| Lire l’argument dans `onGenerateRoute` | `final args = settings.arguments as String`                |
| Revenir                                | `Navigator.pop(context)`                                   |


