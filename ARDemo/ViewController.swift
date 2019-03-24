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

