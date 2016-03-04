//
//  ViewController.swift
//  Sieve Analysis
//
//  Created by Justin Espejo on 1/15/16.
//  Copyright © 2016 Snowcialite. All rights reserved.
//

import CoreData
import UIKit

class CourseAggregateViewController: UIViewController {

    var item1 : String = " "
    var item2 : String = " "
    var item3 : String = " "
    var item4 : String = " "
    var item5 : String = " "

    var spec1 : String = " "
    var spec2 : String = " "
    var spec3 : String = " "
    var spec4 : String = " "
    var spec5 : String = " "
    
    var segue1 : String = " "
    var segue2 : String = " "
    var segue3 : String = " "
    var segue4 : String = " "
    var segue5 : String = " "
    var segue6 : String = " "
    var segueWet : String = " "
    var segueDry : String = " "
    var isPassed = false
    var type : String = " "
    

    @IBOutlet weak var wetMass: UITextField!
    @IBOutlet weak var dryMass: UITextField!
    @IBOutlet weak var waterWeight: UILabel!
    @IBOutlet weak var moistureContent: UILabel!
    
    
    //sieve size label
    @IBOutlet weak var size1: UILabel!
    @IBOutlet weak var size2: UILabel!
    @IBOutlet weak var size3: UILabel!
    @IBOutlet weak var size4: UILabel!
    @IBOutlet weak var size5: UILabel!

    @IBOutlet weak var scrollView: UIScrollView!
    
    //
   

    @IBOutlet weak var specLabel5: UILabel!
    @IBOutlet weak var specLabel4: UILabel!
    @IBOutlet weak var specLabel3: UILabel!
    @IBOutlet weak var specLabel2: UILabel!
    @IBOutlet weak var specLabel1: UILabel!
    
    @IBOutlet weak var mass1: UITextField!
    @IBOutlet weak var mass2: UITextField!
    @IBOutlet weak var mass3: UITextField!
    @IBOutlet weak var mass4: UITextField!
    @IBOutlet weak var mass5: UITextField!
    @IBOutlet weak var mass6: UITextField!
    @IBOutlet weak var massTotal: UILabel!
    
    
    @IBOutlet weak var ret1: UILabel!
    @IBOutlet weak var ret2: UILabel!
    @IBOutlet weak var ret3: UILabel!
    @IBOutlet weak var ret4: UILabel!
    @IBOutlet weak var ret5: UILabel!
    @IBOutlet weak var ret6: UILabel!
    @IBOutlet weak var ret7: UILabel!
    
    @IBOutlet weak var pass1: UILabel!
    @IBOutlet weak var pass2: UILabel!
    @IBOutlet weak var pass3: UILabel!
    @IBOutlet weak var pass4: UILabel!
    @IBOutlet weak var pass5: UILabel!
    
    
    override func viewDidAppear(animated: Bool)
    {
        if(isPassed)
        {
            mass1.text = segue1
            mass2.text = segue2
            mass3.text = segue3
            mass4.text = segue4
            mass5.text = segue5
            mass6.text = segue6
            wetMass.text = segueWet
            dryMass.text = segueDry
            isPassed = false
            self.computeMoisture()
            self.sieveAnalysis()
            
            switch(type){
            
                
                case "seg67":
                print("yeah!")
                item1 = "1\""
                item2 = "3/4\""
                item3 = "3/8\""
                item4 = "#4"
                item5 = "#8"
                
                spec1 = "100"
                spec2 = "90-100"
                spec3 = "20-55"
                spec4 = "0-10"
                spec5 = "0-5"
                break
                
    
                case "seg57":
                item1 = "1 1/2\""
                item2 = "1\""
                item3 = "1/2\""
                item4 = "#4"
                item5 = "#8"
                
                spec1 = "100"
                spec2 = "95-100"
                spec3 = "25-60"
                spec4 = "0-10"
                spec5 = "0-5"
                break
                
                
                case "seg357":
                item1 = "2 1/2\""
                item2 = "2\""
                item3 = "1\""
                item4 = "1/2\""
                item5 = "#4"
                spec1 = "100"
                spec2 = "95-100"
                spec3 = "35-70"
                spec4 = "10-30"
                spec5 = "0-5"
                break
                
                
                 case "seg8":
                item1 = "1/2\""
                item2 = "3/8\""
                item3 = "#4"
                item4 = "#8"
                item5 = "#16"
                
                spec1 = "100"
                spec2 = "85-100"
                spec3 = "10-30"
                spec4 = "0-10"
                spec5 = "0-5"
                break
                
                case "state":
                item1 = "1 1/2\""
                item2 = "1\""
                item3 = "1/2\""
                item4 = "1/4\""
                item5 = " "
                
                spec1 = "100"
                spec2 = "93-100"
                spec3 = "27-58"
                spec4 = "0-8"
                spec5 = " "
                break
                
                default:
                break
                
                }

        
        }
        
        
        
        
        size1.text = item1
        size2.text = item2
        size3.text = item3
        size4.text = item4
        size5.text = item5
        
        specLabel1.text = spec1
        specLabel2.text = spec2
        specLabel3.text = spec3
        specLabel4.text = spec4
        specLabel5.text = spec5
        
        if (spec5==" ")
        {
        mass5.hidden = true
        ret5.hidden = true
        pass5.hidden = true
        mass5.text = "0"

        }
        else{
        mass5.hidden = false
        ret5.hidden = false
        pass5.hidden = false
        }
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize.width = 650
        scrollView.contentSize.height = 650
        
        mass1.keyboardType = UIKeyboardType.DecimalPad
        mass2.keyboardType = UIKeyboardType.DecimalPad
        mass3.keyboardType = UIKeyboardType.DecimalPad
        mass4.keyboardType = UIKeyboardType.DecimalPad
        mass5.keyboardType = UIKeyboardType.DecimalPad
        mass6.keyboardType = UIKeyboardType.DecimalPad
        
        wetMass.keyboardType = UIKeyboardType.DecimalPad
        dryMass.keyboardType = UIKeyboardType.DecimalPad


        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)

        
        pass1.layer.borderWidth = 0.5
        pass1.layer.borderColor = UIColor.blackColor().CGColor
        pass2.layer.borderWidth = 0.5
        pass2.layer.borderColor = UIColor.blackColor().CGColor
        pass3.layer.borderWidth = 0.5
        pass3.layer.borderColor = UIColor.blackColor().CGColor
        pass4.layer.borderWidth = 0.5
        pass4.layer.borderColor = UIColor.blackColor().CGColor
        pass5.layer.borderWidth = 0.5
        pass5.layer.borderColor = UIColor.blackColor().CGColor
        
        ret1.layer.borderWidth = 0.5
        ret1.layer.borderColor = UIColor.blackColor().CGColor
        ret2.layer.borderWidth = 0.5
        ret2.layer.borderColor = UIColor.blackColor().CGColor
        ret3.layer.borderWidth = 0.5
        ret3.layer.borderColor = UIColor.blackColor().CGColor
        ret4.layer.borderWidth = 0.5
        ret4.layer.borderColor = UIColor.blackColor().CGColor
        ret5.layer.borderWidth = 0.5
        ret5.layer.borderColor = UIColor.blackColor().CGColor
        ret6.layer.borderWidth = 0.5
        ret6.layer.borderColor = UIColor.blackColor().CGColor
        ret7.layer.borderWidth = 0.5
        ret7.layer.borderColor = UIColor.blackColor().CGColor

    }

    @IBAction func saveButtonPressed(sender: AnyObject)
    {
        let alert = UIAlertController(title: "New Form",
            message: "Type the name of form.",
            preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save",
            style: .Default,
            handler: { (action:UIAlertAction) -> Void in
                let textField = alert.textFields!.first
                self.saveForm(textField!.text!)
                self.successInput()
                
                
        })
        
        let cancelAction = UIAlertAction(title: "Cancel",
            style: .Default) { (action: UIAlertAction) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert,
            animated: true,
            completion: nil)
        
        
    }
    
    func saveForm(date:String)
    {
        let timestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
        print("saved at " + timestamp)
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity =  NSEntityDescription.entityForName("Stone",
            inManagedObjectContext:managedContext)
        
        let input = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext: managedContext)
        
        //3
        input.setValue(date, forKey: "date")
        input.setValue(mass1.text, forKey: "stone1")
        input.setValue(mass2.text, forKey: "stone2")
        input.setValue(mass3.text, forKey: "stone3")
        input.setValue(mass4.text, forKey: "stone4")
        input.setValue(mass5.text, forKey: "stone5")
        input.setValue(mass6.text, forKey: "stone6")
        input.setValue(wetMass.text, forKey: "wet")
        input.setValue(dryMass.text, forKey: "dry")
        input.setValue(type, forKey: "type")
        input.setValue(timestamp, forKey: "timestamp")

        
        
        
        //4
        do {
            try managedContext.save()
            print("save successful")
            //5
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
            
        }
        
    }
    
    @IBAction func computePressed(sender: AnyObject)
    {
        computeMoisture()
        sieveAnalysis()

    }
    
    func sieveAnalysis()
    {
        let passed0 : Double = 100.0
        if let data1 = Double(mass1.text!){
            if let data2 = Double(mass2.text!){
                if let data3 = Double(mass3.text!){
                    if let data4 = Double(mass4.text!){
                        if let data5 = Double(mass5.text!){
                            if let data6 = Double(mass6.text!){
                                let total = data1+data2+data3+data4+data5+data6
                                let retain1 = data1/total*100
                                let passed1 = passed0-retain1
                                let retain2 = data2/total*100
                                let passed2 = passed1-retain2
                                let retain3 = data3/total*100
                                let passed3 = passed2-retain3
                                let retain4 = data4/total*100
                                let passed4 = passed3-retain4
                                let retain5 = data5/total*100
                                let passed5 = passed4-retain5
                                let retain6 = data6/total*100
                                let retTotal = retain1+retain2+retain3+retain4+retain5+retain6
                                
                                massTotal.text = String(format:"%.2f", total)
                                
                                ret1.text = String(format:"%.2f", retain1)
                                ret2.text = String(format:"%.2f", retain2)
                                ret3.text = String(format:"%.2f", retain3)
                                ret4.text = String(format:"%.2f", retain4)
                                ret5.text = String(format:"%.2f", retain5)
                                ret6.text = String(format:"%.2f", retain6)
                                ret7.text = String(format:"%.2f", retTotal)
                                
                                
                                
                                pass1.text = String(format:"%.2f", passed1)
                                pass2.text = String(format:"%.2f", passed2)
                                pass3.text = String(format:"%.2f", passed3)
                                pass4.text = String(format:"%.2f", passed4)
                                pass5.text = String(format:"%.2f", passed5)
                                
                            }else {errorInput()}
                        }else {errorInput()}
                    }else {errorInput()}
                }else {errorInput()}
            }else {errorInput()}
        }else {errorInput()}
    }
    
    func computeMoisture()
    {
        if let wet = Double(wetMass.text!){
            if let dry = Double(dryMass.text!){
                let water = wet - dry
                let moisture = (water/dry)*100
                waterWeight.text = String(water) + "g"
                moistureContent.text = String(format:"%.2f", moisture) + "%"
            }else {errorInput()}
        }else {errorInput()}
        
        
    }
    
    
    func errorInput(){
        let alertController = UIAlertController(title: "Error", message:
            "Invalid Input, Please type valid input!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func keyboardWillShow(sender: NSNotification) {
        
        scrollView.contentSize.height = 700
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
        scrollView.contentSize.height = 600
        
    }
    
    func successInput(){
        let alertController = UIAlertController(title: "Success", message:
            "You have successfully saved the form!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}
