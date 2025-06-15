# Fiche-projet – Développement Flutter avec API d’Intelligence Artificielle

**Remise : 27 mai 2025**

## 1. Titre du projet

**QuizForge – Générateur automatique de quiz à partir d’un texte**

## 2. Problématique / contexte d’usage

De nombreux enseignants, formateurs et créateurs de contenu cherchent à transformer rapidement un contenu textuel en exercice d’évaluation (quiz). Ce processus manuel est chronophage et répétitif. Une solution automatisée pourrait faire gagner du temps tout en diversifiant les activités pédagogiques.

## 3. Public cible

* Enseignants du secondaire et supérieur
* Formateurs en ligne (MOOC, e-learning)
* Étudiants souhaitant réviser de manière active

## 4. API publique ou API IA retenue

* **Nom** : OpenAI GPT-4o
* **URL** : [https://platform.openai.com/docs](https://platform.openai.com/docs)

## 5. Fonction principale

À partir d’un texte fourni par l’utilisateur, générer automatiquement un quiz de 5 questions (QCM ou vrai/faux), avec réponses proposées.

## 6. Structure fonctionnelle préliminaire

| Écran             | Description                                                                            |
| ----------------- | -------------------------------------------------------------------------------------- |
| Écran d’accueil   | Logo + bouton "Créer un quiz"                                                          |
| Saisie du texte   | Champ texte (multiligne) + bouton "Générer le quiz"                                    |
| Affichage du quiz | Affiche les 5 questions générées + options de réponse + bouton "Vérifier mes réponses" |
| Résultats         | Score + rétroaction + bouton "Recommencer"                                             |

