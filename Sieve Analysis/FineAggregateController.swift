//
//  FineAggregateController.swift
//  Sieve Analysis
//
//  Created by Justin Espejo on 1/15/16.
//  Copyright © 2016 Snowcialite. All rights reserved.
//

import UIKit

class FineAggregateController: UIViewController {

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
    @IBOutlet weak var fm1: UILabel!
    @IBOutlet weak var fm2: UILabel!
    @IBOutlet weak var fm3: UILabel!
    @IBOutlet weak var fm4: UILabel!
    @IBOutlet weak var fm5: UILabel!
    @IBOutlet weak var fm6: UILabel!
    @IBOutlet weak var fm7: UILabel!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        scrollView.contentSize.width = 650
        scrollView.contentSize.height = 600
    }
    
    @IBAction func computePressed(sender: AnyObject)
    {

        
            self.computeMoisture()
        

        
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
    
    func errorInput(){
        let alertController = UIAlertController(title: "Error", message:
            "Invalid Input, Please type valid input!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }

}
