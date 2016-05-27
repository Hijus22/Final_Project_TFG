//
//  YourSportViewController.swift
//  Project 499
//
//  Created by Antonio Martinez Garin on 9/5/16.
//  Copyright © 2016 Antonio Martinez Garin. All rights reserved.
//

import UIKit
import TwitterKit

class YourSportViewController: TWTRTimelineViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let client: TWTRAPIClient
        if let userID = Twitter.sharedInstance().sessionStore.session()?.userID {
            client = TWTRAPIClient(userID: userID)
            // make requests with client
        } else {
            client = TWTRAPIClient()
        }

        self.dataSource = TWTRListTimelineDataSource(listSlug: "baloncesto", listOwnerScreenName: "mundodeportivo", APIClient: client)
        
        self.showTweetActions = true; // Don't show tweet actions.
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
