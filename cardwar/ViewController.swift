//
//  ViewController.swift
//  cardwar
//
//  Created by Hualin Ding on 12/12/14.
//  Copyright (c) 2014 Hualin Ding. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var firstCardImageView: UIImageView!
    @IBOutlet weak var secondCardImageView: UIImageView!
    @IBOutlet weak var playRoundButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var playerScore: UILabel!
    @IBOutlet weak var enemyScore: UILabel!
    
    // Define Audio Player
    var bananaPlayer = AVAudioPlayer()
    var backgroundPlayer = AVAudioPlayer()
    
    var cardNmaesArray:[String] = ["ace", "card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "jack", "queen", "king"]
    
    var playerScoreTotal = 0
    var enemyScoreTotal = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up audio configurations for the background sound
        var backgroundSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("MinionWaterSound", ofType: "mp3")!)
        backgroundPlayer = AVAudioPlayer(contentsOfURL: backgroundSound, error: nil)
        backgroundPlayer.prepareToPlay()
        backgroundPlayer.volume = 0.3
        backgroundPlayer.numberOfLoops = -1
        backgroundPlayer.play()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playRoundTapped(sender: UIButton) {
        // Set up audio configurations for the button click sound effect
        var bananaSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("MinionBananaSound", ofType: "mp3")!)
        bananaPlayer = AVAudioPlayer(contentsOfURL: bananaSound, error: nil)
        bananaPlayer.prepareToPlay()
        bananaPlayer.play()
        
        // Randomize a number for the first imageview
        var firstRandomNum:Int = Int(arc4random_uniform(13))
        // Generate a random string of card number
        var firstCardString:String = self.cardNmaesArray[firstRandomNum]
        
        var secondRandomNum:Int = Int(arc4random_uniform(13))
        var secondCardString:String = self.cardNmaesArray[secondRandomNum]
        
        var numberToWin:Int = 15
        
        self.firstCardImageView.image = UIImage(named: firstCardString)
        self.secondCardImageView.image = UIImage(named: secondCardString)
        
        // Determine the higher card
        if  firstRandomNum > secondRandomNum {
            // TODO: first card is larger
            playerScoreTotal += 1
            self.playerScore.text = String(playerScoreTotal)
        }
        else if firstRandomNum == secondRandomNum {
            // TODO: Tired
        }
        else {
            // TODO: second card is larger
            enemyScoreTotal += 1
            self.enemyScore.text = String(enemyScoreTotal)
        }
        
        if playerScoreTotal == numberToWin {
            // Add winner alert window
            let alertController = UIAlertController(title: "Game Over", message: "You are the winner!", preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "Continue", style: .Cancel) { (action) in
                // ...
            }
            alertController.addAction(cancelAction)
            
            let OKAction = UIAlertAction(title: "Play Again", style: .Default) { (action) in
                // ...
                self.firstCardImageView.image = UIImage(named: "cardback")
                self.secondCardImageView.image = UIImage(named: "cardback")
                self.playerScoreTotal = 0
                self.enemyScoreTotal = 0
                self.playerScore.text = "0"
                self.enemyScore.text = "0"
            }
            alertController.addAction(OKAction)
            
            self.presentViewController(alertController, animated: true) {
                // ...
            }
            
        }
        
        if enemyScoreTotal == numberToWin {
            // Add winner alert window
            let alertController = UIAlertController(title: "Game Over", message: "Enemy is the winner!", preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "Continue", style: .Cancel) { (action) in
                // ...
            }
            alertController.addAction(cancelAction)
            
            let OKAction = UIAlertAction(title: "Play Again", style: .Default) { (action) in
                // ...
                self.firstCardImageView.image = UIImage(named: "cardback")
                self.secondCardImageView.image = UIImage(named: "cardback")
                self.playerScoreTotal = 0
                self.enemyScoreTotal = 0
                self.playerScore.text = "0"
                self.enemyScore.text = "0"
            }
            alertController.addAction(OKAction)
            
            self.presentViewController(alertController, animated: true) {
                // ...
            }
        }
        
    }

}