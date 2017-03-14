//
//  ViewController.swift
//  isItPrime
//
//  Created by Marco Montalto on 30/03/16.
//  Copyright © 2016 Marco Montalto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBAction func isItPrimeButtonTapped(sender: AnyObject) {
        
        if let number = Int(numberTextField.text!) {
            var isPrime = true
            
            var i = 2
            
            if number > 2 {
                while i<=(number/2) {
                    
                    if (number%i==0) {
                        isPrime = false
                    }
                    
                    i++
                    
                }
            }
            
            if isPrime {
                resultLabel.text = "\(number) is prime"
            } else {
                resultLabel.text = "\(number) is not prime"
            }
        } else {
            resultLabel.text = "Error : please enter a whole number"
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

