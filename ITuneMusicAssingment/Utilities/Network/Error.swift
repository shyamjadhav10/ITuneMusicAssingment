//
//  Error.swift
//  ITuneMusicAssingment
//
//  Created by Shyam Jadhav on 23/04/20.
//  Copyright © 2020 Shyam Jadhav. All rights reserved.
//

import Foundation

//  Common Type errors
typealias ErrorHandler = (CommonError?) -> Void


struct CommonError : Error {
    var localizedDescription: String
    
    init(_ localizedDescription: String) {
        self.localizedDescription = localizedDescription
    }
}



struct ServerError: Decodable {
    let status: String?
    let error: String?
}
