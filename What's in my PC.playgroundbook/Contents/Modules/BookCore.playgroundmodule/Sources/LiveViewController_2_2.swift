//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Provides supporting functions for setting up a live view.
//  CPU / THERMAL PASTE VIEW CONTROLLER

import UIKit
import Foundation
import PlaygroundSupport
import SpriteKit
import AVFoundation


public class LiveViewController_2_2: LiveViewController {
    
    let Scene = Scene_2_2()
    
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
                
            case "cpu":
                Scene.allowCpu()
                break
                
            case "thermal_paste":
                Scene.allowPaste()
                break
                
            case "heat_sink":
                Scene.allowHeatSink()
                break
                
            default:
                break
            }
            
        default:
            break
            
        }
    }
}




class Scene_2_2 : SKScene {
    
    let background = SKSpriteNode(imageNamed: "background_large")
    let motherboard = SKSpriteNode(imageNamed: "motherboard")
    let cpu = SKSpriteNode(imageNamed: "cpu")
    let paste = SKSpriteNode(imageNamed: "paste")
    let heatSink = SKSpriteNode(imageNamed: "heat_sink")
    
    let socketArea = SKSpriteNode(color: .init(white: 0, alpha: 0),
                                  size: CGSize(width: 50, height: 50))
    
    let trumpet = SKSpriteNode(imageNamed: "trumpet")
    var doneSound: AVAudioPlayer?
    
    var canAddMotherboard = false
    var canAddCpu = false
    var canAddPaste = false
    var canAddHeatSink = false
    
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
    public func allowCpu() {
        canAddCpu = true
        self.addChild(cpu)
        animatedPulse(object: cpu)
    }
    public func allowPaste() {
        canAddPaste = true
    }
    public func allowHeatSink() {
        canAddHeatSink = true
    }
    
    //MARK: - Setting up the position of the components
    
    override func didChangeSize(_ oldSize: CGSize) {
        
        background.position = CGPoint(x: self.size.width / 2,
                                      y: self.size.height / 2)
        background.setScale(0.6)
        background.zPosition = -3
        
        trumpet.position = CGPoint(x: (self.size.width / 2) + 1000,
                                   y: (self.size.height / 2) - 1000)
        trumpet.setScale(0.5)
        trumpet.zPosition = 0
        
        
        if self.size.width > self.size.height {
            
            //landscape
            
            motherboard.position = CGPoint(x: (self.size.width / 2) - 150,
                                           y: (self.size.height / 2))
            motherboard.zPosition = -2
            
            socketArea.position = CGPoint(x: (self.size.width / 2) - 164,
                                          y: (self.size.height / 2) + 135)
            socketArea.zPosition = 0
            
            if cpu.zPosition == 0 {
                cpu.position = CGPoint(x: (self.size.width / 2) + 200,
                                       y: (self.size.height / 2))
                cpu.zPosition = 0
            } else {
                cpu.position = CGPoint(x: (self.size.width / 2) - 164,
                                       y: (self.size.height / 2) + 135)
                cpu.zPosition = -1
            }
            
            if paste.zPosition == 0 {
                paste.position = CGPoint(x: (self.size.width / 2) + 200,
                                         y: (self.size.height / 2))
                paste.zPosition = 0
            } else {
                paste.position = CGPoint(x: 0, y: 0)
                paste.zPosition = -1
            }
            
            if heatSink.zPosition == 0 {
                heatSink.position = CGPoint(x: (self.size.width / 2) + 200,
                                            y: (self.size.height / 2))
                heatSink.zPosition = 0
            } else {
                heatSink.position = CGPoint(x: (self.size.width / 2) - 164,
                                            y: (self.size.height / 2) + 135)
                heatSink.zPosition = -1
            }
            
        } else {
            
            //portrait
            
            motherboard.position = CGPoint(x: self.size.width / 2,
                                           y: (self.size.height / 2) + 100)
            motherboard.zPosition = -2
            
            socketArea.position = CGPoint(x: (self.size.width / 2) - 14,
                                          y: (self.size.height / 2) + 235)
            socketArea.zPosition = 0
            
            if cpu.zPosition == 0 {
                cpu.position = CGPoint(x: self.size.width / 2,
                                       y: (self.size.height / 2) - 250)
                cpu.zPosition = 0
            } else {
                cpu.position = CGPoint(x: (self.size.width / 2) - 14,
                                       y: (self.size.height / 2) + 235)
                cpu.zPosition = -1
            }
            
            if paste.zPosition == 0 {
                paste.position = CGPoint(x: self.size.width / 2,
                                         y: (self.size.height / 2) - 250)
                paste.zPosition = 0
            } else {
                paste.position = CGPoint(x: 0, y: 0)
                paste.zPosition = -1
            }
            
            if heatSink.zPosition == 0 {
                heatSink.position = CGPoint(x: self.size.width / 2,
                                            y: (self.size.height / 2) - 250)
                heatSink.zPosition = 0
            } else {
                heatSink.position = CGPoint(x: (self.size.width / 2) - 14,
                                            y: (self.size.height / 2) + 235)
                heatSink.zPosition = -1
            }
        }
    }
    
    //MARK: - Managing the movement of the components
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        cpu.removeAllActions()
        paste.removeAllActions()
        heatSink.removeAllActions()
        
        if let touch = touches.first {
            
            if cpu.zPosition == 0 {
                cpu.position = touch.location(in: self)
            }
            if paste.zPosition == 0 {
                paste.position = touch.location(in: self)
            }
            if heatSink.zPosition == 0 {
                heatSink.position = touch.location(in: self)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if socketArea.contains(cpu.position) && cpu.zPosition == 0 {
            
            playSound()
            
            if self.size.width > self.size.height {
                let destinantion = CGPoint(x: (self.size.width / 2) - 164,
                                           y: (self.size.height / 2) + 135)
                let action  = SKAction.move(to: destinantion, duration: 0.5)
                cpu.run(action)
            } else {
                let destinantion = CGPoint(x: (self.size.width / 2) - 14, y: (self.size.height / 2) + 235)
                let action  = SKAction.move(to: destinantion, duration: 0.5)
                cpu.run(action)
            }
            
            cpu.zPosition = -1
            socketArea.size = CGSize(width: 250, height: 50)
            
            //adding paste object
            if canAddPaste {
                self.addChild(paste)
                
                if self.size.width > self.size.height {
                    paste.position = CGPoint(x: (self.size.width / 2) + 200,
                                             y: (self.size.height / 2))
                } else {
                    paste.position = CGPoint(x: self.size.width / 2,
                                             y: (self.size.height / 2) - 250)
                }
                paste.zPosition = 0
                animatedPulse(object: paste)
            }
            
            
        } else if socketArea.contains(paste.position) && paste.zPosition == 0 {
            
            playSound()
            
            cpu.texture = SKTexture(imageNamed: "cpu_with_paste")
            paste.zPosition = -1
            paste.isHidden = true
            
            //adding heat sink object
            if canAddHeatSink {
                self.addChild(heatSink)
                
                if self.size.width > self.size.height {
                    heatSink.position = CGPoint(x: (self.size.width / 2) + 200,
                                                y: (self.size.height / 2))
                } else {
                    heatSink.position = CGPoint(x: self.size.width / 2,
                                                y: (self.size.height / 2) - 250)
                }
                heatSink.zPosition = 0
                animatedPulse(object: heatSink)
            }
            
            
            
        } else if socketArea.contains(heatSink.position) && heatSink.zPosition == 0 {
            
            playSound()
            
            if self.size.width > self.size.height {
                let destinantion = CGPoint(x: (self.size.width / 2) - 164,
                                           y: (self.size.height / 2) + 135)
                let action  = SKAction.move(to: destinantion, duration: 0.5)
                heatSink.run(action)
            } else {
                let destinantion = CGPoint(x: (self.size.width / 2) - 14,
                                           y: (self.size.height / 2) + 235)
                let action  = SKAction.move(to: destinantion, duration: 0.5)
                heatSink.run(action)
            }
            
            heatSink.zPosition = -1
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
