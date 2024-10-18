//
//  APIClientError.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import Foundation

enum APIClientError: Error {
    case connectionError(Data)
    case apiError(String?)
}

