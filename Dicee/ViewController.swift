//
//  ViewController.swift
//  Dicee
//
//  Created by Bobby on 7/15/19.
//  Copyright © 2019 Robert Vaccaro. All rights reserved.
//

import UIKit
import LocalAuthentication


class ViewController: UIViewController {
    let diceArray = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    var randomDiceIndex1: Int = 0
    var randomDiceIndex2: Int = 0
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    @IBOutlet weak var imageContainer: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let context:LAContext = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil){
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "We need your TOUCH ID", reply: { (wasSuccessful, error) in
                if wasSuccessful{
                    let alert = UIAlertController(title: "You're All Set!", message: "You may now continue to the app.", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

                    
                    self.present(alert, animated: true)
                }
                else{
                    print("Not Logged In")
                }
            })
        }
    }


    @IBAction func rollButtonPressed(_ sender: UIButton) {
        updateDiceImage()
        
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceImage()
    }
    
    func updateDiceImage(){
        
        randomDiceIndex1 = Int.random(in: 0 ... 5)
        randomDiceIndex2 = Int.random(in: 0 ... 5)
        
        diceImageView1.image = UIImage(named: diceArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named: diceArray[randomDiceIndex2])
        
    }
    @IBAction func TouchID(_ sender: Any) {
        
    }
}

