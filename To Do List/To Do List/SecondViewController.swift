//
//  SecondViewController.swift
//  To Do List
//
//  Created by Marco Montalto on 31/03/16.
//  Copyright © 2016 Marco Montalto. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var newItemTextField: UITextField!
    
    @IBAction func addItemButtonTapped(sender: AnyObject) {
        
        if (newItemTextField.text != "") {
            toDoListArray.append(newItemTextField.text!)
            
            newItemTextField.text = ""
            
            NSUserDefaults.standardUserDefaults().setObject(toDoListArray, forKey: "toDoList")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.newItemTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()

        return true
        
    }

}

