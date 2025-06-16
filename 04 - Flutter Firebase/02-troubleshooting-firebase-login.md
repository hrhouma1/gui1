### 1. Vérifier si Node.js est installé

Tape dans ton terminal :

```bash
node -v
```

Si cette commande retourne une erreur, installe Node.js depuis [https://nodejs.org/fr/](https://nodejs.org/fr/), version LTS.

---

### 2. Installer Firebase CLI

Une fois Node.js installé, exécute :

```bash
npm install -g firebase-tools
```

L'option `-g` permet une installation globale, accessible depuis n'importe quel terminal.

---

### 3. Vérifier que la commande est reconnue

Teste :

```bash
firebase --version
```

Puis connecte-toi :

```bash
firebase login
```

---

### 4. Si la commande n'est toujours pas reconnue

#### Sous Windows :

Il est probable que le chemin d'installation globale de `npm` ne soit pas inclus dans la variable d'environnement `PATH`.

Exécute :

```bash
npm list -g --depth=0
```

Repère le dossier d'installation (souvent :
`C:\Users\<NomUtilisateur>\AppData\Roaming\npm`)
et ajoute-le à la variable d’environnement `PATH` :

* Va dans le Panneau de configuration
* Ouvre "Système" > "Paramètres système avancés" > "Variables d’environnement"
* Modifie la variable `Path` dans la section "Utilisateur"
* Clique sur "Nouveau" et colle le chemin

---

### 5. Redémarrer le terminal

Ferme et rouvre ton terminal ou VSCode, puis réessaie :

```bash
firebase login
```

