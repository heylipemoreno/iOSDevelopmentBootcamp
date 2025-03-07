//
//  ViewController.swift
//  (AI) Dicee
//
//  Created by Felipe Moreno on 06/03/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    // Array of dice images
    let diceArray = [
        UIImage(named: "DiceOne"),
        UIImage(named: "DiceTwo"),
        UIImage(named: "DiceThree"),
        UIImage(named: "DiceFour"),
        UIImage(named: "DiceFive"),
        UIImage(named: "DiceSix")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize with random dice values
        rollDice()
    }
    
    // Roll button action
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        rollDice()
        
        // Add a small animation to the button
        UIView.animate(withDuration: 0.1, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                sender.transform = CGAffineTransform.identity
            }
        }
        
        // Add animation to dice
        animateDice()
    }
    
    // Function to roll the dice
    func rollDice() {
        // Generate random index for each dice (0-5)
        let randomIndex1 = Int.random(in: 0...5)
        let randomIndex2 = Int.random(in: 0...5)
        
        // Set the dice images
        diceImageView1.image = diceArray[randomIndex1]
        diceImageView2.image = diceArray[randomIndex2]
    }
    
    // Function to animate the dice
    func animateDice() {
        // Animate the first dice
        UIView.animate(withDuration: 0.2, animations: {
            self.diceImageView1.transform = CGAffineTransform(rotationAngle: .pi / 4)
            self.diceImageView2.transform = CGAffineTransform(rotationAngle: -.pi / 4)
        }) { _ in
            UIView.animate(withDuration: 0.2) {
                self.diceImageView1.transform = CGAffineTransform.identity
                self.diceImageView2.transform = CGAffineTransform.identity
            }
        }
    }
}

