//
//  TwitterViewController.swift
//  Project 499
//
//  Created by Antonio Martinez Garin on 13/5/16.
//  Copyright © 2016 Antonio Martinez Garin. All rights reserved.
//

import UIKit
import TwitterKit

class TwitterViewController: UITableViewController, TWTRTweetViewDelegate {
    let tweetTableReuseIdentifier = "TweetCell"
    // Hold all the loaded Tweets
    
    var tweets: [TWTRTweet] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var timer = NSTimer()
    var replace = false
    
    var style = "light"

    //let tweetIDs = ["20", // @jack's first Tweet
    //    "510908133917487104"] // our favorite bike Tweet
    
    override func viewDidLoad() {
        
        // Setup the table view
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableViewAutomaticDimension // Explicitly set on iOS 8 if using automatic row height calculation
        tableView.allowsSelection = false
        tableView.registerClass(TWTRTweetTableViewCell.self, forCellReuseIdentifier: tweetTableReuseIdentifier)
        
        let client: TWTRAPIClient
        if let userID = Twitter.sharedInstance().sessionStore.session()?.userID {
            client = TWTRAPIClient(userID: userID)
            // make requests with client
        } else {
            client = TWTRAPIClient()
        }
        // Load Tweets
        
        client.loadTweetsWithIDs(tweetsQ.items) { tweets, error in

            self.tweets = tweets!
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(5, target:self, selector: #selector(TwitterViewController.updateTweets), userInfo: nil, repeats: true)
 
    }
    
    func updateTweets(){
        let client: TWTRAPIClient
        if let userID = Twitter.sharedInstance().sessionStore.session()?.userID {
            client = TWTRAPIClient(userID: userID)
            // make requests with client
        } else {
            client = TWTRAPIClient()
        }
        
        client.loadTweetsWithIDs(tweetsQ.items) { tweets, error in
            
            self.tweets = tweets!
        }
    }
    
    
    
    func refreshFields() {
        let defaults = NSUserDefaults.standardUserDefaults()
        style = defaults.stringForKey("modeStyle")!
        print("==>> Style = " + style)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        refreshFields()
        updateTweets()
    }
    
    
    
    
    
    // MARK: UITableViewDelegate Methods
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tweets.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tweet = tweets[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(tweetTableReuseIdentifier, forIndexPath: indexPath) as! TWTRTweetTableViewCell
        cell.tweetView.delegate = self
        if style == "light" {
            print("EL MODO ES LIGHT")
            cell.tweetView.theme = .Light
        } else{
            print("EL MODO ES LIGHT");
            cell.tweetView.theme = .Dark
        }
        cell.configureWithTweet(tweet)
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let tweet = tweets[indexPath.row]
        //TWTRTweetTableViewCell.heightForTweet(<#T##tweet: TWTRTweet##TWTRTweet#>, style: <#T##TWTRTweetViewStyle#>, width: <#T##CGFloat#>, showingActions: <#T##Bool#>)
        
        return TWTRTweetTableViewCell.heightForTweet(tweet, style: TWTRTweetViewStyle.Compact, width: CGRectGetWidth(self.view.bounds), showingActions: false)
        
    }
}
