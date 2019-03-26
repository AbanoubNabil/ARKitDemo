//
//  Scene.swift
//  ARDemo
//
//  Created by Ahmed El-Diftar on 3/24/19.
//  Copyright © 2019 MMD. All rights reserved.
//

import SpriteKit
import ARKit

class Scene: SKScene {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let sceneView = self.view as? ARSKView else {
            return
        }
        if let touchLocation = touches.first?.location(in: sceneView) {
            if let hit = sceneView.hitTest(touchLocation, types: .featurePoint).first{
                    sceneView.session.add(anchor: ARAnchor(transform: hit.worldTransform))
            }
        }
    }
}
