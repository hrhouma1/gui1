# Exercice 2 — *Premiers pas avec Flutter* (Stateless → interactions simples)

> **Consigne** : À partir du squelette ci-dessous, **complétez les espaces vides** (marqués `______`) et les `// TODO(Tx)` sans renommer les classes demandées. Ne codez **aucun StatefulWidget**.

# Exercice 2 :
- https://github.com/hrhouma1/flutter-demo-1-stateless/blob/main/03-pratique1.md


## Objectifs d’apprentissage

* Comprendre la structure minimale (`main()`, `runApp`, `MaterialApp`, `Scaffold`).
* Utiliser des **Stateless widgets** et la **composition** (extraction de widgets).
* Configurer un **thème clair** (Material 3) et masquer la **bannière DEBUG**.
* Ajouter une petite **interaction** (SnackBar, compteur *sans état*, voir indices).
* Naviguer vers une **seconde page**.

## Tâches (et points)

* **T1 (2 pts) — Import & point d’entrée**

  * Laissez `import 'package:flutter/material.dart';` tel quel.
  * Dans votre mini-rapport, expliquez **en 1 phrase** le rôle de cet import.
* **T2 (2 pts) — Bannière de debug**

  * **Masquez** la bannière “DEBUG” dans `MaterialApp`.
* **T3 (6 pts) — Thème clair lisible**

  * Activez **Material 3** (déjà présent).
  * Utilisez `colorSchemeSeed: Colors.blue` pour générer la palette.
  * Définissez `brightness: Brightness.light`.
  * **Interdit** : `primarySwatch` seul.
* **T4 (8 pts) — AppBar & body**

  * Conservez la page `PageAccueil`.
  * Remplacez la couleur codée en dur par `Theme.of(context).colorScheme.primary`.
  * Assurez la **lisibilité** des textes (clair).
* **T5 (6 pts) — SnackBar sur le FAB**

  * Au clic du `FloatingActionButton`, affichez un SnackBar : **“Action exécutée !”**.
* **T6 (10 pts) — Interaction sur une Card**

  * Dans `CarteInfo`, au **tap**, affichez un SnackBar avec le **titre** de la carte (ex. “Carte 1”).
  * Indice : envelopper le contenu avec `InkWell` ou `GestureDetector`.
* **T7 (16 pts) — Navigation**

  * Créez `PageDetail(titre: String)` (Stateless).
  * Depuis la **deuxième carte**, au tap, naviguez vers `PageDetail` et affichez `titre` en grand.
  * Le bouton “Retour” provient de l’`AppBar`.

**Barème total : 40 pts**
T1:2 • T2:2 • T3:6 • T4:8 • T5:6 • T6:10 • T7:16

---

## Rendu attendu

* Un **projet Flutter compilable**.
* **2 captures** : page d’accueil + page détail.
* **Mini-rapport (5–8 lignes)** : rôle de l’import, widgets utilisés, navigation.

---

## Squelette à compléter (blanks `______`)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApplication());
}

/// Widget principal de l'application (Stateless)
class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Démonstration Flutter',
      // TODO(T2): cacher la bannière de debug
      debugShowCheckedModeBanner: ______, // <-- T2

      theme: ThemeData(
        // TODO(T3): utiliser colorSchemeSeed + brightness (thème clair lisible)
        useMaterial3: true,
        colorSchemeSeed: ______,          // <-- T3 (ex: Colors.blue)
        brightness: ______,               // <-- T3 (ex: Brightness.light)

        // ❌ À NE PAS UTILISER : primarySwatch seul
        // primarySwatch: Colors.blue,
      ),

      home: const PageAccueil(),
    );
  }
}

/// Page d'accueil avec plusieurs composants graphiques (Stateless)
class PageAccueil extends StatelessWidget {
  const PageAccueil({super.key});

  void _showSnack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary; // utile pour T4

    return Scaffold(
      appBar: AppBar(
        title: const Text('Démonstration Stateless Widgets'),
        // TODO(T4): utiliser la couleur primaire du thème au lieu d'une couleur codée en dur
        backgroundColor: ______, // <-- T4 (ex: primary)
        centerTitle: true,
      ),

      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Titre principal
            TitreSection(titre: 'Bienvenue dans Flutter!'),
            SizedBox(height: 20),

            // Section avec container coloré
            ContainerColore(
              couleur: Colors.blue,
              texte: 'Container avec fond bleu',
            ),
            SizedBox(height: 20),

            // Section avec Row
            SectionRow(),
            SizedBox(height: 20),

            // Section avec Cards
            SectionCartes(),
            SizedBox(height: 20),

            // Section avec icônes
            SectionIcones(),
            SizedBox(height: 20),

            // Bouton décoratif
            BoutonDecoratif(texte: 'Bouton Exemple'),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        // TODO(T5): afficher un SnackBar “Action exécutée !”
        onPressed: () {
          ______; // <-- T5 (ex: _showSnack(context, 'Action exécutée !'))
        },
        tooltip: 'Action',
        child: const Icon(Icons.add_alert),
      ),
    );
  }
}

/// Widget pour afficher un titre (Stateless)
class TitreSection extends StatelessWidget {
  final String titre;
  const TitreSection({super.key, required this.titre});

  @override
  Widget build(BuildContext context) {
    return Text(
      titre,
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        // Bonus : utilisez la couleur du thème
        color: Theme.of(context).colorScheme.primary,
      ),
      textAlign: TextAlign.center,
    );
  }
}

/// Widget Container avec couleur personnalisée (Stateless)
class ContainerColore extends StatelessWidget {
  final Color couleur;
  final String texte;
  const ContainerColore({super.key, required this.couleur, required this.texte});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: couleur,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        texte,
        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
    );
  }
}

/// Section démontrant l'utilisation de Row (Stateless)
class SectionRow extends StatelessWidget {
  const SectionRow({super.key});

  @override
  Widget build(BuildContext context) {
    Widget box(Color c, String t) => Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(t, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Exemple de Row (disposition horizontale):',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            box(Colors.red, 'Box 1'),
            box(Colors.green, 'Box 2'),
            box(Colors.orange, 'Box 3'),
          ],
        ),
      ],
    );
  }
}

/// Section avec des cartes (Stateless)
class SectionCartes extends StatelessWidget {
  const SectionCartes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Exemples de Cards:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        CarteInfo(
          titre: 'Carte 1',
          sousTitre: 'Description de la carte 1',
          icone: Icons.star,
          couleurIcone: Colors.amber,
          // TODO(T6): au tap => SnackBar avec le titre
        ),
        SizedBox(height: 10),
        CarteInfo(
          titre: 'Carte 2',
          sousTitre: 'Description de la carte 2 (tap => aller à la PageDetail)',
          icone: Icons.favorite,
          couleurIcone: Colors.red,
          // TODO(T7): au tap => Navigator.push vers PageDetail(titre: 'Carte 2')
        ),
      ],
    );
  }
}

/// Widget Carte personnalisée (Stateless)
class CarteInfo extends StatelessWidget {
  final String titre;
  final String sousTitre;
  final IconData icone;
  final Color couleurIcone;

  const CarteInfo({
    super.key,
    required this.titre,
    required this.sousTitre,
    required this.icone,
    required this.couleurIcone,
  });

  @override
  Widget build(BuildContext context) {
    final card = Card(
      elevation: 2,
      child: ListTile(
        leading: Icon(icone, color: couleurIcone, size: 36),
        title: Text(titre, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(sousTitre),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );

    // TODO(T6 & T7):
    // - Si titre == "Carte 1" : afficher un SnackBar(titre)
    // - Si titre == "Carte 2" : Navigator.push vers PageDetail(titre: titre)
    return ______( // <-- T6/T7 (ex: InkWell or GestureDetector)
      onTap: () {
        if (titre == 'Carte 1') {
          ______; // <-- T6 (ex: ScaffoldMessenger... SnackBar(titre))
        } else if (titre == 'Carte 2') {
          ______; // <-- T7 (ex: Navigator.of(context).push(...PageDetail...))
        }
      },
      child: card,
    );
  }
}

/// Section avec des icônes (Stateless)
class SectionIcones extends StatelessWidget {
  const SectionIcones({super.key});

  @override
  Widget build(BuildContext context) {
    Widget iconWithLabel(IconData icone, String label, Color couleur) => Column(
          children: [
            Icon(icone, size: 40, color: couleur),
            const SizedBox(height: 5),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Collection d\'icônes:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            iconWithLabel(Icons.home, 'Home', Colors.blue),
            iconWithLabel(Icons.person, 'Profil', Colors.green),
            iconWithLabel(Icons.settings, 'Paramètres', Colors.grey),
            iconWithLabel(Icons.notifications, 'Alertes', Colors.orange),
          ],
        ),
      ],
    );
  }
}

/// Bouton décoratif (Stateless)
class BoutonDecoratif extends StatelessWidget {
  final String texte;
  const BoutonDecoratif({super.key, required this.texte});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            // Bonus : SnackBar “Bouton Exemple cliqué”
            // ScaffoldMessenger.of(context).showSnackBar( ... );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            child: Center(
              child: Text(
                texte,
                style: const TextStyle(
                  color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// TODO(T7): créer la page de détail (Stateless)
class PageDetail extends StatelessWidget {
  final String titre;
  const PageDetail({super.key, required this.titre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(______)), // <-- T7 (ex: titre)
      body: Center(
        child: Text(
          ______, // <-- T7 (ex: titre)
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
```



## Gabarit de mini-rapport (5–8 lignes)

```
Titre : Exercice 2 – Premiers pas Flutter (Stateless)
Nom – Groupe – Date

1) Rôle de l’import material.dart :
   [...]
2) Widgets clés utilisés : MaterialApp, Scaffold, AppBar, Card, ListTile, FloatingActionButton, InkWell/GestureDetector.
3) Thème : Material 3 + colorSchemeSeed (blue), brightness light, debug banner masquée.
4) Interactions : SnackBar sur FAB et Carte 1 ; navigation vers PageDetail depuis Carte 2.
```

## Rappels de commandes

```bash
flutter pub get
flutter run
flutter doctor -v
```
