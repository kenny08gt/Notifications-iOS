//
//  ViewController.swift
//  Notifications
//
//  Created by LionMane Software on 2/22/17.
//  Copyright © 2017 LionMane Software. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. Request permission
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { (granted, error) in
            
            if granted{
                print("Notification access granted")
            }else{
                print(error?.localizedDescription ?? "Error")
            }
        })
    }

    @IBAction func notifyButtonTapped(sender: UIButton){
        scheduleNotification(inSeconds: 5, completion: {success in
            if success {
                print("successfully scheduled notification")
            }else{
                print("Error scheduling notification")
            }
        })
    }
    
    func scheduleNotification(inSeconds: TimeInterval, completion: @escaping (_ Success: Bool)-> ()){
        let notif = UNMutableNotificationContent()
        
        notif.title = "New Notification"
        notif.subtitle = "These are great"
        notif.body = "The new notification options in iOS 10 are what Uve always dreamed of!"
        
        let notifTrigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        
        let request = UNNotificationRequest(identifier: "myNotification", content: notif, trigger: notifTrigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: {error in
            if error != nil{
                print(error ?? "Error")
                completion(false)
            }else{
                completion(true)
            }
        })
        
    }

}

