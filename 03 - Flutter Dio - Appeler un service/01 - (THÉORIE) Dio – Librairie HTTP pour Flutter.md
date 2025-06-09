<h1 id="dio-flutter">Dio – Librairie HTTP pour Flutter</h1>

**Dio** est une bibliothèque Flutter permettant de faire des requêtes HTTP de manière puissante, flexible et professionnelle. Elle est souvent préférée au package `http` de base car elle propose plus de fonctionnalités utiles pour les applications réelles.

---

## Pourquoi utiliser Dio ?

* Requêtes HTTP : `GET`, `POST`, `PUT`, `DELETE`, etc.
* Intercepteurs : pour modifier les requêtes ou les réponses (par exemple, ajouter un token d'authentification).
* Gestion des erreurs centralisée.
* Gestion des délais d’expiration (timeouts).
* Téléchargement et envoi de fichiers (support du multipart/form-data).
* Possibilité d’annuler une requête (CancelToken).
* Rejouer une requête automatiquement en cas d’échec (retry).

---

## Exemple simple avec Dio

```dart
import 'package:dio/dio.dart';

void main() async {
  final dio = Dio();

  try {
    final response = await dio.get('https://jsonplaceholder.typicode.com/posts/1');
    print(response.data);
  } catch (e) {
    print('Erreur : $e');
  }
}
```

---

## Comparaison rapide avec le package http

| Fonctionnalité               | Package `http` | Package `dio` |
| ---------------------------- | -------------- | ------------- |
| Requêtes simples (GET, POST) | Oui            | Oui           |
| Intercepteurs                | Non            | Oui           |
| Gestion avancée des erreurs  | Limitée        | Oui           |
| Timeout configurable         | Partiel        | Oui           |
| Envoi de fichiers            | Basique        | Oui           |
| Annulation de requêtes       | Non            | Oui           |


# Évaluation formative de recherche :

- C'est qui les Intercepteurs ?

...................................................................
