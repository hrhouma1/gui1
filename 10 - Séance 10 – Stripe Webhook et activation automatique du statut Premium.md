## Séance 10 – Stripe Webhook et activation automatique du statut Premium

> Objectif : écouter l’événement Stripe `checkout.session.completed` sur le backend, puis mettre à jour le statut `isPremium = true` côté base de données.
> Le frontend doit refléter automatiquement ce statut et activer les contenus Premium.

---

## PARTIE 1 – BACKEND EXPRESS : WEBHOOK

> Vous devez déjà avoir un backend Express.js (Node) avec Stripe installé.

### Étape 1 – Installer Stripe si ce n’est pas déjà fait

```bash
npm install stripe express body-parser
```

---

### Étape 2 – Créer la route `POST /webhook`

Dans votre backend Node, ajoutez ce fichier `routes/webhook.js` :

```js
const express = require('express');
const router = express.Router();
const stripe = require('stripe')('sk_test_...'); // Clé secrète
const bodyParser = require('body-parser');

// Important : utiliser raw body pour Stripe
router.post(
  '/',
  bodyParser.raw({ type: 'application/json' }),
  async (req, res) => {
    const sig = req.headers['stripe-signature'];
    let event;

    try {
      event = stripe.webhooks.constructEvent(
        req.body,
        sig,
        'whsec_...' // Clé de signature du Webhook (Stripe dashboard)
      );
    } catch (err) {
      console.error('Signature Webhook invalide', err.message);
      return res.sendStatus(400);
    }

    // Si l’événement est un paiement réussi
    if (event.type === 'checkout.session.completed') {
      const session = event.data.object;
      const customerEmail = session.customer_details.email;

      // Ici, mettre à jour la base (MongoDB, SQL, etc.)
      // Exemple : await User.updateOne({ email: customerEmail }, { isPremium: true });

      console.log('Paiement validé, client premium :', customerEmail);
    }

    res.json({ received: true });
  }
);

module.exports = router;
```

---

### Étape 3 – Lier cette route dans `app.js`

```js
const webhookRoute = require('./routes/webhook');
app.use('/webhook', webhookRoute);
```

---

### Étape 4 – Déployer le webhook + configurer Stripe

1. Déployer le backend (ex : Railway, Render, ou ngrok pour test local).
2. Dans Stripe : **Developers > Webhooks > Add endpoint**

   * Endpoint URL : `https://votre-backend.com/webhook`
   * Events to send : `checkout.session.completed`
   * Copier la clé `whsec_...` et placer-la dans le code.

---

## PARTIE 2 – BASE DE DONNÉES (EXEMPLE EN LOCAL)

> Vous devez avoir une table ou collection `users` contenant `email` et `isPremium`.

Exemple MongoDB Mongoose :

```js
const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
  email: String,
  isPremium: { type: Boolean, default: false },
});

module.exports = mongoose.model('User', userSchema);
```

---

## PARTIE 3 – FLUTTER : RÉCUPÉRER LE STATUT PREMIUM

---

### Étape 1 – Créer un endpoint `/me` côté backend

Exemple Express :

```js
router.get('/me', authenticateToken, async (req, res) => {
  const user = await User.findOne({ email: req.user.email });
  if (!user) return res.sendStatus(404);
  res.json({ email: user.email, isPremium: user.isPremium });
});
```

> `authenticateToken` est un middleware qui vérifie le JWT et ajoute `req.user`.

---

### Étape 2 – Créer un provider `premiumStatusProvider` côté Flutter

Créer `lib/application/premium_provider.dart` :

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

final premiumStatusProvider = FutureProvider<bool>((ref) async {
  final dio = Dio(BaseOptions(baseUrl: 'https://votre-backend.com'));
  final response = await dio.get('/me');

  return response.data['isPremium'] == true;
});
```

---

### Étape 3 – Afficher le badge Premium

Dans `home_screen.dart`, ajouter dans le `AppBar.title` :

```dart
title: Consumer(
  builder: (context, ref, _) {
    final premium = ref.watch(premiumStatusProvider);
    return premium.when(
      data: (isPremium) => Text(isPremium ? '🏆 Premium' : 'Accueil'),
      loading: () => Text('Chargement...'),
      error: (_, __) => Text('Accueil'),
    );
  },
),
```

---

### Étape 4 – Restreindre l’accès à certaines fonctionnalités

Exemple : pour afficher un bouton réservé aux Premium :

```dart
Consumer(
  builder: (context, ref, _) {
    final premium = ref.watch(premiumStatusProvider);

    return premium.when(
      data: (isPremium) => isPremium
          ? ElevatedButton(
              onPressed: () {}, child: Text('Accès Premium'))
          : SizedBox.shrink(),
      loading: () => SizedBox.shrink(),
      error: (_, __) => SizedBox.shrink(),
    );
  },
),
```

---

## Résultat attendu

| Fonctionnalité                                      | Statut |
| --------------------------------------------------- | ------ |
| Webhook Stripe fonctionne                           | Oui    |
| Paiement valide déclenche mise à jour en base       | Oui    |
| Flutter récupère le statut `isPremium` depuis `/me` | Oui    |
| Le badge Premium s’affiche après paiement           | Oui    |
| Accès Premium conditionnel dans l’interface         | Oui    |


