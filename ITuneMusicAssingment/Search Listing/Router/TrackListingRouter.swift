//
//  TrackListingRouter.swift
//  ITuneMusicAssingment
//
//  Created by Shyam Jadhav on 24/04/20.
//  Copyright © 2020 Shyam Jadhav. All rights reserved.
//

import Foundation


//Track APIs
enum TrackAPI {
    case getTrackList
    case getTrackDetails(id: Int)
}


extension TrackAPI : RequestProtocol {
        
    var baseURL: URL {
        <#code#>
    }
    
    var path: String {
        <#code#>
    }
    
    var httpMethod: HTTPMethod {
        <#code#>
    }
    
    var httpBody: Data? {
        <#code#>
    }
    
    var headers: HTTPHeaders? {
        <#code#>
    }
    
    
    
    
    
    
    
}
