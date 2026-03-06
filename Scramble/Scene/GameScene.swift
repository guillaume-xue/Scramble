//
//  GameScene.swift
//  Scramble
//
//  Created by Guillaume on 21/01/2026.
//

import SpriteKit
import GameplayKit



class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var plane : Plane?
    private var mob : Mob?
    private var rocket : Rocket?
    private var nbMob: Int = 0
    private var HPLabel : SKLabelNode?
    private var score : Int = 0
    private var curFloorY: Int = -800
    private var curFloorX: Int = 600
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        createBackground()
        
        self.mob = Mob()
        self.plane = Plane()
        
        self.generateFloor()
        plane?.generatePlane(s: self)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if ((firstBody.categoryBitMask & PhysicsCategory.ennemy != 0) &&
            (secondBody.categoryBitMask & PhysicsCategory.rocket != 0)) {
            
            if let mobNode = firstBody.node as? Mob,
               let rocketNode = secondBody.node as? Rocket {
                rocketDidHitMob(rocket: rocketNode, mob: mobNode)
            }
        }
        
        if ((firstBody.categoryBitMask & PhysicsCategory.player != 0) &&
            (secondBody.categoryBitMask & PhysicsCategory.ennemy != 0)) {
            
            if let planeNode = firstBody.node as? Plane,
               let mobNode = secondBody.node as? Mob {
                playerDidHitMob(plane: planeNode, mob: mobNode)
            }
        }
        
        let collisionMask = firstBody.categoryBitMask | secondBody.categoryBitMask

        if collisionMask == (PhysicsCategory.floor | PhysicsCategory.rocket) {
            if let rocketNode = firstBody.node as? Rocket {
                rocketNode.removeFromParent()
            } else if let rocketNode = secondBody.node as? Rocket {
                rocketNode.removeFromParent()
            }
        }
    }
    
    func createBackground() {
        let backgroundTexture = SKTexture(imageNamed: "background")
        let background = SKSpriteNode(texture: backgroundTexture)
        background.position = CGPoint(x: 0, y: 0)
        background.size = CGSize(width: self.size.width + 100, height: self.size.height + 100)
        background.zPosition = -10
        self.addChild(background)
    }
    
    func rocketDidHitMob(rocket: Rocket, mob: Mob) {
        mob.setHP(a: rocket.getDamage())
        if (mob.getHP() <= 0){
            mob.removeFromParent()
            self.nbMob -= 1
            self.score += mob.getScore()
            let label = self.childNode(withName: "//NScore") as? SKLabelNode
            label?.text = String(self.score)
        }
        rocket.removeFromParent()
    }
    
    func playerDidHitMob(plane: Plane, mob: Mob) {
        if let gameOverScene = SKScene(fileNamed: "GameOverScene") as? GameOverScene {
            gameOverScene.scaleMode = .aspectFill
            let transition = SKTransition.fade(withDuration: 1.0)
            self.view?.presentScene(gameOverScene, transition: transition)
        } else {
            print("Erreur : Le fichier GameOverScene.sks est introuvable.")
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func mouseDown(with event: NSEvent) {
        self.touchDown(atPoint: event.location(in: self))
    }
    
    override func mouseDragged(with event: NSEvent) {
        self.touchMoved(toPoint: event.location(in: self))
    }
    
    override func mouseUp(with event: NSEvent) {
        self.touchUp(atPoint: event.location(in: self))
    }
    
    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        case 0x0D:// w
            self.plane?.move(dx: 0, dy: 200)
        case 0x00:// a
            self.plane?.move(dx: -200, dy: 0)
        case 0x01:// s
            self.plane?.move(dx: 0, dy: -200)
        case 0x02:// d
            self.plane?.move(dx: 200, dy: 0)
        case 0x26:// j (Tir droit)
            if let plane = self.plane {
                let rock = Rocket.createLinear(x: Int(plane.position.x), y: Int(plane.position.y), width: Int(plane.size.width))
                self.addChild(rock)
            }
        case 0x28:// k (Tir bas)
            if let plane = self.plane {
                let rock = Rocket.createDown(x: Int(plane.position.x), y: Int(plane.position.y), width: Int(plane.size.width))
                self.addChild(rock)
            }
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }
    
    func generateMob() {
        if nbMob < 3 {
            var isValidPosition = false
            var spawnPoint = CGPoint.zero
            var attempts = 0
            while !isValidPosition && attempts < 10 {
                let x = Int.random(in: 600...800)
                let y = Int.random(in: -400...200)
                let checkPoint = CGPoint(x: x, y: y - 30)
                let nodesAtPosition = self.nodes(at: checkPoint)
                let hitFloor = nodesAtPosition.contains { node in
                    return node.name == "floor"
                }
                if !hitFloor {
                    spawnPoint = CGPoint(x: x, y: y)
                    isValidPosition = true
                }
                attempts += 1
            }
            if isValidPosition {
                let newMob = Mob()
                newMob.position = spawnPoint
                nbMob += 1
                self.addChild(newMob)
            }
        }
    }
    
    func generateFloor(){
        for i in 0...1000{
            let rand = Int.random(in: 0...100)
            var y = self.curFloorY
            if rand > 20 && rand <= 60 {
                y += 20
            } else if rand > 60 {
                y -= 20
            }
            if y > -420 {
                y = -320
            }
            if y < -840 {
                y = -840
            }
            self.curFloorY = y
            let newFloor = Floor()
            newFloor.position = CGPoint(x: curFloorX + 20 * i, y: self.curFloorY)
            self.addChild(newFloor)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        generateMob()
        
        self.enumerateChildNodes(withName: "mob") { (node, stop) in
            if node.position.x < -700 {
                node.removeFromParent()
                self.nbMob -= 1
            }
        }
    }
}

