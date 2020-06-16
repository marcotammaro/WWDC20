//
//  LiveViewController_2_3.swift
//  Book_Sources
//
//  Created by Marco Tammaro on 16/03/2019.
//  GPU VIEW CONTROLLER

import UIKit
import Foundation
import PlaygroundSupport
import SpriteKit
import AVFoundation


public class LiveViewController_2_4: LiveViewController {
    
    let Scene = Scene_2_4()
    
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
                
            case "gpu":
                Scene.allowGpu()
                break
                
            default:
                break
            }
            
        default:
            break
            
        }
    }
}




class Scene_2_4 : SKScene {
    
    let motherboard = SKSpriteNode(imageNamed: "mb_hs_ram")
    let pciSlotArea = SKSpriteNode(color: .init(white: 0, alpha: 0), size: CGSize(width: 180, height: 20))
    let gpu = SKSpriteNode(imageNamed: "gpu_front")
    let background = SKSpriteNode(imageNamed: "background_large")
    
    let trumpet = SKSpriteNode(imageNamed: "trumpet")
    var doneSound: AVAudioPlayer?
    
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
        self.addChild(motherboard)
        self.addChild(pciSlotArea)
    }
    public func allowGpu() {
        self.addChild(gpu)
        animatedPulse(object: gpu)
    }
    
    //MARK: - Setting up the position of the components
    
    override func didChangeSize(_ oldSize: CGSize) {
        
        background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        background.setScale(0.6)
        background.zPosition = -3
        
        trumpet.position = CGPoint(x: (self.size.width / 2) + 1000, y: (self.size.height / 2) - 1000)
        trumpet.setScale(0.5)
        
        if self.size.width > self.size.height {
            
            motherboard.position = CGPoint(x: (self.size.width / 2) - 150, y: (self.size.height / 2))
            pciSlotArea.position = CGPoint(x: (self.size.width / 2) - 195, y: (self.size.height / 2) - 25)
            
            motherboard.zPosition = -2
            pciSlotArea.zPosition = 0
            
            if gpu.zPosition == 0 {
                gpu.position = CGPoint(x: (self.size.width / 2) + 200, y: (self.size.height / 2))
                gpu.zPosition = 0
            } else {
                gpu.position = CGPoint(x: (self.size.width / 2) - 165, y: (self.size.height / 2) - 25)
                gpu.zPosition = -1
            }
            
        } else {
            
            motherboard.position = CGPoint(x: self.size.width / 2, y: (self.size.height / 2) + 100)
            pciSlotArea.position = CGPoint(x: (self.size.width / 2) - 45, y: (self.size.height / 2) + 75)
            
            motherboard.zPosition = -2
            pciSlotArea.zPosition = 0
            
            if gpu.zPosition == 0 {
                gpu.position = CGPoint(x: self.size.width / 2, y: (self.size.height / 2) - 250)
                gpu.zPosition = 0
            } else {
                gpu.position = CGPoint(x: (self.size.width / 2) - 15, y: (self.size.height / 2) + 75)
                gpu.zPosition = -1
            }
        }
    }
    
    //MARK: - Managing the movement of the components
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        gpu.removeAllActions()
        
        if let touch = touches.first {
            if gpu.zPosition == 0 {
                gpu.position = touch.location(in: self)
            }
        }
        
        if motherboard.contains(gpu.position) {
            gpu.texture = SKTexture(imageNamed: "gpu_top")
            gpu.size = UIImage(named: "gpu_top")!.size
            
        } else {
            gpu.texture = SKTexture(imageNamed: "gpu_front")
            gpu.size = UIImage(named: "gpu_front")!.size
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if pciSlotArea.contains(gpu.position) && gpu.zPosition == 0{
            playSound()
            
            if self.size.width > self.size.height {
                let destinantion = CGPoint(x: (self.size.width / 2) - 165, y: (self.size.height / 2) - 25)
                let action  = SKAction.move(to: destinantion, duration: 0.5)
                gpu.run(action)
                
            } else {
                
                let destinantion = CGPoint(x: (self.size.width / 2) - 15, y: (self.size.height / 2) + 75)
                let action  = SKAction.move(to: destinantion, duration: 0.5)
                gpu.run(action)
            }
            
            gpu.zPosition = -1
            
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
