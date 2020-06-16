//
//  LiveViewController_2_3.swift
//  Book_Sources
//
//  Created by Marco Tammaro on 16/03/2019.
//  PSU / SSD VIEW CONTROLLER

import UIKit
import Foundation
import PlaygroundSupport
import SpriteKit
import AVFoundation


public class LiveViewController_2_5: LiveViewController {
    
    let Scene = Scene_2_5()
    
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
                
            case "ssd":
                Scene.showSsd()
                break
                
            case "psu":
                Scene.showPsu()
                break
                
            default:
                break
            }
            
        default:
            break
            
        }
    }
}




class Scene_2_5 : SKScene {
    
    let ssd = SKSpriteNode(imageNamed: "ssd")
    let psu = SKSpriteNode(imageNamed: "psu")
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
    
    //MARK: - Functions called by the interaction of the user with the playground book
    
    public func showSsd() {
        self.addChild(ssd)
    }
    public func showPsu() {
        self.addChild(psu)
    }
    
    //MARK: - Setting up the position of the components
    
    override func didChangeSize(_ oldSize: CGSize) {
        ssd.position = CGPoint(x: self.size.width / 2, y: (self.size.height / 2) + 100)
        psu.position = CGPoint(x: self.size.width / 2, y: (self.size.height / 2) - 100)
        
        background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        background.setScale(0.6)
        background.zPosition = -3
        
    }
    
}
