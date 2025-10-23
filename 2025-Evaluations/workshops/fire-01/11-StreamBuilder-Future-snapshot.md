

# 01 - Explication complète du widget `StreamBuilder` (Flutter)

Le widget `StreamBuilder` est un composant **réactif** de Flutter qui permet d’écouter un **flux de données (stream)** et de reconstruire automatiquement une partie de l’interface utilisateur à chaque fois que de **nouvelles données** arrivent. C’est un outil essentiel lorsqu’on travaille avec des bases de données **en temps réel**, comme **Cloud Firestore**, ou avec des flux continus d’événements, comme des capteurs, des sockets, ou des mises à jour d’état.



### 01.1. Comment fonctionne `StreamBuilder` ?

Un `StreamBuilder` reçoit en paramètre :

* un **flux de données** via `stream:`
* une **fonction de construction** via `builder:`

À chaque nouvelle donnée reçue, Flutter appelle la fonction `builder` et **reconstruit l’interface graphique** avec les nouvelles valeurs contenues dans l’objet `snapshot`.



### 01.2. Structure typique :

```dart
StreamBuilder<QuerySnapshot>(
  stream: FirebaseFirestore.instance.collection('ma_collection').snapshots(),
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      // Les données sont disponibles, on peut les afficher
      return ...;
    } else if (snapshot.hasError) {
      // Une erreur s’est produite
      return Text('Erreur : ${snapshot.error}');
    } else {
      // Les données sont en cours de chargement
      return CircularProgressIndicator();
    }
  },
)
```



### 01.3. Que contient le `snapshot` dans un `StreamBuilder` ?

* `snapshot.hasData` → les données sont prêtes (on peut utiliser `snapshot.data`)
* `snapshot.hasError` → une erreur est survenue dans le flux
* `snapshot.connectionState` → état de la connexion (`waiting`, `active`, `done`, etc.)



### 01.4 Cas d’usage courant avec Firestore :

```dart
stream: FirebaseFirestore.instance
        .collection('recettes')
        .where('categorie', isEqualTo: 'Dinner')
        .snapshots()
```

* Ce flux renvoie automatiquement toutes les recettes de la catégorie "Dinner"
* Chaque fois qu’un document est ajouté, modifié ou supprimé dans Firestore, le `StreamBuilder` **reçoit la nouvelle version** et met l’interface à jour **sans action manuelle**


### 01.5. Pourquoi utiliser `StreamBuilder` ?

* Pour **réagir automatiquement aux changements** dans une source de données
* Pour éviter de **recharger manuellement** les écrans ou d’écrire du code répétitif
* Pour garantir que l’interface est toujours **synchronisée avec la base de données**



### 01.6. À retenir

| Élément       | Rôle                                                                 |
| ------------- | -------------------------------------------------------------------- |
| `stream:`     | Fournit un flux de données en continu                                |
| `builder:`    | Fonction qui définit comment construire l’interface selon `snapshot` |
| `snapshot`    | Contient l’état actuel du flux : données, erreurs, chargement        |
| Usage typique | Cloud Firestore, capteurs, WebSocket, données d’API en direct        |

Le `StreamBuilder` est un composant fondamental de Flutter pour toute application qui repose sur des **données dynamiques ou évolutives**.

<br/>

# 02 - Explication du widget `FutureBuilder` en Flutter

Le widget `FutureBuilder` est un composant Flutter qui permet de **gérer l’affichage d’un résultat asynchrone**. Contrairement à `StreamBuilder` (qui écoute un **flux continu**), `FutureBuilder` est utilisé pour des **opérations ponctuelles** qui retournent une seule fois un résultat, généralement après un délai, comme :

* une requête vers une base de données ou une API REST,
* la lecture d’un fichier,
* l’initialisation d’un service,
* une opération de chargement locale (par exemple, avec `SharedPreferences` ou SQLite),
* ou tout traitement qui retourne un objet `Future`.



## 02.1. Qu’est-ce qu’un `Future` ?

Un `Future` est une promesse de valeur disponible **dans le futur**, c’est-à-dire **pas immédiatement**. Par exemple, une fonction qui attend une réponse d’un serveur renvoie un `Future<String>`. On ne connaît pas encore le résultat au moment de l'appel, mais on l’obtiendra plus tard.



## 02.2. Structure typique de `FutureBuilder`

```dart
FutureBuilder<String>(
  future: getWelcomeMessage(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator(); // En attente
    } else if (snapshot.hasError) {
      return Text("Erreur : ${snapshot.error}"); // En cas d'erreur
    } else if (snapshot.hasData) {
      return Text("Message : ${snapshot.data}"); // Résultat reçu
    } else {
      return Text("Aucun résultat");
    }
  },
)
```



## 02.3. Paramètres essentiels

* `future:` → une fonction asynchrone qui retourne un `Future`
* `builder:` → une fonction appelée automatiquement par Flutter à chaque changement d’état du `Future`. Elle reçoit un **`snapshot`**, qui décrit l’état actuel.



## 02.4. Le `snapshot` dans `FutureBuilder`

L’objet `snapshot` contient des informations sur l'état de l’appel :

| Propriété                  | Signification                                         |
| -------------------------- | ----------------------------------------------------- |
| `snapshot.connectionState` | État actuel de la connexion : `waiting`, `done`, etc. |
| `snapshot.hasData`         | Vrai si le `Future` a renvoyé un résultat             |
| `snapshot.hasError`        | Vrai si une erreur s’est produite                     |
| `snapshot.data`            | Le résultat du `Future`, si disponible                |
| `snapshot.error`           | L’erreur retournée, si présente                       |



## 02.5. Exemple concret avec Firestore

```dart
FutureBuilder<DocumentSnapshot>(
  future: FirebaseFirestore.instance.collection('users').doc('u123').get(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.hasData) {
      var user = snapshot.data!;
      return Text("Nom : ${user['name']}");
    } else {
      return Text("Erreur ou aucun utilisateur trouvé.");
    }
  },
)
```

Ici, on récupère **une seule fois** un document Firestore (par exemple pour préremplir un formulaire).



## 02.6. Différence avec `StreamBuilder`

| Caractéristique | `FutureBuilder`                      | `StreamBuilder`                            |
| --------------- | ------------------------------------ | ------------------------------------------ |
| Type de source  | `Future` (résultat unique)           | `Stream` (données multiples dans le temps) |
| Exécution       | Une seule fois                       | Continue tant que le stream est actif      |
| Cas d’usage     | Chargement initial, API REST, SQLite | Firestore temps réel, WebSocket, capteurs  |



## 02.7. Bonnes pratiques

* Ne pas appeler une fonction dans `future:` qui crée un nouveau `Future` à chaque build. Utilisez une variable ou l’initier dans `initState()` si nécessaire.
* Toujours vérifier `snapshot.connectionState` pour ne pas afficher un résultat vide pendant le chargement.
* Prévoir des cas de gestion d’erreurs (`snapshot.hasError`).



## 02.8. Conclusion

Le `FutureBuilder` est un outil fondamental pour intégrer **des données asynchrones ponctuelles** dans une interface Flutter. Il permet de **synchroniser automatiquement l’affichage avec l’arrivée des résultats**, tout en gérant proprement les états de **chargement, succès ou erreur**, sans devoir écrire manuellement du code de contrôle complexe.

<br/>

# 03 - snapshot

### 03.1 - Le snapshot en bref

En Flutter, un **`snapshot`** est un objet transmis par un widget comme `StreamBuilder` ou `FutureBuilder`, qui représente **l’état courant d’un flux de données** (ou d’une opération asynchrone). Il contient plusieurs informations utiles : si les données sont prêtes (`hasData`), si une erreur est survenue (`hasError`), si l’opération est en cours (`connectionState`), et bien sûr les **données elles-mêmes**, accessibles via `snapshot.data`. Lorsqu’on utilise Firestore avec `StreamBuilder`, par exemple, `snapshot` contient une collection ou un ensemble de documents mis à jour en temps réel. C’est à travers ce `snapshot` que l’interface peut être reconstruite automatiquement chaque fois que les données changent dans la base, sans intervention manuelle du développeur.

<br/>

###  03.2 - Explication détaillé de `snapshot` en Flutter avec des exemples

Le terme **`snapshot`** désigne, dans Flutter, **l’état courant d’une opération asynchrone**. Il est utilisé dans les widgets réactifs comme `FutureBuilder` et `StreamBuilder`. Chaque fois que Flutter doit construire une interface en fonction d’un `Future` (résultat unique à venir) ou d’un `Stream` (flux continu de données), il passe à la fonction `builder` un objet appelé **`snapshot`**.

Ce `snapshot` contient **tout ce que vous devez savoir** à un instant donné sur l’état de la donnée que vous attendez :

* Est-ce que la donnée est disponible ?
* Est-ce que l’opération a échoué ?
* Est-ce que l’opération est encore en cours ?
* Quel est le résultat actuel ?



### 03.3. Propriétés principales de `snapshot`

| Propriété                  | Description                                                                    |
| -------------------------- | ------------------------------------------------------------------------------ |
| `snapshot.hasData`         | Retourne `true` si des **données valides sont disponibles**                    |
| `snapshot.data`            | Contient la **valeur retournée** (le document, la liste, etc.)                 |
| `snapshot.hasError`        | Retourne `true` si une **erreur est survenue** pendant la récupération         |
| `snapshot.error`           | Contient l’objet **erreur**                                                    |
| `snapshot.connectionState` | Indique l’**état de la connexion** (ex. : `waiting`, `active`, `done`, `none`) |



### 03.4. Exemple avec `FutureBuilder`

```dart
FutureBuilder(
  future: FirebaseFirestore.instance.collection('users').doc('u1').get(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator(); // Données en cours de chargement
    } else if (snapshot.hasError) {
      return Text("Erreur : ${snapshot.error}");
    } else if (snapshot.hasData) {
      final user = snapshot.data;
      return Text("Nom : ${user['name']}");
    } else {
      return Text("Aucune donnée.");
    }
  }
)
```

Dans ce cas :

* `snapshot` est un objet de type `AsyncSnapshot<DocumentSnapshot>`.
* Il est **réévalué automatiquement** par Flutter à chaque changement d’état.



### 03.5. Exemple avec `StreamBuilder`

```dart
StreamBuilder(
  stream: FirebaseFirestore.instance.collection('users').snapshots(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.hasData) {
      final users = snapshot.data!.docs;
      return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Text(users[index]['name']);
        },
      );
    } else {
      return Text("Aucune donnée disponible.");
    }
  }
)
```

Ici, `snapshot` contient :

* La liste des documents de la collection
* L’état de connexion au flux Firestore



## À retenir

* Le `snapshot` est **le reflet d’une opération asynchrone en cours**.
* Il est automatiquement fourni à la fonction `builder` dans un `FutureBuilder` ou `StreamBuilder`.
* Il est essentiel pour **construire une interface réactive**, car il permet d’afficher le bon widget selon :

  * l’état de chargement,
  * la présence d’erreurs,
  * la présence ou non de données.



## Schéma  

- *Shéma explicatif clair** représentant les **transitions possibles d’un `snapshot.connectionState`** dans les widgets `FutureBuilder` et `StreamBuilder`.* 
- *Ce Shéma vous permet de comprendre visuellement le **cycle de vie** d’un `snapshot` et les actions attendues à chaque étape.*





```
                             [Initialisation]
                                  |
                                  v
                        +------------------------+
                        | ConnectionState.none   |
                        | (pas encore de future/ |
                        |  stream attribué)      |
                        +------------------------+
                                  |
                                  v
                        +------------------------+
                        | ConnectionState.waiting|
                        | (en attente d’une      |
                        |  réponse, chargement)  |
                        +------------------------+
                                  |
                    +-------------+--------------+
                    |                            |
                    v                            v
        +------------------------+   +-------------------------+
        | ConnectionState.done   |   | ConnectionState.active  |
        | (futur terminé)        |   | (stream en cours        |
        | (FutureBuilder)        |   |  d’émission)            |
        +------------------------+   +-------------------------+
                                                |
                                                v
                                 +----------------------------+
                                 |         (mise à jour       |
                                 |   à chaque nouvelle donnée)|
                                 +----------------------------+
                                                |
                                                v
                                   (stream fermé => done)
                                                |
                                                v
                                 +----------------------------+
                                 | ConnectionState.done       |
                                 | (Stream terminé aussi)     |
                                 +----------------------------+
```



## Explication des états

| État                      | Utilisé par                   | Signification pédagogique                                                       |
| ------------------------- | ----------------------------- | ------------------------------------------------------------------------------- |
| `ConnectionState.none`    | FutureBuilder / StreamBuilder | Aucun `future` ou `stream` n’a encore été fourni (rare)                         |
| `ConnectionState.waiting` | FutureBuilder / StreamBuilder | Le résultat n’est **pas encore disponible** ; l’opération est en cours          |
| `ConnectionState.active`  | StreamBuilder                 | Le `stream` **émet des données en temps réel** (Firestore, capteurs, etc.)      |
| `ConnectionState.done`    | FutureBuilder / StreamBuilder | L’opération est **terminée** (le `Future` a répondu ou le `Stream` s’est fermé) |



## Recommandations

À chaque étape, vous devriez traiter le `snapshot` comme suit dans votre `builder` :

```dart
builder: (context, snapshot) {
  switch (snapshot.connectionState) {
    case ConnectionState.none:
      return Text("Aucun flux détecté.");
    case ConnectionState.waiting:
      return CircularProgressIndicator(); // Chargement
    case ConnectionState.active:
      return afficherContenu(snapshot.data); // Stream actif
    case ConnectionState.done:
      return afficherContenu(snapshot.data); // Résultat final
  }
}
```

<br/>

