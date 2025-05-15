## Séance 9 – Intégration de Stripe (Checkout en mode test)

> Objectif : permettre à l’utilisateur d’acheter une fonctionnalité premium via **Stripe Checkout**, avec redirection vers une interface Stripe hébergée.

---

## CONDITIONS PRÉALABLES

Avant de commencer, vous devez :

1. Avoir un **compte Stripe** ([https://dashboard.stripe.com/test/dashboard](https://dashboard.stripe.com/test/dashboard))
2. Créer un produit + prix (dans Stripe)
3. Configurer un **backend Express.js** déjà existant avec l’endpoint `/create-checkout-session`
4. Obtenir une **clé publique Stripe** (`pk_test_...`)
5. Configurer l’URL de redirection après paiement (`success_url`, `cancel_url`)

---

## ÉTAPE 1 – Installer le SDK Stripe

Dans le terminal :

```bash
flutter pub add flutter_stripe
```

---

## ÉTAPE 2 – Ajouter les permissions (Android)

Ouvrir `android/app/src/main/AndroidManifest.xml`, ajouter **avant la balise `<application>`** :

```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

---

## ÉTAPE 3 – Initialiser Stripe dans le `main.dart`

Dans `lib/main.dart`, importer :

```dart
import 'package:flutter_stripe/flutter_stripe.dart';
```

Puis dans `main()`, avant `runApp()` :

```dart
Stripe.publishableKey = 'pk_test_xxxxxxxxxxxxxxxxxxxxx'; // votre clé publique test
```

---

## ÉTAPE 4 – Créer le service `StripeService`

Créer le fichier `lib/core/services/stripe_service.dart` :

```dart
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:dio/dio.dart';

class StripeService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://votre-backend.com'));

  Future<void> startCheckoutSession() async {
    final response = await _dio.post('/create-checkout-session');

    final sessionId = response.data['id'];

    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: response.data['client_secret'],
        merchantDisplayName: 'Ma Boutique Flutter',
      ),
    );

    await Stripe.instance.presentPaymentSheet();
  }
}
```

> Remplacez `'https://votre-backend.com'` par l’URL réelle de votre backend Express.
> Le backend doit répondre avec un `client_secret` issu de `stripe.checkout.sessions.create(...)`.

---

## ÉTAPE 5 – Créer un écran “Premium”

Créer `lib/presentation/screens/premium_screen.dart` :

```dart
import 'package:flutter/material.dart';
import '../../core/services/stripe_service.dart';

class PremiumScreen extends StatefulWidget {
  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  final StripeService stripeService = StripeService();
  bool _loading = false;

  Future<void> _pay() async {
    setState(() => _loading = true);
    try {
      await stripeService.startCheckoutSession();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Erreur de paiement : $e')));
    }
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Devenir Premium')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Fonctionnalités Premium :\n- Accès illimité\n- Support prioritaire'),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _loading ? null : _pay,
              child: _loading
                  ? CircularProgressIndicator()
                  : Text('Payer 4.99€ avec Stripe'),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## ÉTAPE 6 – Ajouter une route `/premium` dans `main.dart`

```dart
import 'presentation/screens/premium_screen.dart';

routes: {
  // ...
  '/premium': (context) => PremiumScreen(),
}
```

---

## ÉTAPE 7 – Ajouter un bouton vers Premium dans `home_screen.dart`

Dans le `floatingActionButton`, ajouter :

```dart
FloatingActionButton(
  heroTag: 'premium',
  onPressed: () => Navigator.pushNamed(context, '/premium'),
  child: Icon(Icons.star),
  tooltip: 'Premium',
),
```

---

## ÉTAPE 8 – Tester le paiement Stripe

1. Lancer l’application.
2. Cliquer sur l’icône étoile.
3. Cliquer sur “Payer 4.99€ avec Stripe”.
4. L’application ouvre le PaymentSheet Stripe.
5. Saisir un numéro de test Stripe (`4242 4242 4242 4242` avec n’importe quelle date + CVC).
6. Le paiement s’effectue avec redirection `success_url` vers une page définie par votre backend.

---

## ÉTAPE 9 – Vérification dans le Dashboard Stripe

Aller sur [dashboard.stripe.com/test/payments](https://dashboard.stripe.com/test/payments)

* Vérifier que le paiement apparaît.
* Vérifier que l’email est bien lié à un client.

---

## Résultat attendu

| Fonctionnalité                                  | Statut |
| ----------------------------------------------- | ------ |
| Stripe SDK initialisé avec clé test             | Oui    |
| Paiement via Checkout (client\_secret)          | Oui    |
| Redirection vers PaymentSheet Flutter           | Oui    |
| Confirmation de paiement dans Stripe            | Oui    |
| Protection possible des fonctionnalités Premium | Oui    |


