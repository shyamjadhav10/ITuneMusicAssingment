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


class ActivityIndicator {
    
    static let sharedIndicator = ActivityIndicator()
    private var spinnerView = UIView()
    
    func displayActivityIndicator(onView : UIView) {
        spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async { [weak self] in
            guard let _self = self else { return }
            _self.spinnerView.addSubview(ai)
            onView.addSubview(_self.spinnerView)
        }
        
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {[weak self] in
            guard let _self = self else { return }
            _self.spinnerView.removeFromSuperview()
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


extension TimeInterval {
    var minuteSecondMS: String {
        return String(format:"%d:%02d.%03d", minute, second, millisecond)
    }
    
    var minuteSecond: String {
        return String(format:"%d:%02d", minute, second)
    }
    
    var minute: Int {
        return Int((self/60).truncatingRemainder(dividingBy: 60))
    }
    
    var second: Int {
        return Int(truncatingRemainder(dividingBy: 60))
    }
    
    var millisecond: Int {
        return Int((self*1000).truncatingRemainder(dividingBy: 1000))
    }
}

extension Int {
    var msToSeconds: Double {
        return Double(self) / 1000
    }
}
