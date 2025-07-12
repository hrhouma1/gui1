# <h1 id="intro">Cours débutant – Navigation simple entre deux interfaces Flutter</h1>

## <h2 id="objectif">Objectif</h2>

Apprendre à :

* Créer plusieurs interfaces (`Page1`, `Page2`)
* Naviguer d'une interface à une autre
* Revenir en arrière

---

## <h2 id="1">1. Créer deux interfaces (pages)</h2>

### Page 1 : Accueil

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation simple',
      home: const Page1(),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 1')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Aller à la Page 2
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Page2()),
            );
          },
          child: const Text('Aller à la Page 2'),
        ),
      ),
    );
  }
}
```

---

## <h2 id="2">2. Créer la deuxième page</h2>

### Page 2 : Détails

```dart
class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 2')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Revenir à la page précédente
            Navigator.pop(context);
          },
          child: const Text('Retour à la Page 1'),
        ),
      ),
    );
  }
}
```

---

## <h2 id="3">3. Résultat attendu</h2>

* Vous lancez l’application → vous êtes sur **Page 1**
* Vous cliquez sur le bouton → vous arrivez sur **Page 2**
* Vous cliquez sur le bouton **Retour** → vous revenez sur **Page 1**

---

## <h2 id="4">4. Explication du code</h2>

| Code                     | Signification                       |
| ------------------------ | ----------------------------------- |
| `Navigator.push(...)`    | Ouvre une nouvelle page             |
| `MaterialPageRoute(...)` | Crée la transition entre les pages  |
| `Navigator.pop(context)` | Ferme la page et revient en arrière |
| `ElevatedButton`         | Crée un bouton avec une action      |

---

## <h2 id="5">5. Astuce pour aller plus loin</h2>

Si vous voulez **envoyer des données** à la Page 2 :

```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => Page2(message: 'Bonjour')),
);
```

Et dans `Page2` :

```dart
class Page2 extends StatelessWidget {
  final String message;

  const Page2({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 2')),
      body: Center(child: Text(message)),
    );
  }
}
```

<br/>
<br/>


# Exercice - naviguer entre **trois pages Flutter**, avec **passage de messages** et **retour en arrière**.




# <h1 id="exercice">Exercice – Naviguer entre 3 pages Flutter</h1>

## <h2 id="objectif">Objectifs</h2>

* Créer **trois interfaces** (Page1, Page2, Page3)
* Naviguer avec des boutons entre elles
* Passer un message de Page1 à Page3
* Revenir à la page précédente avec un bouton

---

## <h2 id="1">1. Code complet à copier</h2>

### `main.dart`

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation 3 Pages',
      home: const Page1(),
    );
  }
}
```

---

### `Page1`

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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Page2()),
            );
          },
          child: const Text('Aller à la Page 2'),
        ),
      ),
    );
  }
}
```

---

### `Page2`

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
                // Aller à la Page 3 avec un message
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Page3(message: 'Bonjour depuis Page 2'),
                  ),
                );
              },
              child: const Text('Aller à la Page 3 avec un message'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Retour à la Page 1
              },
              child: const Text('Retour à la Page 1'),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

### `Page3`

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
              child: const Text('Retour à la Page 2'),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## <h2 id="2">2. Résultat attendu</h2>

1. Page 1 → bouton → Page 2
2. Page 2 → bouton → Page 3 avec un message
3. Page 3 affiche le message → bouton → retour à Page 2
4. Page 2 → bouton → retour à Page 1


