# Projet de Session – Développement Flutter **avec API publique ou API d’Intelligence Artificielle**


## 1. Calendrier des livraisons

| Date                | Livraison                          | Travail attendu                                                                                        | Mode                | Pondération |
| ------------------- | ---------------------------------- | ------------------------------------------------------------------------------------------------------ | ------------------- | ----------- |
| **27 mai 2025**     | **Fiche-projet**                   | 1 page : titre, objectif, public cible, API publique ou API IA choisie, description des écrans                         | Individuel          | 25 %        |
| **10 juin 2025**    | **Sprint 1**                       | Cahier des charges (1–3 p.) + prototype Flutter (≥ 1 écran, appel IA simulé JSON local)                | Équipe (2–3)        | 35 %        |
| **07 juillet 2025** | **Sprint 2 + évaluation synthèse** | Application finale (≥ 3 écrans, appel IA réel, navigation, gestion d’état) + quiz technique individuel | Équipe + individuel | 40 %        |




# 2. Contenu minimal de la fiche-projet (remise le 27 mai)

1. **Titre du projet**
2. **Problématique / contexte d’usage**
3. **Public cible**
4. **API publique ou API IA retenue** (nom, URL fournisseur)
5. **Fonction principale** (phrase précise)
6. **Structure fonctionnelle préliminaire** (liste des écrans)



# 3. Cahier des charges (Sprint 1 – 10 juin)

* Contexte et objectifs détaillés
* Personas (1–2)
* Exigences fonctionnelles (5–8)
* Exigences non fonctionnelles (performance, accessibilité, sécurité…)
* Architecture fonctionnelle (schéma ou description UI / logique / persistance / IA)
* Maquettes basse fidélité (≥ 2 écrans)




# 4. Idées de projets acceptées (API IA obligatoire)

### 4.1 Projets initiaux (déjà proposés)

| # | Projet          | Description succincte                     | Fonction IA                   | API suggérée               | Difficulté\* |
| - | --------------- | ----------------------------------------- | ----------------------------- | -------------------------- | ------------ |
| 1 | **QuickNotes**  | Résumer un texte et extraire 3 idées clés | Résumé + points clés          | OpenAI Chat Completion     | ★★☆☆         |
| 2 | **DailyQuote**  | Citation quotidienne + image cohérente    | Génération citation & image   | GPT-4o + DALL·E / Unsplash | ★★☆☆         |
| 3 | **PicCaption**  | Légende concise pour une photo            | Vision → réécriture courte    | Google Vision + GPT-4o     | ★★☆☆         |
| 4 | **AskAnything** | Chatbot Q/R concises                      | Réponse ≤ 50 mots             | OpenAI Chat Completion     | ★★☆☆         |
| 5 | **ProofRead**   | Correction orthographique & stylistique   | Relecture améliorée           | GPT-4o                     | ★★☆☆         |
| 6 | **MoodJournal** | Journal avec détection d’humeur           | Sentiment + conseil bien-être | Hugging Face + GPT-4o      | ★★☆☆         |

### 4.2 Nouvelles idées orientées « générateur / assistant »

| #  | Projet               | Description                                                        | Fonction IA                        | API suggérée          | Difficulté\* |
| -- | -------------------- | ------------------------------------------------------------------ | ---------------------------------- | --------------------- | ------------ |
| 7  | **QuizForge**        | Créer automatiquement un quiz (QCM, V/F) à partir d’un texte donné | Génération de questions & réponses | GPT-4o                | ★★☆☆         |
| 8  | **ExplainIt**        | Fournir une explication simplifiée d’un concept technique          | Vulgarisation contrôlée            | GPT-4o / Perplexity   | ★★☆☆         |
| 9  | **ToneCheck**        | Analyser et reformuler le ton d’un courriel                        | Détection de ton + réécriture      | GPT-4o                | ★★☆☆         |
| 10 | **LangBoost**        | Améliorer vocabulaire et grammaire d’un texte                      | Correction avancée                 | GPT-4o / DeepL        | ★★☆☆         |
| 11 | **MailCoach**        | Générer un courriel professionnel sur consigne courte              | Rédaction guidée                   | GPT-4o                | ★★☆☆         |
| 12 | **PitchBuilder**     | Produire un pitch de 30 s pour un projet                           | Résumé + slogan                    | GPT-4o                | ★★☆☆         |
| 13 | **EduFlash**         | Générer des cartes mémoire (flashcards)                            | Q/R automatiques                   | GPT-4o / Hugging Face | ★★☆☆         |
| 14 | **MyTherapyBot**     | Chat d’accompagnement émotionnel (non médical)                     | Sentiment + suggestion bien-être   | Hugging Face + GPT-4o | ★★☆☆         |
| 15 | **FitPrompt**        | Plan d’entraînement personnalisé                                   | Génération programme               | GPT-4o                | ★★☆☆         |
| 16 | **SpeechSimplifier** | Transcrire puis simplifier une phrase orale                        | ASR + simplification niveau B1     | Whisper + GPT-4o      | ★★☆☆         |
| 17 | **IdeaSpark**        | Idées de projets ou d’activités à partir d’un mot clé              | Brainstorm assisté                 | GPT-4o                | ★★☆☆         |
| 18 | **DreamTagger**      | Décrire une image et générer des hashtags                          | Vision + génération de tags        | Replicate + GPT-4o    | ★★☆☆         |
| 19 | **MindMapper**       | Construire une carte mentale automatique                           | Plan hiérarchique JSON             | GPT-4o                | ★★☆☆         |
| 20 | **PlanMyTrip**       | Itinéraire de voyage personnalisé                                  | Plan jour-par-jour                 | GPT-4o / Perplexity   | ★★☆☆         |

\***Échelle de difficulté (indicative)** :
★☆☆☆ = élémentaire | ★★☆☆ = standard | ★★★☆ = intermédiaire | ★★★★ = avancé



# 5. Projets personnalisés

Les équipes peuvent soumettre **une idée originale**, sous réserve :

1. **Intégration effective d’une API publique ou API IA** documentée, gratuite ou à faible coût.
2. Respect des contraintes de temps et de complexité (3 écrans minimum au Sprint 2).
3. Validation formelle via la fiche-projet **avant le 27 mai 2025, 23 h 59**.



# 6. Contraintes techniques incontournables

* **Flutter/Dart** exclusivement.
* Clé API stockée dans `.env` (package `flutter_dotenv`) ; **jamais** poussée sur Git.
* Gestion d’état : Provider, Riverpod ou Bloc.
* Journalisation minimale des appels API (endpoint, timestamp, tokens).
* Documentation embarquée et aide utilisateur au Sprint 2.



# 7. Évaluation synthèse

| Critère                                       | Sprint 1 | Sprint 2 |
| --------------------------------------------- | -------- | -------- |
| Cahier des charges complet                    | x       | —        |
| Prototype fonctionnel (appel IA simulé)       | x       | —        |
| Appel API IA réel, sécurisé                   | —        | x       |
| Qualité UX / UI / accessibilité               | x       | x       |
| Gestion d’état robuste                        | —        | x       |
| Architecture, qualité du code, historique Git | x      | x     |
| Documentation intégrée                        | —        | x       |
| Quiz individuel (technique)                   | —        | x      |



### Rappel essentiel

La **fiche-projet** constitue l’engagement officiel de chaque stagiaire ; aucun changement de thème ou d’API ne sera accepté après validation sans approbation écrite de l’enseignant.

Bonne planification et réussite à toutes et à tous.
