//
//  Storyboard.swift
//  ITuneMusicAssingment
//
//  Created by Shyam Jadhav on 24/04/20.
//  Copyright © 2020 Shyam Jadhav. All rights reserved.
//

import Foundation
import UIKit

//MARK:- Storyboards
extension UIStoryboard {
    
    
    ///////////////////////////////////// Common Flow Storyboards /////////////////////////////////
    class func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    
    ////////////////////////////////////// Common Flow Controllers /////////////////////////////////
    
    class func getMusicSearchListingViewController(_ data: [String:Any] = [:]) -> MusicSearchListingViewController {
        let viewController = mainStoryboard().instantiateViewController(withIdentifier: "MusicSearchListingViewController") as! MusicSearchListingViewController
        
        return viewController
    }
}

