//
//  Rocket.swift
//  Scramble
//
//  Created by Guillaume on 04/02/2026.
//

import SpriteKit
import GameplayKit

class Rocket : SKSpriteNode {
    
    private var damage : Int = 5
    
    init(grav: Bool, rota: Bool, damp: CGFloat) {
        let texture = SKTexture(imageNamed: "rocket")
        super.init(texture: texture, color: .white, size: CGSize(width: 30, height: 5))
        
        self.name = "rocket"

        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.isDynamic = true
        self.physicsBody?.velocity = CGVector(dx: 500, dy: 0)
        self.physicsBody?.affectedByGravity = grav
        self.physicsBody?.allowsRotation = rota
        self.physicsBody?.linearDamping = damp
        
        self.physicsBody?.categoryBitMask = PhysicsCategory.rocket
        self.physicsBody?.contactTestBitMask = PhysicsCategory.ennemy | PhysicsCategory.floor
        self.physicsBody?.collisionBitMask = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func createLinear(x : Int, y : Int, width : Int) -> Rocket {
        let r = Rocket(grav: false, rota: false, damp: 0.5)
        r.position = CGPoint(x: x + width/2, y: y)
        return r
    }
    
    static func createDown(x : Int, y : Int, width : Int) -> Rocket {
        let r = Rocket(grav: true, rota: true, damp: 0.5)
        r.position = CGPoint(x: x + width/2, y: y)
        return r
    }
    
    func getDamage() -> Int{
        return damage
    }
}
