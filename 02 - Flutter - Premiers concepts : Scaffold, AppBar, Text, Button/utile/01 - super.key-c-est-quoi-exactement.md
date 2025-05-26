# 1 -  `super.key` : c’est quoi exactement ?

Dans la ligne :

```dart
const MonApp({super.key});
```

`super.key` signifie simplement : **"passe la valeur du paramètre `key` au constructeur de la classe parente"**, c’est-à-dire ici au `StatelessWidget`.



# 2 -   Que fait `key` dans Flutter ?

* `key` est un **paramètre spécial** dans tous les widgets Flutter.
* Il sert à **identifier un widget de façon unique** dans l’arbre des widgets.
* Flutter l’utilise pour **savoir si un widget peut être réutilisé** ou doit être reconstruit.



# 3 -  Pourquoi `super.key` ?

Dans Dart, quand tu fais :

```dart
class MonApp extends StatelessWidget {
  const MonApp({super.key});
}
```

C’est équivalent à :

```dart
class MonApp extends StatelessWidget {
  const MonApp({Key? key}) : super(key: key);
}
```

Mais la version courte `super.key` est **plus concise** et **automatique** à partir de Dart 2.17.



# 4 - À quoi ça sert dans la pratique ?

Cela permet d’écrire :

```dart
void main() {
  runApp(const MonApp());
}
```

Et Flutter saura que cette instance de `MonApp` est **la même** si elle est reconstruite, car elle a la **même clé (`Key`)**.



# 5 - Tu peux ignorer `super.key` au début

Pour débuter, tu peux très bien faire :

```dart
class MonApp extends StatelessWidget {
  const MonApp();
}
```

Mais si tu veux suivre les bonnes pratiques dès le début, laisse `super.key`.


