//
//  ProductListModel.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import Foundation

class ProductListModel : Codable, Hashable {
    
    public var urunler: [ProductModel]? = nil
    public var success: Int? = 0

    
    static func == (lhs: ProductListModel, rhs: ProductListModel) -> Bool {
        return false
    }
    func hash(into hasher: inout Hasher) {

    }
}
