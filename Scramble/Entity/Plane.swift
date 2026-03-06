//
//  Plane.swift
//  Scramble
//
//  Created by Guillaume on 04/02/2026.
//

import SpriteKit
import GameplayKit

class Plane : SKSpriteNode {
    
    init(){
        let texture = SKTexture(imageNamed: "spaceship")
        super.init(texture: texture, color: .red, size: CGSize(width: 100, height: 100))
        
        self.name = "plane"
        self.position = CGPoint(x: 50 , y:50)
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.categoryBitMask = PhysicsCategory.player
        self.physicsBody?.collisionBitMask = PhysicsCategory.obstacle
        self.physicsBody?.contactTestBitMask = PhysicsCategory.obstacle
        self.physicsBody?.isDynamic = true
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.linearDamping = 1.0
        self.physicsBody?.categoryBitMask = PhysicsCategory.player
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func generatePlane(s : SKScene){
        s.addChild(self)
    }

    func move(dx: CGFloat, dy: CGFloat) {
        self.physicsBody?.velocity = CGVector(dx: dx, dy: dy)
    }
}
