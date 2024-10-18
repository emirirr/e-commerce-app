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
        let result = try await session.data(for: urlRequest)
        try validate(data: result.0, response: result.1)
        
        let decodedResponse = try decoder.decode(Request.Response.self, from: result.0)
        return decodedResponse
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
