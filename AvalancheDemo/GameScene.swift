//
//  GameScene.swift
//  AvalancheDemo
//
//  Created by Kenny Testa on 3/9/17.
//  Copyright © 2017 Kenny Testa. All rights reserved.
//

import SpriteKit
import CoreMotion


class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var background:SKNode!
    var midground:SKNode!
    var foreground:SKNode!
    var hud:SKNode!
    var player: SKNode!
    var scaleFactor:CGFloat!
   // var startButton = SKSpriteNode(imageNamed: "something.png")
    var endOfGamePosition = 0
    let motionManager = CMMotionManager()
    var xAcceleration:CGFloat = 0.0
    var scoreLabel:SKLabelNode!
    var flowerLabel:SKLabelNode!
    var playersMaxY:Int!
    var gameOver = false
    var playerAcceleration = CGVector(dx: 0, dy: 0)
    var playerVelocity = CGVector(dx: 0, dy: 0)
    
    override func didMove(to view: SKView) {
        

        
        
       // player = (self.childNode(withName: "player") as? SKSpriteNode)!
        
        var fallingBlockTimer = Timer.scheduledTimer(timeInterval: 2.30, target: self, selector: Selector("spawnFallingBlocks"), userInfo: nil, repeats: true)

    }

    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    override init(size:CGSize){
        super.init(size:size)
        backgroundColor = SKColor.white
        
        scaleFactor = self.size.width / 320
        
        background = createBackground()
        addChild(background)
        
        midground = createMidground()
        addChild(midground)
        
        foreground = SKNode()
        addChild(foreground)
        
        player = createPlayer()
        foreground.addChild(player)
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -10)
        physicsWorld.contactDelegate = self
        
        motionManager.startAccelerometerUpdates()
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.startAccelerometerUpdates(to: OperationQueue.main){
            (data,error) in
            let floatedAcceleration = CGFloat((data?.acceleration.x)!)
            self.player.physicsBody?.applyImpulse(CGVector(dx:floatedAcceleration * 50 ,dy:0))
            
        }

        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var otherNode:SKNode!
        
        if contact.bodyA.node != player{
            otherNode = contact.bodyA.node
        }else{
            otherNode = contact.bodyB.node
        }
        
        (otherNode as! GenericNode).collisionWithPlayer(player: player)
        
        
    }


    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        player.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        player.physicsBody?.applyImpulse(CGVector(dx: 0 ,dy: 20))
        self.run(SKAction.playSoundFileNamed("jump.mp3", waitForCompletion: true))
       
       
    }
  
        
        
        
   override func update(_ currentTime: CFTimeInterval) {
  
    
    if self.player.position.x < self.frame.minX  {
        
        self.player.position.x = self.frame.maxX
        
    }
        
    else if self.player.position.x > self.frame.maxX  {
        
        self.player.position.x = self.frame.minX 
    }
    
            
        }
    
}
