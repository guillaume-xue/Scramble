//
//  Constants.swift
//  Scramble
//
//  Created by Guillaume on 09/02/2026.
//

struct PhysicsCategory {
    static let player : UInt32 = 0x1 << 1
    static let ball : UInt32 = 0x1 << 2
    static let ennemy : UInt32 = 0x1 << 4
    static let rocket : UInt32 = 0x1 << 8
    static let floor : UInt32 = 0x1 << 16
    
    static let obstacle : UInt32 = PhysicsCategory.ennemy | PhysicsCategory.floor
    static let vaisseau : UInt32 = PhysicsCategory.player | PhysicsCategory.ball
}
