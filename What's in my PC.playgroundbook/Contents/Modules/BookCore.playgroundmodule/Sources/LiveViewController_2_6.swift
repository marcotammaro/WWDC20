//
//  LiveViewController_2_3.swift
//  Book_Sources
//
//  Created by Marco Tammaro on 16/03/2019.
//  CASE VIEW CONTROLLER

import UIKit
import Foundation
import PlaygroundSupport
import SpriteKit
import AVFoundation


public class LiveViewController_2_6: LiveViewController {
    
    let Scene = Scene_2_6()
    
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
                
            case "case":
                Scene.allowCase()
                break
                
            case "motherboard":
                Scene.allowMotherboard()
                break
                
            case "ssd":
                Scene.allowSsd()
                break
                
            case "psu":
                Scene.allowPsu()
                break
                
            default:
                break
            }
            
        default:
            break
            
        }
    }
}




class Scene_2_6 : SKScene {
    
    let PCcase = SKSpriteNode(imageNamed: "case")
    let motherboard = SKSpriteNode(imageNamed: "mb_hs_ram_gpu")
    let ssd = SKSpriteNode(imageNamed: "ssd")
    let psu = SKSpriteNode(imageNamed: "psu")
    
    let motherboardArea = SKSpriteNode(color: .init(white: 0, alpha: 0), size: CGSize(width: 150, height: 180))
    let ssdArea = SKSpriteNode(color: UIColor.init(white: 0, alpha: 0), size: CGSize(width: 90, height: 70))
    let psuArea = SKSpriteNode(color: UIColor.init(white: 0, alpha: 0), size: CGSize(width: 100, height: 90))
    let background = SKSpriteNode(imageNamed: "background_large")
    
    let trumpet = SKSpriteNode(imageNamed: "trumpet")
    var doneSound: AVAudioPlayer?
    
    var canAddCase = false
    var canAddMotherboard = false
    var canAddSsd = false
    var canAddPsu = false
    
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
    
    public func allowCase() {
        canAddCase = true
        self.addChild(PCcase)
    }
    public func allowMotherboard() {
        canAddMotherboard = true
        self.addChild(motherboard)
        animatedPulse(object: motherboard)
    }
    public func allowSsd() {
        canAddSsd = true
    }
    public func allowPsu() {
        canAddPsu = true
    }
    
    //MARK: - Setting up the position of the components
    
    override func didChangeSize(_ oldSize: CGSize) {
        
        background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        background.setScale(0.6)
        background.zPosition = -3
        
        trumpet.position = CGPoint(x: (self.size.width / 2) + 1000, y: (self.size.height / 2) - 1000)
        trumpet.setScale(0.5)
        trumpet.zPosition = 0
        
        PCcase.setScale(0.50)
        motherboard.setScale(0.5)
        ssd.setScale(0.50)
        psu.setScale(0.50)
        
        if self.size.width > self.size.height {
            
            PCcase.position = CGPoint(x: (self.size.width / 2) - 150, y: (self.size.height / 2))
            PCcase.zPosition = -2
            
            if motherboard.zPosition == 0 {
                motherboard.position = CGPoint(x: (self.size.width / 2) + 200, y: (self.size.height / 2))
                motherboard.zPosition = 0
            } else {
                motherboard.position = CGPoint(x: (self.size.width / 2) - 242, y: (self.size.height / 2) + 90)
                motherboard.zPosition = -1
            }
            
            if ssd.zPosition == 0 {
                ssd.position = CGPoint(x: (self.size.width / 2) + 200, y: (self.size.height / 2))
                ssd.zPosition = 0
            } else {
                ssd.position = CGPoint(x: (self.size.width / 2) - 23, y: (self.size.height / 2) + 160)
                ssd.zPosition = -1
            }
            
            if psu.zPosition == 0 {
                psu.position = CGPoint(x: (self.size.width / 2) + 200, y: (self.size.height / 2))
                psu.zPosition = 0
            } else {
                psu.position = CGPoint(x: (self.size.width / 2) - 260, y: (self.size.height / 2) - 152)
                psu.zPosition = -1
            }
            
            motherboardArea.position = CGPoint(x: (self.size.width / 2) - 250, y: (self.size.height / 2) + 110)
            ssdArea.position = CGPoint(x: (self.size.width / 2) - 23 , y: (self.size.height / 2) + 160)
            psuArea.position = CGPoint(x: (self.size.width / 2) - 270, y: (self.size.height / 2) - 153)
            
        } else {
            
            PCcase.position = CGPoint(x: self.size.width / 2, y: (self.size.height / 2) + 100)
            PCcase.zPosition = -2
            
            if motherboard.zPosition == 0 {
                motherboard.position = CGPoint(x: self.size.width / 2, y: (self.size.height / 2) - 250)
                motherboard.zPosition = 0
            } else {
                motherboard.position = CGPoint(x: (self.size.width / 2) - 92, y: (self.size.height / 2) + 190)
                motherboard.zPosition = -1
            }
            
            if ssd.zPosition == 0 {
                ssd.position = CGPoint(x: self.size.width / 2, y: (self.size.height / 2) - 250)
                ssd.zPosition = 0
            } else {
                ssd.position = CGPoint(x: (self.size.width / 2) + 127 , y: (self.size.height / 2) + 260)
                ssd.zPosition = -1
            }
            
            if psu.zPosition == 0 {
                psu.position = CGPoint(x: self.size.width / 2, y: (self.size.height / 2) - 250)
                psu.zPosition = 0
            } else {
                psu.position = CGPoint(x: (self.size.width / 2) - 110, y: (self.size.height / 2) - 52)
                psu.zPosition = -1
            }
            
            motherboardArea.position = CGPoint(x: (self.size.width / 2) - 100, y: (self.size.height / 2) + 210)
            ssdArea.position = CGPoint(x: (self.size.width / 2) + 127 , y: (self.size.height / 2) + 260)
            psuArea.position = CGPoint(x: (self.size.width / 2) - 120, y: (self.size.height / 2) - 53)
            
        }
    }
    
    //MARK: - Managing the movement of the components
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        motherboard.removeAllActions()
        ssd.removeAllActions()
        psu.removeAllActions()
        
        if let touch = touches.first {
            
            if motherboard.zPosition == 0 {
                motherboard.position = touch.location(in: self)
            }
            if ssd.zPosition == 0 {
                ssd.position = touch.location(in: self)
            }
            if psu.zPosition == 0 {
                psu.position = touch.location(in: self)
            }
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if motherboardArea.contains(motherboard.position) && motherboard.zPosition == 0{
            playSound()
            
            motherboard.zPosition = -1
            
            if self.size.width > self.size.height {
                let destinantion = CGPoint(x: (self.size.width / 2) - 242, y: (self.size.height / 2) + 90)
                let action  = SKAction.move(to: destinantion, duration: 0.5)
                motherboard.run(action)
            } else {
                let destinantion = CGPoint(x: (self.size.width / 2) - 92, y: (self.size.height / 2) + 190)
                let action  = SKAction.move(to: destinantion, duration: 0.5)
                motherboard.run(action)
            }
            
            //adding ssd object
            if canAddSsd {
                self.addChild(ssd)
                ssd.setScale(0.50)
                
                if self.size.width > self.size.height {
                    ssd.position = CGPoint(x: (self.size.width / 2) + 200, y: (self.size.height / 2))
                    ssd.zPosition = 0
                    animatedPulse(object: ssd)
                } else {
                    ssd.position = CGPoint(x: self.size.width / 2, y: (self.size.height / 2) - 250)
                    ssd.zPosition = 0
                    animatedPulse(object: ssd)
                }
            }
        }
        
        if ssdArea.contains(ssd.position) && ssd.zPosition == 0 && motherboard.zPosition == -1{
            playSound()
            ssd.zPosition = -1
            
            if self.size.width > self.size.height {
                let destinantion = CGPoint(x: (self.size.width / 2) - 23, y: (self.size.height / 2) + 160)
                let action  = SKAction.move(to: destinantion, duration: 0.5)
                ssd.run(action)
            } else {
                let destinantion = CGPoint(x: (self.size.width / 2) + 127 , y: (self.size.height / 2) + 260)
                let action  = SKAction.move(to: destinantion, duration: 0.5)
                ssd.run(action)
            }
            
            //adding psu object
            if canAddPsu {
                self.addChild(psu)
                psu.setScale(0.50)
                
                if self.size.width > self.size.height {
                    psu.position = CGPoint(x: (self.size.width / 2) + 200, y: (self.size.height / 2))
                    psu.zPosition = 0
                    animatedPulse(object: psu)
                } else {
                    psu.position = CGPoint(x: self.size.width / 2, y: (self.size.height / 2) - 250)
                    psu.zPosition = 0
                    animatedPulse(object: psu)
                }
            }
        }
        
        if psuArea.contains(psu.position) && psu.zPosition == 0 && ssd.zPosition == -1 && motherboard.zPosition == -1{
            playSound()
            psu.zPosition = -1
            
            if self.size.width > self.size.height {
                let destinantion = CGPoint(x: (self.size.width / 2) - 260, y: (self.size.height / 2) - 152)
                let action  = SKAction.move(to: destinantion, duration: 0.5)
                psu.run(action)
            } else {
                let destinantion = CGPoint(x: (self.size.width / 2) - 110, y: (self.size.height / 2) - 52)
                let action  = SKAction.move(to: destinantion, duration: 0.5)
                psu.run(action)
            }
            
            let alert = UIAlertController(title: "Well Done!", message: "You have assembled your PC, CONGRATULATIONS. \n Thanks for your time.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
            view?.window?.rootViewController?.present(alert, animated: true)
            
            confettiView.intensity = 1
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
        let pulseUp = SKAction.scale(to: 0.55, duration: 0.5)
        let pulseDown = SKAction.scale(to: 0.5, duration: 0.5)
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
