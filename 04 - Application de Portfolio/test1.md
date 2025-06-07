# Arborescence logique** du widget `AboutWeb`

```
AboutWeb (StatefulWidget)
└── Scaffold
    ├── drawer: DrawersWeb
    ├── backgroundColor: white
    ├── appBar: AppBar
    │   ├── backgroundColor: white
    │   ├── elevation: 0
    │   ├── iconTheme: IconThemeData (black, size 25)
    │   └── title: TabsWebList
    └── body: ListView
        ├── SizedBox (height: 500)
        │   └── Row (mainAxisAlignment: spaceAround)
        │       ├── Column (crossAxis: start, mainAxis: center)
        │       │   ├── SansBold ("À propos de moi", 40)
        │       │   ├── SizedBox (15)
        │       │   ├── Sans (texte 1, 15)
        │       │   ├── Sans (texte 2, 15)
        │       │   ├── SizedBox (10)
        │       │   └── Row (compétences)
        │       │       ├── tealContainer("Flutter")
        │       │       ├── tealContainer("Firebase")
        │       │       ├── tealContainer("Android")
        │       │       ├── tealContainer("iOS")
        │       │       └── tealContainer("Windows")
        │       └── CircleAvatar (147)
        │           └── CircleAvatar (143, black)
        │               └── CircleAvatar (140, white)
        │                   └── Image.asset("profile2-circle.png")
        ├── SizedBox (20)
        ├── Row ("Développement web")
        │   ├── AnimatedCard ("webL.png")
        │   └── SizedBox (width: 1/3 screen)
        │       └── Column
        │           ├── SansBold("Développement web", 30)
        │           └── Sans (texte, 15)
        ├── SizedBox (20)
        ├── Row ("Développement d'applications")
        │   ├── SizedBox (width: 1/3 screen)
        │   │   └── Column
        │   │       ├── SansBold("Développement d'applications", 30)
        │   │       └── Sans (texte, 15)
        │   └── AnimatedCard ("app.png", reverse: true)
        ├── SizedBox (20)
        ├── Row ("Développement back-end")
        │   ├── AnimatedCard ("firebase.png")
        │   └── SizedBox (width: 1/3 screen)
        │       └── Column
        │           ├── SansBold("Développement back-end", 30)
        │           └── Sans (texte, 15)
        └── SizedBox (40)
```

### Légende :

* Les `SizedBox` servent à l'espacement.
* Les `AnimatedCard`, `Sans`, `SansBold`, `tealContainer` et `TabsWebList` sont des **widgets personnalisés** définis ailleurs ( dans `components.dart`).
* L’image de profil est intégrée dans **trois avatars imbriqués** pour créer un contour stylisé.

![paulina-1](https://github.com/user-attachments/assets/990912e4-79a0-4209-88cf-8a33907c1ef3)


