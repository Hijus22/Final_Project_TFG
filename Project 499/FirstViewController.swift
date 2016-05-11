//
//  FirstViewController.swift
//  Project 499
//
//  Created by Antonio Martinez Garin on 3/5/16.
//  Copyright © 2016 Antonio Martinez Garin. All rights reserved.
//

import UIKit
import TwitterKit



class FirstViewController: UIViewController {
    
    var timer = NSTimer()
    var counter = 0
    var replace = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        timer = NSTimer.scheduledTimerWithTimeInterval(5, target:self, selector: #selector(FirstViewController.showTweet), userInfo: nil, repeats: true)

        // TODO: Base this Tweet ID on some data from elsewhere in your app
        
        
        
        /*
        // Add a button to the center of the view to show the timeline
        let button = UIButton(type: .System)
        button.setTitle("Show Timeline", forState: .Normal)
        button.sizeToFit()
        button.center = view.center
        button.addTarget(self, action: #selector(showTimeline), forControlEvents: [.TouchUpInside])
        view.addSubview(button)
        */
    }


    func showTweet() {
        if let id_str = tweetsQ.pop() {
            TWTRAPIClient().loadTweetWithID(id_str) { (tweet, error) in
                if let unwrappedTweet = tweet {
                    let tweetView = TWTRTweetView(tweet: unwrappedTweet)
                    tweetView.center = CGPointMake(self.view.center.x, self.topLayoutGuide.length + tweetView.frame.size.height / 2);
                    if self.replace {
                        for view:UIView in self.view.subviews {
                            if view.isKindOfClass(TWTRTweetView) {
                                view.removeFromSuperview()
                            }
                        }
                        self.view.addSubview(tweetView)
                    }else {
                        self.view.addSubview(tweetView)
                        self.replace =  true
                    }
                } else {
                    NSLog("Tweet load error: %@", error!.localizedDescription);
                }
            }
        }
    }

    
    
    
    func showTimeline() {
        // Create an API client and data source to fetch Tweets for the timeline
        let client = TWTRAPIClient()
        //TODO: Replace with your collection id or a different data source
        let dataSource = TWTRCollectionTimelineDataSource(collectionID: "539487832448843776", APIClient: client)
        // Create the timeline view controller
        let timelineViewControlller = TWTRTimelineViewController(dataSource: dataSource)
        // Create done button to dismiss the view controller
        let button = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(dismissTimeline))
        timelineViewControlller.navigationItem.leftBarButtonItem = button
        // Create a navigation controller to hold the
        let navigationController = UINavigationController(rootViewController: timelineViewControlller)
        showDetailViewController(navigationController, sender: self)
    }
    func dismissTimeline() {
        dismissViewControllerAnimated(true, completion: nil)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

