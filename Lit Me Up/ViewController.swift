//
//  ViewController.swift
//  Lit Me Up
//
//  Created by Adina Chiriliuc on 02/07/2020.
//  Copyright © 2020 Adina Chiriliuc. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    let woodTimes = ["Brad": 60, "Fag": 120, "Stejar": 220]
    var timer = Timer()
    var player: AVAudioPlayer!
    var totalTime = 0
    var minutesPassed = 0
    
    
    @IBAction func woodSelected(_ sender: UIButton) {
       
    
        timer.invalidate()
        let wood = sender.currentTitle!
        totalTime = woodTimes[wood]!
        progressBar.progress = 0.0
        minutesPassed = 0
        titleLabel.text = wood
        
       timer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        }
    
    @objc func updateTimer() {
        if minutesPassed < totalTime {
            
            
            minutesPassed += 1
            progressBar.progress = Float(minutesPassed) / Float(totalTime)
        
        } else {
            timer.invalidate()
            titleLabel.text = "Pune pe foc!"
    
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
       
        }
        
        
    }
    
}
    






