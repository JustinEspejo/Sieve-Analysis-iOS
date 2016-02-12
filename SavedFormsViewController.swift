//
//  SavedFormsViewController.swift
//  Sieve Analysis
//
//  Created by Justin Espejo on 2/12/16.
//  Copyright © 2016 Snowcialite. All rights reserved.
//

import UIKit
import CoreData

class SavedFormsViewController: UIViewController {
    
    var sand = [NSManagedObject]()
    @IBOutlet weak var tableView: UITableView!


    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "Sand")
        
        //3
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            sand = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self,
            forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension SavedFormsViewController : UITableViewDataSource {
    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 2
//    }
//    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Sand"
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            print(sand.count)
            return sand.count
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell")

            let aggregate = sand[sand.count-indexPath.row-1]
            
            cell!.textLabel!.text = aggregate.valueForKey("date") as? String
            
            return cell!
    }
    
    
    
    }
    

