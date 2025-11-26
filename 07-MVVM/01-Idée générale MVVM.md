
### 1. Idée générale MVVM (version très simple)

En Flutter, tu peux voir MVVM comme ceci :

```text
+------------+      +------------+      +------------+
|   VIEW     | ---> | VIEWMODEL  | ---> |  MODEL     |
| (Widget)   |      | (logique)  |      | (données)  |
+------------+      +------------+      +------------+
       ^                    ^                  |
       |                    |                  v
       +--------------------+          (API, DB, etc.)
```

* **VIEW** : tes widgets (écrans, boutons, textes).
* **VIEWMODEL** : la logique (quoi faire quand on clique, quel texte afficher).
* **MODEL** : les données (classes Dart, accès API, base de données).

---

### 2. Version Flutter ultra concrète

Imagine un écran qui affiche une liste d’articles.

```text
+----------------------+
|      HomePage        |   <-- VIEW (Widget)
|  (Scaffold, ListView)|
+----------+-----------+
           |
           v
+----------------------+
|   HomeViewModel      |   <-- VIEWMODEL
|  - liste d’articles  |
|  - isLoading         |
|  - loadArticles()    |
+----------+-----------+
           |
           v
+----------------------+
|   ArticleRepository  |   <-- MODEL (données)
|  - getArticles()     |
+----------+-----------+
           |
           v
   [ API / JSON / DB ]
```

---

### 3. Structure de fichiers minimale

```text
lib/
  ui/
    home_page.dart          // VIEW
  viewmodels/
    home_view_model.dart    // VIEWMODEL
  data/
    article_repository.dart // MODEL (accès données)
  models/
    article.dart            // Classe Article
```

---

### 4. Comment ça parle ensemble (en français simple)

1. **HomePage** (VIEW) affiche l’interface.
2. Quand l’app démarre, **HomePage** demande à **HomeViewModel** :
   « Charge-moi les articles ».
3. **HomeViewModel** appelle **ArticleRepository** :
   « Donne-moi les données ».
4. **ArticleRepository** va chercher les données (API, DB…).
5. Les données reviennent vers **HomeViewModel**, qui met à jour ses variables.
6. La **VIEW** (HomePage) écoute le **ViewModel** et se reconstruit avec les nouvelles données.


<br/>

# Annexe - exemple simple d’architecture **MVVM en Flutter**

```text
+------------------------------------------------------+
|                    PRESENTATION                      |
|                 (Flutter UI / View)                  |
+------------------------------------------------------+
|                                                      |
|  +----------------------+        +----------------+  |
|  |  Screen Widget      |        |  Screen Widget |  |
|  |  (HomePage)         |        |  (DetailsPage) |  |
|  +----------+----------+        +--------+-------+  |
|             |                            |          |
|             v                            v          |
|      +------+-------------------------------+       |
|      |           VIEWMODELS (VM)           |       |
|      |                                      |      |
|      |  HomeViewModel   DetailsViewModel   |      |
|      +------+--------------+---------------+      |
|             |              |                      |
+-------------|--------------|----------------------+
              |              |
              v              v
+------------------------------------------------------+
|                        DOMAIN                        |
|                 (UseCases / Logique)                 |
+------------------------------------------------------+
|   +-----------------+      +---------------------+   |
|   |   UseCase A     |      |    UseCase B        |   |
|   |  (FetchItems)   |      |  (GetItemDetails)   |   |
|   +--------+--------+      +----------+----------+   |
|            |                          |              |
+------------|--------------------------|--------------+
             |                          |
             v                          v
+------------------------------------------------------+
|                        DATA                          |
|             (Repositories / DataSources)             |
+------------------------------------------------------+
|   +----------------------+   +--------------------+  |
|   |  Repository (Item)   |   |  Repository (Auth) |  |
|   +----------+-----------+   +----------+---------+  |
|              |                          |            |
|     +--------+--------+        +--------+--------+   |
|     |  RemoteSource   |        |  LocalSource    |   |
|     |  (API / HTTP)   |        | (DB / Cache)    |   |
|     +--------+--------+        +--------+--------+   |
|              |                          |            |
+--------------|--------------------------|------------+
               v                          v
        [ REST API / Backend ]       [ SQLite / Hive ]
```

### Flux simplifié (de haut en bas)

```text
UI (Widget) 
   -> appelle méthodes du ViewModel
ViewModel 
   -> appelle UseCase(s) / Repository
UseCase 
   -> orchestre la logique métier
Repository 
   -> va chercher les données (Remote / Local)
Remote / Local 
   -> renvoient les données au Repository
Repository -> UseCase -> ViewModel -> UI
```

### Exemple d’objets typiques

```text
lib/
  models/
    item.dart              (Model)
  data/
    item_repository.dart   (Repository)
    remote/
      item_api_service.dart
    local/
      item_local_store.dart
  domain/
    fetch_items_usecase.dart
  viewmodels/
    home_view_model.dart
  ui/
    screens/
      home_page.dart       (View)
    widgets/
      item_card.dart
```


