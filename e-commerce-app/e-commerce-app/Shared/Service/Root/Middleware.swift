//
//  Middleware.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import Foundation

class Middleware {
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    public init() {}
    
    @discardableResult
    public func send<Request: TransferConnection>(request: Request) async throws -> Request.Response? {
        guard let urlRequest = request.buildURLRequest() else { return nil }
        
        let (data, response) = try await session.data(for: urlRequest)
        try validate(data: data, response: response)
        
        guard let jsonString = String(data: data, encoding: .utf8) else {
            throw APIClientError.apiError("Failed to convert data to string.")
        }
        
        guard let jsonData = jsonString.data(using: .utf8) else {
            throw APIClientError.apiError("Failed to convert string back to data.")
        }

       
        let responseModel = try JSONDecoder().decode(Request.Response.self, from: jsonData)

        return responseModel
    }

    
    func validate(data: Data, response: URLResponse) throws {
        guard let code = (response as? HTTPURLResponse)?.statusCode else {
            throw APIClientError.connectionError(data)
        }
        
        guard (200..<600).contains(code) else {
            throw APIClientError.apiError("API returned error with status code \(code)")
        }
    }
}
