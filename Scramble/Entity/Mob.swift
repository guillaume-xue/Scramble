//
//  Mob.swift
//  Scramble
//
//  Created by Guillaume on 30/01/2026.
//

import SpriteKit
import GameplayKit

class Mob : SKSpriteNode {

    private var hp: Int = 10
    private var score : Int = 100
    private var mob_velocity : CGFloat = -100
    
    init() {
        let texture = SKTexture(imageNamed: "mob")
        super.init(texture: texture, color: .cyan, size: CGSize(width: 50, height: 50))
        
        self.name = "mob"
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.velocity = CGVector(dx: mob_velocity, dy: 0)
        self.physicsBody?.linearDamping = 0
        self.physicsBody?.categoryBitMask = PhysicsCategory.ennemy
        self.physicsBody?.collisionBitMask = 0
        self.physicsBody?.contactTestBitMask = PhysicsCategory.rocket
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getHP() -> Int{
        return hp
    }
    
    func getScore() -> Int {
        return score
    }
    
    func setHP(a : Int){
        self.hp -= a
    }
    
}
