import SpriteKit

class MenuScene: SKScene {

    override func didMove(to view: SKView) {

    }
    
    override func mouseDown(with event: NSEvent) {
            let location = event.location(in: self)
            let node = atPoint(location)
            if node.name == "startButton" {
                launchGame()
            }
        }

    func launchGame() {
        if let button = childNode(withName: "startButton") {
            let scaleDown = SKAction.scale(to: 0.9, duration: 0.1)
            let scaleUp = SKAction.scale(to: 1.0, duration: 0.1)
            let sequence = SKAction.sequence([scaleDown, scaleUp])
            button.run(sequence) {
                self.goToGameScene()
            }
        }
    }
    
    func goToGameScene() {
        if let scene = SKScene(fileNamed: "GameScene") {
            scene.scaleMode = .aspectFill
            let transition = SKTransition.fade(withDuration: 1.0)
            self.view?.presentScene(scene, transition: transition)
        }
    }
}
