//
//  GenericNode.swift
//  AvalancheDemo
//
//  Created by Kenny Testa on 3/12/17.
//  Copyright © 2017 Kenny Testa. All rights reserved.
//

import SpriteKit



struct CollisionBitMask {

    static let Player:UInt32 = 0x00
    static let Flower:UInt32 = 0x01
    static let Brick:UInt32 = 0x02
}


class GenericNode: SKNode {

    func collisionWithPlayer (player:SKNode) -> Bool{
        return false
    }
    
    func shouldRemoveNode (playerY:CGFloat){
        if playerY > self.position.y + 300{
            self.removeFromParent()
        }
    }
    
}
