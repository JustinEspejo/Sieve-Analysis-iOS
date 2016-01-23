//
//  CoursePickerViewController.swift
//  Sieve Analysis
//
//  Created by Justin Espejo on 1/22/16.
//  Copyright © 2016 Snowcialite. All rights reserved.
//

import UIKit

class CoursePickerViewController: UIViewController {

    @IBAction func pressed67(sender: AnyObject)
    {
    
    }

    @IBAction func pressedState1(sender: AnyObject)
    {
    
    }
    @IBAction func pressed357(sender: AnyObject)
    {
    
    }
    @IBAction func pressed57(sender: AnyObject)
    {
    
    }
    
    
    @IBAction func pressed8(sender: AnyObject)
    {
    
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let vcPass = segue.destinationViewController as! CourseAggregateViewController
        
        if(segue.identifier == "seg67"){
        
            vcPass.item1 = "1\""
            vcPass.item2 = "3/4\""
            vcPass.item3 = "3/8\""
            vcPass.item4 = "#4"
            vcPass.item5 = "#8"
            
            vcPass.spec1 = "100"
            vcPass.spec2 = "90-100"
            vcPass.spec3 = "20-55"
            vcPass.spec4 = "0-10"
            vcPass.spec5 = "0-5"



            
        }
        
        else if(segue.identifier == "seg57"){
            
            vcPass.item1 = "1 1/2\""
            vcPass.item2 = "1\""
            vcPass.item3 = "1/2\""
            vcPass.item4 = "#4"
            vcPass.item5 = "#8"
            
            vcPass.spec1 = "100"
            vcPass.spec2 = "95-100"
            vcPass.spec3 = "25-60"
            vcPass.spec4 = "0-10"
            vcPass.spec5 = "0-5"
            
        }
        
        else if(segue.identifier == "seg357"){
            vcPass.item1 = "2 1/2\""
            vcPass.item2 = "2\""
            vcPass.item3 = "1\""
            vcPass.item4 = "1/2\""
            vcPass.item5 = "#4"
            
            vcPass.spec1 = "100"
            vcPass.spec2 = "95-100"
            vcPass.spec3 = "35-70"
            vcPass.spec4 = "10-30"
            vcPass.spec5 = "0-5"
        }
        
        else if(segue.identifier == "seg8"){
            vcPass.item1 = "1/2\""
            vcPass.item2 = "3/8\""
            vcPass.item3 = "#4"
            vcPass.item4 = "#8"
            vcPass.item5 = "#16"
            
            vcPass.spec1 = "100"
            vcPass.spec2 = "85-100"
            vcPass.spec3 = "10-30"
            vcPass.spec4 = "0-10"
            vcPass.spec5 = "0-5"
        }
        
        else {
            vcPass.item1 = "1 1/2\""
            vcPass.item2 = "1\""
            vcPass.item3 = "1/2\""
            vcPass.item4 = "1/4\""
            vcPass.item5 = " "

            vcPass.spec1 = "100"
            vcPass.spec2 = "93-100"
            vcPass.spec3 = "27-58"
            vcPass.spec4 = "0-8"
            vcPass.spec5 = " "
            
        }
        
    }
    
    
    override func viewDidLoad() {

        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
