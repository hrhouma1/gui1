# ✅ Liste Simple TODO - Firebase Configuration

## 🗂️ ÉTAPE 1 : Créer Collection "App-Category"

### ✅ Créer ces 4 catégories :

**Document 1:**
- **Clé :** `name`
- **Valeur :** `"Breakfast"`

**Document 2:**
- **Clé :** `name` 
- **Valeur :** `"Lunch"`

**Document 3:**
- **Clé :** `name`
- **Valeur :** `"Dinner"`

**Document 4:**
- **Clé :** `name`
- **Valeur :** `"Snack"`

---

## 🍽️ ÉTAPE 2 : Créer Collection "Complete-Flutter-App"

### ✅ Structure pour CHAQUE document (7 clés obligatoires) :

| Clé | Type | Exemple |
|-----|------|---------|
| `cal` | string | `"300"` |
| `category` | string | `"Breakfast"` |
| `image` | string | `"https://firebasestorage..."` |
| `name` | string | `"Butter Paneer"` |
| `rating` | string | `"4.5"` |
| `reviews` | string | `"10"` |
| `time` | string | `"25"` |

### ✅ Créer ces 6 documents :

**Document 1 - Beef Steak:**
- `cal` : `"450"`
- `category` : `"Dinner"`
- `image` : `"URL_DE_VOTRE_IMAGE_BEEF_STEAK"`
- `name` : `"Grilled Beef Steak"`
- `rating` : `"4.8"`
- `reviews` : `"25"`
- `time` : `"30"`

**Document 2 - Butter Chicken:**
- `cal` : `"380"`
- `category` : `"Dinner"`
- `image` : `"URL_DE_VOTRE_IMAGE_BUTTER_CHICKEN"`
- `name` : `"Butter Chicken"`
- `rating` : `"4.6"`
- `reviews` : `"18"`
- `time` : `"45"`

**Document 3 - French Toast:**
- `cal` : `"280"`
- `category` : `"Breakfast"`
- `image` : `"URL_DE_VOTRE_IMAGE_FRENCH_TOAST"`
- `name` : `"French Toast"`
- `rating` : `"4.3"`
- `reviews` : `"32"`
- `time` : `"15"`

**Document 4 - Mexican Pizza:**
- `cal` : `"520"`
- `category` : `"Lunch"`
- `image` : `"URL_DE_VOTRE_IMAGE_MEXICAN_PIZZA"`
- `name` : `"Mexican Pizza"`
- `rating` : `"4.7"`
- `reviews` : `"41"`
- `time` : `"20"`

**Document 5 - Dumplings:**
- `cal` : `"220"`
- `category` : `"Lunch"`
- `image` : `"URL_DE_VOTRE_IMAGE_DUMPLINGS"`
- `name` : `"Steamed Dumplings"`
- `rating` : `"4.4"`
- `reviews` : `"15"`
- `time` : `"35"`

**Document 6 - Ramen Noodles:**
- `cal` : `"350"`
- `category` : `"Dinner"`
- `image` : `"URL_DE_VOTRE_IMAGE_RAMEN"`
- `name` : `"Ramen Noodles"`
- `rating` : `"4.5"`
- `reviews` : `"28"`
- `time` : `"25"`

---

## 📁 ÉTAPE 3 : Upload Images dans Storage

### ✅ Créer dossier "images" et uploader :

- [ ] `beef-steak.jpg`
- [ ] `butter-chicken.jpg`
- [ ] `french-toast.jpg`
- [ ] `mexican-pizza.jpg`
- [ ] `dumplings.jpg`
- [ ] `ramen-noodles.jpg`

**⚠️ IMPORTANT :** Copiez l'URL de chaque image et remplacez `"URL_DE_VOTRE_IMAGE_XXX"` dans vos documents !

---

## ✅ CHECKLIST RAPIDE

- [ ] Collection `App-Category` créée
- [ ] 4 catégories ajoutées (Breakfast, Lunch, Dinner, Snack)
- [ ] Collection `Complete-Flutter-App` créée  
- [ ] 6 documents recettes ajoutés
- [ ] Toutes les 7 clés présentes dans chaque document
- [ ] 6 images uploadées dans Storage/images
- [ ] URLs des images copiées dans les documents
- [ ] Tous les types de champs en "string"

**🎉 C'est fait ! Testez votre app Flutter !** 