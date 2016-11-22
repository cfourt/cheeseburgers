//
//  ViewController.swift
//  Cheeseburgers
//
//  Created by Connor Fourt on 7/14/16.
//  Copyright © 2016 Connor Fourt. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    // Declare Outlets
    @IBOutlet weak var timer_btn: NSButton!
    @IBOutlet weak var timer: NSTextField!
    
    // Declare Variables
    var cheeseburgers = 0
    var breakTime = false
    var isPaused = true
    var time = Timer()
    var binaryCount = 0
    var current_time = ""
    var freshStart = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            timer.stringValue = "Let's do this!"
    }

    @IBAction func timer_btn(_ sender: NSButton) {
        
        if (breakTime == true){
            startTimer()
            isPaused = false
            timer_btn.title = "Pause"
            breakTime = false
        }
        if freshStart == true {
            freshStart = false
            startTimer()
        }
            
        else if (isPaused == false && breakTime == false) {
            pause()
        }
        
        else if isPaused == true {
            resume()
        }
    }
    
    func countUp() {
        binaryCount += 1
        
        updateText()
        
        if binaryCount == 5 {
            cheeseburgers += 1
            timer.stringValue = String (cheeseburgers) + " Cheeseburger!"
            switchToBreak()
        }
        
    }
    
    
    func startTimer() {
        time = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.countUp), userInfo: nil, repeats: true)
        timer_btn.title = "Pause"
        isPaused = false
    }
    
    func pause(_ btn_text: String = "Resume"){
        time.invalidate()
        isPaused = true
        timer_btn.title = btn_text
    }
    
    func resume(){
        time = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.countUp), userInfo: nil, repeats: true)
        isPaused = false
        timer_btn.title = "Pause"

    }
    
    
    func switchToBreak() {
        time.invalidate()
        pause("Begin again?")
        breakTime = true
    }
    

    func updateText() {
        
        _ = String(binaryCount)
        var formattedText = String(binaryCount)
        
        let minutes = Int(binaryCount) / 60 % 60
        let seconds = Int(binaryCount) % 60
        formattedText = String(format:"%02i:%02i", minutes, seconds)
        
        timer.stringValue = formattedText
        
        
    }

}

