//
//  RequestBuilder.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import Foundation

class RequestBuilder<T: Codable>: TransferConnection {
    typealias Response = T
    

    internal var path: String?
    internal var method: HTTPMethod?
    internal var body: Data?
    internal var parameters: [String: String]?
    
    init( path: String?, method: HTTPMethod?, body: Data?, parameters: [String: String]?) {
     
        self.path = path
        self.method = method
        self.body = body
        self.parameters = parameters
    }
  
}
