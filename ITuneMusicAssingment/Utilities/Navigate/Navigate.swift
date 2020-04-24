//
//  Navigate.swift
//  ITuneMusicAssingment
//
//  Created by Shyam Jadhav on 24/04/20.
//  Copyright © 2020 Shyam Jadhav. All rights reserved.
//

import Foundation
import UIKit


class BaseNavigationViewController: UINavigationController, UINavigationControllerDelegate  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.default
    }
    
    func setupNavigation(){
        self.navigationBar.barTintColor =  UIColor(red: 84/255, green: 97/255, blue: 104/255, alpha: 1)
        self.navigationBar.tintColor =  UIColor.white
        self.navigationBar.isTranslucent = false
        
        let attributes = [ NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16.0)]
        self.navigationBar.titleTextAttributes = attributes
        self.delegate = self
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
