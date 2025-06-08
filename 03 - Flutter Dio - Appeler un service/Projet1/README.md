# Architecture MVC simple

```
git clone https://github.com/hrhouma1/flutter-01-projet01.git
flutter pub get
flutter doctor
flutter analyze
flutter test
flutter run
```

# Architecture MVC simple

```
lib/
├── main.dart
├── models/
│   └── github_user.dart
├── screens/
│   ├── home_screen.dart
│   └── user_detail_screen.dart
└── services/
    └── github_service.dart
```

Ce diagramme reflète l’architecture MVC simple suivante :

* **models/** : définition des structures de données (ex : `GitHubUser`)
* **services/** : communication avec l’API GitHub (via Dio)
* **screens/** : interface utilisateur (écrans)
* **main.dart** : point d’entrée de l’application


![image](https://github.com/user-attachments/assets/b94148e7-a468-4307-b81a-6f28057dcafe)

