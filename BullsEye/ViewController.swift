//
//  ViewController.swift
//  BullsEye
//
//  Created by Lorenzo on 28/05/2020.
//  Copyright © 2020 Lorenzo Masucci. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startNewGame()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlited = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlited, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
    }
    
    @IBAction func hitMePressed(_ sender: UIButton) {
        
        let difference = abs(targetValue-currentValue)
        var points = 100 - difference
        
        score += points
        
        let title: String
        
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            points += 50
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.startNewRound()
            
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        let roundedValue = sender.value.rounded()
        currentValue = Int(roundedValue)
    }
    @IBAction func startOverPressed(_ sender: Any) {
        startNewRound()
        slider.value = 50.0
    }
    
    func startNewRound() {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        targetValue = Int.random(in: 1...100)
        round += 1
        updateLabel()
    }
    
    func updateLabel() {
        targetLabel.text = "\(targetValue)"
        scoreLabel.text = "\(score)"
        roundLabel.text = String(round)

    }
    
    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
}

