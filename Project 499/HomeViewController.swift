//
//  HomeViewController.swift
//  Project 499
//
//  Created by Antonio Martinez Garin on 11/5/16.
//  Copyright © 2016 Antonio Martinez Garin. All rights reserved.
//

import UIKit
import TwitterKit

class HomeViewController: TWTRTimelineViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = TWTRUserTimelineDataSource(screenName: "fabric", APIClient: TWTRAPIClient())

        // Do any additional setup after loading the view.
    }
/*
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
*/
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
