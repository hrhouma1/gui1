# Examen StreamBuilder - 20 Questions



**Instructions** :
- Lisez attentivement chaque question
- Choisissez la meilleure réponse parmi les choix proposés


# PARTIE 1 : CONCEPTS DE BASE (Questions 1-7)

# Question 1
Qu'est-ce qu'un Stream en Flutter ?

A) Une variable qui contient une seule valeur  
B) Un flux de données qui peut émettre plusieurs valeurs au fil du temps  
C) Une méthode pour télécharger des images  
D) Un type de widget pour afficher des listes  



# Question 2
Quelle est la différence principale entre un Stream et un Future ?

A) Future est plus rapide que Stream  
B) Stream émet une seule valeur, Future émet plusieurs valeurs  
C) Future émet une seule valeur, Stream peut émettre plusieurs valeurs  
D) Il n'y a pas de différence  


# Question 3
Quel est le rôle principal de StreamBuilder ?

A) Créer des animations Flutter  
B) Écouter un Stream et reconstruire automatiquement l'UI  
C) Télécharger des fichiers depuis Internet  
D) Gérer la navigation entre les pages  



# Question 4
Dans `StreamBuilder<QuerySnapshot>`, que représente `QuerySnapshot` ?

A) Une photo de l'écran  
B) Le type de données attendues du Stream  
C) Le nom du Stream  
D) Une méthode de Firestore  



# Question 5
Quelle méthode Firestore crée un Stream qui écoute les changements en temps réel ?

A) `.get()`  
B) `.fetch()`  
C) `.snapshots()`  
D) `.listen()`  



# Question 6
Que contient l'objet `snapshot` dans la fonction builder de StreamBuilder ?

A) Seulement les données  
B) L'état de la connexion et les données  
C) Seulement les erreurs  
D) Rien, il est toujours vide  


# Question 7
Quelle propriété permet de vérifier si le Stream a des données disponibles ?

A) `snapshot.isReady`  
B) `snapshot.hasData`  
C) `snapshot.dataAvailable`  
D) `snapshot.exists`  



# PARTIE 2 : GESTION DES ÉTATS (Questions 8-12)

# Question 8
Dans quel ordre devez-vous vérifier les états du snapshot ?

A) hasData → hasError → connectionState  
B) connectionState → hasData → hasError  
C) hasError → connectionState → hasData  
D) L'ordre n'a pas d'importance  



# Question 9
Que devez-vous afficher quand `snapshot.connectionState == ConnectionState.waiting` ?

A) Un message d'erreur  
B) Les données  
C) Un indicateur de chargement (ex: CircularProgressIndicator)  
D) Rien  



# Question 10
Comment gérer le cas où `snapshot.hasError` est true ?

A) Ignorer l'erreur  
B) Afficher un message d'erreur à l'utilisateur  
C) Fermer l'application  
D) Retourner un Container vide  


# Question 11
Que signifie `snapshot.data!` avec le point d'exclamation `!` ?

A) C'est une erreur de syntaxe  
B) Cela signifie que la donnée n'est jamais null à ce point  
C) Cela crée une alerte  
D) Cela supprime la donnée  


# Question 12
Si `snapshot.hasData` est false, que contient `snapshot.data` ?

A) Une liste vide  
B) Un objet vide  
C) null  
D) La dernière valeur reçue  


# PARTIE 3 : CODE PRATIQUE (Questions 13-17)

# Question 13
Dans ce code, quelle est l'erreur ?

```dart
StreamBuilder<int>(
  stream: myStream,
  builder: (context, snapshot) {
    return Text('Valeur: ${snapshot.data}');
  },
)
```

A) Il n'y a pas d'erreur  
B) On n'a pas vérifié si snapshot.hasData avant d'accéder à data  
C) Le type <int> est incorrect  
D) Le stream n'est pas défini  



# Question 14
Quelle est la bonne façon de limiter le nombre de documents Firestore récupérés ?

A) `.limit(20)` avant `.snapshots()`  
B) `.limit(20)` après `.snapshots()`  
C) `.max(20)` avant `.snapshots()`  
D) On ne peut pas limiter  



# Question 15
Que fait l'opérateur `??` dans ce code ?
```dart
final name = recipe['name'] ?? 'Sans nom';
```

A) Division  
B) Fournit une valeur par défaut si recipe['name'] est null  
C) Multiplie les valeurs  
D) Compare deux valeurs  



# Question 16
Pourquoi utiliser `const` devant les widgets dans StreamBuilder ?

A) C'est obligatoire  
B) Pour améliorer les performances  
C) Pour éviter les erreurs  
D) Cela n'a aucun effet  



# Question 17
Dans quel widget devez-vous créer votre Stream pour de meilleures performances ?

A) Dans build() d'un StatelessWidget  
B) Dans initState() d'un StatefulWidget  
C) Dans un constructeur  
D) Directement dans StreamBuilder  


# PARTIE 4 : FIRESTORE ET STREAMBUILDER (Questions 18-20)

# Question 18
Comment filtrer les données Firestore dans un Stream ?

A) Utiliser `.filter()` avant `.snapshots()`  
B) Utiliser `.where()` avant `.snapshots()`  
C) Filtrer dans le builder après avoir reçu les données  
D) On ne peut pas filtrer avec StreamBuilder  



# Question 19
Combien de fois le builder de StreamBuilder est-il appelé ?

A) Une seule fois au démarrage  
B) À chaque fois que le Stream émet une nouvelle valeur  
C) Seulement quand l'utilisateur scroll  
D) Jamais, il est statique  



# Question 20
Quelle est la bonne pratique pour afficher une liste vide dans Firestore ?

A) Ne rien afficher  
B) Afficher un CircularProgressIndicator  
C) Afficher un message informatif (ex: "Aucune recette disponible")  
D) Afficher une erreur  



# FEUILLE DE RÉPONSES

Inscrivez vos réponses ci-dessous avant de consulter les corrections.

| Question | Votre réponse | Points |
|----------|---------------|--------|
| 1 | _____ | /1 |
| 2 | _____ | /1 |
| 3 | _____ | /1 |
| 4 | _____ | /1 |
| 5 | _____ | /1 |
| 6 | _____ | /1 |
| 7 | _____ | /1 |
| 8 | _____ | /1 |
| 9 | _____ | /1 |
| 10 | _____ | /1 |
| 11 | _____ | /1 |
| 12 | _____ | /1 |
| 13 | _____ | /1 |
| 14 | _____ | /1 |
| 15 | _____ | /1 |
| 16 | _____ | /1 |
| 17 | _____ | /1 |
| 18 | _____ | /1 |
| 19 | _____ | /1 |
| 20 | _____ | /1 |
| **TOTAL** | | **/20** |

