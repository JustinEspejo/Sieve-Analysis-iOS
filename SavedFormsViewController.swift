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
        if segue.identifier=="SandSegue"{
            if let destination = segue.destinationViewController as? FineAggregateController
            {
            
                destination.segueWet = segueWet
                destination.segueDry = segueDry
                destination.segue1 = segueValue1
                destination.segue2 = segueValue2
                destination.segue3 = segueValue3
                destination.segue4 = segueValue4
                destination.segue5 = segueValue5
                destination.segue6 = segueValue6
                destination.segue7 = segueValue7
                destination.segue8 = segueValue8
                destination.isPassed = true
                
            
            }
        }
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
            
            let cell = self.tableView.dequeueReusableCellWithIdentifier("myCell1", forIndexPath: indexPath) as! CustomCellTableViewCell1
            
            let aggregate = sand[sand.count-indexPath.row-1]
            
            
            cell.name.text = aggregate.valueForKey("date") as? String
            
            cell.timestamp.text = aggregate.valueForKey("timestamp") as? String
            
            return cell

    }
    
    
    
}

extension SavedFormsViewController : UITableViewDelegate
{

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // 1
        if editingStyle == .Delete {
            
            // 2
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let moc = appDelegate.managedObjectContext
            
            // 3
            moc.deleteObject(sand[sand.count-indexPath.row-1])
            appDelegate.saveContext()
            
            // 4
            sand.removeAtIndex(sand.count-indexPath.row-1)
            tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("yeah")
        let aggregate = sand[sand.count-indexPath.row-1]
        segueValue1 = (aggregate.valueForKey("sand1") as? String)!
        segueValue2 = (aggregate.valueForKey("sand2") as? String)!
        segueValue3 = (aggregate.valueForKey("sand3") as? String)!
        segueValue4 = (aggregate.valueForKey("sand4") as? String)!
        segueValue5 = (aggregate.valueForKey("sand5") as? String)!
        segueValue6 = (aggregate.valueForKey("sand6") as? String)!
        segueValue7 = (aggregate.valueForKey("sand7") as? String)!
        segueValue8 = (aggregate.valueForKey("sand8") as? String)!
        segueWet = (aggregate.valueForKey("wet") as? String)!
        segueDry = (aggregate.valueForKey("dry") as? String)!

        self.performSegueWithIdentifier("SandSegue", sender: self)
        

    }
}


