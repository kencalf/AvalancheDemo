//
//  GameHandler.swift
//  AvalancheDemo
//
//  Created by Kenny Testa on 3/12/17.
//  Copyright © 2017 Kenny Testa. All rights reserved.
//

import Foundation

class GameHandler {

    var score:Int
    var highScore:Int
    var flowers:Int
    
    var levelData:NSDictionary!
    
    class var sharedInstance:GameHandler{
    
        struct Singleton{
            static let instance = GameHandler()
        
        }
        return Singleton.instance
    }
    
    
    init(){
        score = 0
        highScore = 0
        flowers = 0
        
       
        
        
        
    }
    
    
}
