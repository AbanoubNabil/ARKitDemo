//
//  ViewController.swift
//  ARDemo
//
//  Created by Ahmed El-Diftar on 3/24/19.
//  Copyright © 2019 MMD. All rights reserved.
//

import UIKit
import SpriteKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet var sceneView: ARSKView!
    override func viewDidLoad() {
        super.viewDidLoad()
     sceneView.delegate = self
        if let scene = SKScene(fileNamed: "Scene") {
            sceneView.presentScene(scene)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sceneView.session.pause()
    }

}

extension ViewController: ARSKViewDelegate {
    
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        if GameScene.gameState == .spwanBirds{
         let bird = Bird()
            bird.setupBird()
            return bird
        }else{
            return SKNode()
        }
    }

    func view(_ view: ARSKView, didAdd node: SKNode, for anchor: ARAnchor) {
        let birdnode = SKSpriteNode(imageNamed: "bird")
        birdnode.xScale = 0.25
        birdnode.yScale = 0.25
        node.addChild(birdnode)
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        
    }
    
}
