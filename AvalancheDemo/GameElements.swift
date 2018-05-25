//
//  GameElements.swift
//  AvalancheDemo
//
//  Created by Kenny Testa on 3/12/17.
//  Copyright © 2017 Kenny Testa. All rights reserved.
//

import Foundation

import SpriteKit

extension GameScene{

    
    
    
    func createBackground () -> SKNode {
    
        let backgroundNode = SKNode()
        let spacing = 64 * scaleFactor
        
        for index in 0 ... 19{
            let node = SKSpriteNode(imageNamed: String(format: "Background%02d", index + 1))
            node.setScale(scaleFactor)
            node.anchorPoint = CGPoint(x:0.5,y:0)
            node.position = CGPoint(x: self.size.width / 2, y: spacing * CGFloat(index))
            
            backgroundNode.addChild(node)
        
        }
        
        return backgroundNode
        
    }
    
    
    
    func createMidground () -> SKNode {
        let midgroundNode = SKNode()
        var anchor:CGPoint!
        var xPos:CGFloat!
        
        
        for index in 0 ... 9 {
            var name:String
            
            let randomNumber = arc4random() % 2
            
            if randomNumber > 0 {
                name = "cloudLeft"
                anchor = CGPoint(x:9,y:0.5)
                xPos = 0
                
            }else{
                name = "cloudRight"
                anchor = CGPoint(x:1,y:0.5)
                xPos = self.size.width
            
            }
            
            let cloudNode = SKSpriteNode(imageNamed: "cloudLeft.png")
            cloudNode.anchorPoint = anchor
            cloudNode.position = CGPoint(x: xPos, y: 500 * CGFloat(index))
            
            midgroundNode.addChild(cloudNode)
            
        
        }
        
        return midgroundNode
    
    
    
    }
    
    
    func createPlayer() -> SKNode{
    
    
    let playerNode = SKNode()
        
        playerNode.position = CGPoint(x: self.size.width / 2,y: 80)
        
        let sprite =  SKSpriteNode(imageNamed: "Player.png")
        playerNode.addChild(sprite)
        
        playerNode.physicsBody = SKPhysicsBody(circleOfRadius: sprite.size.width / 2)
        
        playerNode.physicsBody?.isDynamic = true
        playerNode.physicsBody?.allowsRotation = false
        
        playerNode.physicsBody?.restitution = 1
        playerNode.physicsBody?.friction = 0
        playerNode.physicsBody?.angularDamping = 0
        playerNode.physicsBody?.linearDamping = 0
        
        playerNode.physicsBody?.usesPreciseCollisionDetection = true
        
        playerNode.physicsBody?.categoryBitMask = CollisionBitMask.Player
        
        playerNode.physicsBody?.collisionBitMask = 0
        
        playerNode.physicsBody?.contactTestBitMask = CollisionBitMask.Flower | CollisionBitMask.Brick
        
        
        
        
        return playerNode
    
    }
    
    
    
    func spawnFallingBlocks(){
        
        let lowerValue = -700
        let upperValue = 700
        let spawnPoint = Int(arc4random_uniform(UInt32(upperValue - lowerValue + 1))) +   lowerValue
        var fallingBlock = SKSpriteNode.init(imageNamed: "snow.png")
        fallingBlock.position = CGPoint(x: spawnPoint, y: 2000)
        fallingBlock.physicsBody?.isDynamic = false
        fallingBlock.physicsBody?.affectedByGravity = true
        fallingBlock.physicsBody?.allowsRotation = false
        fallingBlock.zPosition = 100
        fallingBlock.physicsBody?.restitution = 0
        fallingBlock.size.width = CGFloat(arc4random_uniform(100) + 100)
        fallingBlock.size.height =  CGFloat(arc4random_uniform(100) + 100)
        fallingBlock.physicsBody = SKPhysicsBody(rectangleOf: fallingBlock.size)
        self.addChild(fallingBlock)
        fallingBlock.physicsBody?.restitution = 0
        fallingBlock.physicsBody?.allowsRotation = false
    }
    
    
    
    
    

}
