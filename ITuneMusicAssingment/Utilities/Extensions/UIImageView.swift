//
//  UIImageView.swift
//  ITuneMusicAssingment
//
//  Created by Shyam Jadhav on 25/04/20.
//  Copyright © 2020 Shyam Jadhav. All rights reserved.
//

import Foundation
import UIKit


// MARK :- UIImageView
extension UIImageView {
    
    // MARK :- API Calls
    func fetchImages(pictureUrl : String){
        
        
        guard !pictureUrl.isEmpty else { return  } // it will generate fatal issue if restaurant image is not present
        let pictureKey = NSString(string: pictureUrl)
        
        self.image = nil // setting it to nil
        
        if let image = Constants.imageCache.object(forKey: pictureKey){
            self.image = image
            return
        
        }else {

        }
    }
}



