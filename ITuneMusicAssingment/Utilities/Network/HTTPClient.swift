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
    
    
    
    func getParams(url : URL, parameter : [String : String]) -> URLRequest {
        
        var urlComponents =  URLComponents(url: url, resolvingAgainstBaseURL: true)!
        var items = [URLQueryItem]()
        
        for (key,value) in parameter {
            items.append(URLQueryItem(name: key, value: value))
        }
        
        items = items.filter{!$0.name.isEmpty}
        if !items.isEmpty {
            urlComponents.queryItems = items // need to check if any param is not empty or it will generate 404
        }
        return  URLRequest(url: urlComponents.url!)
    }
    
    
    
    // MARK: - Data Task Helper
    func dataTask(_ request: RequestProtocol, completion: @escaping CompletionResult) {
        completionResult = completion
        
        var urlRequest = URLRequest(url: request.baseURL.appendingPathComponent(request.path),
                                    cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                    timeoutInterval: 60) //change this
        
        if let params = request.parameters, let stringParams = params as? [String : String], !stringParams.isEmpty {
            urlRequest = getParams(url: request.baseURL.appendingPathComponent(request.path), parameter: stringParams)
        }
        
        urlRequest.httpMethod = request.httpMethod.rawValue
        urlRequest.httpBody = request.httpBody
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        print(urlRequest.url!)
        
        task = session.dataTask(with: urlRequest) { (data, response, error) in
            //return error if there is any error in making request
            if let error = error {
                self.completionResult(.failure(CommonError(error.localizedDescription)))
                return
            }
            
            //check response
            if let response = response, response.isSuccess {
                if let data = data {
                    self.completionResult(.success(data))
                }
                
                if response.httpStatusCode == 204 {
                    self.completionResult(.success(nil))
                }
            } else {
                let commonErrorMessage = NSLocalizedString("Somthing went wrong!", comment: "")
                
                guard let data = data else {
                    self.completionResult(.failure(CommonError(commonErrorMessage)))
                    return
                }
                do {
                    let serverError = try JSONDecoder().decode(ServerError.self, from: data)
                    debugPrint(serverError.error ?? commonErrorMessage)
                    self.completionResult(.failure(CommonError(serverError.error ?? commonErrorMessage)))
                } catch {
                    self.completionResult(.failure(CommonError(commonErrorMessage)))
                    debugPrint(commonErrorMessage)
                }
            }
        }
        
        //Resume task
        self.task?.resume()
    }
    
    
    // MARK: - Private Helper Function
    private func completionResult(_ result: Result<Data?, CommonError>) {
        DispatchQueue.main.async {
            self.completionResult?(result)
        }
    }
    
}
