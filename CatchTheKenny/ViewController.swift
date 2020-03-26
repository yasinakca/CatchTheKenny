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
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        
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
            timeLabel.text = "Time's up!"
        }
    }


}

