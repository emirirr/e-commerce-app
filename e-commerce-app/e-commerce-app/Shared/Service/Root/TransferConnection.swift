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
    associatedtype Response: Codable

    var method: HTTPMethod? { get }
    var path: String? { get }
    var body: Data? { get }
    var parameters: [String: Any]? { get }

    func buildURLRequest() -> URLRequest?
}

extension TransferConnection {
    public func buildURLRequest() -> URLRequest? {
        guard let path = path, let method = method else { return nil }

        if let baseURL = URL(string: ServicePaths.BaseUrl.baseUrl) {
            var url = baseURL.appendingPathComponent(path)
            var urlRequest = URLRequest(url: url)

            urlRequest.httpMethod = method.rawValue
            urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

         
            if let parameters = parameters {
                let parameterString = parameters.map { "\($0.key)=\($0.value)" }.joined(separator: "&")
                urlRequest.httpBody = parameterString.data(using: .utf8)
            } else {
                urlRequest.httpBody = body
            }

            return urlRequest
        } else {
            return nil
        }
    }
}

class Operation {
    static func toJsonData<U: Encodable>(value: U) -> Data? {
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
