//
//  MoreViewController.swift
//  Project 499
//
//  Created by Antonio Martinez Garin on 3/5/16.
//  Copyright © 2016 Antonio Martinez Garin. All rights reserved.
//

import UIKit
import TwitterKit

class MoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func goSettings(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string:UIApplicationOpenSettingsURLString)!)
    }
    
    @IBAction func logout(sender: UIButton) {
        if let userID = Twitter.sharedInstance().sessionStore.session()?.userID {
            Twitter.sharedInstance().sessionStore.logOutUserID(userID)
        }
        
        self.performSegueWithIdentifier("logout", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if "logout" == segue.identifier {
            // Nothing really to do here, since it won't be fired unless
            // shouldPerformSegueWithIdentifier() says it's ok. In a real app,
            // this is where you'd pass data to the success view controller.
        }
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
