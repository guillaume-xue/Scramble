//
//  GameOverScene.swift
//  Scramble
//
//  Created by Guillaume on 09/02/2026.
//

import SpriteKit

class GameOverScene: SKScene {

    var score: Int = 0

    var scoreLabel: SKLabelNode?
    
    override func didMove(to view: SKView) {
        scoreLabel = self.childNode(withName: "scoreLabel") as? SKLabelNode
        scoreLabel?.text = "Score : \(score)"
    }

    override func mouseDown(with event: NSEvent) {
        let location = event.location(in: self)
        let node = atPoint(location)
        
        if node.name == "restartButton" {
            chargerScene(nom: "GameScene")
        } else if node.name == "menuButton" {
            chargerScene(nom: "MenuScene")
        }
    }
    
    func chargerScene(nom: String) {
        if let scene = SKScene(fileNamed: nom) {
            scene.scaleMode = .aspectFill
            let transition = SKTransition.fade(withDuration: 1.0)
            self.view?.presentScene(scene, transition: transition)
        }
    }
    
}
