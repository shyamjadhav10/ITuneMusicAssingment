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
    case getTrackList(params: [String: String])
    case getImage(url : String)
}

extension TrackAPI : RequestProtocol {
    
    var baseURL: URL {
        switch self {
        case .getImage(let url):
            guard let url = URL(string: url) else {
                fatalError("BaseURL could not be configured.")
            }
            return url
        default:
            guard let url = URL(string: Constants.apiBaseUrl) else {
                fatalError("BaseURL could not be configured.")
            }
            return url
        }
    }
    
    
    //Returns EndPoint for tracks APIs
    var path: String {
        switch self {
        case .getTrackList:
            return "/search"
        case .getImage(_):
            return ""
            
        }
    }
    
    //Returns HTTP Method for track APIs
    var httpMethod: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    //Encode and Returns Encoded Data
    var httpBody: Data? {
        switch self {
        default:
            return nil
        }
    }
    
    var parameters: Any? {
        switch self {
        case .getTrackList(let params):
            return params
            
        default:
            return nil
        }
    }
    
    
    //Return track APIs Specific Headers
    var headers: HTTPHeaders? {
        return nil
    }
}
