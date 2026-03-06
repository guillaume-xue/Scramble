//
//  Floor.swift
//  Scramble
//
//  Created by Guillaume on 28/01/2026.
//

import SpriteKit
import GameplayKit

class Floor : SKSpriteNode {
    
    init(){
        let texture = SKTexture(imageNamed: "floor")
        super.init(texture: texture, color: .white, size: CGSize(width: 20, height: 1000))
        self.name = "floor"
        
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.isDynamic = false
        self.physicsBody?.restitution = 0.0

        self.physicsBody?.categoryBitMask = PhysicsCategory.floor
        self.physicsBody?.collisionBitMask = PhysicsCategory.player | PhysicsCategory.ennemy
                
        self.physicsBody?.contactTestBitMask = PhysicsCategory.rocket
        let moveAction = SKAction.moveBy(x: -100, y: 0, duration: 1.0)
        let repeatAction = SKAction.repeatForever(moveAction)
        
        self.run(repeatAction)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(){
        if self.position.x <= -600 {
            self.removeFromParent()
        }
    }
}
