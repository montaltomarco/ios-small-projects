//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Marco Montalto on 23/06/16.
//  Copyright © 2016 Marco Montalto. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        /*let newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
        newUser.setValue("Rob3", forKey: "username")
        newUser.setValue("canazzo3", forKey: "password")*/
        
        do {
            try context.save()
        } catch {
            print("Error saving context")
        }
        
        let request = NSFetchRequest(entityName: "Users")
        // TO PERSONALIZE A REQUEST
        //request.predicate = NSPredicate(format: "username = %@", "Rob")
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.executeFetchRequest(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    // TO DELETE ITEM
                    //context.deleteObject(result)
                    
                    // TO UPDATE VALUE
                    //result.setValue("Ralphie", forKey: "username")
                    
                    do {
                        try context.save()
                    } catch {
                        print("Error saving context")
                    }
                    
                    if let username = result.valueForKey("username") as? String {
                        print(username)
                    }
                }
            }
        } catch {
            print("Error catching")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

