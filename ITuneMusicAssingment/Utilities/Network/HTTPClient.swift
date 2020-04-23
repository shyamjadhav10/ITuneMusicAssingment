//
//  HTTPClient.swift
//  ITuneMusicAssingment
//
//  Created by Shyam Jadhav on 23/04/20.
//  Copyright © 2020 Shyam Jadhav. All rights reserved.
//


import Foundation


class HTTPClient {
    
    
    // MARK: Typealias
    typealias CompletionResult = (Result<Data?, CommonError>) -> Void

    
    // MARK: - Shared Instance
    static let shared = HTTPClient(session: URLSession.shared)
    
    
    // MARK: - Private Properties
    private let session: URLSessionProtocol
    private var task: URLSessionDataTaskProtocol?
    private var completionResult: CompletionResult?
    
    
    // MARK: - Initialiser
    init(session: URLSessionProtocol) {
        self.session = session
    }
}
