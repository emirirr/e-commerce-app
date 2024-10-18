//
//  TransferConnection.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import Foundation


import Foundation
import UIKit


protocol TransferConnection {
    associatedtype Response : Codable
    
    var method: HTTPMethod? { get }
    var path: String? { get }
    var body: Data? { get }
    var parameters: [String : String]? { get }
    
    func buildURLRequest() -> URLRequest?
}


extension TransferConnection {
    public func buildURLRequest() -> URLRequest? {
        guard let path = path, let method = method else { return nil}
       
        if let baseURL  =  URL(string: ServicePaths.BaseUrl.baseUrl) {
            var url = baseURL.appendingPathComponent(path)
            
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
            
            if parameters != nil{
                var queryItems = [URLQueryItem]()
                for parameter in parameters!{
                    let queryItem = URLQueryItem(name: parameter.key, value: parameter.value)
                    queryItems.append(queryItem)
                }
                components?.queryItems = queryItems
            }
        
            var urlRequest = URLRequest(url: url)
            urlRequest.url = components?.url
            urlRequest.httpMethod = method.rawValue
            urlRequest.httpBody = body
            
            return urlRequest
        }
        else {
            return nil
        }
     
    }
}
class Operation {
    static func toJsonData<U: Encodable>(value: U) -> Data?{
        do {
            let jsonEncoder = JSONEncoder()
            let data = try jsonEncoder.encode(value)
            return data
        } catch let jsonErr {
            print("failed to decode, \(jsonErr)")
        }
        return nil
    }
}
