//
//  LoginViewController.swift
//  Project 499
//
//  Created by Antonio Martinez Garin on 11/5/16.
//  Copyright © 2016 Antonio Martinez Garin. All rights reserved.
//

import UIKit
import TwitterKit


class LoginViewController: UIViewController {
    
    @IBOutlet weak var guestButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guestButton.hidden = false
        
        //let ar = Twitter.sharedInstace().sessionStore;
        Twitter.sharedInstance()
        
        if let userID = Twitter.sharedInstance().sessionStore.session()?.userID {
            let logInButton = TWTRLogInButton(logInCompletion: { session, error in
                if (session != nil) {
                    print("signed in as \(session!.userName)");
                    self.performSegueWithIdentifier("login", sender: self)
                } else {
                    print("error: \(error!.localizedDescription)");
                    self.guestButton.hidden = false
                }
                })
            logInButton.center = self.view.center
            self.view.addSubview(logInButton)
        }else{
            let logInButton = TWTRLogInButton(logInCompletion: { session, error in
                if (session != nil) {
                    print("signed in as \(session!.userName)");
                    self.performSegueWithIdentifier("login", sender: self)
                } else {
                    print("error: \(error!.localizedDescription)");
                    self.guestButton.hidden = false
                }
            })
            logInButton.center = self.view.center
            //logInButton.centerY = self.view.centerY
            self.view.addSubview(logInButton)
        }
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func userLogin(sender: UIButton) {
        if processLogin(){
            //self.dismissViewControllerAnimated(true, completion: {
            performSegueWithIdentifier("login", sender: self)

        //})
        }
        else{
            let alert = UIAlertController(title: "Login Button Pressed",
                                          message: "Login unsuccessful",
                                          preferredStyle: .Alert)
            let action = UIAlertAction(title: "Try again", style: .Default, handler: nil)
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if "login" == segue.identifier {
            // Nothing really to do here, since it won't be fired unless
            // shouldPerformSegueWithIdentifier() says it's ok. In a real app,
            // this is where you'd pass data to the success view controller.
        }
    }
    
    private func processLogin() ->Bool {
        /* TODO Manage the login here */
        
        //if inputNameField.text == "foo" && inputPasswordField.text == "bar"{
            return true; // Guest login
        //}
        //else {
        //    return false;
        //}
    }

    @IBAction func guestLogin(sender: AnyObject) {
        
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
