//
//  ViewController.swift
//  howManyFingers
//
//  Created by Marco Montalto on 30/03/16.
//  Copyright © 2016 Marco Montalto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func guessButtonTapped(sender: AnyObject) {
        
        let randomNum = String(arc4random_uniform(6));
        
        if numberTextField.text == "" {
            
            resultLabel.text = "Please enter a number"
            
        } else if numberTextField.text == randomNum {
            
            resultLabel.text = "You got it right!"
            
        } else {
            
            resultLabel.text = "Sorry, the right number was \(randomNum)"
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

