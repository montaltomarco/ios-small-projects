//
//  FirstViewController.swift
//  To Do List
//
//  Created by Marco Montalto on 31/03/16.
//  Copyright © 2016 Marco Montalto. All rights reserved.
//

import UIKit

var toDoListArray = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var toDoList: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let toDoListTemp = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") {
            toDoListArray = toDoListTemp as! [String]
        }
        
        return toDoListArray.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoListArray[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            toDoListArray.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(toDoListArray, forKey: "toDoList")
            toDoList.reloadData()
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
    
    override func viewDidAppear(animated: Bool) {
        toDoList.reloadData()
    }

}

