//
//  ViewController.swift
//  Whats The Weather
//
//  Created by Marco Montalto on 31/03/16.
//  Copyright © 2016 Marco Montalto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var cityNameField: UITextField!
    @IBOutlet weak var resultWeatherLabel: UILabel!
    
    @IBAction func checkTheWeather(sender: AnyObject) {
        
        if cityNameField.text != "" {
            
            self.getTheWeather()
            
        }
        
    }
    
    func getTheWeather() {
        
        var wasSuccessful = false
        
        let urlString = "http://www.weather-forecast.com/locations/" + cityNameField.text!.stringByReplacingOccurrencesOfString(" ", withString: "-") + "/forecasts/latest";
        
        let attemptedUrl = NSURL(string: urlString)
        
        if let url = attemptedUrl {
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
                
                // Will happen when task completes
                
                if let urlContent = data {
                    
                    let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                    
                    let webContentArray = webContent!.componentsSeparatedByString("Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                    
                    if webContentArray.count > 1 {
                        
                        let weatherArray = webContentArray[1].componentsSeparatedByString("</span>")
                        
                        if weatherArray.count > 1 {
                            
                            wasSuccessful = true
                            
                            let weather = weatherArray[0].stringByReplacingOccurrencesOfString("&deg;", withString: "°")
                            
                            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                
                                self.resultWeatherLabel.text = weather
                            })
                            
                        }
                        
                    }
                    
                }
            }
            
            if wasSuccessful == false {
                self.resultWeatherLabel.text = "Couldn't find the weather for that city - Please try again"
            }
            
            task.resume()
            
        } else {
            
            self.resultWeatherLabel.text = "Couldn't find the weather for that city - Please try again"
        }
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.cityNameField.delegate = self
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

