//
//  Utils.swift
//  ITuneMusicAssingment
//
//  Created by Shyam Jadhav on 24/04/20.
//  Copyright © 2020 Shyam Jadhav. All rights reserved.
//

import Foundation
import UIKit


class Utils{
    
    // This is reusable function for displaying alert from anywhere.
    class func displayAlert(title: String, message: String, senderViewController: UIViewController? = nil, alertDisplayedHandler : @escaping ()-> Void = {}) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { (action) in
            print("Dismiss button tapped!")
        }
        
        alert.addAction(alertAction)
        alert.view.tintColor = UIColor.red
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        var viewController = delegate.window?.topMostWindowController() // getting top most controller from stack
        
        if senderViewController != nil {
            viewController = senderViewController
        }
        
        if let _ = viewController?.presentedViewController as? UIAlertController{
        } else {
            viewController!.present(alert, animated: true, completion: {
                alertDisplayedHandler()
            })
        }
    }
}


// MARK :- UIWindow
extension UIWindow {
    //Credit: https://github.com/hackiftekhar/IQKeyboardManager ~ 5.0.0
    /** @return Returns the current Top Most ViewController in hierarchy.   */
    public func topMostWindowController()->UIViewController? {
        
        var topController = rootViewController
        while let presentedController = topController?.presentedViewController {
            topController = presentedController
        }
        
        return topController
    }
}
