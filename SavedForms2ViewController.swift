//
//  SavedFormsViewController.swift
//  Sieve Analysis
//
//  Created by Justin Espejo on 2/12/16.
//  Copyright © 2016 Snowcialite. All rights reserved.
//

import UIKit
import CoreData

class SavedFormsViewController2: UIViewController {
    
    var stone = [NSManagedObject]()
    @IBOutlet weak var tableView: UITableView!
    
    var segueValue1 : String = "0"
    var segueValue2 : String = "0"
    var segueValue3 : String = "0"
    var segueValue4 : String = "0"
    var segueValue5 : String = "0"
    var segueValue6 : String = "0"
    var segueValue7 : String = "0"
    var segueValue8 : String = "0"
    var segueWet = "0"
    var segueDry = "0"
    var typeSaved : String = ""
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "Stone")
        
        //3
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            stone = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        tableView.registerClass(UITableViewCell.self,
            forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier=="StoneSegue"{
            if let destination = segue.destinationViewController as? CourseAggregateViewController
            {
                
                destination.segueWet = segueWet
                destination.segueDry = segueDry
                destination.segue1 = segueValue1
                destination.segue2 = segueValue2
                destination.segue3 = segueValue3
                destination.segue4 = segueValue4
                destination.segue5 = segueValue5
                destination.segue6 = segueValue6
                destination.isPassed = true
                destination.type = typeSaved
                
                
            }
        }
    }
    
}
extension SavedFormsViewController2 : UITableViewDataSource {
    
    //    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    //        return 2
    //    }
    //
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Stone"
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            print(stone.count)
            return stone.count
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
            
            let cell = self.tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! CustomCellTableViewCell
            
            let aggregate = stone[stone.count-indexPath.row-1]
            
            
            cell.name.text = aggregate.valueForKey("date") as? String
            
            cell.timestamp.text = aggregate.valueForKey("timestamp") as? String
            
            return cell

    }
    
    
    
}

extension SavedFormsViewController2 : UITableViewDelegate
{
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // 1
        if editingStyle == .Delete {
            
            // 2
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let moc = appDelegate.managedObjectContext
            
            // 3
            moc.deleteObject(stone[stone.count-indexPath.row-1])
            appDelegate.saveContext()
            
            // 4
            stone.removeAtIndex(stone.count-indexPath.row-1)
            tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let aggregate = stone[stone.count-indexPath.row-1]
        segueValue1 = (aggregate.valueForKey("stone1") as? String)!
        segueValue2 = (aggregate.valueForKey("stone2") as? String)!
        segueValue3 = (aggregate.valueForKey("stone3") as? String)!
        segueValue4 = (aggregate.valueForKey("stone4") as? String)!
        segueValue5 = (aggregate.valueForKey("stone5") as? String)!
        segueValue6 = (aggregate.valueForKey("stone6") as? String)!
        segueWet = (aggregate.valueForKey("wet") as? String)!
        segueDry = (aggregate.valueForKey("dry") as? String)!
        typeSaved = (aggregate.valueForKey("type") as? String)!
        print(typeSaved)
        self.performSegueWithIdentifier("StoneSegue", sender: self)
        
        
    }
}


