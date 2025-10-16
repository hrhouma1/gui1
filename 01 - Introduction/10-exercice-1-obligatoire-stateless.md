# Consigne — **Analysez** le projet Flutter « Stateless Widgets »

> **But** : analyser en profondeur un projet Flutter construit **uniquement** avec des *Stateless Widgets* (structure, composition, layout, Material, stylisation), sans ajouter d’état ni réécrire l’application.

## Lien: 
- https://github.com/hrhouma1/flutter-demo-1-stateless

## Tâches d’analyse (à réaliser **sans coder de nouvelles features**)

1. **Lancer et constater**

* Exécutez le projet (`flutter pub get`, `flutter run`).
* Joignez 1 capture d’écran de l’app en fonctionnement.

2. **Cartographier la structure**

* Décrivez le rôle de `lib/main.dart`, `pubspec.yaml`, `android/`, `ios/`, `web/`, `test/`.
* Relevez les dépendances déclarées dans `pubspec.yaml` et leur utilité.

3. **Inventaire des widgets**

* Listez tous les *widgets de base*, *widgets de layout*, *widgets Material* et *widgets personnalisés* rencontrés.
* Pour chaque widget personnalisé (ex. `TitreSection`, `ContainerColore`, `SectionRow`, `CarteInfo`, `SectionIcones`, `BoutonDecoratif`) :

  * Indiquez son rôle, ses **paramètres**, et **où** il est instancié.

4. **Arbre de composition (widget tree)**

* Produisez un schéma (ASCII ou image) montrant la hiérarchie principale.

  * Exemple attendu :

    ```
    MaterialApp
    └─ Scaffold
       ├─ AppBar
       ├─ FloatingActionButton
       └─ SingleChildScrollView
          └─ Column
             ├─ TitreSection
             ├─ ContainerColore(Text)
             ├─ SectionIcones(...)
             ├─ SectionRow(ContainerColore, ContainerColore, ContainerColore)
             ├─ CarteInfo(...)
             └─ BoutonDecoratif
    ```

5. **Layout & contraintes**

* Expliquez **pourquoi** `Column/Row/Wrap/SizedBox/Padding/SingleChildScrollView` ont été choisis.
* Décrivez l’alignement, l’espacement, la responsivité minimale observée.

6. **Material & UX**

* Identifiez les usages de `AppBar`, `Card`, `ListTile`, `FloatingActionButton`.
* Commentez la cohérence Material (icônes, élévation, affordance du FAB).

7. **Styling & thématisation**

* Relevez les usages de `TextStyle`, `BoxDecoration`, `BorderRadius`, `BoxShadow`, `LinearGradient`.
* Dites ce qui relève du **thème global** vs. du **style local** et proposez 1 amélioration (ex. centraliser certaines couleurs).

8. **Stateless = immuable**

* Montrez **où** l’absence d’état se voit (pas de `setState`, données fixes).
* Donnez **2 cas** où un *Stateful Widget* serait justifié (ex. compteur, chargement async), **sans** les implémenter.

9. **Qualité & accessibilité (A11y)**

* Repérez 2–3 points de lisibilité (noms, factorisation, petites fonctions).
* Proposez 2 améliorations A11y (ex. `Semantics`, contrastes, tailles minimales, labels d’icônes).

10. **Performance (haut niveau)**

* Expliquez brièvement l’impact positif des stateless sur le **rebuild**.
* Indiquez 1–2 micro-optimisations potentielles (ex. `const` devant les widgets immuables).


## Livrables

* **Rapport PDF (2–3 pages)** incluant :

  * Capture d’écran de l’app lancée.
  * Schéma du **widget tree**.
  * Réponses structurées aux 10 points ci-dessus.
* **Annexe** : sorties de `flutter doctor -v` (copier-coller lisible).


## Barème (10 points)

| Critère                                                    | Pts |
| ---------------------------------------------------------- | --: |
| Exécution + capture d’écran                                |   1 |
| Structure & `pubspec.yaml`                                 |   2 |
| Inventaire des widgets + paramètres                        |   2 |
| Widget tree clair et fidèle                                |   2 |
| Analyse (layout, Material, styling, stateless, A11y, perf) |   3 |



## Contraintes

* **Ne pas** ajouter d’état ni de packages externes.
* **Ne pas** modifier la logique : l’objectif est **d’analyser**, pas de développer.
* Citez précisément les widgets/fichiers lorsque vous argumentez.

<br/>

## Gabarit (à copier dans votre rapport)

```text
Titre : Analyse du projet Flutter — Stateless Widgets
Nom – Groupe – Date

1. Lancement et constat (capture incluse)
2. Structure du projet (+ rôle des dossiers/fichiers clés)
3. pubspec.yaml (dépendances, SDK, section flutter)
4. Inventaire des widgets (tableau : nom | rôle | paramètres | où utilisé)
5. Widget tree (schéma)
6. Layout et contraintes (choix, alignement, responsivité)
7. Material & UX (cohérence, affordance)
8. Styling & thème (global vs local, améliorations)
9. Stateless & scénarios nécessitant Stateful (sans coder)
10. Qualité, A11y, performance (const, semantics, etc.)
Annexe : sortie flutter doctor -v
```


<br/>

## Rappels commandes utiles #1

```bash
flutter pub get
flutter run
flutter doctor -v
```

<br/>

## Rappels commandes utiles #2


```bash
# Version Flutter
flutter --version

# Configuration complète
flutter doctor -v

# Périphériques disponibles
flutter devices

# Créer et ouvrir le projet (si aucun dépôt fourni)
flutter create hello_world
cd hello_world

# Lancer l'application
flutter run

# (Après modification de pubspec.yaml)
flutter pub get
```

