//
//  Bird.swift
//  LyndaARGame
//
//  Created by Brian Advent on 24.05.18.
//  Copyright © 2018 Brian Advent. All rights reserved.
//

import SpriteKit
import GameplayKit

class Bird : SKSpriteNode {
 
    var mainSprite : SKSpriteNode!
    
    func setupBird() {
        mainSprite = SKSpriteNode(imageNamed: "bird")
        self.addChild(mainSprite)
        
        let textureAtlas = SKTextureAtlas(named: "bird")
        let frames = ["sprite_0","sprite_1","sprite_2","sprite_3","sprite_4","sprite_5","sprite_6"].map { textureAtlas.textureNamed($0)}
        let atlasAnimation = SKAction.animate(withNormalTextures: frames, timePerFrame: 1/7, resize: true, restore: false)
        let animationAction = SKAction.repeatForever(atlasAnimation)
        mainSprite.run(animationAction)
        
        let left = GKRandomSource.sharedRandom().nextBool()
        
        if left {
            mainSprite.xScale = -1
        }
        
        let duration = randomNumber(lowerBound: 15, upperBound: 20)
        let fade = SKAction.fadeOut(withDuration: TimeInterval(duration))
        let removeBird = SKAction.run {
            NotificationCenter.default.post(name: Notification.Name("spwan"), object: nil)
            self.removeFromParent()
        }
        let flySequence = SKAction.sequence([fade, removeBird])
        mainSprite.run(flySequence)
    }
}


