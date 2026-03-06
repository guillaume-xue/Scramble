# Scramble - Projets Swift

Workspace contenant un applications Swift natives pour macOS: un jeu d'arcade.

## 📚 Projets

### **Scramble** - Jeu d'Arcade 2D

Jeu d'action 2D où le joueur contrôle un vaisseau et détruit des ennemis pour marquer des points.

#### ✨ Features

- **Gameplay:** 
  - Contrôler un vaisseau du joueur (`Plane`)
  - Tirer des missiles (`Rocket`) pour détruire les ennemis (`Mob`)
  - Éviter les obstacles mouvants (`Floor`)

- **Système de points:**
  - Détruire un ennemi = +100 points
  - Collision avec un ennemi = Game Over

- **3 Scènes:**
  - `MenuScene` - Menu principal
  - `GameScene` - Gameplay principal
  - `GameOverScene` - Écran de fin de partie

- **Physique 2D:** 
  - Gravité, détection de collision
  - Contrôle de vitesse et amortissement

#### 🏗️ Architecture

- **Framework:** SpriteKit + GameplayKit
- **Entités de jeu:**
  - `Entity/Plane.swift` - Vaisseau joueur
  - `Entity/Mob.swift` - Ennemis (10 HP, 100 points)
  - `Entity/Rocket.swift` - Projectiles
  - `Entity/Floor.swift` - Obstacles mouvants
- **Configuration:** `Utils/Constants.swift`
- **Scènes:** `Scene/` contient le code et fichiers .sks

#### 🚀 Lancer le jeu

```bash
cd Scramble
open Scramble.xcodeproj
```

Sélectionner le schéma "Scramble" et appuyer sur Run (⌘R).

---

## 📁 Structure du Workspace

```
  Scramble/                      # Jeu SpriteKit
  ├── Scramble/
  │   ├── App/                   # AppDelegate
  │   ├── Entity/                # Entités de jeu
  │   ├── Scene/                 # Scènes du jeu
  │   ├── Utils/                 # Constants et utilitaires
  │   ├── Managers/              # ViewController
  │   ├── Base.lproj/            # Storyboard
  │   ├── Assets.xcassets/       # Ressources visuelles
  │   └── Actions.sks            # Actions SpriteKit
  └── Scramble.xcodeproj/
```

---

## 💻 Prérequis

- **Xcode** 15.0 ou supérieur
- **macOS** 13.0 ou supérieur
- **Swift** 5.9+

---

## 🛠️ Environnement de développement

- **Scramble:** Application macOS native avec SpriteKit

Pour switch entre les projets, ouvrez simplement le fichier `.xcodeproj` correspondant.

---

## 📝 Notes de développement

### Scramble
- Utilise SpriteKit pour le rendu 2D et GameplayKit pour la physique
- La physique et les collisions sont configurées dans `Constants.swift`
- `Plane`, `Mob`, et `Rocket` héritent probablement d'une classe de base commune

---

## 📄 Licence

À déterminer

---

## 👤 Auteur

Guillaume

---

**Dernière mise à jour:** Mars 2026
