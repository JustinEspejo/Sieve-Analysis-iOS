//
//  CreditsViewController.swift
//  Sieve Analysis
//
//  Created by Justin Espejo on 1/23/16.
//  Copyright © 2016 Snowcialite. All rights reserved.
//

import UIKit

class CreditsViewController: UIViewController {

    @IBOutlet weak var loranel: UILabel!
    @IBAction func buttonThanks(sender: AnyObject) {
        if(loranel.hidden==true){
            loranel.hidden = false}
        else{loranel.hidden=true
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
