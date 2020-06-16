//
//  LiveViewController_2_3.swift
//  Book_Sources
//
//  Created by Marco Tammaro on 16/03/2019.
//  RAM VIEW CONTROLLER

import UIKit
import Foundation
import PlaygroundSupport
import SpriteKit
import AVFoundation


public class LiveViewController_2_3: LiveViewController {
    
    let Scene = Scene_2_3()
    
    override public func loadView() {
        
        let view = SKView()
        view.presentScene(Scene)
        self.view = view
    }
    
    public override func viewDidLoad() {
        
        super.viewDidLoad()
        confettiView = ConfettiView(frame: self.view.bounds)
        view.addSubview(confettiView)
    }
    
    override public func receive(_ message: PlaygroundValue) {
        
        switch message {
            
        case  let .string(text):
            
            switch text {
                
            case "motherboard":
                Scene.allowMotherboard()
                break
                
            case "ram":
                Scene.allowRam()
                break
                
            default:
                break
            }
            
        default:
            break
            
        }
    }
}




class Scene_2_3 : SKScene {
    
    let motherboard = SKSpriteNode(imageNamed: "mb_heat_sink")
    let ram1 = SKSpriteNode(imageNamed: "ram_front")
    let ram2 = SKSpriteNode(imageNamed: "ram_front")
    
    let background = SKSpriteNode(imageNamed: "background_large")
    let ramSlotArea = SKSpriteNode(color: .init(white: 0, alpha: 0), size: CGSize(width: 20, height: 180))
    
    let trumpet = SKSpriteNode(imageNamed: "trumpet")
    var doneSound: AVAudioPlayer?
    
    var canAddMotherboard = false
    var canAddRam1 = false
    var canAddRam2 = false
    
    override init() {
        super.init(size: CGSize.zero)
        self.backgroundColor = .white
        self.scaleMode = .resizeFill
        
        self.addChild(background)
        self.addChild(trumpet)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions called by the interaction of the user with the playground book
    
    public func allowMotherboard() {
        canAddMotherboard = true
        self.addChild(motherboard)
    }
    public func allowRam() {
        canAddRam1 = true
        canAddRam2 = true
        self.addChild(ram1)
        animatedPulse(object: ram1)
    }
    
    //MARK: - Setting up the position of the components
    
    override func didChangeSize(_ oldSize: CGSize) {
        
        background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        background.setScale(0.6)
        background.zPosition = -3
        
        trumpet.position = CGPoint(x: (self.size.width / 2) + 1000, y: (self.size.height / 2) - 1000)
        trumpet.setScale(0.5)
        trumpet.zPosition = 0
        
        if self.size.width > self.size.height {
            
            motherboard.position = CGPoint(x: (self.size.width / 2) - 150, y: (self.size.height / 2))
            motherboard.zPosition = -2
            
            if ramSlotArea.zPosition == 0 {
                ramSlotArea.position = CGPoint(x: (self.size.width / 2) - 80, y: (self.size.height / 2) + 110)
            } else {
                ramSlotArea.position = CGPoint(x: (self.size.width / 2) - 40, y: (self.size.height / 2) + 110)
            }
            
            
            if ram1.zPosition == 0 {
                ram1.position = CGPoint(x: (self.size.width / 2) + 200, y: (self.size.height / 2))
                ram1.zPosition = 0
            } else {
                ram1.position = CGPoint(x: (self.size.width / 2) - 79, y: (self.size.height / 2) + 106)
                ram1.zPosition = -1
            }
            
            
            if ram2.zPosition == 0 {
                ram2.position = CGPoint(x: (self.size.width / 2) + 200, y: (self.size.height / 2))
                ram2.zPosition = 0
            } else {
                ram2.position = CGPoint(x: (self.size.width / 2) - 41, y: (self.size.height / 2) + 106)
                ram2.zPosition = -1
            }
            
        } else {
            
            motherboard.position = CGPoint(x: self.size.width / 2, y: (self.size.height / 2) + 100)
            motherboard.zPosition = -2
            
            if ramSlotArea.zPosition == 0 {
                ramSlotArea.position = CGPoint(x: (self.size.width / 2) + 70, y: (self.size.height / 2) + 210)
            } else {
                ramSlotArea.position = CGPoint(x: (self.size.width / 2) + 110, y: (self.size.height / 2) + 210)
            }
            
            
            if ram1.zPosition == 0 {
                ram1.position = CGPoint(x: self.size.width / 2, y: (self.size.height / 2) - 250)
                ram1.zPosition = 0
            } else {
                ram1.position = CGPoint(x: (self.size.width / 2) + 71, y: (self.size.height / 2) + 206)
                ram1.zPosition = -1
            }
            
            
            if ram2.zPosition == 0 {
                ram2.position = CGPoint(x: self.size.width / 2, y: (self.size.height / 2) - 250)
                ram2.zPosition = 0
            } else {
                ram2.position = CGPoint(x: (self.size.width / 2) + 109, y: (self.size.height / 2) + 206)
                ram2.zPosition = -1
            }
        }
        
    }
    
    //MARK: - Managing the movement of the components
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        ram1.removeAllActions()
        ram2.removeAllActions()
        
        if let touch = touches.first {
            
            if ram1.zPosition == 0 {
                ram1.position = touch.location(in: self)
            }
            if ram2.zPosition == 0 {
                ram2.position = touch.location(in: self)
            }
            
            if motherboard.contains(ram1.position) {
                ram1.texture = SKTexture(imageNamed: "ram_top")
                ram1.size = UIImage(named: "ram_top")!.size
                
            } else {
                ram1.texture = SKTexture(imageNamed: "ram_front")
                ram1.size = UIImage(named: "ram_front")!.size
            }
            
            
            if motherboard.contains(ram2.position) {
                ram2.texture = SKTexture(imageNamed: "ram_top")
                ram2.size = UIImage(named: "ram_top")!.size
                
            } else {
                ram2.texture = SKTexture(imageNamed: "ram_front")
                ram2.size = UIImage(named: "ram_front")!.size
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if ramSlotArea.contains(ram1.position) && ram1.zPosition == 0{
            
            playSound()
            
            ram1.zPosition = -1
            
            if self.size.width > self.size.height {
                
                let destinantion = CGPoint(x: (self.size.width / 2) - 79, y: (self.size.height / 2) + 106)
                let action  = SKAction.move(to: destinantion, duration: 0.5)
                ram1.run(action)
                ramSlotArea.position = CGPoint(x: (self.size.width / 2) - 40, y: (self.size.height / 2) + 110)
                ramSlotArea.zPosition = -1
                
            } else {
                
                let destinantion = CGPoint(x: (self.size.width / 2) + 71, y: (self.size.height / 2) + 206)
                let action  = SKAction.move(to: destinantion, duration: 0.5)
                ram1.run(action)
                ramSlotArea.position = CGPoint(x: (self.size.width / 2) + 110, y: (self.size.height / 2) + 210)
                ramSlotArea.zPosition = -1
            }
            
            //adding ram2 object
            if canAddRam2 {
                self.addChild(ram2)
                
                if self.size.width > self.size.height {
                    ram2.position = CGPoint(x: (self.size.width / 2) + 200, y: (self.size.height / 2))
                    ram2.zPosition = 0
                } else {
                    ram2.position = CGPoint(x: self.size.width / 2, y: (self.size.height / 2) - 250)
                    ram2.zPosition = 0
                }
                animatedPulse(object: ram2)
                
                ram2.texture = SKTexture(imageNamed: "ram_front")
                let image = UIImage(named: "ram_front")
                ram2.size = CGSize(width: image!.size.width, height: image!.size.height)
            }
            
            
            
        }
        
        if ramSlotArea.contains(ram2.position) && ram2.zPosition == 0{
            playSound()
            ram2.zPosition = -1
            
            if self.size.width > self.size.height {
                let destinantion = CGPoint(x: (self.size.width / 2) - 41, y: (self.size.height / 2) + 106)
                let action  = SKAction.move(to: destinantion, duration: 0.5)
                ram2.run(action)
            } else {
                let destinantion = CGPoint(x: (self.size.width / 2) + 109, y: (self.size.height / 2) + 206)
                let action  = SKAction.move(to: destinantion, duration: 0.5)
                ram2.run(action)
            }
            
            animateTrumpet()
            confettiView.startConfetti()
        }
    }
    
    //MARK: - Utility functions to manage the animation and the 'reward' effects
    
    /// reproduce the sound of success
    func playSound() {
        let path = Bundle.main.path(forResource: "well_done.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            doneSound = try AVAudioPlayer(contentsOf: url)
            doneSound?.play()
        } catch {
            print("file not loaded")
        }
    }
    
    /// preproduce the sound of success finish
    func playTriumph() {
        let path = Bundle.main.path(forResource: "triumph.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            doneSound = try AVAudioPlayer(contentsOf: url)
            doneSound?.play()
            
        } catch {
            print("file not loaded")
        }
    }
    
    /// used to animated the components giving a nice effect of pulsing
    func animatedPulse(object: SKSpriteNode) {
        let pulseUp = SKAction.scale(to: 1.2, duration: 0.5)
        let pulseDown = SKAction.scale(to: 1.0, duration: 0.5)
        let pulse = SKAction.sequence([pulseUp, pulseDown])
        let repeatPulse = SKAction.repeatForever(pulse)
        object.run(repeatPulse)
    }
    
    /// move the trumpet into the screen
    func animateTrumpet() {
        playTriumph()
        let destination  = SKAction.move(to: CGPoint(x: size.width, y: size.height - size.height), duration: 0.5)
        trumpet.run(destination)
        
        let pulseUp = SKAction.scale(to: 0.5, duration: 0.5)
        let pulseDown = SKAction.scale(to: 0.4, duration: 0.5)
        let pulse = SKAction.sequence([pulseUp, pulseDown])
        let repeatPulse = SKAction.repeatForever(pulse)
        trumpet.run(repeatPulse)
        
        let dismiss  = SKAction.move(to: CGPoint(x: (self.size.width / 2) + 1000, y: (self.size.height / 2) - 1000), duration: 0.5)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.trumpet.run(dismiss)
        }
        
    }
    
}
