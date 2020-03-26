//
//  ViewController.swift
//  CatchTheKenny
//
//  Created by YASIN AKCA on 25.03.2020.
//  Copyright © 2020 YASIN AKCA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var score = 0
    var counter = 0
    
    var timer = Timer()
    var hideTimer = Timer()
    
    var kennyArray = [UIImageView]()
    
    var highScore = 0
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counter = 5
        
        scoreLabel.text = "Score: \(score)"
        timeLabel.text = "Time: \(counter)"
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highScore")
        
        if storedHighScore == nil {
            highScore = 0
            highScoreLabel.text = "High score: \(highScore)"
        }
        
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highScoreLabel.text = "High score: \(highScore)"
        }
        
        kenny1.isUserInteractionEnabled = true
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        kenny1.addGestureRecognizer(recognizer1)
        
        kenny2.isUserInteractionEnabled = true
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        kenny2.addGestureRecognizer(recognizer2)
        
        kenny3.isUserInteractionEnabled = true
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        kenny3.addGestureRecognizer(recognizer3)
        
        kenny4.isUserInteractionEnabled = true
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        kenny4.addGestureRecognizer(recognizer4)
        
        kenny5.isUserInteractionEnabled = true
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        kenny5.addGestureRecognizer(recognizer5)
        
        kenny6.isUserInteractionEnabled = true
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        kenny6.addGestureRecognizer(recognizer6)
        
        kenny7.isUserInteractionEnabled = true
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        kenny7.addGestureRecognizer(recognizer7)
        
        kenny8.isUserInteractionEnabled = true
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        kenny8.addGestureRecognizer(recognizer8)
        
        kenny9.isUserInteractionEnabled = true
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        kenny9.addGestureRecognizer(recognizer9)
        
        kennyArray = [kenny1,kenny2,kenny3,kenny4,kenny5,kenny6,kenny7,kenny8,kenny9]
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideKenny), userInfo: nil, repeats: true)
        
    }
    
    @objc func hideKenny() {
        for kenny in kennyArray {
            kenny.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(kennyArray.count - 1)))
        kennyArray[random].isHidden = false
    }
    
    @objc func increaseScore() {
        scoreLabel.text = "Score: \(score)"
        score += 1
    }
    
    @objc func countDown() {
        counter -= 1
        timeLabel.text = "Time: \(counter)"
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            
            if self.score > self.highScore {
                self.highScore = self.score
                highScoreLabel.text = "High score: \(highScore)"
                UserDefaults.standard.set(highScoreLabel.text, forKey: "highScore")
            }
            
            for kenny in kennyArray {
                kenny.isHidden = true
            }
            
            let alert = UIAlertController(title: "Time's up!", message: "Do you wanna play again?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { (UIAlertAction) in
                
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                
                self.counter = 5
                self.timeLabel.text = "Time: \(self.counter)"
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideKenny), userInfo: nil, repeats: true)
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            
            self.present(alert, animated: true, completion: nil)
        }
    }

}

