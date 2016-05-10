//
//  ViewController.swift
//  Project 499
//
//  Created by Antonio Martinez Garin on 9/5/16.
//  Copyright © 2016 Antonio Martinez Garin. All rights reserved.
//

import UIKit
let socket = SocketIOClient(socketURL: NSURL(string:"http://localhost:8081")!)
var tweetsQ = Queue<String>()
var NewTweets = false

class ViewController: UITabBarController {
    
    // We retrieve the appDelegate
    //let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    //let socket = appDelegate.socket
    
    var name: String?
    var resetAck: SocketAckEmitter?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addHandlers()
        socket.connect()
        // appDelegate.socket to retieve the socket from the appDelegate.
        //socket = appDelegate.socket
    }
    
    func addHandlers() {
        // The socket handlers go here
        /*
         socket!.onAny {
            //var evento = $0.event
            //if $0.event == nil { evento = "Evento nulo" }
            //if $0.event != nil  (print("Got event: \($0.event), with items: \($0.items)"))
            print("Event detected")
         */
        socket.on("twitter-streaming") {[weak self] data, ack in
            print("Twitter-streaming received: \(data[0])")
            if let jsonResult = data[0] as? Dictionary<String, AnyObject> {
                print("Cast successful")
                if let name = jsonResult["name"] as? String, message = jsonResult["message"] as? String {
                    print ("name: [\(name)] message: [\(message)]" )
                    tweetsQ.push(name) // PUSH ID_STR
                    NewTweets = true
                }
            }else{
                print("Cast unsuccessfull")
            }
            return
        }
        
        //socket.onAny {print("Got event: \($0.event), with items: \($0.items)")}
        socket.onAny {print("Got event: \($0.event), SHOULD APPEAR")}
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
