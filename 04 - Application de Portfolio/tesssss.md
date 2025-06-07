[media pointer="file-service://file-2paFiEPR785QxzBLyyNZgd"]
je veux ensignet cette application mais je ne sais pas par ou commencer comment expliquer a mes etudiants styles projets leur demander de etape 1 faire ca etape 2 faire ca etc ... tu propsoes quoi comment tester a caque fois divider le projet en combien de parties , je te donne le cod epartie par partie par partie common / blog.dart  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components.dart';

/// The main widget for displaying the blog section.
class Blog extends StatefulWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    // Determine if the device is a web device based on its width
    bool isWeb = MediaQuery.of(context).size.width > 800;

    return SafeArea(
      child: Scaffold(
        // Extend the body behind the app bar
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        // Drawer for navigation
        endDrawer: const DrawersMobile(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                iconTheme: const IconThemeData(size: 35.0, color: Colors.black),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: !isWeb,
                  title: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: isWeb ? 7.0 : 4.0),
                    child: AbelCustom(
                      text: "Welcome to my blog",
                      size: isWeb ? 30.0 : 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  background: Image.asset(
                    "assets/blog.jpg",
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
                expandedHeight: isWeb ? 500.0 : 400.0,
              ),
            ];
          },
          body: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('articles').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot documentSnapshot =
                        snapshot.data!.docs[index];
                    return BlogPost(
                      title: documentSnapshot["title"],
                      body: documentSnapshot["body"],
                      isWeb: isWeb,
                    );
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}

/// A widget for displaying individual blog posts.
class BlogPost extends StatefulWidget {
  final String title;
  final String body;
  final bool isWeb;

  const BlogPost({
    Key? key,
    required this.title,
    required this.body,
    required this.isWeb,
  }) : super(key: key);

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.isWeb
          ? const EdgeInsets.only(left: 70.0, right: 70.0, top: 40.0)
          : const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(
              style: BorderStyle.solid, width: 1.0, color: Colors.black),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: AbelCustom(
                    text: widget.title,
                    size: 25.0,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      expand = !expand;
                    });
                  },
                  icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                  color: Colors.black,
                ),
              ],
            ),
            const SizedBox(height: 7.0),
            Text(
              widget.body,
              style: GoogleFonts.openSans(fontSize: 15.0),
              maxLines: expand ? null : 3,
              overflow: expand ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}     maintenat mobile import 'package:flutter/material.dart';

import '../components.dart';

/// The main widget for displaying the about section on mobile devices.
class AboutMobile extends StatefulWidget {
  const AboutMobile({Key? key}) : super(key: key);

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Extend the body behind the app bar
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: const IconThemeData(size: 35.0, color: Colors.black),
        ),
        // Drawer for navigation
        endDrawer: const DrawersMobile(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              // Introduction section
              CircleAvatar(
                radius: 117.0,
                backgroundColor: Colors.tealAccent,
                child: CircleAvatar(
                  radius: 113.0,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 110.0,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      "assets/profile2-circle.png",
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SansBold("About me", 35.0),
                    const SizedBox(height: 10.0),
                    const Sans(
                      "Hello! I'm Paulina Knop. I specialize in Flutter development",
                      15.0,
                    ),
                    const Sans(
                      "I strive to ensure astounding performance with state of the art security for Android, iOS, Web, Mac, and Linux.",
                      15.0,
                    ),
                    const SizedBox(height: 15.0),
                    Wrap(
                      spacing: 7.0,
                      runSpacing: 7.0,
                      children: [
                        tealContainer("Flutter"),
                        tealContainer("Firebase"),
                        tealContainer("Android"),
                        tealContainer("Windows"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40.0),

              // Web development section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AnimatedCard(
                    imagePath: "assets/webL.png",
                    width: 200.0,
                  ),
                  const SizedBox(height: 30.0),
                  const SansBold("Web development", 20.0),
                  const SizedBox(height: 10.0),
                  const Sans(
                    "I'm here to build your presence online with state-of-the-art web apps.",
                    15.0,
                  ),
                ],
              ),

              // App development section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20.0),
                  const AnimatedCard(
                    imagePath: "assets/app.png",
                    width: 200.0,
                    reverse: true,
                  ),
                  const SizedBox(height: 30.0),
                  const SansBold("App development", 20.0),
                  const SizedBox(height: 10.0),
                  const Sans(
                    "Do you need a high-performance, responsive, and beautiful app? Don't worry, I've got you covered.",
                    15.0,
                  ),
                ],
              ),

              // Back-end development section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20.0),
                  const AnimatedCard(
                    imagePath: "assets/firebase.png",
                    width: 200.0,
                  ),
                  const SizedBox(height: 30.0),
                  const SansBold("Back-end development", 20.0),
                  const SizedBox(height: 10.0),
                  const Sans(
                    "Do you want your back-end to be highly scalable and secure? Let's have a conversation on how I can help you with that.",
                    15.0,
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}     import 'package:flutter/material.dart';
import '../components.dart';

/// The main widget for displaying the contact section on mobile devices.
class ContactMobile extends StatefulWidget {
  const ContactMobile({Key? key}) : super(key: key);

  @override
  State<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Extend the body behind the app bar
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        // Drawer for navigation
        endDrawer: const DrawersMobile(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 400.0,
                backgroundColor: Colors.white,
                iconTheme: const IconThemeData(size: 35.0, color: Colors.black),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "assets/contact_image.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ];
          },
          body: const SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: ContactFormMobile(),
          ),
        ),
      ),
    );
  }
}  import 'package:flutter/material.dart';
import 'package:paulina_knop/components.dart';

/// The main widget for displaying the landing page on mobile devices.
class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({Key? key}) : super(key: key);

  @override
  _LandingPageMobileState createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Extend the body behind the app bar
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: const IconThemeData(size: 35.0, color: Colors.black),
        ),
        // Drawer for navigation
        endDrawer: const DrawersMobile(),
        body: ListView(
          children: [
            // Introduction section
            const CircleAvatar(
              radius: 117.0,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 113.0,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 110.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/image-circle.png"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        child: const SansBold("Hello I'm", 15.0),
                      ),
                      const SansBold("Paulina Knop", 40.0),
                      const Sans("Flutter developer", 20.0),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 3.0,
                        children: const [
                          Icon(Icons.email),
                          Icon(Icons.call),
                          Icon(Icons.location_pin),
                        ],
                      ),
                      const SizedBox(width: 40.0),
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 9.0,
                        children: const [
                          Sans("paulinaknop@gmail.com", 15.0),
                          Sans("+48 942 564 985", 15.0),
                          Sans("13/3, Szczecin, Poland", 15.0),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 90.0),
            // About me section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SansBold("About me", 35.0),
                  const Sans(
                    "Hello! I'm Paulina Knop I specialize in flutter development",
                    15.0,
                  ),
                  const Sans(
                    "I strive to ensure astounding performance with state of the art security for Android, iOS, Web, Mac, Linux",
                    15.0,
                  ),
                  const SizedBox(height: 10.0),
                  Wrap(
                    spacing: 7.0,
                    runSpacing: 7.0,
                    children: [
                      tealContainer("Flutter"),
                      tealContainer("Firebase"),
                      tealContainer("Android"),
                      tealContainer("Windows"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60.0),
            // What I do section
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SansBold("What I do?", 35.0),
                AnimatedCard(
                  imagePath: "assets/webL.png",
                  text: "Web development",
                  width: 300.0,
                ),
                SizedBox(height: 35.0),
                AnimatedCard(
                  imagePath: "assets/app.png",
                  text: "App development",
                  fit: BoxFit.contain,
                  reverse: true,
                  width: 300.0,
                ),
                SizedBox(height: 35.0),
                AnimatedCard(
                  imagePath: "assets/firebase.png",
                  text: "Back-end development",
                  width: 300.0,
                ),
                SizedBox(height: 60.0),
                // Contact section
                ContactFormMobile(),
                SizedBox(height: 20.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}   import 'package:flutter/material.dart';

import '../components.dart';

/// The main widget for displaying the works section on mobile devices.
class WorksMobile extends StatefulWidget {
  const WorksMobile({Key? key}) : super(key: key);

  @override
  State<WorksMobile> createState() => _WorksMobileState();
}

class _WorksMobileState extends State<WorksMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Extend the body behind the app bar
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        // Drawer for navigation
        endDrawer: const DrawersMobile(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 400.0,
                backgroundColor: Colors.white,
                iconTheme: const IconThemeData(size: 35.0, color: Colors.black),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "assets/works.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ];
          },
          body: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20.0),
                  const SansBold("Works", 35.0),
                  const SizedBox(height: 20.0),
                  const AnimatedCard(
                    imagePath: "assets/portfolio_screenshot.PNG",
                    fit: BoxFit.contain,
                    height: 150.0,
                    width: 300.0,
                  ),
                  const SizedBox(height: 30.0),
                  const SansBold("Portfolio", 20.0),
                  const SizedBox(height: 10.0),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Sans(
                      "Deployed on Android, IOS and Web, the portfolio project was truly an achievement. I used Flutter to develop the beautiful and responsive UI and Firebase for the back-end.",
                      15.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
} et mainetnat WEB   import 'package:flutter/material.dart';
import 'package:paulina_knop/components.dart';

/// Widget principal pour afficher la section "À propos" sur les appareils web.
class AboutWeb extends StatefulWidget {
  const AboutWeb({Key? key}) : super(key: key);

  @override
  State<AboutWeb> createState() => _AboutWebState();
}

class _AboutWebState extends State<AboutWeb> {
  @override
  Widget build(BuildContext context) {
    // Récupère la largeur de l'appareil pour adapter l'affichage.
    var widthDevice = MediaQuery.of(context).size.width;

    return Scaffold(
      // Ajoute un tiroir de navigation (drawer) pour les options de navigation.
      drawer: const DrawersWeb(),
      backgroundColor: Colors.white, // Définit la couleur de fond de la page.
      appBar: AppBar(
        backgroundColor: Colors.white, // Couleur de fond de la barre d'application.
        elevation: 0.0, // Supprime l'ombre sous la barre d'application.
        iconTheme: const IconThemeData(
          size: 25.0, // Taille des icônes dans la barre d'application.
          color: Colors.black, // Couleur des icônes.
        ),
        title: const TabsWebList(), // Ajoute une liste d'onglets dans la barre d'application.
      ),
      body: ListView(
        children: [
          // Section "À propos de moi".
          SizedBox(
            height: 500.0, // Hauteur de la section.
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround, // Espacement horizontal entre les éléments.
              crossAxisAlignment: CrossAxisAlignment.center, // Alignement vertical des éléments.
              children: [
                // Colonne contenant les informations textuelles.
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Alignement à gauche du texte.
                  mainAxisAlignment: MainAxisAlignment.center, // Centrage vertical des éléments.
                  children: [
                    const SansBold("À propos de moi", 40.0), // Titre de la section.
                    const SizedBox(height: 15.0), // Espacement entre le titre et le texte.
                    const Sans(
                      "Bonjour ! Je suis Paulina Knop. Je me spécialise dans le développement Flutter.",
                      15.0, // Texte introductif.
                    ),
                    const Sans(
                      "Je m'efforce de garantir des performances remarquables avec une sécurité de pointe pour Android, iOS, Web, Mac, Linux et Windows.",
                      15.0, // Description des compétences.
                    ),
                    const SizedBox(height: 10.0), // Espacement avant les compétences.
                    Row(
                      // Liste des compétences sous forme de conteneurs colorés.
                      children: [
                        tealContainer("Flutter"),
                        const SizedBox(width: 7.0), // Espacement entre les conteneurs.
                        tealContainer("Firebase"),
                        const SizedBox(width: 7.0),
                        tealContainer("Android"),
                        const SizedBox(width: 7.0),
                        tealContainer("iOS"),
                        const SizedBox(width: 7.0),
                        tealContainer("Windows"),
                      ],
                    ),
                  ],
                ),
                // Avatar circulaire contenant une image de profil.
                CircleAvatar(
                  radius: 147.0, // Rayon externe de l'avatar.
                  backgroundColor: Colors.tealAccent, // Couleur de fond externe.
                  child: CircleAvatar(
                    radius: 143.0, // Rayon intermédiaire.
                    backgroundColor: Colors.black, // Couleur intermédiaire.
                    child: CircleAvatar(
                      radius: 140.0, // Rayon interne.
                      backgroundColor: Colors.white, // Couleur interne.
                      child: Image.asset(
                        "assets/profile2-circle.png", // Chemin de l'image de profil.
                        filterQuality: FilterQuality.high, // Qualité du filtre pour l'image.
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0), // Espacement entre les sections.

          // Section "Développement web".
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Espacement uniforme entre les éléments.
            children: [
              const AnimatedCard(
                imagePath: "assets/webL.png", // Chemin de l'image pour cette section.
                height: 250.0, // Hauteur de l'image.
                width: 250.0, // Largeur de l'image.
              ),
              SizedBox(
                width: widthDevice / 3, // Largeur de la colonne textuelle.
                child: Column(
                  children: const [
                    SansBold("Développement web", 30.0), // Titre de la section.
                    SizedBox(height: 15.0), // Espacement entre le titre et le texte.
                    Sans(
                      "Je suis là pour construire votre présence en ligne avec des applications web de pointe.",
                      15.0, // Description des services.
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0), // Espacement entre les sections.

          // Section "Développement d'applications".
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Espacement uniforme entre les éléments.
            children: [
              SizedBox(
                width: widthDevice / 3, // Largeur de la colonne textuelle.
                child: Column(
                  children: const [
                    SansBold("Développement d'applications", 30.0), // Titre de la section.
                    SizedBox(height: 15.0), // Espacement entre le titre et le texte.
                    Sans(
                      "Besoin d'une application performante, réactive et esthétique ? Ne vous inquiétez pas, je suis là pour vous.",
                      15.0, // Description des services.
                    ),
                  ],
                ),
              ),
              const AnimatedCard(
                imagePath: "assets/app.png", // Chemin de l'image pour cette section.
                height: 250.0, // Hauteur de l'image.
                width: 250.0, // Largeur de l'image.
                reverse: true, // Animation inversée pour cet élément.
              ),
            ],
          ),
          const SizedBox(height: 20.0), // Espacement entre les sections.

          // Section "Développement back-end".
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Espacement uniforme entre les éléments.
            children: [
              const AnimatedCard(
                imagePath: "assets/firebase.png", // Chemin de l'image pour cette section.
                height: 250.0, // Hauteur de l'image.
                width: 250.0, // Largeur de l'image.
              ),
              SizedBox(
                width: widthDevice / 3, // Largeur de la colonne textuelle.
                child: Column(
                  children: const [
                    SansBold("Développement back-end", 30.0), // Titre de la section.
                    SizedBox(height: 15.0), // Espacement entre le titre et le texte.
                    Sans(
                      "Vous voulez un back-end hautement évolutif et sécurisé ? Discutons de la manière dont je peux vous aider.",
                      15.0, // Description des services.
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40.0), // Espacement final avant la fin de la page.
        ],
      ),
    );
  }
}
    import 'package:flutter/material.dart';
import 'package:paulina_knop/components.dart';

/// The main widget for displaying the contact section on web devices.
class ContactWeb extends StatefulWidget {
  const ContactWeb({Key? key}) : super(key: key);

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Drawer for navigation
      drawer: const DrawersWeb(),
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 500.0,
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(size: 25.0, color: Colors.black),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/contact_image.jpg",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
              title: const TabsWebList(),
            ),
          ];
        },
        body: const SingleChildScrollView(
          child: ContactFormWeb(),
        ),
      ),
    );
  }
}    import 'package:flutter/material.dart';
import 'package:paulina_knop/components.dart';

/// The main widget for displaying the landing page on web devices.
class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({Key? key}) : super(key: key);

  @override
  _LandingPageWebState createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  @override
  Widget build(BuildContext context) {
    // Get the height and width of the device
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;

    return Scaffold(
      // Drawer for navigation
      drawer: const DrawersWeb(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          size: 25.0,
          color: Colors.black,
        ),
        title: const TabsWebList(),
      ),
      body: ListView(
        children: [
          // First section: Introduction
          Container(
            height: heightDevice - 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      child: const SansBold("Hello I'm", 15.0),
                    ),
                    const SizedBox(height: 15.0),
                    const SansBold("Paulina Knop", 55.0),
                    const Sans("Flutter developer", 30.0),
                    const SizedBox(height: 15.0),
                    Row(
                      children: const [
                        Icon(Icons.email),
                        SizedBox(width: 20.0),
                        Sans("paulinaknop@gmail.com", 15.0),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: const [
                        Icon(Icons.call),
                        SizedBox(width: 20.0),
                        Sans("+48 942 564 985", 15.0),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: const [
                        Icon(Icons.location_pin),
                        SizedBox(width: 20.0),
                        Sans("13/3, Szczecin, Poland", 15.0),
                      ],
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 147.0,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    radius: 143.0,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 140.0,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/image-circle.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Second section: About me
          Container(
            height: heightDevice / 1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/web.jpg", height: widthDevice / 1.9),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SansBold("About me", 40.0),
                    const SizedBox(height: 15.0),
                    const Sans(
                      "Hello! I'm Paulina Knop. I specialize in flutter development.",
                      15.0,
                    ),
                    const Sans(
                      "I strive to ensure astounding performance with state of the art security for Android, iOS, Web, Mac, Linux, and Windows.",
                      15.0,
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        tealContainer("Flutter"),
                        const SizedBox(width: 7.0),
                        tealContainer("Firebase"),
                        const SizedBox(width: 7.0),
                        tealContainer("Android"),
                        const SizedBox(width: 7.0),
                        tealContainer("iOS"),
                        const SizedBox(width: 7.0),
                        tealContainer("Windows"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Third section: What I do
          Container(
            height: heightDevice / 1.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SansBold("What I do?", 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    AnimatedCard(
                      imagePath: "assets/webL.png",
                      text: "Web development",
                    ),
                    AnimatedCard(
                      imagePath: "assets/app.png",
                      text: "App development",
                      fit: BoxFit.contain,
                      reverse: true,
                    ),
                    AnimatedCard(
                      imagePath: "assets/firebase.png",
                      text: "Back-end development",
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Fourth section: Contact form
          const SizedBox(height: 15.0),
          const ContactFormWeb(),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
} import 'package:flutter/material.dart';
import 'package:paulina_knop/components.dart';

/// The main widget for displaying the works section on the web.
class WorksWeb extends StatefulWidget {
  const WorksWeb({Key? key}) : super(key: key);

  @override
  State<WorksWeb> createState() => _WorksWebState();
}

class _WorksWebState extends State<WorksWeb> {
  @override
  Widget build(BuildContext context) {
    // Get the width of the device
    var widthDevice = MediaQuery.of(context).size.width;

    return Scaffold(
      // Drawer for navigation
      drawer: const DrawersWeb(),
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 500.0,
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(size: 25.0, color: Colors.black),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/works.jpg",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
              title: const TabsWebList(),
            ),
          ];
        },
        body: ListView(
          children: [
            Column(
              children: [
                const SizedBox(height: 30.0),
                const SansBold("Works", 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const AnimatedCard(
                      imagePath: "assets/portfolio_screenshot.PNG",
                      height: 200.0,
                      width: 300.0,
                    ),
                    SizedBox(
                      width: widthDevice / 3,
                      child: Column(
                        children: const [
                          SansBold("Portfolio", 30.0),
                          SizedBox(height: 15.0),
                          Sans(
                            "Deployed on Android, IOS and Web, the portfolio project was truly an achievement. I used Flutter to develop the beautiful and responsive UI and Firebase for the back-end.",
                            15.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
maintenant pas dans le dossier web ou mobile a lexterieur import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

// Logger instance for debugging purposes
final Logger logger = Logger();

// Text editing controllers for managing input fields in forms
final TextEditingController _firstNameController = TextEditingController();
final TextEditingController _lastNameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();
final TextEditingController _messageController = TextEditingController();

// A StatefulWidget for creating navigation tabs on the web
class TabsWeb extends StatefulWidget {
  final String title; // Title of the tab
  final String route; // Route to navigate to when the tab is clicked

  const TabsWeb({Key? key, required this.title, required this.route})
      : super(key: key);

  @override
  _TabsWebState createState() => _TabsWebState();
}

// State class for TabsWeb
class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false; // Boolean to track if the tab is selected

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the specified route when the tab is clicked
        Navigator.of(context).pushNamed(widget.route);
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isSelected = true;
          });
        },
        onExit: (_) {
          setState(() {
            isSelected = false;
          });
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 100),
          curve: Curves.elasticIn,
          style: isSelected
              ? GoogleFonts.roboto(
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(0, -8),
                    ),
                  ],
                  fontSize: 25.0,
                  color: Colors.transparent,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  decorationColor: Colors.tealAccent,
                )
              : GoogleFonts.roboto(color: Colors.black, fontSize: 20.0),
          child: Text(widget.title),
        ),
      ),
    );
  }
}

// A stateless widget to create a list of navigation tabs for the web
class TabsWebList extends StatelessWidget {
  const TabsWebList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Spacer(flex: 3),
        TabsWeb(title: "Home", route: '/'),
        Spacer(),
        TabsWeb(title: "Works", route: '/works'),
        Spacer(),
        TabsWeb(title: "Blog", route: '/blog'),
        Spacer(),
        TabsWeb(title: "About", route: '/about'),
        Spacer(),
        TabsWeb(title: 'Contact', route: '/contact'),
        Spacer(),
      ],
    );
  }
}

// A stateless widget for creating navigation tabs on mobile devices
class TabsMobile extends StatelessWidget {
  final String text; // Text to display on the tab
  final String route; // Route to navigate to when the tab is clicked

  const TabsMobile({Key? key, required this.text, required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      height: 50.0,
      minWidth: 200.0,
      color: Colors.black,
      child: Text(
        text,
        style: GoogleFonts.openSans(fontSize: 20.0, color: Colors.white),
      ),
      onPressed: () {
        // Navigate to the specified route when the tab is clicked
        Navigator.of(context).pushNamed(route);
      },
    );
  }
}

// Function to create an icon button for launching URLs
Widget urlLauncher(String imgPath, String url) {
  return IconButton(
    icon: SvgPicture.asset(imgPath, color: Colors.black, width: 35),
    onPressed: () async {
      // Launch the specified URL
      await launchUrl(Uri.parse(url));
    },
  );
}

// A stateless widget for creating a drawer with profile information and social media links on the web
class DrawersWeb extends StatelessWidget {
  const DrawersWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 72.0,
            backgroundColor: Colors.tealAccent,
            child: CircleAvatar(
              radius: 70.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/image.png"),
            ),
          ),
          const SizedBox(height: 15.0),
          const SansBold("Paulina Knop", 30.0),
          const SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              urlLauncher("assets/instagram.svg",
                  "https://www.instagram.com/tomcruise/"),
              urlLauncher(
                  "assets/twitter.svg", "https://www.twitter.com/tomcruise"),
              urlLauncher("assets/github.svg",
                  "https://github.com/sagnik150699/paulina_knop"),
            ],
          ),
        ],
      ),
    );
  }
}

// A stateless widget for creating a drawer with navigation tabs and social media links on mobile devices
class DrawersMobile extends StatelessWidget {
  const DrawersMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DrawerHeader(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2.0, color: Colors.black),
              ),
              child: Image.asset(
                'assets/profile2-circle.png',
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
          const TabsMobile(text: "Home", route: '/'),
          const SizedBox(height: 20.0),
          const TabsMobile(text: "Works", route: '/works'),
          const SizedBox(height: 20.0),
          const TabsMobile(text: "Blog", route: '/blog'),
          const SizedBox(height: 20.0),
          const TabsMobile(text: "About", route: '/about'),
          const SizedBox(height: 20.0),
          const TabsMobile(text: "Contact", route: '/contact'),
          const SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              urlLauncher("assets/instagram.svg",
                  "https://www.instagram.com/tomcruise/"),
              urlLauncher(
                  "assets/twitter.svg", "https://www.twitter.com/tomcruise"),
              urlLauncher("assets/github.svg",
                  "https://github.com/sagnik150699/paulina_knop"),
            ],
          ),
        ],
      ),
    );
  }
}

// A stateless widget for displaying bold text using the Sans font
class SansBold extends StatelessWidget {
  final String text; // Text to display
  final double size; // Font size

  const SansBold(this.text, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

// A stateless widget for displaying text using the Sans font
class Sans extends StatelessWidget {
  final String text; // Text to display
  final double size; // Font size

  const Sans(this.text, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size),
    );
  }
}

// A stateless widget for displaying text using the Abel font with customizable properties
class AbelCustom extends StatelessWidget {
  final String text; // Text to display
  final double size; // Font size
  final Color? color; // Text color
  final FontWeight? fontWeight; // Font weight

  const AbelCustom({
    Key? key,
    required this.text,
    required this.size,
    this.color,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.abel(
        fontSize: size,
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}

// A stateless widget for creating a form field with a label and validation
class TextForm extends StatelessWidget {
  final String text; // Label text
  final double containerWidth; // Width of the form field container
  final String hintText; // Hint text to display in the form field
  final int? maxLines; // Maximum number of lines for the form field
  final TextEditingController
      controller; // Controller for managing the form field input
  final String? Function(String?)?
      validator; // Validator function for form field validation

  const TextForm({
    Key? key,
    required this.text,
    required this.containerWidth,
    required this.hintText,
    this.maxLines,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sans(text, 16.0),
        const SizedBox(height: 5),
        SizedBox(
          width: containerWidth,
          child: TextFormField(
            validator: validator,
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.tealAccent, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}

// A stateful widget for creating an animated card with an image and optional text
class AnimatedCard extends StatefulWidget {
  final String imagePath; // Path to the image to display on the card
  final String? text; // Optional text to display on the card
  final BoxFit? fit; // BoxFit for the image
  final bool? reverse; // Boolean to indicate if the animation should reverse
  final double? height; // Height of the image
  final double? width; // Width of the image

  const AnimatedCard({
    Key? key,
    required this.imagePath,
    this.text,
    this.fit,
    this.reverse,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  _AnimatedCardState createState() => _AnimatedCardState();
}

// State class for AnimatedCard
class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat(reverse: true);

  late Animation<Offset> _animation = Tween(
    begin: widget.reverse == true ? const Offset(0, 0.08) : Offset.zero,
    end: widget.reverse == true ? Offset.zero : const Offset(0, 0.08),
  ).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        elevation: 30.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(color: Colors.tealAccent),
        ),
        shadowColor: Colors.tealAccent,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.imagePath,
                height: widget.height ?? 200.0,
                width: widget.width ?? 200.0,
                fit: widget.fit,
              ),
              const SizedBox(height: 10.0),
              if (widget.text != null) SansBold(widget.text!, 15.0),
            ],
          ),
        ),
      ),
    );
  }
}

// Class for adding data to Firestore
class AddDataFirestore {
  final CollectionReference response =
      FirebaseFirestore.instance.collection('messages');

  // Method for adding response data to Firestore
  Future<bool> addResponse(String firstName, String lastName, String email,
      String phoneNumber, String message) async {
    try {
      await response.add({
        'first name': firstName,
        'last name': lastName,
        'email': email,
        'phone number': phoneNumber,
        'message': message,
      });
      logger.d("Success");
      return true;
    } catch (error) {
      logger.d(error);
      return false;
    }
  }
}

// Function to display an error dialog
Future<void> DialogError(BuildContext context, String title) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: SansBold(title, 20.0),
    ),
  );
}

// A stateful widget for creating a contact form for the web
class ContactFormWeb extends StatefulWidget {
  const ContactFormWeb({Key? key}) : super(key: key);

  @override
  _ContactFormWebState createState() => _ContactFormWebState();
}

// State class for ContactFormWeb
class _ContactFormWebState extends State<ContactFormWeb> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 30.0),
          const SansBold("Contact me", 40.0),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  TextForm(
                    text: "First Name",
                    containerWidth: 350.0,
                    hintText: "Please type first name",
                    controller: _firstNameController,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "First name is required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15.0),
                  TextForm(
                    text: "Email",
                    containerWidth: 350.0,
                    hintText: "Please type email address",
                    controller: _emailController,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "Email is required";
                      }
                      return null;
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextForm(
                    text: "Last Name",
                    containerWidth: 350.0,
                    hintText: "Please type last name",
                    controller: _lastNameController,
                  ),
                  const SizedBox(height: 15.0),
                  TextForm(
                    text: "Phone number",
                    containerWidth: 350.0,
                    hintText: "Please type phone number",
                    controller: _phoneController,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          TextForm(
            text: "Message",
            containerWidth: widthDevice / 1.5,
            hintText: "Please type your message",
            maxLines: 10,
            controller: _messageController,
            validator: (text) {
              if (text!.isEmpty) {
                return "Message is required";
              }
              return null;
            },
          ),
          const SizedBox(height: 20.0),
          MaterialButton(
            onPressed: () async {
              logger.d(_firstNameController.text);
              final addData = AddDataFirestore();
              if (formKey.currentState!.validate()) {
                if (await addData.addResponse(
                  _firstNameController.text,
                  _lastNameController.text,
                  _emailController.text,
                  _phoneController.text,
                  _messageController.text,
                )) {
                  formKey.currentState!.reset();
                  DialogError(context, "Message sent successfully");
                } else {
                  DialogError(context, "Message failed to send");
                }
              }
            },
            elevation: 20.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 60.0,
            minWidth: 200.0,
            color: Colors.tealAccent,
            child: const SansBold("Submit", 20.0),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}

// A stateful widget for creating a contact form for mobile devices
class ContactFormMobile extends StatefulWidget {
  const ContactFormMobile({Key? key}) : super(key: key);

  @override
  _ContactFormMobileState createState() => _ContactFormMobileState();
}

// State class for ContactFormMobile
class _ContactFormMobileState extends State<ContactFormMobile> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      child: Wrap(
        runSpacing: 20.0,
        spacing: 20.0,
        alignment: WrapAlignment.center,
        children: [
          const SansBold("Contact me", 35.0),
          TextForm(
            text: "First name",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type first name",
            controller: _firstNameController,
            validator: (text) {
              if (text!.isEmpty) {
                return "First name is required";
              }
              return null;
            },
          ),
          TextForm(
            text: "Last name",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type last name",
            controller: _lastNameController,
          ),
          TextForm(
            text: "Phone number",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type phone number",
            controller: _phoneController,
          ),
          TextForm(
            text: "Email",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type email address",
            controller: _emailController,
            validator: (text) {
              if (text!.isEmpty) {
                return "Email is required";
              }
              return null;
            },
          ),
          TextForm(
            text: "Message",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type your message",
            maxLines: 10,
            controller: _messageController,
            validator: (text) {
              if (text!.isEmpty) {
                return "Message is required";
              }
              return null;
            },
          ),
          MaterialButton(
            onPressed: () async {
              logger.d(_firstNameController.text);
              final addData = AddDataFirestore();
              if (formKey.currentState!.validate()) {
                if (await addData.addResponse(
                  _firstNameController.text,
                  _lastNameController.text,
                  _emailController.text,
                  _phoneController.text,
                  _messageController.text,
                )) {
                  formKey.currentState!.reset();
                  DialogError(context, "Message sent successfully");
                } else {
                  DialogError(context, "Message failed to send");
                }
              }
            },
            elevation: 20.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 60.0,
            minWidth: widthDevice / 2.2,
            color: Colors.tealAccent,
            child: const SansBold("Submit", 20.0),
          ),
        ],
      ),
    );
  }
}

// Function to create a container with teal border and text
Widget tealContainer(String text) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.tealAccent,
        style: BorderStyle.solid,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(5.0),
    ),
    padding: const EdgeInsets.all(7.0),
    child: Text(
      text,
      style: GoogleFonts.openSans(fontSize: 15.0),
    ),
  );
} // File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDV6TiAOypowEIwKiBPd46nYNIHZU2Lw14',
    appId: '1:555718417628:web:de754578937e1dab4be819',
    messagingSenderId: '555718417628',
    projectId: 'portfolio-782e9',
    authDomain: 'portfolio-782e9.firebaseapp.com',
    storageBucket: 'portfolio-782e9.appspot.com',
    measurementId: 'G-DMWX170PZ9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJemnZV4Seo9n_atjl-FIrGEKa1yf95Ww',
    appId: '1:555718417628:android:327bc09099557d664be819',
    messagingSenderId: '555718417628',
    projectId: 'portfolio-782e9',
    storageBucket: 'portfolio-782e9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCwUlLQUxAmcu6-k3onacgaUX_8DrZqwkw',
    appId: '1:555718417628:ios:b6c3e43ba75d4f8e4be819',
    messagingSenderId: '555718417628',
    projectId: 'portfolio-782e9',
    storageBucket: 'portfolio-782e9.appspot.com',
    iosClientId: '555718417628-v5r90hccobuaf7jhs6p5ahbpbh28cnk3.apps.googleusercontent.com',
    iosBundleId: 'com.codingliquids.paulinaKnop',
  );
}
main import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:paulina_knop/routes.dart';
import 'package:url_strategy/url_strategy.dart';
import 'firebase_options.dart';

/// The main entry point of the application.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  // Initialize Firebase with the default platform options
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

/// The root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Generate routes for navigation
      onGenerateRoute: Routes.generateRoute,
      initialRoute: '/',
    );
  }
}
 routes import 'package:flutter/material.dart';
import 'package:paulina_knop/common/blog.dart';
import 'package:paulina_knop/mobile/about_mobile.dart';
import 'package:paulina_knop/mobile/contact_mobile.dart';
import 'package:paulina_knop/mobile/works_mobile.dart';
import 'package:paulina_knop/web/about_web.dart';
import 'package:paulina_knop/web/landing_page_web.dart';
import 'package:paulina_knop/web/works_web.dart';

import 'mobile/landing_page_mobile.dart';
import 'web/contact_web.dart';

/// The class responsible for generating routes based on the provided route settings.
class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const LandingPageWeb();
              } else {
                return const LandingPageMobile();
              }
            },
          ),
        );
      case '/contact':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const ContactWeb();
              } else {
                return const ContactMobile();
              }
            },
          ),
        );
      case '/about':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const AboutWeb();
              } else {
                return const AboutMobile();
              }
            },
          ),
        );
      case '/blog':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const Blog(),
        );
      case '/works':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const WorksWeb();
              } else {
                return const WorksMobile();
              }
            },
          ),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const LandingPageWeb();
              } else {
                return const LandingPageMobile();
              }
            },
          ),
        );
    }
  }
}
SVP SVP SVP mes etudiats sont trop debutants ils ont besoin de copier coller soit exhaustif et fais un plan pour le donner cette pllication etape par etape donne moi le plan  
 
