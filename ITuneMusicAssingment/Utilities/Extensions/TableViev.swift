//
//  TableViewExtension.swift
//  ITuneMusicAssingment
//
//  Created by Shyam Jadhav on 24/04/20.
//  Copyright © 2020 Shyam Jadhav. All rights reserved.
//

import Foundation
import UIKit



// MARK :- UITableViews
extension UITableView {
    
    func registerNibs(_ cellIdentifiers: [String]) {
        for identifier in cellIdentifiers {
            self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        }
    }
    
    func registerNib(_ cellIdentifier: String) {
        self.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
}



