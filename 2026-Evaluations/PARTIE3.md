# Exercice Pratique : Développer avec StreamBuilder

## Instructions

Dans cet exercice, vous allez **DÉVELOPPER** (pas seulement analyser) du code avec StreamBuilder.

**Objectif** : Créer 3 applications Flutter fonctionnelles utilisant StreamBuilder.


# PARTIE 1 : StreamBuilder Compteur (10 points)

### Énoncé

Créez une application Flutter avec un **compteur** qui s'incrémente toutes les secondes.

**Spécifications** :

1. Créer un Stream qui émet un nombre entier chaque seconde (0, 1, 2, 3...)
2. Utiliser StreamBuilder pour afficher ce nombre
3. Le compteur doit commencer à 0
4. L'interface doit afficher :
   - Le nombre actuel en grand (taille 48)
   - Un texte "Compteur" au-dessus
   - Un CircularProgressIndicator pendant l'attente de la première valeur

**Contraintes techniques** :
- Le Stream doit être créé dans `initState()` (pas dans build)
- Utiliser `StreamBuilder<int>`
- Gérer l'état `ConnectionState.waiting`
- Utiliser `const` où possible

**Interface attendue** :
```
┌─────────────────────┐
│      Compteur       │
│                     │
│         42          │  ← Taille 48, gras
│                     │
└─────────────────────┘
```


### Votre code ici :

```dart
import 'package:flutter/material.dart';

// TODO: Développez votre code ici

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  // TODO: Déclarez votre Stream ici
  
  
  @override
  void initState() {
    super.initState();
    // TODO: Initialisez votre Stream ici
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compteur StreamBuilder'),
      ),
      body: Center(
        child: // TODO: Créez votre StreamBuilder ici
        
        
        
        
        
        
        
        
        
      ),
    );
  }
}
```

---

### Grille de notation (10 points)

- [ ] Stream créé correctement avec `Stream.periodic` (2 pts)
- [ ] Stream déclaré dans la classe (late final) (1 pt)
- [ ] Stream initialisé dans initState() (1 pt)
- [ ] StreamBuilder avec type `<int>` correct (1 pt)
- [ ] Gestion de ConnectionState.waiting (2 pts)
- [ ] Affichage du nombre avec bonne taille (1 pt)
- [ ] Code compile sans erreur (1 pt)
- [ ] Utilisation appropriée de const (1 pt)




<br/>
<br/>

# PARTIE 2 : StreamBuilder Date et Heure (10 points)

### Énoncé

Créez une **horloge digitale** qui affiche la date et l'heure actuelles, mises à jour chaque seconde.

**Spécifications** :

1. Créer un Stream qui émet `DateTime.now()` chaque seconde
2. Utiliser StreamBuilder pour afficher :
   - L'heure au format : `14:35:27`
   - La date au format : `Mercredi 5 Novembre 2025`
3. L'horloge doit se mettre à jour en temps réel
4. Afficher l'heure immédiatement (utiliser `initialData`)

**Contraintes techniques** :
- Utiliser `StreamBuilder<DateTime>`
- Formater l'heure avec `padLeft(2, '0')` pour avoir 14:05 et pas 14:5
- Gérer tous les états (waiting, error, data)
- L'heure doit être en gros (taille 48)
- La date en plus petit (taille 18)

**Interface attendue** :
```
┌──────────────────────────┐
│                          │
│        14:35:27          │  ← Taille 48, gras
│                          │
│  Mercredi 5 Novembre     │  ← Taille 18
│                          │
└──────────────────────────┘
```

**Aide** : Pour formater la date, vous pouvez utiliser :
```dart
// Jours de la semaine
final days = ['Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche'];
final dayName = days[dateTime.weekday - 1];

// Mois
final months = ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 
                'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'];
final monthName = months[dateTime.month - 1];
```

---

### Votre code ici :

```dart
import 'package:flutter/material.dart';

class ClockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ClockScreen(),
    );
  }
}

class ClockScreen extends StatefulWidget {
  @override
  _ClockScreenState createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  // TODO: Déclarez votre Stream de DateTime
  
  
  // TODO: Créez la liste des jours et mois
  
  
  @override
  void initState() {
    super.initState();
    // TODO: Initialisez votre Stream
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horloge Digitale'),
      ),
      body: Center(
        child: // TODO: Créez votre StreamBuilder<DateTime>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
      ),
    );
  }
}
```

---

### Grille de notation (10 points)

- [ ] Stream DateTime créé avec Stream.periodic (2 pts)
- [ ] Stream initialisé dans initState() (1 pt)
- [ ] StreamBuilder avec type `<DateTime>` (1 pt)
- [ ] initialData utilisé (1 pt)
- [ ] Formatage de l'heure correct (HH:MM:SS) (2 pts)
- [ ] Formatage de la date en français (1 pt)
- [ ] Gestion des états (1 pt)
- [ ] Code compile et fonctionne (1 pt)

---



<br/>
<br/>

# PARTIE 3 : StreamBuilder avec Firestore (10 points)

### Énoncé

Créez une application qui affiche **en temps réel** une liste de tâches depuis Firestore.

**Spécifications** :

1. Créer une collection Firestore nommée 'tasks'
2. Utiliser StreamBuilder pour écouter cette collection
3. Afficher chaque tâche dans une ListTile
4. Gérer TOUS les états :
   - Chargement : CircularProgressIndicator
   - Erreur : Message d'erreur en rouge
   - Liste vide : "Aucune tâche" avec icône
   - Données : ListView des tâches

5. Ajouter un bouton FloatingActionButton pour ajouter une tâche

**Structure de document Firestore** :
```javascript
{
  "title": "Faire les courses",
  "completed": false,
  "createdAt": Timestamp
}
```

**Interface attendue** :
```
┌──────────────────────────────┐
│  Mes Tâches            [+]   │
├──────────────────────────────┤
│ ☐ Faire les courses          │
│ ☑ Étudier StreamBuilder      │
│ ☐ Créer l'application         │
└──────────────────────────────┘
```

---

### Votre code ici :

```dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TasksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TasksScreen(),
    );
  }
}

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  // TODO: Déclarez votre instance Firestore
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes Tâches'),
      ),
      body: // TODO: Créez votre StreamBuilder<QuerySnapshot>
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Ajoutez une tâche à Firestore
          
          
          
          
          
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
```

---

### Grille de notation (10 points)

- [ ] Instance Firestore créée (1 pt)
- [ ] StreamBuilder avec bon type (1 pt)
- [ ] Stream Firestore correct (.snapshots()) (1 pt)
- [ ] Gestion de hasError (1 pt)
- [ ] Gestion de ConnectionState.waiting (1 pt)
- [ ] Gestion de liste vide (1 pt)
- [ ] Affichage des tâches dans ListView (2 pts)
- [ ] Fonction addTask fonctionnelle (1 pt)
- [ ] Code compile sans erreur (1 pt)




<br/>
<br/>

# BONUS : Défis supplémentaires (points bonus)

# Défi 1 : Compteur avec pause (2 points)

Améliorez le compteur (Partie 1) pour ajouter :
- Un bouton "Pause" qui arrête le compteur
- Un bouton "Reprendre" qui le relance
- Un bouton "Reset" qui remet à 0

**Indice** : Utilisez un `StreamController<int>` au lieu de `Stream.periodic`

<br/>
<br/>


# Défi 2 : Horloge avec fuseaux horaires (2 points)

Améliorez l'horloge (Partie 2) pour afficher :
- L'heure locale
- L'heure UTC
- L'heure à New York (-5h)

<br/>
<br/>

# Défi 3 : Tâches avec filtres (3 points)

Améliorez la liste de tâches (Partie 3) pour ajouter :
- Filtrer : Toutes / Complétées / À faire
- Marquer une tâche comme complétée en cliquant
- Supprimer une tâche

