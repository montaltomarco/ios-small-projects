//
//  ViewController.swift
//  Downloading Image
//
//  Created by Marco Montalto on 23/06/16.
//  Copyright © 2016 Marco Montalto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Alexandra_Stan_in_Sofia.JPG/320px-Alexandra_Stan_in_Sofia.JPG")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) -> Void in
            if error != nil {
                print(error)
            } else {
                
                //ALWAYS UPDATE UIVIEW ON MAIN THREAD
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                    if let image = UIImage(data: data!) {
                    
                        self.imgView.image = image
                    
                    }
                })
                
            }
        }
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

