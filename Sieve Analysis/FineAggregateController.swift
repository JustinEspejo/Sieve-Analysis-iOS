//
//  FineAggregateController.swift
//  Sieve Analysis
//
//  Created by Justin Espejo on 1/15/16.
//  Copyright © 2016 Snowcialite. All rights reserved.
//

import UIKit
import CoreData

class FineAggregateController: UIViewController {

    var isPassed = false
    var segue1 : String!
    var segue2 : String!
    var segue3 : String!
    var segue4 : String!
    var segue5 : String!
    var segue6 : String!
    var segue7 : String!
    var segue8 : String!
    var segueWet : String!
    var segueDry : String!


    @IBOutlet weak var mySwitch: UISwitch!

    @IBOutlet weak var specLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var computeButton: UIBarButtonItem!
    
    //Moisture Computation
    @IBOutlet weak var wetMass: UITextField!
    @IBOutlet weak var dryMass: UITextField!
    @IBOutlet weak var waterMass: UILabel!
    @IBOutlet weak var moistureContent: UILabel!
    
    //MassTextfield
    @IBOutlet weak var input1: UITextField!
    @IBOutlet weak var input2: UITextField!
    @IBOutlet weak var input3: UITextField!
    @IBOutlet weak var input4: UITextField!
    @IBOutlet weak var input5: UITextField!
    @IBOutlet weak var input6: UITextField!
    @IBOutlet weak var input7: UITextField!
    @IBOutlet weak var input8: UITextField!
    
    //Total Mass
    @IBOutlet weak var totalMass: UILabel!
    
    @IBOutlet weak var spec1: UILabel!
    @IBOutlet weak var spec2: UILabel!
    @IBOutlet weak var spec3: UILabel!
    @IBOutlet weak var spec4: UILabel!
    @IBOutlet weak var spec5: UILabel!
    @IBOutlet weak var spec6: UILabel!
    @IBOutlet weak var spec7: UILabel!
    
    
    
    //% Retained
    @IBOutlet weak var retained1: UILabel!
    @IBOutlet weak var retained2: UILabel!
    @IBOutlet weak var retained3: UILabel!
    @IBOutlet weak var retained4: UILabel!
    @IBOutlet weak var retained5: UILabel!
    @IBOutlet weak var retained6: UILabel!
    @IBOutlet weak var retained7: UILabel!
    @IBOutlet weak var retained8: UILabel!
    @IBOutlet weak var retained9: UILabel!
    
    //% Passed
    @IBOutlet weak var Passed1: UILabel!
    @IBOutlet weak var Passed2: UILabel!
    @IBOutlet weak var Passed3: UILabel!
    @IBOutlet weak var Passed4: UILabel!
    @IBOutlet weak var Passed5: UILabel!
    @IBOutlet weak var Passed6: UILabel!
    @IBOutlet weak var Passed7: UILabel!
    
    //Fineness Modulus
    @IBOutlet weak var fmLabel: UILabel!
    @IBOutlet weak var fm1: UILabel!
    @IBOutlet weak var fm2: UILabel!
    @IBOutlet weak var fm3: UILabel!
    @IBOutlet weak var fm4: UILabel!
    @IBOutlet weak var fm5: UILabel!
    @IBOutlet weak var fm6: UILabel!
    @IBOutlet weak var fm7: UILabel!
    @IBOutlet weak var FinenessModulus: UILabel!

    
    
    override func viewDidAppear(animated: Bool)
    {
        if(isPassed)
        {
            
            input1.text = segue1
            input2.text = segue2
            input3.text = segue3
            input4.text = segue4
            input5.text = segue5
            input6.text = segue6
            input7.text = segue7
            input8.text = segue8
            wetMass.text = segueWet
            dryMass.text = segueDry
            isPassed = false
            self.computeMoisture()
            self.sieveAnalysis()
            
        }
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
   
        
        scrollView.contentSize.width = 650
        scrollView.contentSize.height = 650
        
        input1.keyboardType = UIKeyboardType.DecimalPad
        input2.keyboardType = UIKeyboardType.DecimalPad
        input3.keyboardType = UIKeyboardType.DecimalPad
        input4.keyboardType = UIKeyboardType.DecimalPad
        input5.keyboardType = UIKeyboardType.DecimalPad
        input6.keyboardType = UIKeyboardType.DecimalPad
        input7.keyboardType = UIKeyboardType.DecimalPad
        input8.keyboardType = UIKeyboardType.DecimalPad

        wetMass.keyboardType = UIKeyboardType.DecimalPad
        dryMass.keyboardType = UIKeyboardType.DecimalPad
        
        drawBoarder()

        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)

        
    }
    @IBAction func saveButtonPressed(sender: AnyObject)
    {
        let alert = UIAlertController(title: "New Name",
            message: "Type the date/name of form.",
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
    
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity =  NSEntityDescription.entityForName("Sand",
            inManagedObjectContext:managedContext)
        
        let input = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext: managedContext)
        
        //3
        input.setValue(date, forKey: "date")
        input.setValue(input1.text, forKey: "sand1")
        input.setValue(input2.text, forKey: "sand2")
        input.setValue(input3.text, forKey: "sand3")
        input.setValue(input4.text, forKey: "sand4")
        input.setValue(input5.text, forKey: "sand5")
        input.setValue(input6.text, forKey: "sand6")
        input.setValue(input7.text, forKey: "sand7")
        input.setValue(input8.text, forKey: "sand8")
        input.setValue(wetMass.text, forKey: "wet")
        input.setValue(dryMass.text, forKey: "dry")


        
        //4
        do {
            try managedContext.save()
            print("save successful")
            //5
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")

        }
    
    }
    
    @IBAction func switchSpec(sender: AnyObject)
    {
        if mySwitch.on {

            specLabel.text = "Spec"
            
            spec1.hidden = false
            spec2.hidden = false
            spec3.hidden = false
            spec4.hidden = false
            spec5.hidden = false
            spec6.hidden = false
            spec7.hidden = false

            
            fm1.hidden = true
            fm2.hidden = true
            fm3.hidden = true
            fm4.hidden = true
            fm5.hidden = true
            fm6.hidden = true
            fm7.hidden = true
  
        }
        else {
            specLabel.text = "F.M."
            
            spec1.hidden = true
            spec2.hidden = true
            spec3.hidden = true
            spec4.hidden = true
            spec5.hidden = true
            spec6.hidden = true
            spec7.hidden = true
            
            fm1.hidden = false
            fm2.hidden = false
            fm3.hidden = false
            fm4.hidden = false
            fm5.hidden = false
            fm6.hidden = false
            fm7.hidden = false
            
        }
    }
    
    func drawBoarder()
    {
        retained1.layer.borderWidth = 0.5
        retained1.layer.borderColor = UIColor.blackColor().CGColor
        
        retained2.layer.borderWidth = 0.5
        retained2.layer.borderColor = UIColor.blackColor().CGColor
        
        retained3.layer.borderWidth = 0.5
        retained3.layer.borderColor = UIColor.blackColor().CGColor
        
        retained4.layer.borderWidth = 0.5
        retained4.layer.borderColor = UIColor.blackColor().CGColor
        
        retained5.layer.borderWidth = 0.5
        retained5.layer.borderColor = UIColor.blackColor().CGColor
        
        retained6.layer.borderWidth = 0.5
        retained6.layer.borderColor = UIColor.blackColor().CGColor
        
        retained7.layer.borderWidth = 0.5
        retained7.layer.borderColor = UIColor.blackColor().CGColor
        
        retained8.layer.borderWidth = 0.5
        retained8.layer.borderColor = UIColor.blackColor().CGColor
        
        retained9.layer.borderWidth = 0.5
        retained9.layer.borderColor = UIColor.blackColor().CGColor
        
        Passed1.layer.borderWidth = 0.5
        Passed1.layer.borderColor = UIColor.blackColor().CGColor
        Passed2.layer.borderWidth = 0.5
        Passed2.layer.borderColor = UIColor.blackColor().CGColor
        Passed3.layer.borderWidth = 0.5
        Passed3.layer.borderColor = UIColor.blackColor().CGColor
        Passed4.layer.borderWidth = 0.5
        Passed4.layer.borderColor = UIColor.blackColor().CGColor
        Passed5.layer.borderWidth = 0.5
        Passed5.layer.borderColor = UIColor.blackColor().CGColor
        Passed6.layer.borderWidth = 0.5
        Passed6.layer.borderColor = UIColor.blackColor().CGColor
        Passed7.layer.borderWidth = 0.5
        Passed7.layer.borderColor = UIColor.blackColor().CGColor
        
        
        
    
    }
    
    @IBAction func computePressed(sender: AnyObject)
    {
            self.computeMoisture()
            self.sieveAnalysis()
    }
    
    func computeMoisture()
    {
    if let wet = Double(wetMass.text!){
        if let dry = Double(dryMass.text!){
            let waterWeight = wet - dry
            let moisture = (waterWeight/dry)*100
            waterMass.text = String(waterWeight) + "g"
            moistureContent.text = String(format:"%.2f", moisture) + "%"
        }else {errorInput()}
    }else {errorInput()}

        
    }
    
    func sieveAnalysis()
    {   let pass0 : Double = 100
        if let data1 = Double(input1.text!){
            if let data2 = Double(input2.text!){
                if let data3 = Double(input3.text!){
                    if let data4 = Double(input4.text!){
                        if let data5 = Double(input5.text!){
                            if let data6 = Double(input6.text!){
                                if let data7 = Double(input7.text!){
                                    if let data8 = Double(input8.text!){
                                        let total = data1+data2+data3+data4+data5+data6+data7+data8
                                        let ret1 = data1/total*100
                                        let pass1 = pass0-ret1
                                        let ret2 = data2/total*100
                                        let pass2 = pass1-ret2
                                        let ret3 = data3/total*100
                                        let pass3 = pass2-ret3
                                        let ret4 = data4/total*100
                                        let pass4 = pass3-ret4
                                        let ret5 = data5/total*100
                                        let pass5 = pass4-ret5
                                        let ret6 = data6/total*100
                                        let pass6 = pass5-ret6
                                        let ret7 = data7/total*100
                                        let pass7 = pass6-ret7
                                        let ret8 = data8/total*100
                                        let ret9 = ret1+ret2+ret3+ret4+ret5+ret6+ret7+ret8
                                        
                                        retained1.text = String(format:"%.2f", ret1)
                                        retained2.text = String(format:"%.2f", ret2)
                                        retained3.text = String(format:"%.2f", ret3)
                                        retained4.text = String(format:"%.2f", ret4)
                                        retained5.text = String(format:"%.2f", ret5)
                                        retained6.text = String(format:"%.2f", ret6)
                                        retained7.text = String(format:"%.2f", ret7)
                                        retained8.text = String(format:"%.2f", ret8)
                                        retained9.text = String(format:"%.2f", ret9)
                                        
                                        totalMass.text = String(total)
                                        
                                        Passed1.text = String(format:"%.2f", pass1)
                                        Passed2.text = String(format:"%.2f", pass2)
                                        Passed3.text = String(format:"%.2f", pass3)
                                        Passed4.text = String(format:"%.2f", pass4)
                                        Passed5.text = String(format:"%.2f", pass5)
                                        Passed6.text = String(format:"%.2f", pass6)
                                        Passed7.text = String(format:"%.2f", pass7)
                                        
                                        let finenessModulus1 = pass0-pass1
                                        let finenessModulus2 = pass0-pass2
                                        let finenessModulus3 = pass0-pass3
                                        let finenessModulus4 = pass0-pass4
                                        let finenessModulus5 = pass0-pass5
                                        let finenessModulus6 = pass0-pass6
                                        let finenessModulus7 = pass0-pass7
                                        
                                        fm1.text = String(format:"%.2f", finenessModulus1)
                                        fm2.text = String(format:"%.2f", finenessModulus2)
                                        fm3.text = String(format:"%.2f", finenessModulus3)
                                        fm4.text = String(format:"%.2f", finenessModulus4)
                                        fm5.text = String(format:"%.2f", finenessModulus5)
                                        fm6.text = String(format:"%.2f", finenessModulus6)
                                        fm7.text = String(format:"%.2f", finenessModulus7)


                                       let finenessModulus = (finenessModulus1+finenessModulus2+finenessModulus3+finenessModulus4+finenessModulus5+finenessModulus6+finenessModulus7)/100
                                        
                                        FinenessModulus.text = String(format:"%.2f", finenessModulus)

                                        
                                    }else {errorInput()}
                                }else {errorInput()}
                            }else {errorInput()}
                        }else {errorInput()}
                    }else {errorInput()}
                }else {errorInput()}
            }else {errorInput()}
        }else {errorInput()}
    }
    
    
    func keyboardWillShow(sender: NSNotification) {
        
        scrollView.contentSize.height = 700
//
//        let userInfo: [NSObject : AnyObject] = sender.userInfo!
//        
//        let keyboardSize: CGSize = userInfo[UIKeyboardFrameBeginUserInfoKey]!.CGRectValue.size
//        let offset: CGSize = userInfo[UIKeyboardFrameEndUserInfoKey]!.CGRectValue.size
//        
//        if keyboardSize.height == offset.height {
//            if self.view.frame.origin.y == 0 {
//                UIView.animateWithDuration(0.1, animations: { () -> Void in
//                    self.view.frame.origin.y -= keyboardSize.height
//                })
//            }
//        } else {
//            UIView.animateWithDuration(0.1, animations: { () -> Void in
//                self.view.frame.origin.y += keyboardSize.height - offset.height
//            })
//        }
//        print(self.view.frame.origin.y)
//    
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
        scrollView.contentSize.height = 600

//        
//        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
//            self.view.frame.origin.y += keyboardSize.height
        
//        }
    }
    
    
    func errorInput(){
        let alertController = UIAlertController(title: "Error", message:
            "Invalid Input, Please type valid input!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func successInput(){
        let alertController = UIAlertController(title: "Success", message:
            "You have successfully saved the form!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}
