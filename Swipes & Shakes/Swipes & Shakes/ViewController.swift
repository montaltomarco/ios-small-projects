//
//  ViewController.swift
//  Swipes & Shakes
//
//  Created by Marco Montalto on 23/06/16.
//  Copyright © 2016 Marco Montalto. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer = AVAudioPlayer()
    var noises: [String] = [String]()
    var noiseIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initNoises()
        print(noises)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipped(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipped(_:)))
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
    }
    
    func initNoises() {
        noises.append("female")
        noises.append("horse")
        noises.append("thunder")
        noises.append("m_blast")
        noises.append("s_shot")
        noises.append("t_shots")
        noises.append("song")
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        if event?.subtype == UIEventSubtype.MotionShake {
            
            print("Shaked")
            
            do {
                try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(noises[noiseIndex], ofType: "mp3")!))
                
                    player.play()
                
            } catch {
                print("Can't find the audio")
            }
            
            changeNoise()
        }
    }
    
    func changeNoise() {
        noiseIndex = Int(arc4random_uniform(UInt32(noises.count)))
    }
    
    func swipped(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizerDirection.Up :
                print("Swiped Up")
                
            case UISwipeGestureRecognizerDirection.Right :
                print("Swiped Right")
                
            default :
                break
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stopSound(sender: AnyObject) {
        
        player.pause()
        
    }

}

