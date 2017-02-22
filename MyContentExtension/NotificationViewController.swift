//
//  NotificationViewController.swift
//  MyContentExtension
//
//  Created by LionMane Software on 2/22/17.
//  Copyright © 2017 LionMane Software. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
       
        guard let attachment = notification.request.content.attachments.first else{
            return
        }
        
        if attachment.url.startAccessingSecurityScopedResource(){
            let imageData = try? Data.init(contentsOf: attachment.url)
            if let img = imageData{
                image.image = UIImage(data: img)
            }
        }
        
    }

}
