//
//  UIView.swift
//  ITuneMusicAssingment
//
//  Created by Shyam Jadhav on 24/04/20.
//  Copyright © 2020 Shyam Jadhav. All rights reserved.
//

import Foundation
import UIKit


// MARK :- UIView
extension UIView {
    @discardableResult
    func fromNib<T : UIView>() -> T? {
        
        //Resource - https://stackoverflow.com/questions/24857986/load-a-uiview-from-nib-in-swift
        guard let contentView = Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? T else {
            // xib not loaded, or it's top view is of the wrong type
            return nil
        }
        
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        return contentView
    }
    
    
    func setRoundedCorners(cornerRadius : CGFloat) {
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
    
}
