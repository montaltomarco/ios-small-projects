//
//  ViewController.swift
//  Working With Audio
//
//  Created by Marco Montalto on 23/06/16.
//  Copyright © 2016 Marco Montalto. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var timer: NSTimer?
    
    var player: AVAudioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        initPlayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playTapped(sender: AnyObject) {
        player.play()

        if timer == nil {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.updateSlider), userInfo: nil, repeats: true)
        }
    }
    
    func updateSlider() {
        scrubSlider.value = Float(player.currentTime)
        if(player.currentTime==player.duration) {
            if let _ = timer {
                timer!.invalidate()
                timer = nil
            }
        }
    }
    
    @IBAction func pauseTapped(sender: AnyObject) {
        player.pause()
        timer!.invalidate()
        timer = nil
    }

    @IBAction func stopTapped(sender: AnyObject) {
        player.stop()
        timer!.invalidate()
        timer = nil
        self.initPlayer()
    }
    
    @IBOutlet weak var volumeSlider: UISlider!
    @IBAction func volumeChanged(sender: AnyObject) {
        player.volume = volumeSlider.value
    }


    @IBOutlet weak var scrubSlider: UISlider!
    @IBAction func scrub(sender: AnyObject) {
        player.currentTime = NSTimeInterval(scrubSlider.value)
    }
    
    func initPlayer() {
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("audio", ofType: "mp3")!))
            player.volume = volumeSlider.value
            scrubSlider.maximumValue = Float(player.duration)
            scrubSlider.value = 0
            
        } catch {
            print("Can't find the audio")
        }
    }
    
}

