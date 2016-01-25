//
//  MainViewController.swift
//  Sieve Analysis
//
//  Created by Justin Espejo on 1/23/16.
//  Copyright © 2016 Snowcialite. All rights reserved.
//

import UIKit
import iAd

class MainViewController: UIViewController , ADBannerViewDelegate{

    @IBOutlet weak var creditsButton: UIButton!
    @IBOutlet weak var fineButton: UIButton!
    @IBOutlet weak var courseButton: UIButton!
    @IBOutlet weak var banner: ADBannerView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        banner.hidden = true
        banner.delegate = self
        self.canDisplayBannerAds = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        NSLog("banner error")
    }
    
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        return true
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        self.banner.hidden = false
    }
    
    func bannerViewWillLoadAd(banner: ADBannerView!) {
        
    }
    
//    func buttonDesign()
//    {
//        UIColor *color = creditsButton.currentTitleColor
//        creditsButton.titleLabel.layer.shadowColor = [color CGColor]
//        creditsButton.titleLabel.layer.shadowRadius = 4.0f
//        creditsButton.titleLabel.layer.shadowOpacity = .9;
//        creditsButton.titleLabel.layer.shadowOffset = CGSizeZero;
//        creditsButton.titleLabel.layer.masksToBounds = NO;
//    }
//    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
