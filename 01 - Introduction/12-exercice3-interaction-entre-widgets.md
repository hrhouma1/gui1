# Exercice 3 — Création d’une nouvelle application Flutter avec **widgets stateless**-Actions → Réactions

> **But** : Concevoir une petite app *sans état interne* (stateless uniquement) avec **trois écrans** (Accueil, Détail, Paramètres), en décrivant clairement :
>
> 1. **L’arborescence des widgets** (Widget Tree)
> 2. **La navigation entre écrans** (flux “tap” → écran)
> 3. **Les interactions utilisateur** → **réactions UI** (SnackBar, Navigation)

---

## Instructions générales

1. Produire **l’arborescence des widgets** pour les trois écrans (Accueil, Détail, Paramètres).
2. Décrire **les flux de navigation** (qui tape quoi, vers quel écran).
3. Lier **chaque interaction** (tap) à une **réaction UI** (SnackBar, push navigation).

**Contraintes :**

* Utilisez des **noms de widgets Flutter réels** : `MaterialApp`, `Scaffold`, `AppBar`, `SingleChildScrollView`, `Column`, `Row`, `Card`, `Icon`, `FloatingActionButton`, `ListView`, etc.
* **Aucun état interne** (pas de `StatefulWidget`, pas de “Idle/Loading”).
* Navigation : `Navigator.push`/`pop` depuis des **Stateless** (l’événement de tap déclenche la navigation).

---

## Partie 1 — Arborescence des Widgets (ASCII)

> **À faire :** représenter la **structure hiérarchique** de vos trois écrans. Complétez / adaptez les modèles ci-dessous.

```
Écran Accueil
└─ MaterialApp
   └─ Scaffold
      ├─ AppBar (titre: Accueil)
      ├─ Body (SingleChildScrollView)
      │  ├─ Column
      │  │  ├─ Text("Bienvenue")
      │  │  ├─ Container (bandeau info)
      │  │  ├─ Row (3 Cartes)
      │  │  └─ Bouton décoratif
      └─ FloatingActionButton (Icon: add_alert)

Écran Détail
└─ Scaffold
   ├─ AppBar (titre dynamique)
   ├─ Body (Column)
   │  ├─ Image/Hero
   │  ├─ Text descriptif
   │  └─ Row (Boutons d’action)

Écran Paramètres
└─ Scaffold
   ├─ AppBar ("Paramètres")
   └─ Body (ListView)
      ├─ ListTile (Switch Thème)
      └─ ListTile (Radio Langue)
```

---

## Partie 2 — Navigation entre écrans (flux “tap” → écran)

> **À faire :** lister les **transitions** déclenchées par l’utilisateur.

```
Accueil --(tap Carte 2)--> Détail
Accueil --(tap Icon Paramètres)--> Paramètres
Détail --(AppBar Back)--> Accueil
Paramètres --(AppBar Back)--> Accueil
```

---

## Annexes — Interactions utilisateur → Réactions UI (Mermaid)

### Accueil

```mermaid
flowchart TD
  %% ECRAN ACCUEIL (vertical)
  direction TB
  MaterialApp --> A_Scaffold[Scaffold]
  A_Scaffold --> A_AppBar[AppBar: Accueil]
  A_Scaffold --> A_Body[Body: SingleChildScrollView]
  A_Scaffold --> A_FAB[FAB: add_alert]
  A_Body --> A_Column[Column]
  A_Column --> A_Titre[Text: Bienvenue]
  A_Column --> A_Bandeau[Container: bandeau info]
  A_Column --> A_Grille[Row/Wrap: 3 Cards]
  A_Column --> A_Bouton[Bouton décoratif]
```

### Détail

```mermaid
flowchart TD
  direction TB
  D_Scaffold[Scaffold] --> D_AppBar[AppBar: titre dynamique]
  D_Scaffold --> D_Body[Body: Column]
  D_Body --> D_Image[Image/Hero]
  D_Body --> D_Texte[Text descriptif]
  D_Body --> D_Actions[Row: Boutons d'action]
```

### Paramètres

```mermaid
flowchart TD
  direction TB
  P_Scaffold[Scaffold] --> P_AppBar[AppBar: Paramètres]
  P_Scaffold --> P_List[ListView]
  P_List --> P_Switch[Switch: Thème]
  P_List --> P_Radio[Radio: Langue]
```

---

## Vision “1 seul bloc en pile” (3 sous-graphes)

```mermaid
flowchart TD
  %% Forcer l’empilement vertical via une chaîne
  A_anchor --> D_anchor --> P_anchor

  subgraph Accueil
    direction TB
    MaterialApp --> A_Scaffold[Scaffold]
    A_Scaffold --> A_AppBar[AppBar: Accueil]
    A_Scaffold --> A_Body[Body: SingleChildScrollView]
    A_Scaffold --> A_FAB[FAB: add_alert]
    A_Body --> A_Column[Column]
    A_Column --> A_Titre[Text: Bienvenue]
    A_Column --> A_Bandeau[Container: bandeau info]
    A_Column --> A_Grille[Row/Wrap: 3 Cards]
    A_Column --> A_Bouton[Bouton décoratif]
  end

  subgraph Detail
    direction TB
    D_Scaffold[Scaffold] --> D_AppBar[AppBar: titre dynamique]
    D_Scaffold --> D_Body[Body: Column]
    D_Body --> D_Image[Image/Hero]
    D_Body --> D_Texte[Text descriptif]
    D_Body --> D_Actions[Row: Boutons]
  end

  subgraph Parametres
    direction TB
    P_Scaffold[Scaffold] --> P_AppBar[AppBar: Paramètres]
    P_Scaffold --> P_List[ListView]
    P_List --> P_Switch[Switch: Thème]
    P_List --> P_Radio[Radio: Langue]
  end
```

---

## Arborescence des Widgets (3 sous-graphes)

```mermaid
flowchart TD
  %% ECRAN ACCUEIL
  subgraph Accueil
    MaterialApp --> A_Scaffold[Scaffold]
    A_Scaffold --> A_AppBar[AppBar: Accueil]
    A_Scaffold --> A_Body[Body: SingleChildScrollView]
    A_Scaffold --> A_FAB[FAB: add_alert]
    A_Body --> A_Column[Column]
    A_Column --> A_Titre[Text: Bienvenue]
    A_Column --> A_Bandeau[Container: bandeau info]
    A_Column --> A_Grille[Row/Wrap: 3 Cards]
    A_Column --> A_Bouton[Bouton décoratif]
  end

  %% ECRAN DETAIL
  subgraph Detail
    D_Scaffold[Scaffold]
    D_Scaffold --> D_AppBar[AppBar: titre dynamique]
    D_Scaffold --> D_Body[Body: Column]
    D_Body --> D_Image[Image/Hero]
    D_Body --> D_Texte[Text descriptif]
    D_Body --> D_Actions[Row: Boutons]
  end

  %% ECRAN PARAMETRES
  subgraph Parametres
    P_Scaffold[Scaffold]
    P_Scaffold --> P_AppBar[AppBar: Paramètres]
    P_Scaffold --> P_List[ListView]
    P_List --> P_Switch[Switch: Thème]
    P_List --> P_Radio[Radio: Langue]
  end
```

---

## Navigation entre écrans (Mermaid)

```mermaid
flowchart LR
  Accueil -- tap Carte 2 --> Detail
  Accueil -- tap Icon Paramètres --> Parametres
  Detail -- AppBar Back --> Accueil
  Parametres -- AppBar Back --> Accueil
```

---

## Interactions UI — Flowchart (Actions → Réactions)








Tu as un bug Mermaid à cause de caractères spéciaux/parenthèses dans le label du nœud `Recompute`. Voici une version **ASCII-safe** (sans accents ni flèches “→”, sans parenthèses dans les labels) qui se rend bien sur GitHub :

```mermaid
flowchart TD
  subgraph Actions
    TapFAB((Tap FAB))
    TapCarte1((Tap Carte 1))
    TapCarte2((Tap Carte 2))
    TapIconParams((Tap Icon Parametres))
    ToggleTheme((Switch Theme))
  end

  subgraph Reactions
    SnackFAB[SnackBar: Action executee]
    SnackC1[SnackBar: Carte 1]
    GoDetail[[Navigator.push -> Detail]]
    GoSettings[[Navigator.push -> Parametres]]
    Recompute[Recompute color scheme - theme clair stateless simule]
  end

  TapFAB --> SnackFAB
  TapCarte1 --> SnackC1
  TapCarte2 --> GoDetail
  TapIconParams --> GoSettings
  ToggleTheme --> Recompute
```

Si tu veux garder les accents et la flèche “→”, évite les parenthèses dans les labels, par exemple :

```mermaid
flowchart TD
  subgraph Actions
    TapFAB((Tap FAB))
    TapCarte1((Tap Carte 1))
    TapCarte2((Tap Carte 2))
    TapIconParams((Tap Icon Paramètres))
    ToggleTheme((Switch Thème))
  end

  subgraph Réactions
    SnackFAB[SnackBar : Action exécutée]
    SnackC1[SnackBar : Carte 1]
    GoDetail[[Navigator.push → Détail]]
    GoSettings[[Navigator.push → Paramètres]]
    Recompute[Recalcul du thème clair stateless simulé]
  end

  TapFAB --> SnackFAB
  TapCarte1 --> SnackC1
  TapCarte2 --> GoDetail
  TapIconParams --> GoSettings
  ToggleTheme --> Recompute
```




## Diagramme de séquence (Mermaid)

```mermaid
sequenceDiagram
  actor U as User
  participant A as Accueil
  participant SM as ScaffoldMessenger
  participant N as Navigator

  U->>A: Tap FAB
  A->>SM: showSnackBar("Action exécutée")

  U->>A: Tap Carte 1
  A->>SM: showSnackBar("Carte 1")

  U->>A: Tap Carte 2
  A->>N: push(Detail, args: titre/id)

  U->>A: Tap Icon Paramètres
  A->>N: push(Paramètres)
```

---

## Livrables

* **PDF (2–3 pages)** :

  * Les **trois arborescences** (ASCII ou images)
  * Le **schéma de navigation** (texte ou Mermaid)
  * Le **mapping interactions → réactions** (Mermaid recommandé)
* **Captures** :

  * Accueil
  * Détail
  * Paramètres
* **Mini-rapport (5–8 lignes)** : widget principaux, logique de navigation, choix UI.

## Barème (40 pts)

* Arborescences précises et complètes (3 écrans) — **14 pts**
* Navigation (flux clairs, aller/retour) — **10 pts**
* Interactions → Réactions (SnackBar/Navigation) — **10 pts**
* Qualité de présentation (lisibilité, cohérence, respect des contraintes) — **6 pts**

---

## Rappels commandes

```bash
flutter create pratique2_stateless
cd pratique2_stateless
flutter pub get
flutter run
flutter doctor -v
```

> Astuce : Même **sans Stateful**, vous pouvez **déclencher** SnackBar et Navigation depuis des *handlers* (onTap/onPressed) dans des **Stateless** en utilisant `ScaffoldMessenger.of(context)` et `Navigator.of(context)`.
