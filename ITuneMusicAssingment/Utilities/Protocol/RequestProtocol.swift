//
//  RequestProtocol.swift
//  ITuneMusicAssingment
//
//  Created by Shyam Jadhav on 23/04/20.
//  Copyright © 2020 Shyam Jadhav. All rights reserved.
//

import Foundation


enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete  = "DELETE"
}

public typealias HTTPHeaders = [String: Any]


// Configuring Request Protocol
protocol RequestProtocol {

    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var httpBody: Data? { get }
    var headers: HTTPHeaders? { get }

}

// Handlig states pf sessions
protocol URLSessionDataTaskProtocol {
    func resume()
    func cancel()
}




