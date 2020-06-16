//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Provides supporting functions for setting up a live view.
//

import UIKit
import Foundation
import PlaygroundSupport
import SpriteKit
import AVFoundation


public class LiveViewController_1_1: LiveViewController {
    
    let Scene = Scene_1_1()
    
    override public func loadView() {
        
        let view = SKView()
        view.presentScene(Scene)
        self.view = view
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}


class Scene_1_1 : SKScene {
    
    let background = SKSpriteNode(imageNamed: "background_large")
    
    override init() {
        super.init(size: CGSize.zero)
        self.backgroundColor = .white
        self.scaleMode = .resizeFill
        
        self.addChild(background)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setting up the position of the components
    
    override func didChangeSize(_ oldSize: CGSize) {
        
        background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        background.setScale(0.6)
        background.zPosition = -1
        
    }
    
}
