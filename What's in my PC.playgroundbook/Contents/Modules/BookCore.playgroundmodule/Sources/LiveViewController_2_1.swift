//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Provides supporting functions for setting up a live view.
//  MOTHERBOARD VIEW CONTROLLER

import UIKit
import Foundation
import PlaygroundSupport
import SpriteKit


public class LiveViewController_2_1: LiveViewController {
    
    let Scene = Scene_2_1()
    
    override public func loadView() {
        let view = SKView()
        view.presentScene(Scene)
        self.view = view
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override public func receive(_ message: PlaygroundValue) {
        
        switch message {
            
        case  let .string(text):
            
            switch text {
                
            case "motherboard":
                Scene.allowMotherboard()
                break
                
            default:
                break
            }
            
        default:
            break
            
        }
    }
}




class Scene_2_1 : SKScene {
    
    let motherboard = SKSpriteNode(imageNamed: "mb_framed")
    let background = SKSpriteNode(imageNamed: "background_large")
    
    let socketArea = SKSpriteNode(color: .init(white: 0, alpha: 0),
                                  size: CGSize(width: 101, height: 101))
    let ramArea = SKSpriteNode(color: .init(white: 0, alpha: 0),
                               size: CGSize(width: 90, height: 185))
    let gpuArea = SKSpriteNode(color: .init(white: 0, alpha: 0),
                               size: CGSize(width: 190, height: 50))
    
    var canAddMotherboard = false
    
    //MARK: - Functions called by the interaction of the user with the playground book
    
    public func allowMotherboard() {
        canAddMotherboard = true
        self.addChild(motherboard)
    }
    
    override init() {
        super.init(size: CGSize.zero)
        
        self.backgroundColor = .white
        self.scaleMode = .resizeFill
        
        self.addChild(background)
        
        if canAddMotherboard {
            self.addChild(motherboard)
            self.addChild(socketArea)
            self.addChild(ramArea)
            self.addChild(gpuArea)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setting up the position of the components
    
    override func didChangeSize(_ oldSize: CGSize) {
        
        motherboard.position = CGPoint(x: self.size.width / 2,
                                       y: self.size.height / 2)
        
        socketArea.position = CGPoint(x: (self.size.width / 2) - 14,
                                      y: (self.size.height / 2) + 136)
        
        ramArea.position = CGPoint(x: (self.size.width / 2) + 100,
                                   y: (self.size.height / 2) + 110)
        
        gpuArea.position = CGPoint(x: (self.size.width / 2) - 38,
                                   y: (self.size.height / 2) - 25)
        
        background.position = CGPoint(x: self.size.width / 2,
                                      y: self.size.height / 2)
        
        background.setScale(0.6)
        background.zPosition = -3
    }
    
    //MARK: - Managing the tap into the hot area of the matherboard
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            
            let action = UIAlertAction(title: "OK",
                                       style: .cancel,
                                       handler: nil)
            
            if socketArea.contains(touch.location(in: self)) {
                
                let alert = UIAlertController(title: "CPU socket",
                                              message: "Here you will place the component called CPU.",
                                              preferredStyle: .alert)
                alert.addAction(action)
                view?.window?.rootViewController?.present(alert, animated: true)
                
            } else if ramArea.contains(touch.location(in: self)) {
                
                let alert = UIAlertController(title: "RAMs slot",
                                              message: "In this slot you will place the components called RAM.",
                                              preferredStyle: .alert)
                alert.addAction(action)
                view?.window?.rootViewController?.present(alert, animated: true)
                
            } else if gpuArea.contains(touch.location(in: self)) {
                
                let alert = UIAlertController(title: "PCI Express slot",
                                              message: "In the PCI Express slot you will set the component called GPU.",
                                              preferredStyle: .alert)
                alert.addAction(action)
                view?.window?.rootViewController?.present(alert, animated: true)
                
            }
        }
    }
    
}
